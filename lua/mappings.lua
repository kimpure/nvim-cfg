local keymap = vim.keymap

keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
keymap.set("n", "dd", '"_dd', { noremap = true })
keymap.set("v", "D", '"_D', { noremap = true })

keymap.set("n", "<A-Right>", ":wincmd l<CR>")
keymap.set("n", "<A-Left>", ":wincmd h<CR>")
keymap.set("n", "<A-Down>", ":wincmd j<CR>")
keymap.set("n", "<A-Up>", ":wincmd k<CR>")

keymap.set("n", "<A-l>", ":wincmd l<CR>")
keymap.set("n", "<A-h>", ":wincmd h<CR>")
keymap.set("n", "<A-j>", ":wincmd j<CR>")
keymap.set("n", "<A-k>", ":wincmd k<CR>")

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
