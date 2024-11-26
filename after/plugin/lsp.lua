-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Reserve a space in the gutter
vim.opt.signcolumn = 'no'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'cssls',
    'lua_ls',
    'jsonls',
    'pyright',
    'clangd',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  }),
})














--local lsp_zero = require('lsp-zero')

--lsp_zero.on_attach(function(client, bufnr)
  --lsp_zero.default_keymaps({buffer = bufnr})
--end)

--require('mason').setup({})
--require('mason-lspconfig').setup({
  --ensure_installed = {
    --'tsserver',
    --'eslint',
    --'cssls',
    --'lua_ls',
    --'jsonls',
    --'pyright',
    --'clangd',
  --},
  --handlers = {
    --lsp_zero.default_setup,
  --},
--})

--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}

--cmp.setup({
  --mapping = cmp.mapping.preset.insert({
    --['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    --['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    --['<Enter>'] = cmp.mapping.confirm({ select = true }),
  --})
--})

---- none
--lsp_zero.set_preferences({
	--sign_icons = { }
--})

---- from reddit to ignore react folder
--local function filter(arr, fn)
  --if type(arr) ~= "table" then
    --return arr
  --end

  --local filtered = {}
  --for k, v in pairs(arr) do
    --if fn(v, k, arr) then
      --table.insert(filtered, v)
    --end
  --end

  --return filtered
--end

--local function filterReactDTS(value)
  --return string.match(value.filename, 'react/index.d.ts') == nil
--end

--local function on_list(options)
  --local items = options.items
  --if #items > 1 then
    --items = filter(items, filterReactDTS)
  --end

  --vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  --vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
--end

---- keymaps that first try lsp, then use vim
--lsp_zero.on_attach(function (client, bufnr)
  --local opts = {buffer = bufnr, remap = false}
      --local bufopts = { noremap=true, silent=true, buffer=bufnr }
      --vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition{on_list=on_list} end, bufopts)
  --end)
