return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  cmd = { "RemoteSSHFSConnect", "RemoteSSHFSDisconnect", "RemoteSSHFSEdit" },
  keys = {
    { "<leader>rc", "<cmd>RemoteSSHFSConnect<cr>", desc = "Remote connect" },
    { "<leader>rd", "<cmd>RemoteSSHFSDisconnect<cr>", desc = "Remote disconnect" },
    { "<leader>re", "<cmd>RemoteSSHFSEdit<cr>", desc = "Edit ssh config" },
    {
      "<leader>rf",
      function()
        require("telescope").extensions["remote-sshfs"].find_files()
      end,
      desc = "Remote find files",
    },
    {
      "<leader>rg",
      function()
        require("telescope").extensions["remote-sshfs"].live_grep()
      end,
      desc = "Remote grep",
    },
  },
  config = function()
    require("remote-sshfs").setup({})
    require("telescope").load_extension("remote-sshfs")
  end,
}
