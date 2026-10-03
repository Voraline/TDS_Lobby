-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePropertyValue
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
return function(a1, a2) -- Line: 8 -- upvalues: React (val), useEffect (val) -- types: a1: userdata, a2: string
    local v1, u9 = React.useState(if not a1 then nil else a1[a2])
    local v2 = {a1, a2}
    useEffect(function() -- Line: 11 -- upvalues: a1 (val), a2 (val), u9 (val)
        if not a1 then
            return
        end
        local u9_2 = (a1:GetPropertyChangedSignal(a2)):Connect(function() -- Line: 16 -- upvalues: u9 (upval), a1 (upval), a2 (upval)
            u9(a1[a2])
        end)
        return function() -- Line: 20 -- upvalues: u9_2 (val)
            u9_2:Disconnect()
        end
    end, v2)
    return v1
end