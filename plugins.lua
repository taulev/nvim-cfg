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
-- Change <Leader> to <Space>
let.mapleader = ' '
map('n', '<Leader>e', ':Explore<CR>', { noremap = true, silent = false })

-- Set various vim options
set.relativenumber = true
set.ruler = true

-- Golang import/format on save
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! GoImports ]], false)


-- Packer something I dont understand
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You add plugins here  
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
end)

