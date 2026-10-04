-- Script path: ReplicatedStorage.Content.GlobalModifiers.ExplodingEnemies
-- Decompile time: 1.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Exploding Enemies",
    description = "Enemies explode on death",
    icon = 93424071036499,
    rewardMultiplier = 0.1,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 18 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 23 -- upvalues: ReplicatedStorage (upval), Enum (upval)
            if not a2 then
                return nil
            end
            local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
            a2.Destroyed:Connect(function() -- Line: 30 -- upvalues: TeamOctrees (val), a2 (val), Enum (upval)
                local Explosion, Normal
                for i, j in (TeamOctrees.getTargets(a2.Team, a2.Position, 8)) do
                    if j.Type == "Towers" then
                        Normal = Enum.StunType.Normal
                        j:Stun(1, Normal)
                    elseif j.Type == "Units" then
                        Explosion = Enum.DamageType.Explosion
                        j:Damage(20, Explosion)
                    end
                end
            end)
            return a2
        end))
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 49 -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val), EmitterManager (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 54 -- upvalues: ReplicatedStorage (upval), EmitterManager (upval)
            if not a2 then
                return nil
            end
            a2:EquipHat(ReplicatedStorage.Assets.Effects.Misc.PirateHat, true)
            a2.OnDestroy:Connect(function() -- Line: 62 -- upvalues: EmitterManager (upval), a2 (val)
                EmitterManager.Emit("BigExplosion", CFrame.new(a2.LastPosition), 8)
            end)
            return a2
        end))
    end,
}