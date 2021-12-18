"
"  ▄    ▄ ▄▄▄▄▄  ▄    ▄ ▄▄▄▄▄    ▄▄▄
"  ▀▄  ▄▀   █    ██  ██ █   ▀█ ▄▀   ▀
"   █  █    █    █ ██ █ █▄▄▄▄▀ █
"   ▀▄▄▀    █    █ ▀▀ █ █   ▀▄ █
"    ██   ▄▄█▄▄  █    █ █    ▀  ▀▄▄▄▀
" 
" Michael Espeña (https://gitlab.com/paperbackwryter/dotfiles)

" sane defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set updatetime=100
set noerrorbells
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.local/undodir/vim
set undofile
set incsearch
set exrc
set hidden
set scrolloff=999
set sidescrolloff=999
set guicursor=
set ft=nasm
set nocompatible
set number
set relativenumber
" set nohlsearch
" set laststatus=2
" set cursorline

syntax on
syntax enable
highlight Normal ctermbg=None

"hi CursorLine cterm=NONE ctermbg=gray ctermfg=white guibg=gray guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

filetype plugin indent on
filetype plugin on


" FINDING FILES
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab-complete
set wildmenu

" With the last two configs set above we now can:
" -- hit TAB to :find by partial match
" -- use * to make it fuzzy
"
" Things to consider:
" -- :b lets you autocomplete any open buffer
"
" TAG JUMPING
command! MakeTags !ctags -R .

" With the command above we now can:
" -- Use ^] to jump to tag under cursor
" -- Use g^] for ambiguous tags
" -- Use ^t to jump back up the tag stack
"
" Things to consider:
" -- This doesn't help if you want a visual list of tags

" AUTOCOMPLETE
"
" The good stuff is documented in |ins-completion|
"
" HIGHLIGHTS:
" -- ^x^n for JUST this file
" -- ^x^f for filenames (works with path)
" -- ^x^j for tags only
" -- ^n for anything specified by 'complete' option TODO tweak this option
"
" NOW WE CAN:
" -- Use ^n and ^p to go back and forth in the suggestion list
"
" FILE BROWSING
"
" Tweaks for browsing
let g:netrw_banner=0				" disable banner
let g:netrw_browse_split=4			" open in prior window
let g:netrw_altv=1					" open spilts to the right
let g:netrw_liststyle=3				" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" -- :edit a folder to open a file browser
" -- <CR>/v/t to open in an h-split/v-split/tab
" -- check |netrw-browse-maps| for more mappings
"
"  SNIPPETS:
"
"  Read an empty HTML template and move cursor to title
"  nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
"
"  NOW WE CAN:
"  -- Take over the world!
"  -- (with just a few keystrokes)

" set undo directory
if has("persistent_undo")
    set undodir=~/.undodir/vim
    set undofile
endif

" set leader key
let mapleader = " "

" Remap resizing splits to simple keybindings 
" to avoid using command mode
nnoremap <silent> <C-Right> :vertical resize +3<CR>
nnoremap <silent> <C-Left> :vertical resize -3<CR>
nnoremap <silent> <C-Down> :resize +3<CR>
nnoremap <silent> <C-Up> :resize -3<CR>

" Remap to open terminal inside neovim
" map <leader>tt :vnew term://bash<CR>

" Change 2 split windows form vertical to horizontal
" and vice versa
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" The following configuration removes the pipes that
" acts as separators on splits
" NOTE: There is a SPACE typed in after the backslash
" otherwise the pipes will just be replaced with
" backlashes instead
set fillchars+=vert:\ 


" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" set 'updatetime' to 15 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=4000
au InsertLeave * let &updatetime=updaterestore

" set shortmess=F
" set noshowmode
" set noruler
" set laststatus=0
" set noshowcmd
" set cmdheight=1

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
call plug#end()

" set background=dark
colorscheme nord

" set  background color to none
" hi Normal ctermbg=NONE
" hi LineNr ctermbg=NONE guibg=NONE
" hi Comment ctermfg=darkgray guifg=darkgray
" hi SignColumn ctermbg=NONE
" hi EndOfBuffer ctermbg=NONE
" hi StatusLine ctermbg=NONE guibg=NONE

" remove the annoying tilde characters in empty lines
" end of buffer(EOB)
let &fcs='eob: '

ab myemail michaelespena.public@gmail.com
