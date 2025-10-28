"""
" Author: Shruti Yadav
" Last modified:
"""

" autocmd BufWritePre,FileWritePre ~/.vim/vimrc ks|call LastMod()|'s

" fun LastMod()
"   :g/Last modified: /s/Last modified: /normal @=strftime("%d %b %Y - %X")/

set nocompatible " not compatible to vi
set autoread " Auto reload changed files
set encoding=utf-8
set laststatus=2 " Always display the status line
set lazyredraw " Reduce the redraw frequency
set cursorline " highlight current line
set ruler " show the cursor position all the time
" set cursorcolumn
set showcmd " show cmd that's typed
set noshowmode " Don't show the current mode
set confirm " Show confirmation dialog when exiting unsaved file
set history=10000
" ignore these files (not shown in completeon menu)
set wildignore+=node_modules/*
" fuzzy file find
set path^=~/novels/,~/.config/nvim/,~/.config/*,~/.termux/**,~/.vim/,~/**,~/*
set path-=~/storage/**,~/downloads/,~/.vim/plugged/*,~/.vim/plugged/**
set path+=**/*
set hidden " dont lose undo history when buffer is 'abandoned' (?)
set cmdheight=1
set updatetime=300
set mouse=a " enable mouse
set nostartofline " Don’t reset cursor to start of line when moving around.
" Invisible characters
" set listchars=eol:¬,trail:·
" Flagging unecessary white space
set list
set listchars=trail:·
"" set t_Co=256 " enable 256-color mode.
syntax enable " enable syntax highlighting

" restore cursor to posn  before exit (from defaults.vim)
autocmd BufReadPost *
  \ let line = line("'\"")
  \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
  \      && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
  \ |   execute "normal! g`\""
  \ | endif

" text wrapping
" set columns=80
set wrap
set linebreak

