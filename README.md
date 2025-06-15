# Neovim Configuration

This repository contains a modular, plugin-based Neovim configuration written in Lua. It leverages [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and aims to provide a modern, productive, and visually appealing development environment.

## Features

- **Plugin Management:** Uses `lazy.nvim` for fast, lazy-loaded plugin management.
- **LSP Support:** Pre-configured Language Server Protocol (LSP) support for many languages (TypeScript, Python, SQL, YAML, Docker, HTML, CSS, Bash, Ansible, Markdown, Nginx, and more).
- **Autocompletion:** Powered by `nvim-cmp` with snippet support via `LuaSnip`.
- **Fuzzy Finder:** Integrated `telescope.nvim` for searching files, buffers, help, and more.
- **File Explorer:** `neo-tree.nvim` for a modern file tree with git integration.
- **Statusline & Bufferline:** Beautiful statusline (`lualine.nvim`) and bufferline (`bufferline.nvim`).
- **Syntax Highlighting:** `nvim-treesitter` for advanced syntax highlighting and code navigation.
- **Formatting & Linting:** Automatic formatting with `conform.nvim` and LSP-based diagnostics.
- **Git Integration:** `gitsigns.nvim`, `vim-fugitive`, and `lazygit.nvim` for powerful git workflows.
- **UI Enhancements:** `noice.nvim` for improved notifications and command line, `which-key.nvim` for keybinding hints, and more.
- **Color Theme:** Uses the `onedark.nvim` theme with transparent background support.
- **Miscellaneous:** Includes plugins for autopairs, color highlighting, todo comments, and more.

## Directory Structure

```
init.lua
lua/
  core/
    keymaps.lua
    options.lua
  plugins/
    <plugin-configs>.lua
    lsp-configs/
      <lsp-server>.lua
lazy-lock.json
```

- `init.lua`: Entry point, loads core settings and plugins.
- `lua/core/`: Editor options and keymaps.
- `lua/plugins/`: Plugin specifications and configurations.
- `lua/plugins/lsp-configs/`: Per-language LSP server configurations.
- `lazy-lock.json`: Plugin lockfile (auto-generated).

## Installation

1. **Clone this repository** into your Neovim config directory:

   ```sh
   git clone <this-repo-url> ~/.config/nvim
   ```

2. **Start Neovim**. The configuration will automatically bootstrap [lazy.nvim](https://github.com/folke/lazy.nvim) and install all plugins.

3. **Install LSP servers and formatters**  
   Most language servers and formatters are managed via [mason.nvim](https://github.com/williamboman/mason.nvim).  
   Open Neovim and run:

   ```
   :Mason
   ```

   to install or manage external tools.

4. **(Optional) Install additional dependencies**  
   Some language servers require external installation (e.g., via `npm`, `pip`). See the documentation in `lua/plugins/lsp-configs/` for details.

## Usage

- **File Explorer:**  
  - Toggle: `<leader>e`
  - Reveal current file: `\`
- **Fuzzy Finder:**  
  - Find files: `<leader>ff`
  - Live grep: `<leader>fg`
- **Buffer Navigation:**  
  - Next buffer: `<Tab>`
  - Previous buffer: `<S-Tab>`
  - Close buffer: `<leader>x`
- **LSP:**  
  - Go to definition: `gd`
  - References: `gr`
  - Rename: `<leader>rn`
  - Code action: `<leader>ca`
- **Formatting:**  
  - Format file: `<leader>fm`
- **Git:**  
  - Open LazyGit: `<leader>lg`
  - Git status in Neo-tree: `<leader>ngs`
- **Keybinding Help:**  
  - Show available keybindings: (wait for which-key popup after pressing `<leader>`)

## Customization

- **Add/Remove Plugins:**  
  Edit files in [`lua/plugins/`](lua/plugins/) to add or remove plugins.
- **LSP Servers:**  
  Add new LSP configs in [`lua/plugins/lsp-configs/`](lua/plugins/lsp-configs/).
- **Keymaps & Options:**  
  Edit [`lua/core/keymaps.lua`](lua/core/keymaps.lua) and [`lua/core/options.lua`](lua/core/options.lua).

## Updating

To update plugins, run:

```
:Lazy update
```

## License

CHICKEN >.<