api = vim.api
set = vim.opt
let = vim.g

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Key Mappings
local map = require("keymap/keymap").keymap
map('n', '<Space>', '<Nop>')
let.mapleader = ' ' -- Change <Leader> to <Space>
map('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<Leader>gd', ':GoDoc<CR>', { silent = true })
map('n', '<Leader>fst', ':GoFillStruct<CR>', { silent = true })
map('n', '<Leader>aty', ':GoAddTags yaml<CR>', { silent = true })
map('n', '<Leader>atj', ':GoAddTags json<CR>', { silent = true })
map('n', '<Leader>rt', ':GoRemoveTags<CR>', { silent = true })
map('n', '<Leader>ac', ':GoCmt<CR>', { silent = true })
map('n', '<Leader>-', ':res -1<CR>', { silent = true })
map('n', '<Leader>=', ':res +1<CR>', { silent = true })
map('n', '<Leader>,', ':vert res -1<CR>', { silent = true })
map('n', '<Leader>.', ':vert res +1<CR>', { silent = true })
map('n', '<Leader>sh', ':terminal<CR>', { silent = true })
map('n', '<Leader>ct', ':CtrlSFToggle<CR>', { silent = true })
map('n', '<Leader>cs', ':CtrlSF<CR> :CtrlSFFocus<CR>', { silent = true })


-- Set various vim options
set.number = true
set.relativenumber = true
set.ruler = true
set.splitright = true
set.splitbelow = true

-- Golang LSP
--require('lspconfig').gopls.setup{
--	cmd = {'gopls'},
--  settings = {
--    gopls = {
--      analyses = {
--        nilness = true,
--        unusedparams = true,
--        unusedwrite = true,
--        useany = true,
--      },
--      experimentalPostfixCompletions = true,
--      gofumpt = true,
--      staticcheck = true,
--      usePlaceholders = true,
--    },
--  },
--	on_attach = on_attach,
--}


-- Needs npm
-- curl -sL install-node.vercel.app/lts | bash
-- npm install -g intelephense
-- PHP LSP
--require('lspconfig').intelephense.setup{}

-- nvim-cmp reccomended config
--local cmp = require('cmp')
--cmp.setup({
--  snippet = {
--    expand = function(args)
--        vim.fn["vsnip#anonymous"](args.body)
--    end,
--  },
--  mapping = {
--    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--    ['<Tab>'] = cmp.mapping.select_next_item(),
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-e>'] = cmp.mapping.close(),
--    ['<CR>'] = cmp.mapping.confirm({
--      behavior = cmp.ConfirmBehavior.Insert,
--      select = true,
--    })
--  },
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'vsnip' },
--    { name = 'path' },
--    { name = 'buffer' },
--    { name = 'nvim_lsp_signature_help' },
--  },
--})
--
---- Treesitter stuff
--require('nvim-treesitter.configs').setup {
--  ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork", "hcl", "help", "html", "http", "javascript", "json", "lua", "make", "markdown", "python", "regex", "ruby", "rust", "toml", "vim", "yaml", "zig" },
--  highlight = {
--    enable = true,
--  },
--  rainbow = {
--    enable = true,
--    extended_mode = true,
--    max_file_lines = nil,
--  }
--}
--require('hlargs').setup()
--require('nvim-tree').setup()
--
--
---- null-ls config
--local null_ls = require('null-ls')
--null_ls.setup({
--   sources = {
--	null_ls.builtins.formatting.phpcsfixer,
--	null_ls.builtins.diagnostics.php,
--	null_ls.builtins.diagnostics.phpstan,
--   },
--})
--
---- Golang import/format on save
--api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
--api.nvim_exec([[ autocmd BufWritePre *.go :silent! GoImports ]], false)


-- Packer something I dont understand
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You add plugins here  
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'folke/trouble.nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'j-hui/fidget.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'm-demare/hlargs.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'simrat39/rust-tools.nvim'
  use 'weilbith/nvim-code-action-menu'
  use 'williamboman/nvim-lsp-installer'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'dyng/ctrlsf.vim'
  use { 'neoclide/coc.nvim', branch = 'release' }

  use({
	  'jose-elias-alvarez/null-ls.nvim',
	  config = function()
		  require('null-ls').setup()
	  end,
	  requires = { 'nvim-lua/plenary.nvim' }
  })

end)
