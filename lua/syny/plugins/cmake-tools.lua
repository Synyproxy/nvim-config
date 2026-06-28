return {
	"Civitasv/cmake-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- `keys` registers real global keymaps right away (lazy.nvim lazy-loads the
	-- plugin itself on first press). Don't rely on `event` alone for this --
	-- BufRead/BufNewFile on CMakeLists.txt only loads the plugin once that
	-- specific buffer is opened, so the keymaps wouldn't exist yet anywhere else.
	keys = {
		{
			"<F8>",
			function()
				local actions = {
					{ label = "Build",               cmd = "CMakeBuild" },
					{ label = "Run",                 cmd = "CMakeRun" },
					{ label = "Debug",               cmd = "CMakeDebug" },
					{ label = "Select Target",       cmd = "CMakeSelectLaunchTarget" },
					{ label = "Select Build Type",   cmd = "CMakeSelectBuildType" },
					{ label = "Generate/Configure",  cmd = "CMakeGenerate" },
					{ label = "Clean",               cmd = "CMakeClean" },
					{ label = "Stop",                cmd = "CMakeStop" },
				}
				vim.ui.select(actions, {
					prompt = "CMake",
					format_item = function(a) return a.label end,
				}, function(choice)
					if choice then vim.cmd(choice.cmd) end
				end)
			end,
			desc = "CMake: Menu",
		},
		{ "<leader>cg", "<cmd>CMakeGenerate<CR>", desc = "CMake: Generate/Configure" },
		{ "<leader>cb", "<cmd>CMakeBuild<CR>", desc = "CMake: Build" },
		{ "<leader>ct", "<cmd>CMakeSelectBuildTarget<CR>", desc = "CMake: Select Build Target" },
		{ "<leader>cl", "<cmd>CMakeSelectLaunchTarget<CR>", desc = "CMake: Select Launch Target" },
		{ "<leader>cy", "<cmd>CMakeSelectBuildType<CR>", desc = "CMake: Select Build Type" },
		{ "<leader>cr", "<cmd>CMakeRun<CR>", desc = "CMake: Run Launch Target" },
		{ "<leader>cd", "<cmd>CMakeDebug<CR>", desc = "CMake: Debug Launch Target" },
		{ "<leader>cc", "<cmd>CMakeClean<CR>", desc = "CMake: Clean" },
		{ "<leader>co", "<cmd>CMakeOpen<CR>", desc = "CMake: Open Console" },
		{ "<leader>cx", "<cmd>CMakeStop<CR>", desc = "CMake: Stop" },
	},
	opts = {
		cmake_command = "cmake",
		cmake_build_directory = "build",
		cmake_generate_options = { "-G", "Ninja" },
		cmake_build_options = {},
		cmake_dap_configuration = {
			name = "cpp",
			type = "codelldb",
			request = "launch",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		},
		-- Both executor (build) and runner (run) use cmake-tools' built-in
		-- terminal backend -- a full-size split for both. Important: CMakeRun
		-- always rebuilds the launch target first internally (even a no-op
		-- rebuild check), so if the executor were set to "overseer" while the
		-- runner is "terminal", every <leader>cr would still silently pop open
		-- the overseer panel for that implicit build step. Keeping both on the
		-- same backend avoids that.
		cmake_executor = {
			name = "terminal",
			opts = {
				split_direction = "horizontal",
				split_size = 15,
				start_insert = false,
				focus = true,
			},
		},
		cmake_runner = {
			name = "terminal",
			opts = {
				split_direction = "horizontal",
				split_size = 15,
				start_insert = false,
				focus = true,
			},
		},
	},
}
