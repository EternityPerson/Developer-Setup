set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=101 

set clipboard=unnamedplus
set autoindent
set number
set title

nmap <F2> :set invnumber<CR>
nmap <F4> :Startify<CR>
nmap <F6> :TagbarToggle<CR>
set pastetoggle=<F3>

" FZF.vim plugin mapping
nmap <C-f> :Files<CR>
nmap <C-g> :GFiles<CR>

" vim quick save
map <C-a> :w <Enter>

" Copy and paste between Vim instances
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" dein.vim plugin manager configuration
if &compatible
  set nocompatible
endif
set runtimepath+=/usr/local/bin/repos/github.com/Shougo/dein.vim

if dein#load_state('/usr/local/bin/repos/github.com/Shougo/dein.vim/rplugin')
  call dein#begin('/usr/local/bin/repos/github.com/Shougo/dein.vim/rplugin')

  call dein#add('/usr/local/bin/repos/github.com/Shougo/dein.vim')
  call dein#add('mhinz/vim-startify')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add("altercation/vim-colors-solarized")
  call dein#add("WorldNull/fzf.vim")
  call dein#add("junegunn/fzf", { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add("scrooloose/nerdtree")
  call dein#add("majutsushi/tagbar")

  call dein#end()
  call dein#save_state()
endif

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1 
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-u>"

" easymotion plugin configuration
"------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"-----------------------------------------------------------

" FZF vim plugin configuration
" If installed using git
set rtp+=~/.fzf


" nerdtree plugin configuration
map <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set mouse=a
let g:NERDTreeMouseMode=3 


filetype plugin indent on
syntax enable
set t_Co=16
let g:solarized_termtrans = 1
set background=dark
set backupcopy=yes
colorscheme solarized
