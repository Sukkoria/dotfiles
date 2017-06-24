" .vimrc.js
" AUTHOR : Sukkoria
" Last modification : 24.06.2017

set tw=120 " 119 col textwidth	

" Comment/uncomment
nnoremap <leader>c I//<esc>
nnoremap <leader>t :s$//$$<CR>

" Special commands for jQuery
inoremap <leader>$ $('')<esc>hi
inoremap <leader>l console.log();<esc>hi

" Double characters behaviour
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap < <><Esc>i
" and to compense
inoremap <leader>{ {
inoremap <leader>( (
inoremap <leader>[ [
inoremap <leader>" "
inoremap <leader>< <

