" Forest Evening - A warm, green-focused nature-inspired color scheme
" Maintainer: Your Name
" Version: 1.1 - More Green, Less Blue

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "forest_evening"
set background=dark

" Color Palette - Forest Evening Theme (Green-focused)
let s:palette = {
\ 'bg0':        '#1a1f1a',
\ 'bg1':        '#212621',
\ 'bg2':        '#2a312a',
\ 'bg3':        '#333d33',
\ 'bg4':        '#3d4a3d',
\ 'fg0':        '#e8dcc6',
\ 'fg1':        '#d4c7aa',
\ 'fg2':        '#c0b28a',
\ 'fg3':        '#ac9d6a',
\ 'fg4':        '#98884a',
\ 'red':        '#d65d0e',
\ 'orange':     '#ff8c00',
\ 'yellow':     '#fabd2f',
\ 'green':      '#8fbc8f',
\ 'dark_green': '#6b8e23',
\ 'forest':     '#228b22',
\ 'emerald':    '#50c878',
\ 'lime':       '#9acd32',
\ 'teal':       '#5f8a5f',
\ 'purple':     '#d3869b',
\ 'brown':      '#a89984',
\ 'pine':       '#4a5d4a',
\ 'moss':       '#6b8e23',
\ 'bark':       '#8b4513',
\ 'sunset':     '#ff6347',
\ 'golden':     '#daa520',
\ 'amber':      '#ffbf00',
\ 'sage':       '#9caf88',
\ 'cedar':      '#704214',
\ 'mint':       '#7fb069',
\ 'olive':      '#8fbc8b'
\ }

" Helper function to set highlights
function! s:hi(group, fg, bg, attr)
  let l:fg = a:fg != '' ? 'guifg=' . a:fg : ''
  let l:bg = a:bg != '' ? 'guibg=' . a:bg : ''
  let l:attr = a:attr != '' ? 'gui=' . a:attr : ''
  exec 'hi ' . a:group . ' ' . l:fg . ' ' . l:bg . ' ' . l:attr
endfunction

" UI Elements
call s:hi('Normal', s:palette.fg0, s:palette.bg0, '')
call s:hi('Cursor', s:palette.bg0, s:palette.golden, '')
call s:hi('CursorLine', '', s:palette.bg1, '')
call s:hi('CursorColumn', '', s:palette.bg1, '')
call s:hi('ColorColumn', '', s:palette.bg2, '')
call s:hi('LineNr', s:palette.fg4, '', '')
call s:hi('CursorLineNr', s:palette.golden, '', 'bold')
call s:hi('VertSplit', s:palette.bg3, '', '')
call s:hi('StatusLine', s:palette.fg1, s:palette.bg3, '')
call s:hi('StatusLineNC', s:palette.fg3, s:palette.bg2, '')
call s:hi('Tabline', s:palette.fg3, s:palette.bg2, '')
call s:hi('TablineFill', '', s:palette.bg1, '')
call s:hi('TablineSel', s:palette.fg0, s:palette.bg4, 'bold')

" Windows and Splits
call s:hi('WinSeparator', s:palette.pine, '', '')
call s:hi('Pmenu', s:palette.fg1, s:palette.bg2, '')
call s:hi('PmenuSel', s:palette.bg0, s:palette.emerald, 'bold')
call s:hi('PmenuSbar', '', s:palette.bg3, '')
call s:hi('PmenuThumb', '', s:palette.bg4, '')

" Search and Selection
call s:hi('Search', s:palette.bg0, s:palette.amber, 'bold')
call s:hi('IncSearch', s:palette.bg0, s:palette.lime, 'bold')
call s:hi('Visual', '', s:palette.bg3, '')
call s:hi('VisualNOS', '', s:palette.bg3, '')

" Messages and Prompts
call s:hi('ErrorMsg', s:palette.sunset, '', 'bold')
call s:hi('WarningMsg', s:palette.orange, '', 'bold')
call s:hi('MoreMsg', s:palette.emerald, '', 'bold')
call s:hi('Question', s:palette.mint, '', 'bold')

" Syntax Highlighting
call s:hi('Comment', s:palette.moss, '', 'italic')
call s:hi('Todo', s:palette.amber, s:palette.bg0, 'bold')

