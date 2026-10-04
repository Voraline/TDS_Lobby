-- Script path: ReplicatedStorage.Content.GlobalModifiers.PirateHat
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Talk Like a Pirate Day",
    description = "Arrr!",
    icon = 10045192886,
    onEnableClient = function(a1, a2, a3) -- Line: 11 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 16 -- upvalues: ReplicatedStorage (upval)
            if not a2 then
                return nil
            end
            a2:EquipHat(ReplicatedStorage.Assets.Effects.Misc.PirateHat, true)
            return a2
        end))
    end,
}