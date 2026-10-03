-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.PreviewInfo.PreviewPolicy
-- Decompile time: 0.27 ms

local EvolutionLock = require(script.Parent.Parent.EvolutionLock)
return {
    hasLevelPreview = function(a1, a2) -- Line: 7 -- upvalues: EvolutionLock (val) -- types: a2: boolean
        local v1 = true
        if a1.type ~= "tower" then
            v1 = a1.type == "skin"
        end
        return v1 and (not a2 or EvolutionLock.canPurchaseWithGamepass(a1, a1.gamepassId))
    end,
}