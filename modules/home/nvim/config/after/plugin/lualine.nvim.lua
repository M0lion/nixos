local function time()
	return os.date([[%H:%M %a %d-%b]])
end

require("lualine").setup {
	sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
		lualine_x = {'encoding', time, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
	}
}
