-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Hooks.useBindings
-- Decompile time: 0.96 ms

local React = require(script.Parent.Parent.React)
local useEffect = React.useEffect
local __subscribeToBinding = React.__subscribeToBinding
return function(a1, a2, a3) -- Line: 6
    -- upvalues: useEffect (val), __subscribeToBinding (val)
    local v1 = {unpack(a2), (unpack(a3 or {}))}
    useEffect(function() -- Line: 7 -- upvalues: a2 (val), __subscribeToBinding (upval), a1 (val)
        local u0 = {}
        local u1 = {}
        local u2 = true
        for i, j in a2 do
            u1[i] = (j:getValue())
        end
        for k, n in a2 do
            u0[k] = (__subscribeToBinding(n, function(a1_2) -- Line: 20 -- upvalues: u2 (ref), u1 (val), k (val), a1 (upval)
                if not u2 then
                    warn("Binding updated after unmount")
                    return
                end
                if typeof(a1_2) ~= "table" and u1[k] == a1_2 then
                    return
                end
                u1[k] = a1_2
                a1(unpack(u1))
            end))
        end
        a1(unpack(u1))
        return function() -- Line: 37 -- upvalues: u0 (val), u2 (ref), u1 (val)
            for i, j in u0 do
                j()
            end
            u2 = false
            table.clear(u0)
            table.clear(u1)
        end
    end, v1)
end