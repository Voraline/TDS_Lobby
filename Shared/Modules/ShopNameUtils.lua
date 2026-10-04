-- Script path: ReplicatedStorage.Shared.Modules.ShopNameUtils
-- Decompile time: 0.49 ms

local Modules = game:GetService("ReplicatedStorage").Shared.Modules
local Handlers = Modules.Asset.Handlers
local TowerDisplayName = require(Modules.TowerDisplayName)
local Troops = require(Handlers.Troops)
return {
    getTowerDisplayName = function(a1) -- Line: 11 -- upvalues: TowerDisplayName (val)
        if not a1 then
            return ""
        end
        return TowerDisplayName.fromAsset(a1, nil)
    end,
    getTowerSkinDisplayName = function(a1, a2) -- Line: 19 -- upvalues: Troops (val)
        if not a2 then
            return ""
        end
        local v1 = a1 and Troops(a1)
        local Properties = v1 and v1.Properties
        local SkinData = Properties and Properties.SkinData and Properties.SkinData[a2]
        return SkinData and SkinData.DisplayName or a2
    end,
}