--
--   ██████   ██████                     ███     █████   █████  ███
--  ▒▒██████ ██████                     ▒▒▒     ▒▒███   ▒▒███  ▒▒▒
--   ▒███▒█████▒███   ██████   ██████   ████     ▒███    ▒███  ████  █████████████
--   ▒███▒▒███ ▒███  ███▒▒███ ▒▒▒▒▒███ ▒▒███     ▒███    ▒███ ▒▒███ ▒▒███▒▒███▒▒███
--   ▒███ ▒▒▒  ▒███ ▒███ ▒███  ███████  ▒███     ▒▒███   ███   ▒███  ▒███ ▒███ ▒███
--   ▒███      ▒███ ▒███ ▒███ ███▒▒███  ▒███      ▒▒▒█████▒    ▒███  ▒███ ▒███ ▒███
--   █████     █████▒▒██████ ▒▒████████ █████ ██    ▒▒███      █████ █████▒███ █████
--   ▒▒▒▒▒     ▒▒▒▒▒  ▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒ ▒▒      ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒
--
--
-- First set up: 06.11.2025
-- Author: Itcor (TheItcor)
-- Github page: github.com/TheItcor/Moai.Vim
-- Original Neovim: github.com/neovim/neovim
-- Description: Minimalistic Neovim config based on Vim-Plug.
--
-- Special thanks: Contributer(s)
--
--
-- Last update: 21.11.2025
--                     Version
--                        |
--                        |
--                        |
--                       \ /
--                        v
local config_version = '[v1.4] "Little Turtle"'

-- Basic settings {
vim.o.number = true -- Show numbers
vim.o.wrap = false -- Don't wrap long lines visually
vim.o.clipboard = 'unnamedplus' -- Use system clipboard for all
vim.o.mouse = 'a' -- Use mouse
vim.o.history = 200 -- Undo/Redo history
vim.o.ruler = true -- Always show cursor position in the bottom-right corner
vim.o.showcmd = true -- Show partial command in the last lin
vim.o.showmatch = true -- Briefly jump to matching bracket

-- Searching settings
vim.o.ignorecase = true -- Ignore case when searching with lowercase patterns...
vim.o.smartcase = true -- ...but respect case if the pattern contains uppercase letters

-- Syntax light
vim.o.termguicolors = true -- Enable 24-bit RGB colors

-- UTF-8
vim.o.encoding = 'utf-8' -- Default file encoding = UTF-8

-- No swaps
vim.o.swapfile = false

-- Tabs
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
-- }

-- Auto install VimPlug {
local data_dir = vim.fn.stdpath('data') .. '/site'
local plug_path = data_dir .. '/autoload/plug.vim'

if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.fn.system({
    'curl',
    '-fLo',
    plug_path,
    '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',
  })
  -- After install the Vimplug restarting the config
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end
-- }

-- Further for convenience
local Plug = vim.fn['plug#']

-- Plugins {
vim.call('plug#begin')

-- Goods
Plug('Mofiqul/vscode.nvim') -- Colorscheme
Plug('nvim-lualine/lualine.nvim') -- Status Bar
Plug('nvimdev/dashboard-nvim') -- New Start Menu

-- file manage
Plug('nvim-treesitter/nvim-treesitter') -- Parser | it's here only for treesitter-family
Plug('nvim-tree/nvim-tree.lua') -- File Manager
Plug('nvim-tree/nvim-web-devicons') -- Icons for File Manager
Plug('tpope/vim-fugitive') -- Git
Plug('lewis6991/gitsigns.nvim') -- Git icons on lines
Plug('nvim-lua/plenary.nvim') -- For telescope
Plug('nvim-telescope/telescope.nvim') -- Telescope

-- Coding
Plug('aliqyan-21/runTA.nvim') -- Run code
Plug('windwp/nvim-autopairs') -- New plugin for auto closed brakets
Plug('akinsho/toggleterm.nvim') -- Terminal
Plug('Wansmer/langmapper.nvim') -- Friendly non-English input
Plug('lukas-reineke/indent-blankline.nvim') -- For C-style code {}

-- LSR
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('mfussenegger/nvim-jdtls')

-- Snippets
Plug('L3MON4D3/LuaSnip')
Plug('rafamadriz/friendly-snippets')
Plug('saadparwaiz1/cmp_luasnip')

-- -- Add here your plugins! -- --

vim.call('plug#end')
-- }

