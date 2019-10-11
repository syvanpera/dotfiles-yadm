" Plugins -------------------------------------------------------------------{{{

  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin()

    " UI stuff
    " Plug 'dracula/vim'
    " Plug 'rakr/vim-one'
    " Plug 'morhetz/gruvbox'
    Plug 'joshdick/onedark.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'chrisbra/Colorizer'

    Plug 'mhinz/vim-startify'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'scrooloose/nerdtree'
    Plug 'mbbill/undotree'
    " Plug 'kien/ctrlp.vim'
    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'tomtom/tcomment_vim'
    Plug 'majutsushi/tagbar'
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'elmcast/elm-vim'

    Plug 'fatih/vim-go'
    Plug 'godoctor/godoctor.vim'
    Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug 'sheerun/vim-polyglot'

    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-fugitive'

  call plug#end()

" }}}

" Settings ------------------------------------------------------------------{{{

  " language en_US
  let mapleader=','

  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  "   set t_8f=^[[38;2;%lu;%lu;%lum
  "   set t_8b=^[[48;2;%lu;%lu;%lum
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif

  set hidden
  set encoding=UTF-8
  set list listchars=tab:»·,trail:·,nbsp:·
  set scrolloff=0
  " set clipboard+=unnamedplus
  set nocompatible
  set noshowmode
  set noswapfile
  set nobackup
  set nowritebackup
  set number
  set relativenumber
  set numberwidth=4
  set cursorline
  set tabstop=2 shiftwidth=2 expandtab
  set autoindent
  set shiftround
  set conceallevel=0
  set virtualedit=block
  set wildmenu
  set laststatus=2
  set lazyredraw
  set wrap linebreak
  set wildmode=full
  set autoread
  set complete=.,w,b,u,t,k
  set formatoptions+=t
  set shortmess=atIc
  set isfname-==
  set suffixesadd=.js,.coffee,.jsx

  " Clear trailing whitespace when saving buffer
  autocmd BufWritePre * %s/\s\+$//e

  " Turn off relative numbering when going into insert mode
  " autocmd InsertEnter,InsertLeave * set rnu!

  " Remember cursor position between vim sessions
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
  " center buffer around cursor when opening files
  autocmd BufRead * normal zz

  autocmd InsertEnter,InsertLeave * set cul!

  " Add format option 'w' to add trailing white space, indicating that paragraph
  " continues on next line. This is to be used with mutt's 'text_flowed' option.
  augroup mail_trailing_whitespace " {
    autocmd!
    autocmd FileType mail setlocal formatoptions+=w
  augroup END " }

" }}}

" Autocommands --------------------------------------------------------------{{{
  autocmd BufWritePost *sxhkdrc !kill -SIGUSR1 sxhkd

  " autocmd BufWritePost ~/.config/compton.conf !killall -q compton; setsid compton --config ~/.config/compton.conf &
" }}}

" Look & Feel ---------------------------------------------------------------{{{

  set background=dark
  syntax on

  " colorscheme onedark
  colorscheme base16-tomorrow-night

  highlight Normal guibg=NONE ctermbg=NONE guifg=#e9fffa

" }}}

