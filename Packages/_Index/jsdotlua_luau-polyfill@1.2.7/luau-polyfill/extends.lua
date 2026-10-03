-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.extends
-- Decompile time: 0.63 ms

return function(a1, a2, a3) -- Line: 16
    local u3 = {}
    u3.__index = u3

    function u3.__tostring(a1_2) -- Line: 19 -- upvalues: a1 (val)
        return getmetatable(a1).__tostring(a1_2)
    end

    local v1 = {}

    function u3.new(...) -- Line: 25 -- upvalues: a3 (val), u3 (val)
        local v1 = {}
        a3(v1, ...)
        return (setmetatable(v1, u3))
    end

    if typeof((getmetatable(a1))) == "table" and getmetatable(a1).__call then
        function v1.__call(a1, ...) -- Line: 32 -- upvalues: u3 (val)
            return u3.new(...)
        end
    end
    v1.__index = a1

    function v1.__tostring(a1_2) -- Line: 38 -- upvalues: u3 (val), a2 (val), a1 (val)
        if a1_2 == u3 then
            return (tostring(a2))
        end
        return getmetatable(a1).__tostring(a1_2)
    end

    setmetatable(u3, v1)
    return u3
end