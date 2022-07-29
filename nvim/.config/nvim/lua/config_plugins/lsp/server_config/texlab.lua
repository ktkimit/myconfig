return {
  settings = {
    texlab = {
      build = {
        forwardSearchAfter = true,
      },
      forwardSearch = {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = {"-g", "%l", "%p", "%f"}
      },
    },
  },
}