-- Activation of ColorScheme
vim.cmd.colorscheme('vscode')
-- }

-- Actication of Lualine
require('lualine').setup({})
-- }

-- Treesitter {
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'lua',
    'python',
    'javascript',
    'typescript',
    'c',
    'cpp',
    'rust',
    'java',
    'json',
    'yaml',
    'nasm', -- Assembly x86 / 86_64 (Intel Syntax)

    -- -- Add here your language! -- --

    -- 'arm_asm', - ARM-assambly
    -- 'asm', - Assembly x86 / x86_64 (AT&T Syntax)
    -- 'go',
    -- 'html',
    -- 'css',
    -- 'kotlin',
    -- 'csharp',
    -- 'php',
  },
  highlight = { enable = true }, -- better syntax highlight
  indent = { enable = true },
})
-- }

-- File Manager {
require('nvim-tree').setup({
  view = {
    width = 30,
    side = 'left',
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
-- }

-- Settings Gitsigns {
require('gitsigns').setup()
-- }

-- Settings Telescope {
require('telescope').setup({
  defaults = {},
})
-- }

-- Compile && Run code {
require('runTA.commands').setup({
  output_window_type = 'pane',
  output_window_configs = {
    position = 'bottom',
    transparent = 'false',
  },
})
-- }

-- Auto Pairs {
require('nvim-autopairs').setup({})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
-- }

-- Terminal {
require('toggleterm').setup({
  size = 15,
  open_mapping = [[<A-x>]],
  shade_filetypes = {},
  direction = 'horizontal',
  float_opts = {
    border = 'curved',
  },
  on_open = function(term)
    -- Clear terminal after opening
    vim.defer_fn(function()
      vim.api.nvim_chan_send(term.job_id, 'clear\n')
    end, 10)
  end,
})
-- }

-- For C-style code {
require('ibl').setup({
  indent = {
    char = '│',
  },
  exclude = {
    filetypes = { 'dashboard', 'NvimTree' },
    buftypes = { 'terminal' },
  },
})
-- }

-- LSR settings {
-- Setup Mason and mason-lspconfig for installing LSP servers
require('mason').setup()
require('mason-lspconfig').setup({
  --  ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "ts_ls", "clangd" },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'lua_ls', 'rust_analyzer', 'pyright', 'ts_ls', 'clangd', 'asm_lsp' }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
    -- settings = { ... },
    -- on_attach = on_attach,
  })
  --  vim.lsp.enable(server)
end

-- Special setup for java
-- This uses autocmd to attach jdtls only for Java buffers, avoiding lspconfig issues...
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function()
    if vim.fn.executable('jdtls') == 0 or vim.fn.executable('java') == 0 then
      return -- if the user doesn't have Java, then just skip it
    end

    local ok, jdtls = pcall(require, 'jdtls')
    if not ok then
      return
    end

    pcall(jdtls.start_or_attach, {
      cmd = { 'jdtls' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]) or vim.fn.getcwd(),
      capabilities = capabilities,
    })
  end,
})
-- }

-- Snippets {
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Expand snippets using LuaSnip
    end,
  },
  sources = {
    {
      name = 'nvim_lsp',
      max_item_count = 6, -- Limit LSP suggestions to 6
      group_index = 1,
    },
    {
      name = 'luasnip',
      max_item_count = 3, -- Limit snippet suggestions to 3
      group_index = 1,
    },
    {
      name = 'buffer',
      keyword_length = 3,
      max_item_count = 2, -- Limit buffer suggestions to 2
      group_index = 2,
    },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- Next item in completion menu
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump() -- Expand or jump in snippet
      else
        fallback()
      end
    end, { 'i', 's' }), -- Apply in insert and select modes
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- Previous item in completion menu
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback() -- Fallback to default Shift-Tab behavior
      end
    end, { 'i', 's' }),
    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion menu
  },
  completion = {
    keyword_length = 2,
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  window = {
    completion = {
      max_height = 6,
      scrollbar = true, -- Enable scrollbar if needed
    },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
})
-- }

