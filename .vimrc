set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=101 
set backspace=indent,eol,start
set relativenumber

set wildignorecase
set hlsearch
set clipboard=unnamedplus
set autoindent
set number
set wildmenu
set textwidth=100

let g:NERDTreeWinSize=50

set laststatus=2

nnoremap <C-m> :call MaximizeToggle()<CR>
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Conque Allow C-w window navigation while in insert mode
let g:ConqueTerm_CWInsert = 1

" nnoremap <C-J> <C-W><C-J>
" #nnoremap <C-K> <C-W><C-K>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nnoremap <S-t> :ConqueTermSplit zsh<CR>

map <C-n> :NERDTreeToggle<CR>
map <silent> <C-e> :NERDTreeFocus<CR>

imap jj <Esc>

nmap <F2> :set invnumber<CR>
nmap <F4> :Startify<CR>
nmap <F6> :TagbarToggle<CR>
set pastetoggle=<F3>

" FZF.vim plugin mapping
nmap <C-g> :GFiles<CR>
nmap <C-b> :Buffers<CR>

" vim quick save
inoremap <c-s> <Esc>:update<CR>

" Copy and paste between Vim instances
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" dein.vim plugin manager configuration
if &compatible
  set nocompatible
endif
set runtimepath+=/home/weijian.cao/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/weijian.cao/.cache/dein')
  call dein#begin('/home/weijian.cao/.cache/dein')

  call dein#add('/home/weijian.cao/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add("altercation/vim-colors-solarized")
  call dein#add("junegunn/fzf.vim")
  call dein#add("junegunn/fzf", { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add("majutsushi/tagbar")

  call dein#add("scrooloose/nerdtree")
  call dein#add("airblade/vim-gitgutter")
  call dein#add("itchyny/lightline.vim")
  call dein#add("tpope/vim-surround")
  call dein#add("tpope/vim-fugitive")

  call dein#end()
  call dein#save_state()
endif

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1 
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Ultisnips
let g:UltiSnipsSnippetsDir = "/usr/local/bin/repos/github.com/Shougo/dein.vim/rplugin/repos/github.com/honza/vim-snippets/"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-u>"

" easymotion plugin configuration
"------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>l <Plug>(easymotion-bd-jk)
map  <Leader>w <Plug>(easymotion-bd-w)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"-----------------------------------------------------------

" FZF vim plugin configuration
" If installed using git
set rtp+=~/.fzf


let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%:p')
endfunction


filetype plugin indent on
syntax enable
set t_Co=16
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
