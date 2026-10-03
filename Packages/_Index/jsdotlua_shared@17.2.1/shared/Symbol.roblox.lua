-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.Symbol.roblox
-- Decompile time: 0.25 ms

return {
    named = function(a1) -- Line: 30
        assert(type(a1) == "string", "Symbols must be created using a string name!")
        local v1 = newproxy(true)
        local u17 = string.format("Symbol(%s)", a1)
        local v2 = getmetatable(v1)

        function v2.__tostring() -- Line: 37 -- upvalues: u17 (val)
            return u17
        end

        return v1
    end,
}