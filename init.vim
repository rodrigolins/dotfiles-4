set nocompatible
filetype off

call plug#begin("~/.config/nvim/bundle")
Plug 'MattesGroeger/vim-bookmarks'
Plug 'elmcast/elm-vim'
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'shougo/unite.vim'
Plug 'shougo/denite.nvim'	
Plug 'shougo/vimfiler.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'vim-syntastic/syntastic'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'tomasr/molokai'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" javacomplete2
nnoremap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nnoremap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nnoremap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nnoremap <leader>jii <Plug>(JavaComplete-Imports-Add)

inoremap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
inoremap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
inoremap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
inoremap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nnoremap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

inoremap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nnoremap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nnoremap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nnoremap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nnoremap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nnoremap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nnoremap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nnoremap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nnoremap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

inoremap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
inoremap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
inoremap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vnoremap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vnoremap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vnoremap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nnoremap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nnoremap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" deoplete
let g:deoplete#enable_at_startup = 1 

" syntastic 
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '~/checkstyle-8.12-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/checkstyle.xml'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" skywind
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" mapleader
let mapleader = "_"

" tag search
set tags=./tags;~/Projects

" open tag in another window 
nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" option-t open tagbar
nnoremap <C-t> :TagbarToggle<CR>

" neoformat
nnoremap <C-f> :Neoformat<CR>

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
" augroup astyle
"   autocmd!
"  autocmd BufWritePre * Neoformat
" augroup END
" let g:neoformat_java_google = {
"             \ 'exe': 'java',
"             \ 'args': ['-jar /usr/local/bin/google-java-format-1.6.jar -'],
"             \ 'stdin': 1, 
"             \ }
" let g:neoformat_enabled_java = ['google']

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
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

