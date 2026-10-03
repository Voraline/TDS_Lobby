-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.EvolutionLock
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
return {
    getLockedMessage = function(a1, a2) -- Line: 9 -- types: a2: string
        if a1 and type(a1.unlockRequirement) == "string" then
            return (("Beat \"%*\" to buy this tower."):format(a1.unlockRequirement))
        end
        if a1 and type(a1.evolvesFrom) == "string" and type(a1.evolutionLevel) == "number" then
            return (("Reach %* Level %* to unlock %*."):format(a1.evolvesFrom, a1.evolutionLevel, a2))
        end
        if a1 and type(a1.lockedMessage) == "string" and a1.lockedMessage ~= "" then
            return a1.lockedMessage
        end
        if a1 and type(a1.description) == "string" and a1.description ~= "" then
            return a1.description
        end
        return (("%* is currently locked."):format(a2))
    end,
    canPurchaseWithGamepass = function(a1, a2) -- Line: 29 -- types: a2: number?
        local v1 = false
        if a1 ~= nil then
            v1 = false
            if a1.type == "tower" then
                v1 = false
                if a1.evolutionLevel == nil then
                    v1 = type(a2) == "number"
                end
            end
        end
        return v1
    end,
    isLocked = function(a1, a2, a3) -- Line: 36 -- upvalues: TowerExpUtil (val) -- types: a3: table
        if a1 and a1.locked == true then
            if a1.type == "tower" and type(a1.evolvesFrom) == "string" and type(a1.evolutionLevel) == "number" then
                local towers = a2 and a2.towers
                if towers and towers[a1.evolvesFrom] then
                    return (TowerExpUtil.getLevel({TowerExp = a3}, a1.evolvesFrom)) < a1.evolutionLevel
                end
                return true
            end
            return true
        end
        return false
    end,
}