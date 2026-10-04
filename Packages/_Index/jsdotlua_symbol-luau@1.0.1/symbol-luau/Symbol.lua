-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau.Symbol
-- Decompile time: 0.21 ms

return {
    new = function(a1) -- Line: 15 -- types: a1: string?
        local v1 = newproxy(true)
        local u10 = "Symbol()"
        if a1 then
            u10 = ("Symbol(%s)"):format(a1)
        end
        local v2 = getmetatable(v1)

        function v2.__tostring() -- Line: 23 -- upvalues: u10 (ref)
            return u10
        end

        return v1
    end,
}