return {
	"Civitasv/cmake-tools.nvim",
	opts = {
		cmake_executor = {
			default_opts = {
				quickfix = {
					auto_close_when_success = false,
				},
			},
		},
		cmake_runner = {
			default_opts = {
				quickfix = {
					auto_close_when_success = false,
				},
			},
		},
	},
	keys = {
		{ "<leader>cg", "<cmd>CMakeGenerate<CR>", desc = "Generate" },
		{ "<leader>cb", "<cmd>CMakeBuild<CR>", desc = "Build" },
		{ "<leader>cr", "<cmd>CMakeRun<CR>", desc = "Run" },
		{ "<leader>ct", "<cmd>CMakeTest<CR>", desc = "Test" },
		{ "<leader>cd", "<cmd>CMakeDebug<CR>", desc = "Debug" },
		{ "<leader>cs", "<cmd>CMakeSelectBuildType<CR>", desc = "Select Build Type" },
		{ "<leader>ck", "<cmd>CMakeSelectKit<CR>", desc = "Select Kit" },
		{ "<leader>cl", "<cmd>CMakeSelectLaunchTarget<CR>", desc = "Select Target" },
		{ "<leader>cC", "<cmd>CMakeClean<CR>", desc = "Clean" },
	},
}
