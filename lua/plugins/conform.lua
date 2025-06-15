return {
  'stevearc/conform.nvim',
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier" },
      },
      stop_after_first = true,
      ft_parsers = {
        javascript = "babel",
        javascriptreact = "babel",
        typescript = "typescript",
        typescriptreact = "typescript",
        vue = "vue",
        css = "css",
        scss = "scss",
        less = "less",
        html = "html",
        json = "json",
        jsonc = "json",
        yaml = "yaml",
        markdown = "markdown",
        ["markdown.mdx"] = "mdx",
        graphql = "graphql",
        handlebars = "glimmer",
      },
      ext_parsers = {
        qmd = "markdown",
      },
    })
  end,
}

