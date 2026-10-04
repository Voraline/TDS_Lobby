-- Script path: ReplicatedStorage.Content.GlobalModifiers.Mutation
-- Decompile time: 1.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Mutation",
    description = "Mobs will gain more HP per wave after being introduced.",
    icon = 10046408505,
    rewardMultiplier = 0.2,
    onEnableServer = function(a1, a2, a3, a4, a5) -- Line: 13 -- upvalues: LegacyMiddleware (val), GameState (val)
        local u5 = a4 or 0.05
        local u6 = a5 or 0.02
        local u7 = 1
        local u8 = {}
        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 23 -- upvalues: GameState (upval), u7 (ref), u8 (val), u5 (ref), u6 (ref)
            local v1 = tonumber(GameState.Wave)
            if v1 then
                u7 = v1
            else
                v1 = u7
            end
            local Name = a2.Name
            if not u8[Name] then
                u8[Name] = v1
            end
            local v2 = math.round((v1 - u8[Name]) * (a2.MaxHealth * u5 + (GameState.PlayerCount - 1) * u6))
            if not a2.HealthShield then
                a2.HealthShield = 0
                a2.MaxShield = 0
            end
            a2.HealthShield = a2.HealthShield + v2
            a2.MaxShield = a2.MaxShield + v2
            a2.Replicator:Set("Shield", a2.HealthShield)
            a2.Replicator:Set("MaxShield", a2.MaxShield)
            return a2
        end)
    end,
}