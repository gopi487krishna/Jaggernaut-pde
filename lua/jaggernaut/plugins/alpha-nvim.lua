return {
  "goolord/alpha-nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.opts.hl = "Label"
    -- Header
    dashboard.section.header.val = {
"                                                                                      ",
"                                                                                      ",
" 󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝    ",
"                                                                                      ",
"                                                                                      ",
"     ██╗ █████╗  ██████╗  ██████╗ ███████╗██████╗ ███╗   ██╗ █████╗ ██╗   ██╗████████╗",
"     ██║██╔══██╗██╔════╝ ██╔════╝ ██╔════╝██╔══██╗████╗  ██║██╔══██╗██║   ██║╚══██╔══╝",
"     ██║███████║██║  ███╗██║  ███╗█████╗  ██████╔╝██╔██╗ ██║███████║██║   ██║   ██║   ",
"██   ██║██╔══██║██║   ██║██║   ██║██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║   ██║   ██║   ",
"╚█████╔╝██║  ██║╚██████╔╝╚██████╔╝███████╗██║  ██║██║ ╚████║██║  ██║╚██████╔╝   ██║   ",
" ╚════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ",
"                                                                                      ",
" 󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝   󱚝    ",
"                                                                                      ",
"                                    ██╗██████╗ ███████╗                               ",
"                                    ██║██╔══██╗██╔════╝                               ",
"                                    ██║██║  ██║█████╗                                 ",
"                                    ██║██║  ██║██╔══╝                                 ",
"                                    ██║██████╔╝███████╗                               ",
"                                    ╚═╝╚═════╝ ╚══════╝                               ",
"                                                                                      "

    }
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button( "e", "  : New file" , ""),
      dashboard.button( "f", "󰛔  : Find file", ""),
      dashboard.button( "r", "  : Recent"   , ""),
      dashboard.button( "s", "  : Settings" , ""),
      dashboard.button( "q", "󰰲  : Quit Jaggernaut", ""),
  }
  alpha.setup(dashboard.opts)
   -- Disable folding on alpha buffer
  vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
  ]])
  end
}
