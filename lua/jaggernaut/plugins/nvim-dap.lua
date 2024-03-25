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

		--Signs
		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = "●", texthl = "DAP_BREAKPOINT", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DAP_BREAKPOINT", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
		sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DAP_LINE_COLOR", numhl = "DapStopped" })
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
			id = "cppdbg",
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
		}

		require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp", "rust" } })
	end,
}
