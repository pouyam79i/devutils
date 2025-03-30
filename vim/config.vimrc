" Enable vim-plug
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
" Plugins for Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go support
Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Autocompletion
Plug 'preservim/nerdtree'                          " File explorer
Plug 'airblade/vim-gitgutter'                      " Git integration
Plug 'tpope/vim-fugitive'                          " Git commands
Plug 'dense-analysis/ale'                          " Linting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'                            " Fuzzy finder integration

" Plugins for Dockerfile development
Plug 'ekalinin/Dockerfile.vim'                     " Dockerfile syntax

" Plugins for JavaScript, Node.js, Vue, CSS, and HTML
Plug 'pangloss/vim-javascript'                     " JavaScript syntax
Plug 'mxw/vim-jsx'                                 " JSX syntax
Plug 'posva/vim-vue'                               " Vue.js syntax
Plug 'hail2u/vim-css3-syntax'                      " CSS3 syntax
Plug 'othree/html5.vim'                            " HTML5 syntax
Plug 'mattn/emmet-vim'                             " Emmet for HTML/CSS

" Plugins for Shell Scripting
Plug 'vim-syntastic/syntastic'                     " Syntax checking
Plug 'shime/vim-livedown'                          " Markdown preview (optional)
Plug 'chr4/nginx.vim'                              " Nginx config syntax (optional)
Plug 'WolfgangMehner/bash-support'                 " Bash IDE support

call plug#end()

" Basic settings
set number              " Show line numbers
set tabstop=4           " Set tab width to 4 spaces
set shiftwidth=4        " Set indentation width to 4 spaces
set expandtab           " Use spaces instead of tabs
set termguicolors
colorscheme onedark
syntax on               " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection and indentation

" vim-go settings
let g:go_fmt_command = "goimports" " Automatically format and organize imports
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" coc.nvim settings
let g:coc_theme = 'default'
let g:coc_global_extensions = [
    \ 'coc-go',     
    \ 'coc-docker',  
    \ 'coc-json',      
    \ 'coc-yaml',     
    \ 'coc-snippets', 
    \ 'coc-tsserver',  
    \ 'coc-vetur',     
    \ 'coc-css',     
    \ 'coc-html',      
    \ 'coc-sh',        
    \ ]

" Key mappings for coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call CocAction('doHover')<CR>

" NERDTree settings
map <C-n> :NERDTreeToggle<CR> " Toggle NERDTree with Ctrl+n
let NERDTreeShowHidden=1      " Show hidden files in NERDTree

" ALE settings
let g:ale_linters = {
    \ 'go': ['gopls', 'golint'],
    \ 'dockerfile': ['hadolint'],
    \ 'javascript': ['eslint'],
    \ 'vue': ['eslint'],
    \ 'css': ['stylelint'],
    \ 'html': ['htmlhint'],
    \ 'sh': ['shellcheck'],
    \ }
let g:ale_fixers = {
    \ 'go': ['gofmt', 'goimports'],
    \ 'dockerfile': ['dockerfile_lint'],
    \ 'javascript': ['eslint'],
    \ 'vue': ['eslint'],
    \ 'css': ['stylelint'],
    \ 'html': ['htmlhint'],
    \ 'sh': ['shfmt'],
    \ }
let g:ale_fix_on_save = 1 " Automatically fix files on save

" Emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
let g:user_emmet_mode='a' " Enable Emmet in all modes
let g:user_emmet_leader_key='<C-Z>' " Set Emmet trigger key

" Bash-support settings
let g:Bash_Ctrl_j = 'off' " Disable Ctrl-j mapping to avoid conflict

highlight CocMenuSel guibg=#4C566A guifg=#ECEFF4
highlight CocFloating guibg=#2E3440 guifg=#D8DEE9
highlight CocPumSearch guifg=#88C0D0
highlight CocPumMenu guibg=#3B4252 guifg=#E5E9F0

" Use <CR> (Enter) to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Enable spell checking
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

" Customize spell check highlighting
highlight SpellBad cterm=underline ctermfg=red guifg=red
highlight SpellCap cterm=underline ctermfg=blue guifg=blue
highlight SpellRare cterm=underline ctermfg=magenta guifg=magenta
highlight SpellLocal cterm=underline ctermfg=cyan guifg=cyan

" Toggle spell check with F6
nnoremap <F6> :set spell!<CR>
inoremap <F6> <C-o>:set spell!<CR>
