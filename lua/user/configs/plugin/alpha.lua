local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("Plugin alpha not found !")
	return
end

local dashboard = require("alpha.themes.dashboard")

local function footer()
	-- local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

	-- return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
	return datetime .. nvim_version_info
end

dashboard.section.buttons.val = {
	dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
	dashboard.button("o", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("p", "  > Project", ":Telescope projects<CR>"),
	dashboard.button("s", "  > Session", ":Telescope possession list<CR>"),
	dashboard.button("ns", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "AlphaHeader"


alpha.setup(dashboard.config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
