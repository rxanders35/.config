vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.o.clipboard = "unnamedplus"

--plugins
vim.pack.add({
    { src = "https://github.com/stevedylandev/darkmatter-nvim.git" },
    { src = "https://github.com/vague2k/vague.nvim.git" },
    { src = "https://github.com/WTFox/jellybeans.nvim.git" },
    { src = "https://github.com/fenetikm/falcon.git" },
    { src = "https://github.com/stevearc/oil.nvim.git" },
    { src = "https://github.com/neovim/nvim-lspconfig.git" },
    { src = "https://github.com/hrsh7th/nvim-cmp.git" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
    { src = "https://github.com/hrsh7th/cmp-buffer.git" },
    { src = "https://github.com/nvim-mini/mini.pick.git" },
    { src = "https://github.com/windwp/nvim-autopairs.git" },
})

--theme
vim.cmd("colorscheme falcon")

--oil
require("oil").setup()
vim.keymap.set('n', '<leader>-', '<CMD>:Oil<CR>')

--pick
vim.keymap.set('n', '<leader>p', function()
    require("mini.pick").builtin.files()
end)

--Auto-pairs
require("nvim-autopairs").setup()


vim.lsp.config["lua_ls"] = {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
}

--Rust
vim.lsp.config["rust_analyzer"] = {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
    },
  },
}

--Go
vim.lsp.config["gopls"] = {}

--Python
vim.lsp.config["pyright"] = {}

--C/C++
vim.lsp.config["clangd"] = {}


vim.keymap.set('i', '<C-Space>', function()
    vim.lsp.buf.completion()
end)
