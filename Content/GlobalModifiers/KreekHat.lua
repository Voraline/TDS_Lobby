-- Script path: ReplicatedStorage.Content.GlobalModifiers.KreekHat
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Kreek Hat",
    description = "Every new enemy wears a Kreek.",
    onEnableClient = function(a1, a2, a3) -- Line: 10 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 15 -- upvalues: ReplicatedStorage (upval)
            if not a2 then
                return nil
            end
            local Kreek = ReplicatedStorage.Assets.Effects.Misc:FindFirstChild("Kreek")
            if Kreek then
                a2:EquipHat(Kreek, true)
            end
            return a2
        end))
    end,
}