return {
  "coder/claudecode.nvim",
  opts = {
    terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
    terminal = { provider = "snacks" }, -- or "none" to run claude in your own terminal
  },
}