" Constants
call s:hi('Constant', s:palette.golden, '', '')
call s:hi('String', s:palette.emerald, '', '')
call s:hi('Character', s:palette.mint, '', '')
call s:hi('Number', s:palette.amber, '', '')
call s:hi('Boolean', s:palette.lime, '', '')
call s:hi('Float', s:palette.amber, '', '')

" Identifiers
call s:hi('Identifier', s:palette.teal, '', '')
call s:hi('Function', s:palette.golden, '', 'bold')

" Statements
call s:hi('Statement', s:palette.orange, '', 'bold')
call s:hi('Conditional', s:palette.forest, '', 'bold')
call s:hi('Repeat', s:palette.dark_green, '', 'bold')
call s:hi('Label', s:palette.sage, '', '')
call s:hi('Operator', s:palette.fg2, '', '')
call s:hi('Keyword', s:palette.forest, '', 'bold')
call s:hi('Exception', s:palette.sunset, '', 'bold')

" PreProcessor
call s:hi('PreProc', s:palette.purple, '', '')
call s:hi('Include', s:palette.mint, '', '')
call s:hi('Define', s:palette.emerald, '', '')
call s:hi('Macro', s:palette.lime, '', '')
call s:hi('PreCondit', s:palette.teal, '', '')

" Types
call s:hi('Type', s:palette.green, '', '')
call s:hi('StorageClass', s:palette.olive, '', '')
call s:hi('Structure', s:palette.emerald, '', '')
call s:hi('Typedef', s:palette.teal, '', '')

" Special
call s:hi('Special', s:palette.sunset, '', '')
call s:hi('SpecialChar', s:palette.mint, '', '')
call s:hi('Tag', s:palette.forest, '', '')
call s:hi('Delimiter', s:palette.sage, '', '')
call s:hi('SpecialComment', s:palette.moss, '', 'bold')
call s:hi('Debug', s:palette.sunset, '', '')

" Underlined and Error
call s:hi('Underlined', s:palette.emerald, '', 'underline')
call s:hi('Error', s:palette.sunset, s:palette.bg0, 'bold')

" Diff
call s:hi('DiffAdd', s:palette.emerald, s:palette.bg0, '')
call s:hi('DiffChange', s:palette.amber, s:palette.bg0, '')
call s:hi('DiffDelete', s:palette.sunset, s:palette.bg0, '')
call s:hi('DiffText', s:palette.lime, s:palette.bg2, 'bold')

" Folding
call s:hi('Folded', s:palette.moss, s:palette.bg2, 'italic')
call s:hi('FoldColumn', s:palette.moss, s:palette.bg1, '')

" Spelling
call s:hi('SpellBad', s:palette.sunset, '', 'undercurl')
call s:hi('SpellCap', s:palette.orange, '', 'undercurl')
call s:hi('SpellLocal', s:palette.amber, '', 'undercurl')
call s:hi('SpellRare', s:palette.purple, '', 'undercurl')

" LSP/Diagnostic highlights
call s:hi('DiagnosticError', s:palette.sunset, '', '')
call s:hi('DiagnosticWarn', s:palette.orange, '', '')
call s:hi('DiagnosticInfo', s:palette.emerald, '', '')
call s:hi('DiagnosticHint', s:palette.mint, '', '')

" Treesitter highlights (if available)
if has('nvim-0.8')
  call s:hi('@variable', s:palette.fg1, '', '')
  call s:hi('@variable.builtin', s:palette.teal, '', 'bold')
  call s:hi('@function', s:palette.golden, '', 'bold')
  call s:hi('@function.builtin', s:palette.golden, '', 'bold')
  call s:hi('@keyword', s:palette.forest, '', 'bold')
  call s:hi('@keyword.function', s:palette.dark_green, '', 'bold')
  call s:hi('@string', s:palette.emerald, '', '')
  call s:hi('@comment', s:palette.moss, '', 'italic')
  call s:hi('@type', s:palette.green, '', '')
  call s:hi('@constant', s:palette.golden, '', '')
  call s:hi('@number', s:palette.amber, '', '')
  call s:hi('@boolean', s:palette.lime, '', '')
  call s:hi('@operator', s:palette.sage, '', '')
  call s:hi('@punctuation', s:palette.fg2, '', '')
  call s:hi('@tag', s:palette.forest, '', '')
  call s:hi('@tag.delimiter', s:palette.teal, '', '')
  call s:hi('@attribute', s:palette.mint, '', '')
  call s:hi('@field', s:palette.emerald, '', '')
  call s:hi('@property', s:palette.mint, '', '')
  call s:hi('@method', s:palette.golden, '', 'bold')
  call s:hi('@namespace', s:palette.olive, '', '')
  call s:hi('@constructor', s:palette.green, '', 'bold')
