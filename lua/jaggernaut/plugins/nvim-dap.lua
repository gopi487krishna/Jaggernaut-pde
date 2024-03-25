return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"Weissle/persistent-breakpoints.nvim",
		"williamboman/mason.nvim",
	},
	config = function()
		local dap = require("dap")
		local mason_nvim_dap = require("mason-nvim-dap")
		-- Keybindings
		vim.keymap.set("n", "<F1>", ":lua require'dap'.repl.open()<CR>")
		vim.keymap.set("n", "<F11>", ":lua require'dap'.continue()<CR>")
		vim.keymap.set("n", "<F12>", "lua require'dap'.terminate()<CR>")
		vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
		vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
		vim.keymap.set(
			"n",
			"<leader>lp",
			":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
		)
		-- Setup dap
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/root/.local/share/nvim/mason/bin/OpenDebugAD7',
    }

		require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp", "rust" } })
	end,
}
