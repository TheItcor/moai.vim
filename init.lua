

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
-- github.com/TheItcor/Moai.Vim
-- Original Neovim: github.com/neovim/neovim
-- Neovim config for programming based on VimPlug.
-- 
--
--
-- Last update: 09.11.2025
-- Version 
--      |
--      |
--      |
--     \ /
--      v
local config_version = '[v1.0] "Little Turtle"' 
  
-- Basic settings {
vim.opt.number = true

-- Tabs
vim.opt.expandtab = true    
vim.opt.tabstop = 4       
vim.opt.shiftwidth = 4  
vim.opt.softtabstop = 4   
vim.opt.autoindent = true 
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.history = 200
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.shortmess:append("I")
vim.opt.showmatch = true

-- Searching settings {
vim.opt.ignorecase = true
-- }

-- Syntax light {
vim.opt.syntax = "ON"
vim.opt.termguicolors = true
-- }

-- UTF-8 {
vim.opt.encoding = "utf-8"
--}

-- No swaps {
vim.opt.swapfile = false
-- }

-- }



-- Further for convenience
local vim = vim
local Plug = vim.fn['plug#']

-- Plugins {
vim.call('plug#begin')

-- Goods
Plug 'Mofiqul/vscode.nvim' -- Colorscheme
Plug 'nvim-lualine/lualine.nvim' -- Status Bar
-- Plug 'mhinz/vim-startify' -- Start Menu
Plug 'nvimdev/dashboard-nvim' -- Start Menu


-- file manage
Plug 'nvim-tree/nvim-tree.lua' -- File Manager
Plug 'nvim-tree/nvim-web-devicons' -- Icons for File Manager
Plug 'tpope/vim-fugitive' -- Git
Plug 'lewis6991/gitsigns.nvim' -- Git icons on lines
Plug 'nvim-lua/plenary.nvim' -- For telescope
Plug 'nvim-telescope/telescope.nvim' -- Telescope


-- Coding
Plug 'aliqyan-21/runTA.nvim' -- Run code
Plug 'jiangmiao/auto-pairs' -- Auto closed brakets
Plug 'akinsho/toggleterm.nvim' -- Terminal
Plug 'sheerun/vim-polyglot' -- Syntax highlight
Plug 'Wansmer/langmapper.nvim' -- Friendly non-English input
Plug 'lukas-reineke/indent-blankline.nvim' -- For C-style code {}


-- LSR
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'mfussenegger/nvim-jdtls'


-- Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'


-- -- Add here your plugins! -- --


vim.call('plug#end')
-- }



-- Activation of ColorScheme
vim.cmd([[colorscheme vscode]])
-- }


-- Actication of Lualine
require('lualine').setup{}
-- }


-- File Manager {
require("nvim-tree"). setup({
  view = {
    width = 30,
    side = "left",
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

-- Settings Telescope
require('telescope').setup{
  defaults = {
  },
}



-- Compile && Run code {
require('runTA.commands').setup({
    output_window_type = "pane",
    output_window_configs = {
      position = "bottom",
      transparent = "false"
  }
})
-- }


-- Terminal {
require("toggleterm").setup({
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
      vim.api.nvim_chan_send(term.job_id, "clear\n")
    end, 10)
  end,
})
-- }

-- For c-style code {
require('ibl').setup({
indent = { 
    char = "│", 
    highlight = highlight
  },
  exclude = {
    filetypes = { "dashboard", "NvimTree",},
    buftypes = { "terminal" }, 
  }    
})
-- }


-- LSR settings {
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "rust_analyzer", "pyright", "ts_ls", "jdtls"}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {'lua_ls', 'rust_analyzer', 'pyright', 'ts_ls', 'clangd', 'jdtls'}
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
  vim.lsp.enable(server)
end

local cmp = require'cmp'
cmp.setup({
  sources = {
    { 
      name = 'nvim_lsp', 
      max_item_count = 6, -- limits LSP to 6 options
      group_index = 1,
    },
    { 
      name = 'buffer', 
      keyword_length = 3,
      max_item_count = 2, -- buffer only 2 options
      group_index = 2,
    },
  },

  mapping = {
    -- KEYMAP!
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(), 
  },

  completion = {
    keyword_length = 2,
    completeopt = "menu,menuone,noinsert,noselect",
  },

  window = {
    completion = {
      max_height = 6, 
      scrollbar = true,
    }
  },
  
  -- Group & Sort
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
    }
  }
})
-- }


