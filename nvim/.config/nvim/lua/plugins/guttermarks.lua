return {
  "dimtion/guttermarks.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "FileType" },
  opts = {
  },
  keys = {
    {
      "m;",
      function()
        require("guttermarks.actions").delete_mark()
      end,
      desc = "Delete mark under cursor",
    },
    {
      "m]",
      function()
        require("guttermarks.actions").next_buf_mark()
      end,
      desc = "Next mark in current buffer",
    },
    {
      "m[",
      function()
        require("guttermarks.actions").prev_buf_mark()
      end,
      desc = "Previous mark in current buffer",
    },
    {
      "<leader>mq",
      function()
        require("guttermarks.actions").marks_to_quickfix()
        vim.cmd("copen")
      end,
      desc = "Send marks to quickfix",
    }
  }
}
