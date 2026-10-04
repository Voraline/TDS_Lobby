-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useNetworkEvent
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1, a2, a3) -- Line: 6 -- upvalues: React (val), Network (val) -- types: a1: string, a2: string, a3: function
    local v1 = {a1, a2, a3}
    React.useEffect(function() -- Line: 7 -- upvalues: Network (upval), a1 (val), a2 (val), a3 (val)
        return (Network.Channel(a1)):On(a2, a3)
    end, v1)
end