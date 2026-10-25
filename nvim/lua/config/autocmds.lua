-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)

-- Autosave on normal mode
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! update")
    end
  end,
})

-- Set the header dashboard colour to Blueish
local function header_color()
  vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#0a5f7f", bold = true })
end
header_color()
vim.api.nvim_create_autocmd("ColorScheme", { callback = header_color })

-- Set some colours for C on top the jetbrains theme
local function c_colors()
  local hl = function(g, o)
    vim.api.nvim_set_hl(0, g, o)
  end
  hl("@type.builtin.c", { fg = "#a078f0" }) -- int, char, void
  hl("@lsp.type.macro.c", { fg = "#d0b06c", bold = true }) -- #define macros
  hl("@comment.c", { fg = "#6272a4", italic = true })
  hl("@type.c", { fg = "#a0587f" }) -- user types (Treesitter)
  hl("@lsp.type.type.c", { link = "@type.c" }) -- typedef names (clangd)
  hl("@lsp.type.class.c", { link = "@type.c" }) -- struct names (clangd)
  hl("@variable.member.c", { fg = "#9876AA" }) -- struct fields
  hl("@lsp.type.property.c", { link = "@variable.member.c" })
end
c_colors()
vim.api.nvim_create_autocmd("ColorScheme", { callback = c_colors })
