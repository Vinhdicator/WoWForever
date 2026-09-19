std = "lua51"

-- WoW API surface: allow all read/write access to unknown globals.
-- WoW injects hundreds of globals (frames, API functions, SavedVariables)
-- at runtime, so we don't enumerate them. This config only catches
-- real problems: syntax errors, unused locals, shadowing, etc.
not_globals = false
read_globals = {}

-- WoW addon globals and libraries this project references
globals = {
  "NecrosisConfig",
  "DEFAULT_CHAT_FRAMEWORK",
  "SlashCmdList",
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
