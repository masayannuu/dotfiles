vim.keymap.set({ "o" }, "m", function()
	require("tsht").nodes()
end, { noremap = false, expr = false, silent = true })
vim.keymap.set({ "x" }, "m", function()
	require("tsht").nodes()
end, { noremap = true, expr = false, silent = true })
