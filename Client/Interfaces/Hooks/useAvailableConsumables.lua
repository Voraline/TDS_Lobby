-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAvailableConsumables
-- Decompile time: 0.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useCache = require(Hooks.useCache)
local useConsumables = require(Hooks.useConsumables)
local useMemo = React.useMemo
return function(a1, a2) -- Line: 23
    -- upvalues: useConsumables (val), useCache (val), useMemo (val), Sift (val), Enum (val)
    local u3 = a1 == true
    local u5 = useConsumables()
    local u11 = useCache("Inventory.Consumables", {}, a2)
    return (useMemo(function() -- Line: 29 -- upvalues: Sift (upval), u5 (val), u11 (val), Enum (upval), u3 (val)
        return Sift.Dictionary.map(u5, function(a1, a2) -- Line: 30 -- upvalues: u11 (upval), Enum (upval), u3 (upval), Sift (upval)
            local v1 = u11[a2] or 0
            if v1 < 1 and a1.Rarity == Enum.ConsumableRarity.Exclusive then
                return nil
            end
            if u3 and a1.PVP ~= true then
                return nil
            end
            if not u3 and a1.PVP then
                return nil
            end
            return Sift.Dictionary.join(a1, {owned = v1})
        end)
    end, {u11, u5, u3}))
end