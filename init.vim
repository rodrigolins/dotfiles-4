set nocompatible
filetype off

call plug#begin("~/.config/nvim/bundle")
Plug 'majutsushi/tagbar'
Plug 'shougo/unite.vim'
Plug 'shougo/denite.nvim'	
Plug 'shougo/vimfiler.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
call plug#end()

" mapleader
let mapleader = "_"

" option-t open tagbar
nnoremap <C-t> :TagbarToggle<CR>

" neoformat
nnoremap <C-f> :Neoformat<CR>

" unite file explorer
:nnoremap <C-e> :VimFiler<CR>

" Move lines up and down
:nnoremap <S-Up> :m-2<CR>
:nnoremap <S-Down> :m+<CR>
:inoremap <S-Up> <Esc>:m-2<CR>
:inoremap <S-Down> <Esc>:m+<CR>

" Denite configs
nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

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
        \ ['rg', '--files', '--glob', '!.git', ''])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
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

" Java Complete 
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" neoformat 
augroup astyle
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END
let g:neoformat_java_google = {
            \ 'exe': 'java',
            \ 'args': ['-jar /usr/local/bin/google-java-format-1.6.jar -'],
            \ 'stdin': 1, 
            \ }
let g:neoformat_enabled_java = ['google']

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package:1',
        \ 'c:classes',
        \ 'i:interfaces',
        \ 't:traits',
        \ 'e:enums',
        \ 'm:methods',
        \ 'f:fields:1'
    \ ]
    \ }

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

