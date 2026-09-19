std = "lua51+wow"

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
