return {
	"williamboman/mason.nvim",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "cppdbg", "python" },
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
		})
	end,
}
