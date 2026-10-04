-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkCall
-- Decompile time: 1.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local useMemo = React.useMemo
local useCallback = React.useCallback
return function(a1, a2) -- Line: 9
    -- upvalues: useMemo (val), NewNetwork (val), useCallback (val)
    local v1 = {a1}
    local u6 = useMemo(function() -- Line: 10 -- upvalues: NewNetwork (upval), a1 (val)
        return NewNetwork.Channel(a1)
    end, v1)
    return useCallback(function(a1, ...) -- Line: 14 -- upvalues: a2 (val), u6 (val) -- types: a1: string
        if a2 then
            return u6:invokeServer(a1, ...)
        end
        return u6:fireServer(a1, ...)
    end, {a1})
end