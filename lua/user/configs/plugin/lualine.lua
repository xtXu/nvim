local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("Plugin lualine not found !")
	return
end

local function lsp_client_names()
	local client_names = {}
	for _, client in ipairs(vim.lsp.buf_get_clients(0)) do
		table.insert(client_names, client.name)
	end
	return table.concat(client_names, ",")
end


lualine.setup {
	options = {
		theme = 'base46'
	},

	extensions = {
		"nvim-tree",
		"quickfix",
		"man",
		-- "aerial",
		"symbols-outline",
		"toggleterm",
	},

	sections = {
		lualine_c = {
			{
				'filename',
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = false, -- Display new file status (new file means no write after created)
				path = 1, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = '[+]', -- Text to show when the file is modified.
					readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
					unnamed = '[No Name]', -- Text to show for unnamed buffers.
					newfile = '[New]', -- Text to show for new created file before first writting
				}
			}
		},

		-- lualine_x = {'lsp_progress', 'encoding', 'fileformat', 'filetype' },
		-- lualine_x = {lsp_client_names, 'encoding', 'fileformat', 'filetype' },
	}
}
