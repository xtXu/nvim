local status_ok, comment = pcall(require, "Comment")

if not status_ok then
	vim.notify("Plugin Comment.nvim not found !")
	return
end

comment.setup()
