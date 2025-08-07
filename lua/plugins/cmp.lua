local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local config = function(_, _)
  local cmp = require 'cmp'
  cmp.setup {
    -- snippet engine
    snippet = {
      expand = function(args)
        -- for `vsnip` users.
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    -- sources
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'vsnip' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'omni' },
      { name = 'path' },
      { name = 'treesitter' },
    }),
    mapping = {
      ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
      ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
      ['<a-q>'] = cmp.mapping(cmp.mapping.close(), { 'i', 'c' }),
      ['<a-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<a-u>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c', 'n' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }), -- accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<a-j>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
      ['<a-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
      ['<a-l>'] = cmp.mapping(function(_)
        if vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
          -- else
          --   fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { 'i', 's' }),
      ['<a-h>'] = cmp.mapping(function()
        if vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { 'i', 's' }),
    },
    -- format with lspkind
    formatting = {
      format = require 'lspkind'.cmp_format({
        with_text = true, -- do not show text alongside icons
        maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        before = function(entry, vim_item)
          -- show source
          vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
          return vim_item
        end
      })
    },
  }
  -- use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'buffer' },
      { name = 'cmdline' }
    })
  })
end

return {
  "hrsh7th/cmp-nvim-lsp",                -- { name = nvim_lsp }
  "hrsh7th/cmp-buffer",                  -- { name = 'buffer' },
  "hrsh7th/cmp-path",                    -- { name = 'path' }
  "hrsh7th/cmp-cmdline",                 -- { name = 'cmdline' }
  "hrsh7th/cmp-vsnip",                   -- { name = 'vsnip' }
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-nvim-lsp-signature-help", -- { name = 'nvim_lsp_signature_help' }

  {
    "hrsh7th/nvim-cmp",
    config = config,
  },
}
