local util = require 'lspconfig.util'

return {
  default_config = {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = {
      'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
      'vue', 'svelte', 'php', 'blade', 'templ'
    },
    settings = {
      tailwindCSS = {
        validate = true,
        lint = {
          cssConflict = 'warning',
          invalidApply = 'error',
          invalidScreen = 'error',
          invalidVariant = 'error',
          invalidConfigPath = 'error',
          invalidTailwindDirective = 'error',
          recommendedVariantOrder = 'warning',
        },
        classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
        includeLanguages = {
          eelixir = 'html-eex',
          eruby = 'erb',
          templ = 'html',
        },
      },
    },
    root_dir = function(fname)
      return util.root_pattern(
        'tailwind.config.js',
        'tailwind.config.ts',
        'postcss.config.js',
        'postcss.config.ts',
        'package.json'
      )(fname)
    end,
  }
}

