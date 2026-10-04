-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.escapePatternCharacters
-- Decompile time: 0.21 ms

return {
    escapePatternCharacters = function(a1) -- Line: 1 -- types: a1: string
        return string.gsub(a1, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
    end,
}