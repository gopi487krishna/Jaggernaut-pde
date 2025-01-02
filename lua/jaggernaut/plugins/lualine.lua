return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_y = {
					function()
						return os.date("%H:%M:%S")
					end,
				},
			},
		})
	end,
}
