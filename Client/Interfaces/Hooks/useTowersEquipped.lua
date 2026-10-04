-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowersEquipped
-- Decompile time: 0.53 ms

local Hooks = game:GetService("ReplicatedStorage").Client.Interfaces.Hooks
local useCache = require(Hooks.useCache)
local useGameStateValue = require(Hooks.useGameStateValue)
return function(a1) -- Line: 11 -- upvalues: useGameStateValue (val), useCache (val) -- types: a1: boolean?
    return useCache(
        if a1 then "Equipped.PVPTroops" else if not (useGameStateValue("GameMode", "") == "PVP") then "Equipped.Troops" else "Equipped.PVPTroops",
        {}
    )
end