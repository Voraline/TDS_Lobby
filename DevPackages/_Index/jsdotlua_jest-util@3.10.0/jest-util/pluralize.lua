-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util.pluralize
-- Decompile time: 0.30 ms

return {
    default = function(a1, a2) -- Line: 12 -- types: a1: string, a2: number
        return ("%s %s%s"):format(tostring(a2), a1, if a2 ~= 1 then "s" else "")
    end,
}