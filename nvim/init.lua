vim.o.number = true
vim.o.relativenumber = true
vim.o.swap = false

vim.keymap.set("i", "jk", "<Esc>", { noremap = true }  )
vim.keymap.set("n", "-", ":Ex<cr>", { noremap = true, desc = "Open file explorer" }  )
