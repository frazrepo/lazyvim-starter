return {
  -- minioperators  : Sort (gs), Replace with register (gr), Exchange text regions (gx/gxx), Multiply text (gm/gmm),
  {
    'echasnovski/mini.operators',
    version = '*',
    vscode = true,
    opts = {},
    keys = {
      { "zs" , desc= "Sort text region" },
      { "gx" , desc= "Exchange text region" },
      { "gm" , desc= "Multiply text region" },
      { "gr" , desc= "Replace with register" },
      -- { "g=" , "Evaluate text and replace" }, -- Already used to indent buffer
    }
  },
}
