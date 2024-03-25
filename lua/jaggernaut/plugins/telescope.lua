return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.6',
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function ()
    require("telescope").setup({})
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>tm', builtin.man_pages, {})
    vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {})
  end
}
