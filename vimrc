set nocompatible
filetype off
set rtp+=~/.vim/

" install VimPlug
if empty(glob("~/.vim/autoload/plug.vim"))
	execute '!mkdir -p ~/.vim/plugged'
	execute '!mkdir -p ~/.vim/autoload'
	execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'bogado/file-line'
Plug 'chrisbra/NrrwRgn'
Plug 'cloudhead/neovim-fuzzy'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'https://gitlab.com/nany-lang/syntax-highlighting/nany-syntax-vim.git'
Plug 'itchyny/lightline.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kien/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-startify'
Plug 'rcmdnk/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-pathogen'
Plug 'Valloric/YouCompleteMe', { 'do': 'python ./install.py --clangd-completer' }
Plug 'xolox/vim-misc'
Plug 'mhinz/vim-signify'
Plug 'xolox/vim-session'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
Plug 'airblade/vim-rooter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'Shougo/ddc.vim'
Plug 'shun/ddc-vim-lsp'
Plug 'hashicorp/terraform-ls'
"{{ Autopairs
" ---> closing XML tags <---
Plug 'alvan/vim-closetag'
" ---> files on which to activate tags auto-closing <---
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb,*.cpp,*.tf,*.py'
" ---> closing braces and brackets <---
Plug 'jiangmiao/auto-pairs'
"}}

"{{ Configuring UltiSnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"}}

"{{ Configuring CtrlP
Plug 'ctrlpvim/ctrlp.vim'
"}}

"{{ TMux - Vim integration
Plug 'christoomey/vim-tmux-navigator'
"}}

" themes
Plug 'altercation/vim-colors-solarized'
Plug 'Blevs/vim-dzo'
Plug 'cocopon/iceberg.vim'
Plug 'exitface/synthwave.vim'
Plug 'https://gitlab.com/milipili/vim-config'
Plug 'Marfisc/vorange'
Plug 'morhetz/gruvbox'
Plug 'szorfein/fromthehell.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-gotham'
Plug 'ajmwagar/vim-deus'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Apply
filetype plugin indent on
call plug#end()


"
" ---- plugins options ---
"

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-buffergator
let buffergator_sort_regime='mru'
let buffergator_viewport_split_policy='B'

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : ['h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3'] }

" nerdtree
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split
let g:netrw_list_hide='.*\.sw.*$'
let g:netrw_winsize=40
nmap <F7> :NERDTreeToggle<CR>

" ligtline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_xml_xmllint_args = "--xinclude --postvalid --nonet"

" YouCompleteMe
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
let g:ycm_always_populate_location_list = 1
let g:ycm_max_num_identifier_candidates = 75 
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_log_level = 'warning'
let g:ycm_max_diagnostics_to_display = 200
let g:ycm_confirm_extra_conf = 0
set completeopt=longest,menuone
set completeopt-=preview
cnoremap <expr> <up>   pumvisible() ? "<C-p>" : "<up>"
cnoremap <expr> <down> pumvisible() ? "<C-n>" : "<down>"

" Narrow Region - press 'n' after selecting some text to edit only this part
vmap n :NarrowRegion<CR>

" vim-session
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" rainbow
let g:rainbow_active = 1

" fuzzyopen
if has('nvim')
	nnoremap <leader>e :FuzzyOpen<cr>
	"nnoremap <leader>g :FuzzyGrep @z<cr>
	tnoremap <C-\><C-c>   <C-\><C-n><C-w>
	tnoremap <C-w><left>  <C-\><C-n><C-w>h
	tnoremap <C-w><down>  <C-\><C-n><C-w>j
	tnoremap <C-w><up>    <C-\><C-n><C-w>k
	tnoremap <C-w><right> <C-\><C-n><C-w>l
end

" goyo
let g:goyo_width = '100%'
let g:goyo_height = '100%'
nnoremap <C-f> :Goyo<cr>


"
" ---- misc options ----
"

set encoding=utf8
scriptencoding utf-8

set autoindent
set whichwrap=b,s,l,h,<,>,[,]
set icon
set title
set showbreak=\\
set noeol
set et
set hlsearch
set keywordprg=man\ -k
set formatprg=fmt
set novisualbell
set ttyfast
set hidden
set switchbuf=useopen
set showmatch
set matchtime=1
set showcmd
set lazyredraw
set viminfo='20,\"50
set history=40
set smartcase
set nofoldenable 
set incsearch
" set ignorecase
set splitbelow " open splits below and right side by default
set splitright
set cursorline
set list

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" tabs war
set tabstop=4
set noexpandtab
set listchars=tab:\|\ ,trail:•,extends:#,nbsp:.
set shiftwidth=4
set softtabstop=4



"
" ---- Extrassss ----
"

" Find other occurrences of a word under the cursor
set updatetime=400
function! HighlightWordUnderCursor()
	if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
		exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/' 
	else 
		match none 
	endif
endfunction
autocmd CursorHold,CursorHoldI * call HighlightWordUnderCursor()


