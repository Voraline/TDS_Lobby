-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkEvent
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local useMemo = React.useMemo
local useEffect = React.useEffect
return function(a1, a2, a3) -- Line: 9
    -- upvalues: useMemo (val), NewNetwork (val), useEffect (val)
    local v1 = {a1}
    local u7 = useMemo(function() -- Line: 10 -- upvalues: NewNetwork (upval), a1 (val)
        return NewNetwork.Channel(a1)
    end, v1)
    local v2 = {a1, a2, a3}
    useEffect(function() -- Line: 14 -- upvalues: u7 (val), a2 (val), a3 (val)
        return u7:onEvent(a2, a3)
    end, v2)
end