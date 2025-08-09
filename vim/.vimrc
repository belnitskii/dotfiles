" === Автоматическая установка vim-plug ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === Инициализация плагинов ===
call plug#begin('~/.vim/plugged')

" Плагин для автоматического переключения раскладки
Plug 'brglng/vim-im-select'
" Подсветка скопированного текста
Plug 'machakann/vim-highlightedyank'
" Навигация по тексту
Plug 'bkad/CamelCaseMotion'

map w  <Plug>CamelCaseMotion_w
map e  <Plug>CamelCaseMotion_e
map b  <Plug>CamelCaseMotion_b
map ge <Plug>CamelCaseMotion_ge

call plug#end()

" === Настройки vim-im-select для macOS ===
let g:im_select_get_im_cmd = ['im-select']
let g:ImSelectSetImCmd = { key -> ['im-select', key] }
let g:im_select_default = 'com.apple.keylayout.ABC'

" === Настройки vim-highlights для macOS ===
" Время подсветки в миллисекундах
let g:highlightedyank_highlight_duration = 900

" === Удобные настройки ===
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

let mapleader = ' '
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P
nnoremap <Esc> :nohlsearch<CR>

" Открыть vimrc для редактирования
noremap <leader>cc :edit ~/.vimrc<CR>

" Перезагрузить vimrc и убрать подсветку поиска
noremap <leader>cs :source ~/.vimrc<CR>:nohlsearch<CR>

" Навигация по сплитам
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Создание и удаление сплитов
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>ww :close<CR>
nnoremap <leader>wa :only<CR>

