import os
import pathlib
import re
import shutil
import subprocess
import time

from termcolor import colored
from watchdog.events import FileSystemEventHandler
from watchdog.observers.polling import PollingObserver


class UrlMemo:
    def __init__(self, path):
        self.path = path.with_name('url')

    def changed(self, url):
        return url != self.read()

    def read(self):
        if self.path.exists():
            return self.path.read_text()
        else:
            return None

    def write(self, url):
        self.path.write_text(url)

class RunTimeMemo:
    def __init__(self, path):
        self.path = path.with_name('run_time')

    def passed_time(self):
        return time.time() - self.read() > 1

    def read(self):
        if self.path.exists():
            return self.path.stat().st_mtime
        else:
            return 0

    def write(self):
        self.path.touch()

class JudgeRunner:
    def __init__(self, path):
        self.path = path
        self.url_memo = UrlMemo(path)
        self.run_time_memo = RunTimeMemo(path)

    def run(self):
        if not self.run_time_memo.passed_time():
            return

        print(colored('==================== ' + str(self.path), attrs=['bold']))

        self.chdir()
        url = self.get_url()
        if url is None:
            return

        try:
            if self.url_memo.changed(url):
                self.download(url)
                self.url_memo.write(url)
            runner = self.get_runner()
            runner.compile()
            runner.test()
            self.run_time_memo.write()

        except subprocess.CalledProcessError:
            None

    def get_url(self):
        with open(self.path, mode='r') as file:
            for line in file:
                m = re.match(r'(//|#) URL: (.*)', line)
                if m:
                    return m.group(2)
            return None

    def chdir(self):
        os.chdir(self.path.parent)

    def download(self, url):
        print('--- download')
        print(f'$ oj download {url}')
        shutil.rmtree('test', ignore_errors=True)
        subprocess.run(['oj', 'download', url], check=True)

    def get_runner(self):
        if self.path.suffix == '.cr':
            return RunnerCrystal(self.path)
        elif self.path.suffix == '.py':
            return RunnerPython(self.path)


class RunnerCrystal:
    def __init__(self, path):
        self.path = path

    def compile(self):
        print('--- compile')
        print(f'crystal build -o a.out {self.path.name}')
        subprocess.run(['sudo', 'docker', 'exec', 'procod', '/code/compile.sh', self.path], check=True)

    def test(self):
        print('--- test')
        print('oj test')
        subprocess.run(['oj', 'test'], check=True)


class RunnerPython:
    def __init__(self, path):
        self.path = path

    def compile(self):
        pass

    def test(self):
        print('--- test')
        print(f'oj test -c "pypy3 {self.path.name}"')
        subprocess.run(['oj', 'test', '-c', f'pypy3 {self.path.name}'], check=True)


class ChangeHandler(FileSystemEventHandler):
    def on_created(self, event):
        self.on_changed(event)

    def on_modified(self, event):
        self.on_changed(event)

    def on_changed(self, event):
        path = pathlib.Path(event.src_path)

        if not path.exists() or path.is_dir():
            return

        if path.parent.name == 'test' or path.name in {'url', 'run_time', 'a.out'} or path.match('/code/lib/**/*'):
            return

        if re.match('^/code/lib', str(path)) or re.match(r'^#.*#$', path.name):
            return

        JudgeRunner(path).run()


print(__name__)
if __name__ == '__main__':
    print('*** Starting judge')

    event_handler = ChangeHandler()
    observer = PollingObserver()
    print('observer:', observer)

    watch = observer.schedule(event_handler, '/code', recursive=True)
    print('watch:', watch)

    observer.start()
    print('*** Started watching')

    try:
        while True:
            time.sleep(0.05)

    except KeyboardInterrupt:
        observer.stop()
        observer.join()