-- Friendly non-English input {
require('langmapper').setup({
  layout = {
    'ru',
    'be',
    'de',
    'fr',
    'es',
    'it',
    'pl',
    'cz',
    'tr',
    'jp',
    'cn',
    'kr',
    'pt',
    'br',
    'fi',
    'sv',
    'no',
    'da',
    'hu',
    'ro',
    'bg',
    'gr',
    'nl',
    'in',
  },
  keep_keymaps = true,
})
-- }

-- KEYMAPS {
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<A-e>', ':NvimTreeToggle<CR>', {}) -- Open/Close Tree File Manager
vim.keymap.set('n', '<F5>', ':RunCode<CR>', { noremap = true, silent = true, desc = 'Run current code' })
--- LSR
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
--- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find text (live grep)' })
-- }

-- Start screen {
require('dashboard').setup({
  theme = 'doom',
  config = {
    header = {
      '',
      '',
      '                               ::...... : :::                  ',
      '                    ::.    : . :. --.-- .-:=:--+               ',
      '                   - .... .   :.    : . --:. +**#*             ',
      '                 .:. :-:+#%%%%%%%#*-+:..::-+*****-***          ',
      '                =.-%%@@%%%%%%%%%%%%%%%%%%%+++%*##=#**          ',
      '                %%%%@%%@%: :. +-+#@@@%%%%%%%%#*%#%%%#          ',
      '                %%%%@@%%%=..:.=:+%%#%###%%%%%%#%#*+#*          ',
      '                =#++==+*-... -++#%*+=-+++=+=-**#%+*##          ',
      '                 :.=--==. :.::-+#-:----..: ::=###*#*#          ',
      '               :.::.---:. ..+:=*%-:-=-:.=.-..*#%#+###          ',
      '               --..----. -.-=*+*-=:.-.: ::--%%###*##*          ',
      '              =....--.. ..+==+*#==:--:-=:--=%%%%%+#*#          ',
      '              -::-... .:-:::=::::+-:=.:-==*%##%##*###          ',
      '              =-::++*###**+-=+*--==:=--:=+##%%######*          ',
      '              ==-%@@%#%%%@@@@%%##*%--:==+*%%#%%##*##*          ',
      '              +:-+#%%%%%@@%%%%%%%%*++==+=#######%####          ',
      '              =.--.-=**#****++**=+-===+**#####*#%%%##          ',
      '              --.:..:-.: ..:=--=++=-+==++##%%###%@%            ',
      '              =:#%%=:.. .:-*%@%=-:=+++++*##*#%#%%%             ',
      '              -*#############%#**#*+*++*+##%*####%             ',
      '             ==+*#****##**####%####+**+#*##*#####%             ',
      '             ==*+*+++=*+*++++*#**+=*#*+####%#####%             ',
      '             =--=-+=======+=+++**=++*=*+*#%####*#%             ',
      '            -=-==.==+:==--=+==::=+++=++=#*##%%%%%##            ',
      '            #+=+==:---=-=-======-+=+++*#%%%%%%%%%###**.        ',
      '              #==:+-=-+:-+:-=*=+#%%@%%%%%%%%%#%%##*++++-.      ',
      '             =-:*#%%%%%%%@%%%%@%%%%%%%%%%%%%##%%##****=-==:=   ',
      '',
      ((' '):rep(61) .. '%s'):format(config_version),
      '',
      '',
    },
    center = {
      {
        icon = '  ',
        desc = 'New File             ',
        key = 'n',
        action = 'ene | startinsert',
      },
      {
        icon = '󰈞  ',
        desc = 'Find File            ',
        key = 'f',
        action = 'Telescope find_files',
      },
      {
        icon = '  ',
        desc = 'Recent Files         ',
        key = 'r',
        action = 'Telescope oldfiles',
      },
      {
        icon = '  ',
        desc = 'Config               ',
        key = 'c',
        action = 'e $MYVIMRC',
      },
      {
        icon = '󰅚  ',
        desc = 'Quit                 ',
        key = 'q',
        action = 'qa',
      },
    },
    footer = {},
  },
})
-- colors for main menu --
vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#24d4b6', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#40E0D0', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#FFFFFF', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#FFFFFF', bg = 'NONE', bold = true })
-- }
