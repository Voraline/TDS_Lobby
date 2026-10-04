-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useNetworkCall
-- Decompile time: 0.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local useMemo = React.useMemo
local useCallback = React.useCallback
return function(a1, a2) -- Line: 11
    -- upvalues: useMemo (val), Network (val), useCallback (val)
    local v1 = {a1}
    local u6 = useMemo(function() -- Line: 12 -- upvalues: Network (upval), a1 (val)
        return Network.Channel(a1)
    end, v1)
    return (useCallback(function(a1, ...) -- Line: 16 -- upvalues: a2 (val), u6 (val) -- types: a1: string
        if a2 then
            return u6:InvokeServer(a1, ...)
        end
        return u6:FireServer(a1, ...)
    end, {a1}))
end