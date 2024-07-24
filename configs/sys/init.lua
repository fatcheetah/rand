-- download lazy vim plugin manager from git data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=c02268a",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
-- plugins just point at a git repo to be downloaded
-- always use tags or commits to force versioning
local plugins = {
    {
        "smoka7/hop.nvim", -- jump to pattern
        tag = "v2.4.0",
        commit = "a75b915",
        event = "VeryLazy"
    },
    {
        "neovim/nvim-lspconfig", -- lsp
        branch = "master",
        commit = "d0467b9"
    },
    {
        "mfussenegger/nvim-lsp-compl", -- lsp autocompletion
        branch = "master",
        commit = "030e270"
    },
    {
        "nvim-telescope/telescope.nvim", -- file finder
        tag = "0.1.4",
        commit = "7011eaa",
        dependencies = {
            "nvim-lua/plenary.nvim",
            commit = "a3e3bc8"
        }
    },
    {
        "folke/which-key.nvim", -- key helper & bindings
        tag = "v1.6.0",
        commit = "ce741eb",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 150
        end,
        opts = {}
    },
}

require("lazy").setup(plugins, opts) -- load lazy with plugins
require("hop").setup() -- load hop

-- load lspconfig with lsp_compl for autocomplete on type
-- install csharp ls > dotnet tool install --global csharp-ls
require'lspconfig'.csharp_ls.setup{on_attach=require"lsp_compl".attach}

vim.api.nvim_create_autocmd("LspAttach",  -- when lsp attaches
{
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- load lsp autocompletions into <c-x><c+o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local opts = { buffer = ev.buf }
        -- lsp keymaps
        vim.keymap.set("n", "g]", "<cmd>Telescope lsp_references<cr>", opts)
        vim.keymap.set("n", "gq", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
        -- disable semantic highlighting (:help lsp-semantic)
        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
          vim.api.nvim_set_hl(0, group, {})
        end
    end,
})
-- dont auto insert completions, also applies to lsp_compl
vim.opt.completeopt = "menu,preview,noinsert" 

-- better colors
vim.cmd [[colorscheme habamax]]
vim.cmd [[highlight normal ctermfg=white ctermbg=NONE]]
vim.cmd [[highlight comment ctermfg=green]]
vim.cmd [[highlight comment ctermfg=green]]
vim.cmd [[highlight linenr ctermfg=grey]]
vim.cmd [[highlight pmenu ctermbg=black ctermfg=240]]
vim.cmd [[highlight pmenusel ctermbg=black ctermfg=white]]
vim.cmd [[highlight cursorline ctermbg=234 cterm=NONE]]

-- better netrw using tree view and hiding .gitignore files
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] 

-- better defaults
local set = vim.opt
set.scrolloff = 8
set.number = true
set.mouse = ""
set.guicursor = ""
set.expandtab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = -1
set.hlsearch = true
set.showmatch = true
set.ignorecase = true
set.smartcase = true
set.wrap = true
set.linebreak = true
set.breakindent = true
set.showbreak = "~~~"
set.cursorline = true

vim.g.mapleader = " " -- bind <leader> to <space>
local wk = require("which-key") -- <leader> key binding(s) set through which-key
wk.register(
{
    f = { "<cmd>Lex %:p:h<cr>", "file explorer" },
    g = { "<cmd>HopLine<cr>", "hop line" },
    h = { "<cmd>HopPattern<cr>", "hop search" },
    l = { "<cmd>Telescope live_grep<cr>", "locate text" },
    n = { "<cmd>vsp<cr>", "split vertical" },
    p = { "<cmd>Telescope find_files<cr>", "find files" },
    v = { "<cmd>Telescope registers<cr>", "*registers*" },
    r = {
        r = { "gg=G<C-o>", "re-indent file" }
        ,"[format-options]"
    }
}, { prefix = "<leader>"})

-- command(s)
vim.api.nvim_create_user_command(
    'Datenow',
    ":put =strftime('## %a %d-%m-%Y %H:%M:%S')",
    { desc = "Puts current datetime into buffer" }
)

-- autocommand(s)
vim.api.nvim_create_autocmd(
{ "BufWritePre" }, -- on save
{
    pattern = { "*.md" }, -- if markdown
    command = ":%s/\\s\\+$//e" -- remove whitespace
})

vim.api.nvim_create_autocmd(
{ "FileType" }, -- on filetype
{ 
    pattern = { "cs" }, -- if csharp
    callback = function(ev) 
        -- csharp comment bindings
        vim.keymap.set("x", "<C-_>", ":s/^/\\/\\/<cr>:noh<cr>", { noremap = true })
    end,
})