" completion
set shortmess+=c " dont show insert completion msgs.
set spell
hi clear SpellBad
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" turn off preview for completion
set completeopt-=preview
" skeleton htmlo
au BufNewFile */*.html 0r ~/skeleton.html
au BufNewFile */*.css 0r ~/skeleton.css
au BufNewFile */*.css 0r ~/skeleton.css
" novels autocmds
au BufEnter */novels/*.txt nnoremap <leader>c :Colors<CR>
au BufEnter */novels/*.txt nnoremap <Space>p <C-w>w<UP><CR>
au BufEnter */novels/*.txt nnoremap <Space>n <C-w>w<DOWN><CR>
au BufAdd */novels/*.txt kB
au VimLeavePre */novels/*.txt kB
" Run python file
au BufEnter *.py nnoremap <leader>p :w<CR>:!python %<CR>
au BufLeave *.py nunmap <leader>p
" Saving reading session //does not work
function Browse_nv()
  Lex %:p:h
  wincmd p
endfunction

au VimEnter ~/novels/* call Browse_nv()
au BufEnter ~/novels/*.txt setlocal nomodifiable readonly

" clear prev search highlight on vim enter
au VimEnter * let @/=""

" Backups
set nobackup nowritebackup
set directory^=~/.vim/swap_files/
" undo history
set undolevels=10000
set undodir^=~/.vim/undodir
set undofile

" make sure there're 10 lines after current line
set scrolloff=10

" Search
set showmatch
set hlsearch incsearch
set ignorecase smartcase

" Line numbering
set number relativenumber

" Auto 'set nu' (absolute numbering) in Insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END


" indentation and spacing
set autoindent smartindent
set tabstop=4 shiftwidth=4
set shiftround
set expandtab smarttab

" CURSOR style in different modes
let &t_SI.="\e[5 q"  " SI = INSERT mode
let &t_SR.="\e[4 q"  " SR = REPLACE mode
let &t_EI.="\e[2 q"  " EI = NORMAL mode (ELSE)

" MAPPINGS
let mapleader = " "  " leader key=<Space>

" window nav
nnoremap <leader><leader> <C-w>w
nnoremap <leader><left> <C-w><left>
nnoremap <leader><right> <C-w><right>
nnoremap <leader><down> <C-w><down>
nnoremap <leader><up> <C-w><up>
" filename completion
inoremap <c-f> <c-x><c-f>
" :so vimrc -> ,+,
nnoremap <leader>v :so ~/.vimrc<CR>
inoremap <C-s> <Esc>:w<CR>li
nnoremap <C-s> :w<CR>
" FZF mappings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>j :Jumps<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>h :History<CR>
" quit vim -> ,+q
nnoremap <leader>q <C-w>q
" vert resize
nnoremap <C-Right> <C-w>>
nnoremap <C-Left> <C-w><

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

nnoremap <leader>u :UndotreeToggle<CR>

" html snippet
" nnoremap <leader>html :-1read ~/skeleton.html<CR>7jwf<
" css snippet
" nnoremap <leader>css :-1read ~/skeleton.css<CR>Ga

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'markonm/traces.vim' " live subn.
Plug 'mattn/emmet-vim'  " emmet
Plug 'jiangmiao/auto-pairs' " auto pairs
Plug 'vim-airline/vim-airline' " vim airline
" Plug 'othree/xml.vim' " html/xml tag completion
Plug 'mbbill/undotree' " undotree
Plug 'tpope/vim-surround'
" Colorschemes
Plug 'franbach/miramare'
Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" completion plugins
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
" highlight yanked text
Plug 'machakann/vim-highlightedyank'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_statusline_ontop=1

" color scheme
" gruvbox, onedark, gruvbox-material
set termguicolors
set background=dark
colo gruvbox-material
" Search highlight color
hi Search gui=bold cterm=bold guibg=#063e63 ctermbg=063e63 guifg=#eeeeee
hi clear SpellBad

" guifg=grey guibg=#063e63
" comment highlight
hi Comment cterm=italic gui=italic

" Session setting
set sessionoptions=folds,help,tabpages,winsize,terminal
" auto save restore sessions ------ppp?

" file browser settings
" -- netrw
let g:netrw_preview = 1 " vert split preview
let g:netrw_banner = 0 " remove banner
" tree style listing default (use 'i' to change)
let g:netrw_liststyle = 3
" make new window larger by default when opened with p
let g:netrw_winsize = 25
" open vert split in right win
let g:netrw_altv = 1
" sorting
" let g:netrw_sort_by="time"
" let g:netrw_sort_direction="reverse"
" file ex -> edit in new tab
" let g:netrw_browse_split = 3

" -- fzf
" Initialize configuration dictionary
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,70%', 'ctrl-/'] " ~> 70%:wrap for wrap
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_history_dir = '~/.local/share/fzf-history'
" command! -bang -nargs=? -complete=dir Files
      " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options':['--preview-window=70%']}), <bang>0)
" fzf --preview 'bat --color=always {}' --preview-window '~3'

" xml file for unexpected keyboard
" au BufWritePost ~/customkblayout.xml cat %|termux-clipboard-set
" emmet config
" let g:user_emmet_leader_key='\'
" let g:user_emmet_expandabbr_key = '\'

" ALE SETTINGS
" load ALE only after saving file or opening it
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0

let g:ale_sign_error = '😱'
let g:ale_sign_warning = '💩'
"  Airline + ale
let g:airline#extensions#ale#enabled = 1

" jedi vim
let g:jedi#completions_command = "<tab>"
autocmd FileType python setlocal completeopt-=preview
" let g:jedi#show_call_signatures = '0'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#call_signatures_command = ''
" let g:jedi#goto_assignments_command = ''
" let g:jedi#goto_command = ''
let g:jedi#goto_stubs_command = ''
let g:jedi#goto_definitions_command = '<leader>d'

" comment line in python
nnoremap gcc mz0i# <Esc>`zll

" Super tab config
let g:SuperTabDefaultCompletionType = "context"
let g:highlightedyank_highlight_in_visual = 0
hi Visual guibg=#000000
