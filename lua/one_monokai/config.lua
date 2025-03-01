local config = {}

config.options = {
    ---automatically set colorscheme on setup
    use_cmd = false,
    ---enable transparent background
    transparent = false,
    ---@type table<string, string> #custom colors
    colors = {},
    ---custom highlighting groups
    ---@param _ table<string, string>|nil #colors table
    ---@return table #list of configured highlighting groups
    themes = function(_)
        return {}
    end,
}

---Extend default with user config
function config:extend(user_config)
    if not user_config or vim.tbl_isempty(user_config) then
        return
    end

    self.options = vim.tbl_deep_extend("force", self.options, user_config)
end

return setmetatable(config, {
    __index = function(table, key)
        return table.options[key]
    end,
})
