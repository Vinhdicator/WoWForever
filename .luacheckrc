std = "lua51"

-- WoW injects its API (frames, functions, SavedVariables) as globals at
-- runtime. The full WoW API surface is provided by wow_api_globals.lua
-- (generated from Ketho/vscode-wow-api) so genuine typos and undefined
-- variables still fail, while real API calls pass.

-- WoW API globals (read-only): GameTooltip, CreateFrame, C_*, etc.
read_globals = dofile("wow_api_globals.lua")

-- WoW addon globals and libraries this project reads AND writes
globals = {
  "NecrosisConfig",
  "DEFAULT_CHAT_FRAMEWORK",
  "SlashCmdList",
  "Necrosis",
  "NecrosisUI",
  "NUI",
}

-- Third-party libraries vendored in libs/ are not linted
exclude_files = {
  "Necrosis/libs/",
}

-- WoW Lua frequently uses long localized strings and legacy patterns
max_line_length = false
ignore = {
  "212/self", -- unused 'self' argument is idiomatic in WoW frame scripts
  "631",      -- line too long (handled by max_line_length = false)
}