endif

" Telescope (if installed)
call s:hi('TelescopeNormal', s:palette.fg1, s:palette.bg1, '')
call s:hi('TelescopeBorder', s:palette.pine, s:palette.bg1, '')
call s:hi('TelescopePromptBorder', s:palette.emerald, s:palette.bg1, '')
call s:hi('TelescopeResultsBorder', s:palette.teal, s:palette.bg1, '')
call s:hi('TelescopePreviewBorder', s:palette.sage, s:palette.bg1, '')
call s:hi('TelescopeMatching', s:palette.lime, '', 'bold')
call s:hi('TelescopeSelection', '', s:palette.bg3, 'bold')
call s:hi('TelescopeSelectionCaret', s:palette.emerald, '', 'bold')

" NvimTree (if installed)
call s:hi('NvimTreeNormal', s:palette.fg1, s:palette.bg1, '')
call s:hi('NvimTreeFolderIcon', s:palette.emerald, '', '')
call s:hi('NvimTreeFolderName', s:palette.green, '', 'bold')
call s:hi('NvimTreeOpenedFolderName', s:palette.lime, '', 'bold')
call s:hi('NvimTreeEmptyFolderName', s:palette.teal, '', '')
call s:hi('NvimTreeIndentMarker', s:palette.pine, '', '')
call s:hi('NvimTreeVertSplit', s:palette.bg0, s:palette.bg0, '')
call s:hi('NvimTreeRootFolder', s:palette.forest, '', 'bold')
call s:hi('NvimTreeFileIcon', s:palette.sage, '', '')
call s:hi('NvimTreeExecFile', s:palette.lime, '', 'bold')
call s:hi('NvimTreeSpecialFile', s:palette.golden, '', 'bold')

" GitSigns (if installed)
call s:hi('GitSignsAdd', s:palette.emerald, '', '')
call s:hi('GitSignsChange', s:palette.amber, '', '')
call s:hi('GitSignsDelete', s:palette.sunset, '', '')
call s:hi('GitSignsCurrentLineBlame', s:palette.moss, '', 'italic')

" LSP Semantic Highlights
call s:hi('LspReferenceText', '', s:palette.bg3, '')
call s:hi('LspReferenceRead', '', s:palette.bg3, '')
call s:hi('LspReferenceWrite', '', s:palette.bg3, 'bold')

" Additional green-focused highlights for popular plugins
" Indent Blankline
call s:hi('IndentBlanklineChar', s:palette.pine, '', '')
call s:hi('IndentBlanklineContextChar', s:palette.emerald, '', '')

" Which Key
call s:hi('WhichKey', s:palette.emerald, '', 'bold')
call s:hi('WhichKeyDesc', s:palette.mint, '', '')
call s:hi('WhichKeyGroup', s:palette.forest, '', 'bold')
call s:hi('WhichKeySeparator', s:palette.sage, '', '')

" Hop.nvim
call s:hi('HopNextKey', s:palette.lime, '', 'bold')
call s:hi('HopNextKey1', s:palette.emerald, '', 'bold')
call s:hi('HopNextKey2', s:palette.mint, '', '')

" Dashboard/Alpha
call s:hi('DashboardHeader', s:palette.forest, '', 'bold')
call s:hi('DashboardCenter', s:palette.emerald, '', '')
call s:hi('DashboardShortcut', s:palette.golden, '', 'bold')
call s:hi('DashboardFooter', s:palette.moss, '', 'italic')
