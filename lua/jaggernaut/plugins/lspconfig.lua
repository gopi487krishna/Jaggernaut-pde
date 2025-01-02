return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
    "SmiteshP/nvim-navbuddy",
	},
	config = function()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_config = require("lspconfig")
    local wk = require("which-key.extras");

		-- Lua language
		lsp_config.lua_ls.setup({
			capablities = lsp_capabilities,
		})

    -- Rust
  lsp_config.rust_analyzer.setup{
      settings = {
        ['rust_analyzer'] = {
          diagnostics = {
            enable = false
          }
        }
      }
  }

		-- Clangd
    lsp_config.clangd.setup({})

		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {desc = "Open float"})
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to Prev"})
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to Next"})
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, {desc = "LocList"})

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = ev.buf, desc = "Go to Declaration"})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = ev.buf, desc = "Go to Definition"})
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = ev.buf, desc = "Symbol Info"})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = ev.buf, desc = "Go to Implementation"})
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {buffer = ev.buf, desc = "Signature Help"})
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {buffer = ev.buf, desc = "Add Workspace Folder"})
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {buffer = ev.buf, desc = "Remove Workspace Folder"})
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, {buffer = ev.buf, desc = "List workspace folders"})
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {buffer = ev.buf, desc = "Go to Definition"})
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {buffer = ev.buf, desc = "Rename symbol under cursor"})
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {buffer = ev.buf, desc = "List Available Code Actions"})
				vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = ev.buf, desc = "Get references for Symbol under cursor"})
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, {buffer = ev.buf, desc = "Format Current Buffer"})
			end,
		})
	end,
}
