-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local default_opts = { noremap = true, silent = true }

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
