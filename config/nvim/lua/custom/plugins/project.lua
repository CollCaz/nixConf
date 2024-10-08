return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			vim.keymap.set('n', '<leader>sp', '<cmd>Telescope projects<CR>', { desc = 'Find [P]rojects' })
		}
	end
}
