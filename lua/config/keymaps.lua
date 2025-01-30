-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local default_opts = { noremap = true, silent = true }
-- buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- Backspace to navigate to alternate buffer
vim.keymap.set("n", "<bs>", "<c-^>", { noremap = false, silent = true })

-- H and L Begin/End on homerow
vim.keymap.set("n", "H", "^", { noremap = false, silent = true })
vim.keymap.set("n", "L", "g_", { noremap = false, silent = true })

-- Paste quickly in insert mode
vim.keymap.set("i", "<C-r><C-r>", "<C-r>*", default_opts)

-- Map some keys for azerty keyboard
vim.keymap.set("n", "µ", "#", { noremap = false, silent = true })
vim.keymap.set("n", "²", ".", { noremap = false, silent = true })

-- Marks keepjumps
vim.keymap.set("n", "mù", "m`", default_opts)
vim.keymap.set("n", "ùù", "``", default_opts)
vim.keymap.set("n", "'", "`", default_opts)

-- Change word under cursor and dot repeat, really useful to edit quickly
vim.keymap.set("n", "c*", "*Ncgn", default_opts)
vim.keymap.set("n", "c#", "#NcgN", default_opts)
vim.keymap.set("n", "cg*", "g*Ncgn", default_opts)
vim.keymap.set("n", "cg#", "g#Ncgn", default_opts)

-- Remove the Windows ^M - when the encodings gets messed up
vim.keymap.set(
  "n",
  "<Leader>m",
  [[mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm]],
  { noremap = false, silent = true, desc = "Remove special char ^M" }
)

--Alternative to unimpaired to add spaces above or below
vim.keymap.set(
  "n",
  "gO",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Add blank line(s) above" }
)
vim.keymap.set(
  "n",
  "go",
  "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
  { desc = "Add blank line(s) below" }
)

------------------------------------------------------------
-- Search and Replace normal and visual mode
------------------------------------------------------------
-- search replace
vim.keymap.set("n", "<leader>r", ":%s/", { noremap = true, silent = false, desc = "Search and replace" })
vim.keymap.set("x", "<leader>r", [[:s/]], { noremap = true, silent = false, desc = "Search and replace" })

-- replace the current text in search register
vim.keymap.set(
  "n",
  "<leader>R",
  [[:%s///g<Left><Left>]],
  { noremap = true, silent = false, desc = "Replace Search register" }
)

-- Put visual selection in search register
function VisualSelection(direction, extra_filter)
  local saved_reg = vim.fn.getreg('"')
  vim.cmd("normal! vgvy")

  local pattern = vim.fn.escape(vim.fn.getreg('"'), "\\/.*'$^~[]")
  pattern = vim.fn.substitute(pattern, "\n$", "", "")

  if direction == "replace" then
    vim.fn.feedkeys(":" .. "%s" .. "/" .. pattern .. "/")
  end

  vim.fn.setreg("/", pattern)
  vim.fn.setreg('"', saved_reg)
end

-- Search and replace the selected text
vim.keymap.set("x", "<leader>R", [[:<C-u>lua VisualSelection('replace','')<CR>]], default_opts)
