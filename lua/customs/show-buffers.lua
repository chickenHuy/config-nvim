local M = {}

function M.ShowBufferPopup()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local previewers = require("telescope.previewers")
	local conf = require("telescope.config").values
	local entry_display = require("telescope.pickers.entry_display")
	local actions = require("telescope.actions")

	local api = vim.api

	local buffers = {}
	for _, buf in ipairs(api.nvim_list_bufs()) do
		if api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			local name = api.nvim_buf_get_name(buf)
			table.insert(buffers, {
				buf = buf,
				name = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]",
				full_name = name ~= "" and name or "[No Name]",
			})
		end
	end

	if #buffers == 0 then
		vim.notify("No listed buffers", vim.log.levels.INFO)
		return
	end

	pickers
		.new({}, {
			prompt_title = "Buffers",
			finder = finders.new_table({
				results = buffers,
				entry_maker = function(entry)
					local displayer = entry_display.create({
						separator = " ",
						items = {
							{ width = 10 },
							{ remaining = true },
						},
					})

					return {
						value = entry,
						display = function()
							return displayer({
								"Buffer " .. entry.buf,
								entry.name,
							})
						end,
						ordinal = entry.name,
						filename = entry.full_name,
						bufnr = entry.buf,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			previewer = previewers.new_buffer_previewer({
				define_preview = function(self, entry, _)
					local lines = api.nvim_buf_get_lines(entry.bufnr, 0, -1, false)
					api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
					api.nvim_buf_set_option(self.state.bufnr, "filetype", vim.bo[entry.bufnr].filetype)
				end,
			}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)
					api.nvim_set_current_buf(selection.bufnr)
				end)
				map("i", "<C-d>", function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					if not selection or not selection.bufnr then
						vim.notify("No buffer selected", vim.log.levels.ERROR)
						return
					end
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
					require("telescope.actions").close(prompt_bufnr)
					vim.notify("Buffer " .. selection.bufnr .. " deleted", vim.log.levels.INFO)
				end)
				map("i", "<C-j>", actions.preview_scrolling_down)
				map("i", "<C-k>", actions.preview_scrolling_up)
				return true
			end,
			layout_strategy = "horizontal",
			layout_config = {
				preview_width = 0.6,
			},
		})
		:find()
end

return M
