-- Script path: ReplicatedStorage.Content.GlobalModifiers.TankyEnemies
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Tanky Enemies",
    description = "All enemies are Tank",
    icon = 120242518964452,
    onEnableServer = function(a1, a2, a3) -- Line: 12 -- upvalues: LegacyMiddleware (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 17 -- upvalues: Enum (upval)
            if not a2 then
                return nil
            end
            a2.StatusEffects:apply(Enum.StatusEffect.Tank, "innate")
            return a2
        end))
    end,
}