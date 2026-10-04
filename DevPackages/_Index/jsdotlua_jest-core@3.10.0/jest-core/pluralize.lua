-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.pluralize
-- Decompile time: 0.32 ms

return {
    default = function(a1, a2, a3) -- Line: 10 -- types: a1: string, a2: number, a3: string
        return ("%s %s%s"):format(tostring(a2), a1, if a2 ~= 1 then a3 else "")
    end,
}