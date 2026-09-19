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
  -- Compat.lua intentionally creates/shims these WoW namespaces when the
  -- client version lacks them (classic vs retail), so they are writable here.
  "C_PetBattles",
  "C_Club",
  "C_Calendar",
  "C_Container",
  "C_Timer",
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
  "113",      -- accessing undefined variable: cross-file addon globals (frames,
              -- constants like NECROSIS_ID, AFKS_*) are defined in other files
              -- and wired up by the WoW client at load time; not enumerable here.
  "122",      -- mutating non-standard global: addon sets fields on its own frames.
}
