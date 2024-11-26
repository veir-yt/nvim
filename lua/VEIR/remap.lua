local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader, space
vim.g.mapleader = ' '
keymap({ 'n', 'v' }, '<Space>', '<Nop>', opts)

function source_files()
  vim.cmd('source C:\\Users\\VEIR\\AppData\\Local\\nvim\\init.lua')
  vim.cmd('source C:\\Users\\VEIR\\AppData\\Local\\nvim\\lua\\VEIR\\set.lua')
  vim.cmd('source C:\\Users\\VEIR\\AppData\\Local\\nvim\\lua\\VEIR\\init.lua')
  vim.cmd('source C:\\Users\\VEIR\\AppData\\Local\\nvim\\lua\\VEIR\\remap.lua')
end



-- #################### KEY MAPS ####################



-- ########## CURSOR POSITIONS ########## 

keymap('n', 'j', 'jzz', opts) -- keep cursor in middle - preference
keymap('n', 'k', 'kzz', opts)
keymap('v', 'j', 'jzz', opts)
keymap('v', 'k', 'kzz', opts)
keymap('v', 'H', 'Hzz', opts)
keymap('v', 'L', 'Lzz', opts)
keymap('n', 'H', 'Hzz', opts)
keymap('n', 'L', 'Lzz', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)
keymap('n', 'gd', 'gdzz', opts) -- idk if this is working
keymap('n', 'G', 'Gzz', opts)
keymap('n', 'u', 'uzz', opts)
keymap('n', '<C-r>', '<C-r>zz', opts)



-- ########## MOVING TEXT ########## 

keymap('n', '<A-h>', '<<', opts)
keymap('n', '<A-l>', '>>', opts)
keymap('n', '<A-k>', ':m .-2<CR>zz', opts)
keymap('n', '<A-j>', ':m .+1<CR>zz', opts)
keymap('v', '<A-j>', ":m '>+1<CR>gv=gvzz", opts)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gvzz", opts)
keymap('v', '<a-h>', '<gv', opts) -- todo make this repeatable
keymap('v', '<a-l>', '>gv', opts)



-- ########## COPY / PASTE / BUFFERS ########## 

keymap('i', '<C-b>', '<Esc>pa', opts) -- paste in insert mode from vim copy buffer, not ctrl + v

keymap('n', 'd', '"_d', opts) -- delete / change without copy, amazing
keymap('n', '<C-d>', 'd', opts)
keymap('n', 'x', '"_x', opts)
keymap('n', 'c', '"_c', opts)
keymap('v', 't', '"+y', opts) -- copy to clipboard
keymap('v', 'd', '"_d', opts)
keymap('v', 'p', '"_pp', opts)
keymap('v', 'p', '"_PP', opts)
keymap('v', 'r', 'd', opts)



-- ########## WINDOWS ##########

keymap('n', '<C-k>', '<C-w>k', opts) -- moving
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('i', '<C-k>', '<Esc><C-w>k', opts) -- moving in insert
keymap('i', '<C-j>', '<Esc><C-w>j', opts)
keymap('i', '<C-l>', '<Esc><C-w>l', opts)
keymap('i', '<C-h>', '<Esc><C-w>h', opts)
keymap('n', '<C-A-j>', ':split<CR><C-w>j<CR>', opts)
keymap('n', '<C-A-l>', ':vsplit<CR><C-w>l<CR>', opts)
keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts) -- moving in terminal
keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
keymap('t', '<C-Down>', '<C-\\><C-n><C-w>k', opts) -- moving in terminal
keymap('t', '<C-Up>', '<C-\\><C-n><C-w>j', opts)
keymap('t', '<C-Left>', '<C-\\><C-n><C-w>h', opts)
keymap('t', '<C-Right>', '<C-\\><C-n><C-w>l', opts)
keymap('t', '<Esc>', '<C-\\><C-n>', opts) -- exit terminal



-- ########## BARBAR ##########

keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts) -- move left / right
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts) -- re-order to right / left
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts) -- goto buffer in position n
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts) -- pin / unpin buffer

keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts) -- close current tab
keymap('n', '<A-d>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts) -- close all tabs but current or pinned



-- ########## LEADER ##########

keymap('n', '<leader><leader>', [[:lua source_files()<CR>:noh<CR>]], opts) -- refresh


keymap('n', '<leader><enter>', ':noh<CR>', opts) -- clear higlighting
keymap('n', '<leader>ss', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>') -- search and replace in file over word
keymap('n', '<leader>ff', ':/<C-r><C-w><CR>N', opts) -- search in file over word

-- inner words, don't copy when deleting or changing
keymap('n', '<leader>y', 'yiw', opts)
keymap('n', '<leader>tt', 'viw"+y', opts)
keymap('n', '<leader>r', '"_diwP', opts)
keymap('n', '<leader>d', '"_diw', opts)
keymap('n', '<leader>c', '"_ciw', opts)
keymap('n', '<leader>v', 'viw', opts)

-- comments
keymap('v', '<leader>m', '<plug>NERDCommenterToggle gv', opts)
keymap('n', '<leader>m', '<plug>NERDCommenterToggle', opts)
keymap('n', '<leader>,', '<plug>NERDCommenterAppend', opts)
vim.g.NERDCustomDelimiters = {
  c = {
    left = '// ',
  }
}

-- tpope surround is awesome
keymap('n', '<leader>nc', '<plug>Csurround', opts)
keymap('n', '<leader>nd', '<plug>Dsurround', opts)
keymap('n', '<leader>ni', '<plug>Ysurroundiw', opts)
keymap('n', '<leader>na', '<plug>Yssurround', opts)
--xmap S   <Plug>VSurround // V then S then <> for html stuff, no leader here

-- spectre, amazing package doing find and replace a lot like vscode
keymap('n', '<leader>so', '<cmd>lua require("spectre").toggle()<CR>i', opts) -- open
keymap('n', '<leader>sc', '<cmd>lua require("spectre").toggle()<CR>', opts) -- close
keymap('n', '<leader>sr', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap('v', '<leader>sr', '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)
keymap('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search()<CR>', opts)



-- ########## MISC ########## 

keymap('n', '<S-j>', 'o<Esc>zz', opts) -- insert new lines above and below, I love this
keymap('n', '<S-k>', 'O<Esc>', opts)

keymap('i', '<A-n>', '_<Esc>a', opts) -- easy underscore, I like snake case

keymap('i', '<A-l>', '<Esc>la', opts) -- navigate in insert mode, nice
keymap('i', '<A-h>', '<Esc>ha', opts)
keymap('i', '<A-j>', '<Esc>ja', opts)
keymap('i', '<A-k>', '<Esc>ka', opts)
keymap('i', '<A-e>', '<Esc>ea', opts)
keymap('i', '<A-b>', '<Esc>bi', opts)
keymap('i', '<A-S-L>', '<Esc>A', opts)
keymap('i', '<A-S-H>', '<Esc>I', opts)

keymap('i', '<A-p>', '<Esc>pa', opts)

keymap('n', '<C-a>', 'ggVG', opts) -- select all

keymap('n', 'Q', '<nop>', opts) -- disable ex mode
keymap('n', 'q', '<nop>', opts) -- stop macros

keymap('n', ';', ':') -- for ease of use 
keymap('n', ':', ';')
keymap('n', '.', ';', opts)
keymap('n', '/', '/\\c')






-- #################### KEY MAPS ####################



-- ########## GIT FUGITIVE ########## 

keymap('n', '<leader>go', ':DiffviewOpen<CR>', opts)
keymap('n', '<leader>gc', ':DiffviewClose<CR>', opts)



-- ########## TELESCOPE ########## 

local telescope_builtin = require('telescope.builtin')

keymap('n', '<leader>to', telescope_builtin.find_files, opts)
keymap('n', '<leader>ts', telescope_builtin.live_grep, opts)
keymap('n', '<leader>po', ':Ex <CR>', opts) -- open file explorer



-- ########## TROUBLE ########## 

keymap("n", "<leader>x", function() require("trouble").toggle() end)



-- ########## UNDOTREE ########## 

keymap('n', '<leader>u', vim.cmd.UndotreeToggle, opts)
