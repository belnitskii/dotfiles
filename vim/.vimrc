"=== Автоматическая установка vim-plug ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Принудительная установка TERM
if $TERM == 'dumb'
    let &term = 'xterm-256color'
endif

" === Инициализация плагинов ===
call plug#begin('~/.vim/plugged')

" Настройка для LSP сервера
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Плагин для автоматического переключения раскладки
Plug 'brglng/vim-im-select'
" Подсветка скопированного текста
Plug 'machakann/vim-highlightedyank'
" Навигация по тексту
Plug 'bkad/CamelCaseMotion'
" Навигация по связке vim+tmux
Plug 'christoomey/vim-tmux-navigator'
" Мульти курсор
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Автозакрытие тегов
Plug 'alvan/vim-closetag'

" Popup menu от Coc.nvim
highlight! link Pmenu CmpPmenu
highlight! link PmenuSel CmpPmenuSel
highlight! link PmenuSbar Pmenu
highlight! link PmenuThumb Pmenu

" Выбор элемента автодополнения с Enter
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

map w  <Plug>CamelCaseMotion_w
map e  <Plug>CamelCaseMotion_e
map b  <Plug>CamelCaseMotion_b
map ge <Plug>CamelCaseMotion_ge

call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

let mapleader = ' '
nnoremap <silent> <leader><leader> <Plug>(coc-format)
nnoremap <silent> <leader>ca :<C-u>CocAction<CR>

" Список типов файлов, для которых работает vim-closetag
let g:closetag_filetypes = 'html,xml,xsl,xhtml'
" Часто вам также захочется, чтобы он работал сразу после закрытия тега (>)
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.xsl'


" === Настройки vim-im-select для macOS ===
let g:im_select_get_im_cmd = ['im-select']
let g:ImSelectSetImCmd = { key -> ['im-select', key] }
let g:im_select_default = 'com.apple.keylayout.ABC'

" === Настройки vim-highlights для macOS ===
" Время подсветки в миллисекундах
let g:highlightedyank_highlight_duration = 900

" === Удобные настройки ===
" добавить маппинг для автоматического закрытия скобок
set hlsearch            " Подсветка результатов поиска
set scrolloff=5         " Отступ сверху/снизу при прокрутке
set ignorecase          " Игнорировать регистр при поиске...
set smartcase           " ...но учитывать, если есть заглавные буквы
set showmode            " Показывать режим (Insert/Normal)
set history=1000        " История команд
set incsearch           " Интерактивный поиск
set relativenumber      " Относительная нумерация строк
set visualbell          " Без звукового сигнала
set showcmd             " Показывать набираемые команды
set virtualedit=onemore " Курсор может заходить за последний символ в строке

noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d
noremap <Leader>D "+D

nnoremap <Esc> :nohlsearch<CR>

" Открыть vimrc для редактирования
noremap <leader>cc :edit! ~/.vimrc<CR>

" Перезагрузить vimrc и убрать подсветку поиска
noremap <leader>cs :source ~/.vimrc<CR>:nohlsearch<CR>

" Навигация по сплитам
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Создание и удаление сплитов
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>ww :close<CR>
nnoremap <leader>wa :only<CR>

