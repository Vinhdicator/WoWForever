std = "lua51"

-- WoW injects its API (frames, functions, SavedVariables) as globals at
-- runtime. std=lua51 already permits global access, so we don't enumerate
-- the WoW API here. This config catches real problems: syntax errors,
-- unused locals/variables, shadowing, and redefined locals.

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
