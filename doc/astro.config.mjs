import { defineConfig } from 'astro/config';
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind()],
  markdown: {
    remarkPlugins: [remarkMath],
    rehypePlugins: [
      [
        rehypeKatex, {
          macros: {
            "\\abs": "\\left|#1\\right|",
            "\\lcm": "\\rm{lcm}",
            "\\perm": "{}_{#1}P_{#2}",
            "\\comb": "{}_{#1}C_{#2}",
            "\\floor": "\\left\\lfloor #1 \\right\\rfloor",
            "\\ceil": "\\left\\lceil #1 \\right\\rceil"
          }
        }
      ]
    ],
  },
});