" Key mappings  -------------------------------------------------------------{{{

  nnoremap <leader>v :sp ~/.config/nvim/init.vim<CR>
  nnoremap <leader>u :source ~/.config/nvim/init.vim<CR>

  nnoremap <leader>jf :%!python -m json.tool<CR>

  " movement
  inoremap <c-k> <up>
  inoremap <c-j> <down>
  inoremap <c-h> <left>
  inoremap <c-l> <right>

  " buffer operations
  nnoremap <leader>q :bdelete<CR>
  nnoremap <leader>bd :bdelete<CR>
  nnoremap <leader>bb :Buffers<CR>
  " Switch between the last two buffers
  nnoremap <leader><tab> <c-^>

  " window movement
  " nmap <c-j> <c-w>j
  " nmap <c-k> <c-w>k
  " nmap <c-l> <c-w>l
  " nmap <c-h> <c-w>h

  " Zoom windows
  nnoremap <leader>- :wincmd _<CR>:wincmd \|<CR>
  nnoremap <leader>= :wincmd =<CR>

  nnoremap <M-s> :w<CR>
  nnoremap <M-u> :UndotreeToggle<CR>
  nnoremap <M-e> :NERDTreeToggle<CR>
  nnoremap <M-r> :TagbarToggle<CR>
  nnoremap <leader>h :nohl<CR>
  nnoremap <leader>n :set rnu!<CR>

  nmap <leader>E :NERDTreeToggle<CR>
  nmap <leader>e :NERDTreeFind<CR>

  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gb :Gblame<CR>

  nnoremap <leader>gd :GoDeclsDir<CR>

  " TMUX Pane movement
  nnoremap <silent> <c-w><c-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <c-w>h :TmuxNavigateLeft<CR>
  nnoremap <silent> <c-w><c-j> :TmuxNavigateDown<CR>
  nnoremap <silent> <c-w>j :TmuxNavigateDown<CR>
  nnoremap <silent> <c-w><c-k> :TmuxNavigateUp<CR>
  nnoremap <silent> <c-w>k :TmuxNavigateUp<CR>
  nnoremap <silent> <c-w><c-l> :TmuxNavigateRight<CR>
  nnoremap <silent> <c-w>l :TmuxNavigateRight<CR>

  nnoremap <space> za

  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  vmap v <Plug>(expand_region_expand)
  vmap V <Plug>(expand_region_shrink)

  nnoremap <leader>ff :Files<CR>
  nnoremap <C-p> :Files<CR>
  nnoremap <M-F> :Rg<CR>

" }}}

" Airline -------------------------------------------------------------------{{{

  if !exists('g:airline_symbols')
    let g:airline_symbols={}
  endif

  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#mike#enabled=0
  let g:airline#extensions#tabline#fnamemod=':t'
  let g:airline#extensions#tabline#buffer_idx_mode=1
  let g:airline_powerline_fonts=1

  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#ale#error_symbol=' '
  let g:airline#extensions#ale#warning_symbol=' '

  let g:airline_symbols.branch=''
  let g:airline_theme='base16_tomorrow'
  " let g:airline_theme='onedark'

  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9

  let g:airline#extensions#tabline#buffer_idx_format={
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 ',
        \}

" }}}

" NERDTree ------------------------------------------------------------------{{{

  let g:NERDTreeWinSize=45
  let g:NERDTreeQuitOnOpen=1
  let g:NERDTreeAutoDeleteBuffer=1
  let NERDTreeMinimalUI=1
  let NERDTreeDirArrows=1
  let g:WebDevIconsOS='Darwin'

"}}}

" FZF -----------------------------------------------------------------------{{{
  " Show previews for Rg
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  " Likewise, Files command with preview window
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  "}}}

" ALE -----------------------------------------------------------------------{{{

  " Error and warning signs.
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''

  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('ternjs', 'mark', '')
  call deoplete#custom#source('omni', 'mark', '⌾')
  call deoplete#custom#source('file', 'mark', 'file')
  call deoplete#custom#source('jedi', 'mark', '')
  call deoplete#custom#source('typescript', 'mark', '')
  " call deoplete#custom#source('neosnippet', 'mark', '')
  " call deoplete#custom#source('typescript',  'rank', 630)

"}}}

" Deoplete ------------------------------------------------------------------{{{

  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#go#gocode_binary = '/home/tuomo/go/bin/gocode'

"}}}

" Go ------------------------------------------------------------------------{{{

  au FileType go set shiftwidth=4 softtabstop=4 tabstop=4

  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1

  let g:go_auto_sameids = 1

  let g:gofmt_command = "goimports"
  let g:go_auto_type_info = 1

  let g:go_code_completion_enabled = 1
  let g:go_fmt_autosave = 1
  let g:go_addtags_transform = "camelcase"

  let g:go_metalinter_autosave = 1
  let g:go_metalinter_autosave_enabled = ['vet', 'golint']

  call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

"}}}

" Elm -----------------------------------------------------------------------{{{

  au FileType elm set shiftwidth=4 softtabstop=4 tabstop=4

  let g:elm_format_autosave = 1

"}}}