" Performance problems
" It seems that vim does not handle sucessive calls of the match command
" gracefully. Since BufWinEnter commands are executed every time a buffer
" is displayed (i.e., switching to another file), the match command is
" executed many times during a vim session. This seems to lead to a memory
" leak which slowly impacts performance (for example scrolling and writing become unbearable slow)
if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
	syn keyword cType uchar uint sint64 uint64 sint32 uint32 sint16 uint16 sint128 uint128 float32 float64
	syn keyword cType yint64 yuint64 yint32 yuint32 yint16 yuint16 yint128 yuint128 yint8 yuint8 yfloat32 yfloat64
	syn keyword cType AnyString String Clob CString YString nullptr
	syn keyword cType Vector Dict Error Bind function Yuni Type Ptr
	syn keyword cStatement  each foreach override final
	syn keyword cSpecial  assert free malloc calloc memset and not or xor emit

	syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
	highlight def link cppFuncDef Special

	syn match    cSpecialGrammar    "[&\*,\(\)\[\]<>&|]"
	syn match    cSpecialGrammar    "[+-]\?[=!]=\?"
	syn match    cSpecialGrammar    "->"
	highlight def link  cSpecialGrammar Special
endfunction
" autocmd Syntax cpp call EnhanceCppSyntax()
" autocmd Syntax c call EnhanceCppSyntax()

autocmd BufRead,BufNewFile,BufEnter *.ny,*.hny,*.slny,*.tlny set filetype=nany nowrap cindent smartindent noexpandtab incsearch
autocmd BufRead,BufNewFile,BufEnter *.ygr set filetype=yuni-grammar nowrap cindent smartindent noexpandtab incsearch
autocmd BufReadPre /tmp/pico.*,mutt-* set filetype=mail
autocmd BufRead,BufNewFile *.as set filetype=actionscript
autocmd FileType actionscript set syntax=actionscript
autocmd FileType css set smartindent
autocmd FileType make set nowrap noexpandtab
autocmd BufEnter * set tabstop=4
autocmd BufEnter *.c,*.cpp,*.cc,*.cxx,*.h,*.hpp,*.hxx,*.hh set formatoptions=croql comments=sr:/*,mb:*,el:*/ cpt=k~/.complete-cpp,i,k nowrap cindent smartindent
autocmd BufEnter *.java set formatoptions=croql comments=sr:/*,mb:*,el:*/ cpt=k~/.complete-java,i,k nowrap cindent au
autocmd BufEnter *.py set formatoptions=croql et ai noexpandtab cindent cinkeys=:,o,O nowrap smartindent
autocmd BufEnter *.tex set cpt=k~/.complete-latex,i,k
autocmd BufEnter *.htt set syntax=html
autocmd BufEnter *.mly set syntax=yacc
autocmd BufEnter *.phps set syntax=php
autocmd BufEnter *.as set syntax=actionscript
autocmd BufEnter SConscript,SConstruct set syntax=python filetype=python
autocmd BufEnter Makefile,GNUmakefile set formatoptions=croql tabstop=8 nowrap smartindent
autocmd BufReadPost quickfix set wrap

" Help NeoVim check for modified files: https://github.com/neovim/neovim/issues/2127
autocmd BufEnter,FocusGained * checktime

"
" ---- shortcuts ----
"

" Hide coloration of found words
map <C-C> :nohlsearch<CR>

" alt+<number> : switch tab
"NORMAL mode bindings for gvim
noremap <unique> <A-F1> 1gt
noremap <unique> <A-F2> 2gt
noremap <unique> <A-F3> 3gt
noremap <unique> <A-F4> 4gt
noremap <unique> <A-F5> 5gt
noremap <unique> <A-F6> 6gt
noremap <unique> <A-F7> 7gt
noremap <unique> <A-F8> 8gt
noremap <unique> <A-F9> 9gt


"INSERT mode bindings for gvim
inoremap <unique> <A-F1> <C-O>1gt
inoremap <unique> <A-F2> <C-O>2gt
inoremap <unique> <A-F3> <C-O>3gt
inoremap <unique> <A-F4> <C-O>4gt
inoremap <unique> <A-F5> <C-O>5gt
inoremap <unique> <A-F6> <C-O>6gt
inoremap <unique> <A-F7> <C-O>7gt
inoremap <unique> <A-F8> <C-O>8gt
inoremap <unique> <A-F9> <C-O>9gt

" Paste
map  <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" <tab> / <shift-tab> to indent and unindent
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


"
" ---- gui ----
"

set t_Co=256 " 256 colors
set background=dark

" before the first colorscheme command will ensure that the highlight group
" gets created and is not cleared by future colorscheme commands
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=yellow guibg=yellow

highlight CursorLine   guibg=#191919 gui=none
highlight CursorColumn guibg=#181818
highlight Visual       guifg=White guibg=red gui=none
highlight StatusLine   cterm=none ctermfg=white ctermbg=darkblue gui=none guifg=white guibg=darkblue

if has("gui_running")
	colorscheme busyeee
else
	colorscheme gruvbox
endif
highlight IncSearch ctermbg=darkblue ctermfg=cyan cterm=none

