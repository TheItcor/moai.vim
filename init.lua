

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
-- Last update: 13.11.2025
--                     Version 
--                        |
--                        |
--                        |
--                       \ /
--                        v
local config_version = '[v1.2] "Little Turtle"'
  
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

-- Searching settings 
vim.opt.ignorecase = true

-- Syntax light 
vim.opt.termguicolors = true

-- UTF-8 
vim.opt.encoding = "utf-8"

-- No swaps 
vim.opt.swapfile = false

-- }



-- Further for convenience
local vim = vim
local Plug = vim.fn['plug#']

-- Plugins {
vim.call('plug#begin')

-- Goods
Plug 'Mofiqul/vscode.nvim' -- Colorscheme
Plug 'nvim-lualine/lualine.nvim' -- Status Bar
-- Plug 'mhinz/vim-startify' -- Old Start Menu
Plug 'nvimdev/dashboard-nvim' -- New Start Menu


-- file manage
Plug 'nvim-treesitter/nvim-treesitter' -- Parser | it's here only for treesitter-family
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
-- Plug 'sheerun/vim-polyglot' -- Syntax highlight
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


-- Treesitter {
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'rust', 'python', 'typescript', 'c', 'cpp','java', 'javascript' },
  -- highlight = { enable = true },
  -- indent = { enable = true },
}
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
  },
  exclude = {
    filetypes = { "dashboard", "NvimTree",},
    buftypes = { "terminal" }, 
  }    
})
-- }


-- LSR settings {
-- Setup Mason and mason-lspconfig for installing LSP servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "rust_analyzer", "pyright", "ts_ls", "clangd"}
})

-- LSP capabilities from cmp_nvim_lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {'lua_ls', 'rust_analyzer', 'pyright', 'ts_ls', 'clangd'} 
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,  -- Attach capabilities for CMP integration
  })
  vim.lsp.enable(server)  -- Enable the config to activate for filetypes
end

-- Special setup for java
-- This uses autocmd to attach jdtls only for Java buffers, avoiding lspconfig issues...
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls = require('jdtls')
    jdtls.start_or_attach({
      cmd = { 'jdtls' },
      root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
      capabilities = capabilities,
    })
  end,
})

-- Snippets
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)  -- Expand snippets using LuaSnip
    end,
  },
  sources = {
    {
      name = 'nvim_lsp',
      max_item_count = 6,  -- Limit LSP suggestions to 6
      group_index = 1,
    },
    {
      name = 'luasnip',
      max_item_count = 3,  -- Limit snippet suggestions to 3
      group_index = 1,
    },
    {
      name = 'buffer',
      keyword_length = 3,
      max_item_count = 2,  -- Limit buffer suggestions to 2
      group_index = 2,
    },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection with Enter
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()  -- Next item in completion menu
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()  -- Expand or jump in snippet
      else
        fallback()
      end
    end, {'i', 's'}),  -- Apply in insert and select modes
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()  -- Previous item in completion menu
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()  -- Fallback to default Shift-Tab behavior
      end
    end, {'i', 's'}),
    ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion menu
  },
  completion = {
    keyword_length = 2,
    completeopt = "menu,menuone,noinsert,noselect",
  },
  window = {
    completion = {
      max_height = 6,
      scrollbar = true,  -- Enable scrollbar if needed
    }
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
    } 
  }
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
  --colors = {
  --  {fg = "#24d4b6"}, -- this thing works very stangely, so the color is set below
  --  {fg = "#2bc4b0"}
  --},
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
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#24d4b6", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#40E0D0", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#FFFFFF", bg = "NONE", bold = true }) 
vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#FFFFFF", bg = "NONE", bold = true })
-- }




