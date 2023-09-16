return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
	},
}
