local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	vim.notify("Plugin nvim-treesitter not found !")
	return
end

local ts_comment, _ = pcall(require, "ts_context_commentstring")
local comment_enable_autocmd = false
if not ts_comment then
	comment_enable_autocmd = true
end

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "json", "cmake" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },

	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<TAB>',
      node_incremental = '<TAB>',
      node_decremental = '<BS>',
      -- scope_incremental = '<TAB>',
    }
  },

	-- specific comment for embended filetype (eg. lua in vimsrcipt)
	context_commentstring = {
    enable = true,
		enable_autocmd = comment_enable_autocmd
  },

	refactor = {
    highlight_definitions = {
      enable = false,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
		highlight_current_scope = { enable = false }
  },

	rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },

	matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
}

-- 开启 Folding
vim.wo.foldmethod =  'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
vim.wo.foldlevel = 99
