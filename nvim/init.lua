vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.termguicolors = true
vim.wo.signcolumn = "yes"

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>j', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set("n", "J", "5j", { noremap = true })
vim.keymap.set("n", "K", "5k", { noremap = true })

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
	{ src = "https://github.com/epwalsh/obsidian.nvim.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim.git" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
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

vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
  "gopls",
  "pyright",
  "clangd",
})

--obsidian
require("obsidian").setup({
  workspaces = {
    {
      name = "notes",
      path = "~/Documents/Obsidian Vault",
    },
  },
})


-- Setup nvim-cmp
local cmp = require("cmp")

cmp.setup({
  snippet = { expand = function() end },

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-Space>"] = cmp.mapping.complete(),
  },

  sources = {
    { name = "nvim_lsp" },
  },

  experimental = {
    ghost_text = true,
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config["lua_ls"].capabilities = capabilities
vim.lsp.config["rust_analyzer"].capabilities = capabilities
vim.lsp.config["gopls"].capabilities = capabilities
vim.lsp.config["pyright"].capabilities = capabilities
vim.lsp.config["clangd"].capabilities = capabilities

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "rust",
    "go",
    "python",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
  },
  highlight = { enable = true },
  indent = { enable = true },
})

