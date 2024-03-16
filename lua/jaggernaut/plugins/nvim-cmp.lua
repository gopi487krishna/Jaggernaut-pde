return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
		local cmp = require("cmp")
		local icons = {
			Text 	 = "󰦨 Text",
			Variable = "󰀫 Variable",
			Snippet  = "<> Snippet",
			Property = " Property",
			Function = "󰊕 Function",
			Field	 = " Field",
		}
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "double"
				}),
				documentation = cmp.config.window.bordered(),
			},

			formatting = {
				format = function(_, vim_item)
					vim_item.kind = icons[vim_item.kind] or vim_item.kind
					return vim_item
				end
			},
			mapping = cmp.mapping.preset.insert({
      				['<C-b>'] = cmp.mapping.scroll_docs(-4),
      				['<C-f>'] = cmp.mapping.scroll_docs(4),
      				['<C-Space>'] = cmp.mapping.complete(),
      				['<C-e>'] = cmp.mapping.abort(),
      				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
        { name = 'plugins' },
			})
		})
  end,
}
