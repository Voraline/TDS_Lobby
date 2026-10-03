-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradeActionSelector
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
return {
    select = function(a1) -- Line: 7
        return {
            units = a1.units,
            globalOptionsCoolDown = a1.globalOptionsCoolDown,
            globalOptionsStart = a1.globalOptionsStart,
        }
    end,
    isEqual = function(a1, a2) -- Line: 15 -- upvalues: table (val)
        if a1.globalOptionsCoolDown ~= a2.globalOptionsCoolDown or a1.globalOptionsStart ~= a2.globalOptionsStart then
            return false
        end
        if a1.units ~= a2.units and not table.deepCompare(a1.units, a2.units) then
            return false
        end
        return true
    end,
}