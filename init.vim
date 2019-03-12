set nocompatible
filetype off

call plug#begin("~/.config/nvim/bundle")
 Plug 'MattesGroeger/vim-bookmarks'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-rails'
 Plug 'majutsushi/tagbar'
 Plug 'shougo/unite.vim'
 Plug 'shougo/denite.nvim'	
 Plug 'shougo/vimfiler.vim'
 Plug 'sbdchd/neoformat'
 Plug 'tibabit/vim-templates'
 " typescript formatting
 Plug 'HerringtonDarkholme/yats.vim'
 Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' }
 " grubox theme
 Plug 'morhetz/gruvbox'
 " code completion
 if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
 endif
 Plug 'Shougo/neosnippet.vim'
 Plug 'Shougo/neosnippet-snippets'
call plug#end()

" Plugin key-mappings.
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory = $HOME . '/.config/nvim/neosnips'

" vimfiler
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
" Edit file by tabedit.
call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0,
      \ })

" window zooming
noremap Zz :tabnew %<CR> 
noremap Zo :q<CR>
 
" deoplete
let g:deoplete#enable_at_startup = 1 

" mapleader
let mapleader = "_"

" tag search
set tags=./tags

" open tag in another window 
nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" open tag in vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" option-t open tagbar
nnoremap <C-t> :TagbarToggle<CR>

" unite file explorer
nnoremap <C-e> :VimFiler<CR>

" highlight search
nnoremap <C-h> :set hlsearch!<CR>

" Move lines up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Denite configs
nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

" rspec
nnoremap <leader>rt :!rspec %<CR>
nnoremap <leader>ra :!rake spec<CR>
nnoremap <leader>tt :!rake test %<CR>

if has('nvim')
  " reset 50% winheight on window resize
  augroup deniteresize
    autocmd!
    autocmd VimResized,VimEnter * call denite#custom#option('default',
          \'winheight', winheight(0) / 2)
  augroup end

  call denite#custom#option('default', {
        \ 'prompt': '❯'
        \ })

  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git', '!node_modules'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--hidden', '--vimgrep', '--smart-case'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
        \'noremap')
  call denite#custom#map('normal', '<Esc>', '<NOP>',
        \'noremap')
  call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
        \'noremap')
  call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
        \'noremap')
  call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
        \'noremap')
endif

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Tagbar settings
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

" deoplete   
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

" neoformat 
augroup tsfmt 
  autocmd!
 autocmd BufWritePre * Neoformat
augroup END

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" scheme
colorscheme gruvbox
set background=dark
