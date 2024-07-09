;; set crystal executable as safe for flycheck
(add-to-list 'safe-local-variable-values
             '(flycheck-crystal-build-executable . "/home/shigi/projects/procon4/code/script/compile-with-lib.sh"))

;; copy for submit for crystal
(setq procon-dir (file-truename (file-name-directory load-file-name)))

(defun procon-copy-for-submit-crystal ()
  (interactive)
  (let ((orig-buffer (current-buffer))
        (read-file '()))
    (with-temp-buffer
      (insert-buffer-substring orig-buffer)
      (while (progn
               (goto-char (point-min))
               (re-search-forward "^require \"\\(procon.*\\)\"" nil t))
        (let ((file (buffer-substring (match-beginning 1) (match-end 1)))
              (work-buffer (current-buffer)))
          (delete-region (line-beginning-position) (line-end-position))
          (if (member file read-file)
              (delete-blank-lines)
            (setq read-file (cons file read-file))
            (with-temp-buffer
              (insert-file-contents
               (concat (expand-file-name "../code/lib/" procon-dir) file ".cr"))
              (goto-char (point-min))
              (let ((import-buffer (current-buffer))
                    (code-min (progn
                                (re-search-forward "^# :::::::::::::::::::: .*$" nil t)
                                (+ (match-end 0) 1)))
                    (code-max (progn
                                (re-search-forward "^# ::::::::::::::::::::$" nil t)
                                (- (match-beginning 0) 1))))
                (switch-to-buffer work-buffer)
                (insert "\n")
                (insert-buffer-substring import-buffer code-min code-max))))))
      (while (progn
	       (goto-char (point-min))
	       (re-search-forward "^\\s-*#" nil t))
	(delete-region (line-beginning-position) (+ (line-end-position) 1)))
      (copy-region-as-kill (point-min) (point-max)))))

(add-hook 'crystal-mode-hook
          (lambda ()
            (define-key crystal-mode-map (kbd "C-c p c") 'procon-copy-for-submit-crystal)))
