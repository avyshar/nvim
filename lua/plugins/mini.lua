local minis = {
  -- "ai",
  -- "basics",
  "bufremove",
  -- "files",
  -- "extra",
  -- "completion",
  "comment",
  -- "fuzzy",
  -- "hipatterns",
  -- "jump",
  -- "jump2d",
  -- "move",
  -- "notify",
  -- "operators",
  -- "pairs",
  -- "pick",
  -- "sessions",
  "statusline",
  -- "surround",
  "tabline",
  -- "visits"
}

local mini_plugins = {
  "echasnovski/mini.nvim",
}

for i = 1, #minis do
  table.insert(mini_plugins, {
    "echasnovski/mini." .. minis[i],
    version = false,
    config = function()
      require("mini." .. minis[i]).setup()
    end
  })
end

return mini_plugins
