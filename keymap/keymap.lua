local M = {}

function M.keymap(mode, l, r, options)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, l, r, options)
end

return M

