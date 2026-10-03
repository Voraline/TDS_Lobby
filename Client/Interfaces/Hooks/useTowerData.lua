-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowerData
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local useMemo = React.useMemo
return function(a1) -- Line: 11 -- upvalues: useMemo (val), Troops (val) -- types: a1: string?
    return useMemo(function() -- Line: 12 -- upvalues: a1 (val), Troops (upval)
        if not a1 then
            return nil
        end
        return Troops(a1)
    end, {a1})
end