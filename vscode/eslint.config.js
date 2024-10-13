import eslint from "@eslint/js";
import globals from "globals";

export default [
  eslint.configs.recommended,
  {
    languageOptions: {
      globals: globals.browser,
    },
    rules: {
      semi:  ["error", "always"],
    },
  },
];
