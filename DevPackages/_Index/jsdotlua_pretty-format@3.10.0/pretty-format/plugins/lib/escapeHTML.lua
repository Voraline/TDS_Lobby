-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.lib.escapeHTML
-- Decompile time: 0.12 ms

return {
    default = function(a1) -- Line: 10 -- types: a1: string
        return (a1:gsub("<", "&lt;")):gsub(">", "&gt;")
    end,
}