-- Snippets {
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },

  sources = {
    { name = 'nvim_lsp', max_item_count = 6 },
    { name = 'buffer', keyword_length = 3, max_item_count = 2 },
    { name = 'luasnip' }, --
  },
})
-- }


-- Friendly non-English input {
require('langmapper').setup {
  layout = {'ru', 'be', 'de', 'fr', 'es', 'it', 'pl', 'cz', 'tr', 'jp', 'cn', 'kr', 'pt', 'br', 'fi', 'sv', 'no', 'da', 'hu', 'ro', 'bg', 'gr', 'nl', 'in'},
  keep_keymaps = true,
}
-- }


-- KEYMAPS {
vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
  colors = {
    {fg = "#24d4b6"}, -- this thing works very stangely, so the color is set below
    {fg = "#2bc4b0"}, 
    {fg = '#98c379'}
  },
  config = {
    header = {
      "",
      "",
      "                               ::...... : :::                  ",
      "                    ::.    : . :. --.-- .-:=:--+               ",
      "                   - .... .   :.    : . --:. +**#*             ",
      "                 .:. :-:+#%%%%%%%#*-+:..::-+*****-***          ",
      "                =.-%%@@%%%%%%%%%%%%%%%%%%%+++%*##=#**          ",
      "                %%%%@%%@%: :. +-+#@@@%%%%%%%%#*%#%%%#          ",
      "                %%%%@@%%%=..:.=:+%%#%###%%%%%%#%#*+#*          ",
      "                =#++==+*-... -++#%*+=-+++=+=-**#%+*##          ",
      "                 :.=--==. :.::-+#-:----..: ::=###*#*#          ",
      "               :.::.---:. ..+:=*%-:-=-:.=.-..*#%#+###          ",
      "               --..----. -.-=*+*-=:.-.: ::--%%###*##*          ",
      "              =....--.. ..+==+*#==:--:-=:--=%%%%%+#*#          ",
      "              -::-... .:-:::=::::+-:=.:-==*%##%##*###          ",
      "              =-::++*###**+-=+*--==:=--:=+##%%######*          ",
      "              ==-%@@%#%%%@@@@%%##*%--:==+*%%#%%##*##*          ",
      "              +:-+#%%%%%@@%%%%%%%%*++==+=#######%####          ",
      "              =.--.-=**#****++**=+-===+**#####*#%%%##          ",
      "              --.:..:-.: ..:=--=++=-+==++##%%###%@%            ",
      "              =:#%%=:.. .:-*%@%=-:=+++++*##*#%#%%%             ",
      "              -*#############%#**#*+*++*+##%*####%             ",
      "             ==+*#****##**####%####+**+#*##*#####%             ",
      "             ==*+*+++=*+*++++*#**+=*#*+####%#####%             ",
      "             =--=-+=======+=+++**=++*=*+*#%####*#%             ",
      "            -=-==.==+:==--=+==::=+++=++=#*##%%%%%##            ",
      "            #+=+==:---=-=-======-+=+++*#%%%%%%%%%###**.        ",
      "              #==:+-=-+:-+:-=*=+#%%@%%%%%%%%%#%%##*++++-.      ",
      "             =-:*#%%%%%%%@%%%%@%%%%%%%%%%%%%##%%##****=-==:=   ",
      "",
      string.format("                                                       %s", config_version),
      "",
      "",
    },
    center = {
      {
        icon = "  ",
        desc = "New File             ",
        key = "n",
        action = "ene | startinsert",
      },
      {
        icon = "󰈞  ",
        desc = "Find File            ",
        key = "f",
        action = "Telescope find_files",
      },
      {
        icon = "  ",
        desc = "Recent Files         ",
        key = "r",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        desc = "Config               ",
        key = "c",
        action = "e $MYVIMRC",
      },
      {
        icon = "󰅚  ",
        desc = "Quit                 ",
        key = "q",
        action = "qa",
      },
    },
    footer = {},

  }
})
-- }
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#24d4b6", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#2bc4b0", bg = "NONE", bold = true })



