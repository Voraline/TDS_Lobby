-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.createSignal.roblox
-- Decompile time: 0.64 ms

return function() -- Line: 36
    local u0 = {}
    local u1 = {}
    local u2 = false
    return function(a1) -- Line: 41 -- upvalues: u2 (ref), u0 (val), u1 (val)
        assert(typeof(a1) == "function", "Can only subscribe to signals with a function.")
        local u10 = {disconnected = false, callback = a1}
        if u2 and not u0[a1] then
            u1[a1] = u10
        end
        u0[a1] = u10
        return function() -- Line: 60 -- upvalues: u10 (val), u0 (upval), a1 (val), u1 (upval)
            assert(not u10.disconnected, "Listeners can only be disconnected once.")
            u10.disconnected = true
            u0[a1] = nil
            u1[a1] = nil
        end
    end, function(...) -- Line: 74 -- upvalues: u2 (ref), u0 (val), u1 (val)
        u2 = true
        for i, j in u0 do
            if not j.disconnected and not u1[i] then
                i(...)
            end
        end
        u2 = false
        table.clear(u1)
    end
end