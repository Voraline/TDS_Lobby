-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings
-- Decompile time: 1.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local __subscribeToBinding = React.__subscribeToBinding
local useEffect = React.useEffect
return function(a1, a2, a3) -- Line: 11
    -- upvalues: useEffect (val), __subscribeToBinding (val), table (val)
    local v1 = {unpack(a2), (unpack(a3 or {}))}
    useEffect(function() -- Line: 12 -- upvalues: a2 (val), __subscribeToBinding (upval), a1 (val), table (upval)
        local u0 = {}
        local u1 = {}
        local u2 = true
        for i, j in a2 do
            u1[i] = (j:getValue())
        end
        for k, n in a2 do
            u0[k] = (__subscribeToBinding(n, function(a1_2) -- Line: 25 -- upvalues: u2 (ref), u1 (val), k (val), a1 (upval)
                if not u2 then
                    warn("Binding updated after unmount")
                    return
                end
                local v1 = u1[k]
                u1[k] = a1_2
                if v1 ~= a1_2 or typeof(a1_2) == "table" then
                    a1(unpack(u1))
                end
            end))
        end
        a1(unpack(u1))
        return function() -- Line: 42 -- upvalues: u0 (val), u2 (ref), table (upval), u1 (val)
            for i, j in u0 do
                j()
            end
            u2 = false
            table.clear(u0)
            table.clear(u1)
        end
    end, v1)
end