-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useDelayedCallback
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useBinding = React.useBinding
local useEffect = React.useEffect
local useCallback = React.useCallback
return function(a1, a2, a3) -- Line: 13
    -- upvalues: useBinding (val), useCallback (val), useEffect (val)
    local u5, u6 = useBinding(nil)
    local u10 = useCallback(function() -- Line: 16 -- upvalues: u5 (val)
        local v1 = u5:getValue()
        if v1 then
            task.cancel(v1)
        end
    end, {})
    local v1 = {a1, a2, table.unpack(a3 or {})}
    useEffect(function() -- Line: 24 -- upvalues: u6 (val), a1 (val), a2 (val), u10 (val)
        u6(task.delay(a1, a2))
        return u10
    end, v1)
    return u10
end