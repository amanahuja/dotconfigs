
-- Lua configs
-- stored in folder .config/nvim/lua
require("settings")

-- package manager
require("config.lazy")

-- plugins config
require("plugins")

-- custom functions (loading these after plugins)
require("custom.monolith_navigation")

-- key mappings
require("keymaps")

-- color scheme and theme stuff
-- require("theme")
--
--

