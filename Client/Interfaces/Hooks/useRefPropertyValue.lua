-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useRefPropertyValue
-- Decompile time: 1.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1, a2, a3) -- Line: 5 -- upvalues: React (val) -- types: a2: string
    local v1, u14 = React.useState(a1.current and a1.current[a2] or a3)
    local useEffect = React.useEffect
    local v2 = {a1.current, a2}
    useEffect(function() -- Line: 13 -- upvalues: a1 (val), a2 (val), u14 (val)
        local current = a1.current
        local u11 = nil
        if current then
            u11 = (current:GetPropertyChangedSignal(a2)):Connect(function() -- Line: 18 -- upvalues: u14 (upval), current (val), a2 (upval)
                u14(current[a2])
            end)
            u14(current[a2])
        end
        return function() -- Line: 24 -- upvalues: u11 (ref)
            if u11 then
                u11:Disconnect()
            end
        end
    end, v2)
    return v1
end