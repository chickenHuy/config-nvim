return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 7,               -- Default terminal size
    open_mapping = [[<C-\>]], -- Toggle terminal with Ctrl + \
    hide_numbers = true,     -- Hide line numbers in terminal
    shade_terminals = true,  -- Add shading to terminal
    shading_factor = 2,      -- Amount of shading
    start_in_insert = true,  -- Start terminal in insert mode
    persist_size = true,     -- Remember terminal size
    direction = "horizontal", -- Default direction: "horizontal", "vertical", "float", "tab"
    close_on_exit = true,    -- Close terminal when process exits
    shell = vim.o.shell,     -- Use Neovim's default shell
  },
}

