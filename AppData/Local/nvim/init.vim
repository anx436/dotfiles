lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
EOF

lua << EOF
require("lazy").setup({
-- list of plugins.

-- { "conornewton/vim-latex-preview" },
-- { "lervag/vimtex" },
-- { "mcchrish/nnn.vim" },
-- { "neoclide/coc.nvim", branch = "release" },
-- { "preservim/nerdtree" },
-- { "sjl/gundo.vim" },                              -- undo tree visualized
-- { "tribela/vim-transparent" },
-- { "junegunn/goyo.vim" },

{ "chrisbra/unicode.vim" },                          -- unicode code of char under cursor
{ "godlygeek/tabular" },
{ "machakann/vim-highlightedyank" },
{ "mbbill/undotree" }, -- undotree, requires scoop install diffutils on windows
{ "powerman/vim-plugin-ruscmd" },
{ "preservim/vim-indent-guides" },
{ "tpope/vim-abolish" },
{ "tpope/vim-commentary" },                          -- gcc to comment something
{ "tpope/vim-repeat" },
{ "tpope/vim-surround" },                            -- surrounding words in brackets, tags, function calls
{ "tpope/vim-unimpaired" },                          -- only really use: [b for :bprevious
{ "tpope/vim-speeddating" },                         -- c-x on dates and time
{ "chrisbra/colorizer" },                            -- display color by its hexcode
{ "lambdalisue/vim-suda" },                          -- sudo write
-- { "junegunn/fzf.vim" },

-- { "chaoren/vim-wordmotion" },                     -- camelcase word motion var1

-- colorschemes
{ "rakr/vim-two-firewatch" },                        -- colorscheme
{ "haishanh/night-owl.vim" },                        -- colorscheme
{ "frenzyexists/aquarium-vim", branch = "develop" }, -- colorscheme
{ "bluz71/vim-moonfly-colors" },                     -- colorscheme
{ "bluz71/vim-nightfly-guicolors" },                 -- colorscheme
{ "pineapplegiant/spaceduck" },                      -- colorscheme
{ "sainnhe/gruvbox-material" },                      -- colorscheme
{ "tomasiser/vim-code-dark" },                       -- colorscheme
{ "flazz/vim-colorschemes" },                        -- supposedly installs all colorschemes below

-- { "tomasr/molokai" },                             -- colorscheme
-- { "patstockwell/vim-monokai-tasty" },             -- colorscheme
-- { "dracula/vim", name = "dracula" },              -- colorscheme
-- { "arcticicestudio/nord-vim" },                   -- colorscheme
-- { "joshdick/onedark.vim" },                       -- colorscheme
-- { "morhetz/gruvbox" },                            -- colorscheme
-- { "jacoborus/tender.vim" },                       -- colorscheme
-- { "cocopon/iceberg.vim" },                        -- colorscheme

-- plugin configuration

-- hlslens config
{ "kevinhwang91/nvim-hlslens", config = function()
  require('hlslens').setup()
  local kopts = {noremap = true, silent = true}
  vim.api.nvim_set_keymap('n', 'n',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts)
  vim.api.nvim_set_keymap('n', 'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      kopts)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
end },

-- nvim-spider config -- to fix a bug with skipping over russian symbols run $ sudo pacman -S lua51-luautf8 or windows alternative
-- { "chrisgrieser/nvim-spider",
-- 	keys = {
-- 		{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
-- 		{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
-- 		{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
-- 		{ "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
-- 	},
-- },

{ "vim-airline/vim-airline" }, -- statusline
{ "vim-airline/vim-airline-themes", dependencies = "vim-airline/vim-airline" },

{ "xolox/vim-colorscheme-switcher", dependencies = "xolox/vim-misc" }, -- colorscheme switcher
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  { "justinmk/vim-dirvish" }, -- directory viewer, netrw replacement cmd = { "dirvish", "dirvishtoggle" } },
  { url = "https://codeberg.org/andyg/leap.nvim" }, -- move cursor to label
  -- {
  --   'mikesmithgh/kitty-scrollback.nvim',
  --   enabled = true,
  --   lazy = true,
  --   cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth', 'KittyScrollbackGenerateCommandLineEditing' },
  --   event = { 'User KittyScrollbackLaunch' },
  --   -- version = '*', -- latest stable version, may have breaking changes if major version changed
  --   -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
  --   config = function()
  --     require('kitty-scrollback').setup()
  --   end,
  -- },
  -- install with yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
      'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
          'nvim-lua/plenary.nvim',
          -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      }
  },

-- plugins list end @@
})
EOF

" command used for plugin list formatting plug '<,'>Tabularize /\s\+\zs"\ze\s\+\w/l1
" command used for plugin list formatting lazy nvim '<,'>Tabularize /\s\+\zs--\ze\s\+\w/l1

" set omnifunc=syntaxcomplete#Complete
set omnifunc=v:lua.vim.lsp.omnifunc

runtime macros/matchit.vim
syntax on

set history=200

set nu
set rnu
set ic

set encoding=utf-8

set wildmenu
set incsearch
set hlsearch

set ruler
set showcmd

set splitbelow
set splitright

set expandtab
set tabstop=2
set shiftwidth=2

set hidden

" set spell

set undofile
set undodir=~/.vim/undodir
" let g:loaded_matchparen=0

set shell=/bin/zsh

" movement in split panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" change color of keyword completion dialogue
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

"man pages in vim
runtime ftplugin/man.vim
let g:ft_man_open_mode = 'tab'

"Search for the Current Visual Selection
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

let mapleader=" "
" map <Leader>J :!node -i -e "$(<%)"<Enter>
" map <Leader>j :!node %<Enter>
" map <Leader>h :!firefox %<Enter>
" map <Leader>p o<Esc>"+p

"copy-paste

"windows
map <Leader>y "+y
"map <Leader>Y "*y

" " wayland
" " Copy exact visual selection to Wayland clipboard
" xnoremap <Leader>y y:call system('wl-copy -n', @")<CR>
" xnoremap <Leader>н y:call system('wl-copy -n', @")<CR>

" paste
noremap <Leader>p "+p
noremap <Leader>з "+p

" map <Leader>V :source ~/.vimrc<Enter>
map <Leader>vv ggVG
" map <Leader>u :GundoToggle<Enter>
" map <Leader>l :silent !pdflatex %; mupdf %:r.pdf<Enter>
" map <Leader>L :silent !mupdf %:r.pdf<Enter>
" map <Leader>w :silent !texworks %<Enter>
" map <Leader>г :GundoToggle<Enter>

noremap <Leader>ъ :bnext<Enter>
noremap <Leader>х :bprev<Enter>

" Use K to show documentation in preview window.
" nnoremap <silent> K :call ShowDocumentation()<CR>

" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" map <Leader>s :call CocAction('toggleExtension', 'coc-word')

" let g:netrw_browse_split=2
map K k

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR> "set current directory to parent of current file
nnoremap <leader>nh :nohlsearch<CR>

" set formatoptions-=cro
" set formatoptions-=ro
autocmd FileType * set formatoptions-=ro
" set cursorcolumn
" set cursorline

set ttyfast                " Faster redrawing.
"set lazyredraw            " Only redraw when necessary. " breaks undo notification of type 1 change before...

" colorscheme spaceduck
" colorscheme moonfly
" colo habamax
" colo hydrangea
colo luinnar

set termguicolors
set visualbell

set notimeout

nnoremap <leader>cc :ColorHighlight<CR>
nnoremap <Leader>m :call mkdir(expand("%:p:h"), "p")<CR> "make parent directories of current file
nnoremap <Leader>k V:s/\s\+/ /g<CR>
nnoremap QQ ZQ "close file no write

set foldmethod=marker

"telescope config
lua << EOF
require('telescope').setup{}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
EOF

"Neotree config
nnoremap <leader>e :Neotree toggle reveal<cr>
nnoremap <leader>E :Neotree toggle current reveal<cr>
nnoremap <leader>b :Neotree toggle buffers right reveal<cr>
nnoremap <leader>s :Neotree float git_status<cr>

nnoremap <F8> :NextColorScheme<cr>
nnoremap <F9> :PrevColorScheme<cr>

lua << EOF
require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "disabled",
  }
})
EOF

lua << EOF
require("leap").setup{}
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
EOF

" lua << EOF
" -- default values
" require("spider").setup {
" 	skipInsignificantPunctuation = true,
" 	subwordMovement = true,
" 	consistentOperatorPending = false, -- see the README for details
" 	customPatterns = {}, -- see the README for details
" }
" EOF

" make Vim use PowerShell 7 (pwsh) shell natively
let &shell = 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
