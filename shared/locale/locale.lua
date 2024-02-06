_LOCALE = _LOCALE[_CONFIG.locale]

if (not _LOCALE) then
    error(f("Unknown locale: %s"))
end
