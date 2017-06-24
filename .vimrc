" .vimrc

" IMPORTANT : DO NOT REMOVE

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" " /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" " you can find below.  If you wish to change any of those settings, you
" should
" " do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" " everytime an upgrade of the vim packages is performed.  It is recommended
" to
" " make changes after sourcing archlinux.vim since it alters the value of the
" " 'compatible' option.

" ensures that various options are properly set to work with the Vim-related packages.
 runtime! archlinux.vim

" " If you prefer the old-style vim functionalty, add 'runtime!
" vimrc_example.vim'
" For HELP, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual


" GENERAL
	set number	" Numbers along the lines
	set relativenumber
	set background=dark 
	set title 	" Title for the window
	set lbr! 	" Don’t cut the words
	syntax on
        set tw=100 " 79 col textwidth	
        let mapleader=","
        let g:mapleader=","
        set listchars+=nbsp:_

	" Enable type-specific configuration
	filetype on 
	filetype plugin on
	filetype indent on

	" Indenting
	"Default to autoindenting of C like languages
	"This is overridden per filetype below
	set noautoindent smartindent copyindent
	" Show levels of indentation
	set listchars=tab:--

	"The rest deal with whitespace handling and
	"mainly make sure hardtabs are never entered
	"as their interpretation is too non standard in my experience
	set softtabstop=4
	" Note if you don't set expandtab, vi will automatically merge
	" runs of more than tabstop spaces into hardtabs. Clever but
	" not what I usually want.
	set expandtab
	set shiftwidth=4
	set shiftround
	set nojoinspaces

	" Auto-completion
	set wildmenu 	" Enable auto-completion
	set wildmode=list:longest " Enable shell-like <TAB> auto-completion	
	set wildignore=*.o,*.a,*.pyc,*.jpg,*.png,*.bmp " Ignore those files

	" Show Non-breakable Spaces
	highlight NbSp ctermbg=lightgray guibg=lightred
	match NbSp /\%xa0/	

        " When open a new file remember the cursor position of the last
        " editing
        if has("autocmd")
            " When editing a file, always jump to the last cursor
            " position
            autocmd BufReadPost * if line("'\"") | exe "'\""|endif
        endif

	" To automatically apply .vimrc modifications
	if has("autocmd")
		autocmd! bufwritepost .vimrc source ~/.vimrc
	endif
        
        " Save file with root permission with w!!
        cmap w!! w !sudo tee % > /dev/null

        " Save swap files in a specific folder
        set backup
        set backupcopy=yes
        set backupdir=/home/sukkoria/vim-backups 

        " 1 space, not 2, when joining sentences.
        set nojoinspaces 

        " Duplicate current(s) line(s), notepad++ like
        inoremap <leader>d <esc>yypi
        nnoremap <leader>d yyp
        vnoremap <leader>d 0y0p


        " Move current(s) line(s) with ??
        " TODO

" SEARCH
	" Case-sensitive search
	" Only make "/" search case-sensitive when an uppercase letter is present
	set ignorecase
	set smartcase

	" Highlight searched terms
	set hlsearch

	set incsearch "… dynamically while typing

" MAPPING BÉPO
	if !empty(system("setxkbmap -print|grep bepo"))
		source ~/.vimrc.bepo
	endif

" GRAPHIC CUSTOMISATION
	" vim-airline
	let g:airline_theme='badwolf'

        " Draw a decorative line
"        au VimEnter * call CmdAlias('line', 'set fillchars+=stl:\_')
" LATEX
        " To use some Wikipedia-like shortcuts and commands
        au FileType tex source ~/.vimrc.wikitex

	" Compile and show pdf
	au FileType tex nnoremap <buffer> <F5> :w

        " Folds (principally for big templates)
        au FileType tex set foldmethod=marker
"        au FileType tex set foldmarker=("<!--","-->")
        

" PYTHON
	" Comment a line
	au FileType python source ~/.vimrc.python 

" JS
au FileType javascript source ~/.vimrc.js

" bash
au FileType sh source ~/.vimrc.sh
        " Set folding
        "au FileType python :set foldmethod=indent

        " POWERLINE
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
" python del powerline_setup
set laststatus=2
set t_Co=256
" Notepad ++
inoremap <leader>d <esc>yypi
nnoremap <leader>d yyp
vnoremap <leader>d 0y0p



" Folding
" autocmd FileType javascript set foldmethod=indent

" Escape in Insert and Visual modes
inoremap <leader><leader> <esc>
vnoremap <leader><leader> <esc>
" END MÀJ !

" "REQUIRED for latexsuite
" filetype plugin on
"
" "IMPORTANT
set grepprg=grep\.-nH\ $*
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
"
"
"Latex
" "OPTIONNEL
"filetype indent on 
"let g:tex_flavor='latex'
" REPLIS: vim-latex replis automatiquement certaines sections et environnements
" ou commandes. La liste de ce qui doit être replié est géré par les varibales
" globales suivantes. Les replis se font en partant de la fin de la liste puis
" en remontant. Les defaut sont dans folding.vim (~/.vim/ftplugin/latex-suite/)
"let g:Tex_FoldedSections="part,chapter,section,%%fakesection,subsection"
"let g:Tex_FoldedEnvironments="verbatim,comment,eq,figure,table,tabular,tikzpicture,thebibliography,abstract,frame"
"let g:Tex_FoldedMisc = 'preamble,<<<'  " >>>

" COMPILATION VISUALISATION: par defaut on compile avec pdflatex et on utilise
" pour visualiser les pdf : kpdf
"let g:Tex_DefaultTargetFormat="pdf"
"let g:Tex_ViewRule_pdf = "qpdfview"
