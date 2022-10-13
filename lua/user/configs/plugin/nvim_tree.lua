local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("Plugin nvim-tree not found !")
  return
end

nvimtree.setup { -- BEGIN_DEFAULT_OPTS
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	renderer = {
		group_empty = true,
		highlight_opened_files = "name",
	},

} -- END_DEFAULT_OPTS
