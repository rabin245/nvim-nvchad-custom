---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- For a more complex keymap
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },

    -- donot forget to put this in
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- linting with nvim-lint
    ["<leader>lm"] = {
      function()
        require("lint").try_lint()
      end,
      "Trigger linting for current file",
    },

    -- git stage for nvim-tree
    ["<leader>ga"] = {
      function()
        local api = require "nvim-tree.api"
        local node = api.tree.get_node_under_cursor()
        local gs = node.git_status.file

        -- If the current node is a directory get children status
        if gs == nil then
          gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
            or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
        end

        -- If the file is untracked, unstaged or partially staged, we stage it
        if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
          vim.cmd("silent !git add " .. node.absolute_path)

          -- If the file is staged, we unstage
        elseif gs == "M " or gs == "A " then
          vim.cmd("silent !git restore --staged " .. node.absolute_path)
        end

        api.tree.reload()
      end,
      "git add",
    },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M

-- vim.keymap.set("n", "ga", git_add, opts "Git Add")
