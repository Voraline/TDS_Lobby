-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.substr
-- Decompile time: 0.15 ms

return function(a1, a2, a3) -- Line: 1 -- types: a1: string, a2: number, a3: number?
    if a3 and a3 <= 0 then
        return ""
    end
    return (string.sub(a1, a2, a3 and a2 + a3 - 1 or nil))
end