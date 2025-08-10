local util = require("lspconfig.util")

return {
  default_config = {
    cmd = { "ruby-lsp" },
    filetypes = { "ruby", "eruby" },
    root_dir = util.root_pattern("Gemfile", ".git", ".ruby-version"),
    init_options = {
      formatter = "auto",
    },
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd_cwd = new_root_dir
    end,
  },
}

