-- Script path: ReplicatedStorage.Content.GlobalModifiers.FlyingEnemies
-- Decompile time: 2.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Flying Enemies",
    description = "All enemies are Flying (after wave 5)",
    icon = 122227082729039,
    rewardMultiplier = 0.15,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 19 -- upvalues: LegacyMiddleware (val), GameState (val), Enum (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 24 -- upvalues: GameState (upval), Enum (upval)
            if not a2 then
                return nil
            end
            if GameState.Wave < 5 then
                return a2
            end
            a2.StatusEffects:apply(Enum.StatusEffect.Flying, "innate")
            return a2
        end))
    end,
    onEnableClient = function(a1, a2, a3) -- Line: 41
        -- upvalues: LegacyMiddleware (val), GameState (val), Enum (val), ReplicatedStorage (val), Animation (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 46 -- upvalues: GameState (upval), Enum (upval), ReplicatedStorage (upval), Animation (upval)
            if not a2 then
                return nil
            end
            if GameState.Wave < 5 then
                return a2
            end
            if a2.Stats.Attributes and table.find(a2.Stats.Attributes, Enum.Modifier.Flying) then
                return a2
            end
            local v1 = a2.Model:GetExtentsSize().Y / 2.8 * a2.Model:GetScale() * 0.8
            local v2 = ReplicatedStorage.Assets.Effects.Misc.EnemyWings:Clone()
            local Torso = a2.Model:FindFirstChild("Torso") or a2.Model.PrimaryPart
            local WeldConstraint = Instance.new("WeldConstraint")
            v2:ScaleTo(v1)
            v2:PivotTo(Torso.CFrame + (Vector3.new(0, 0, Torso.Size.Z / 2)))
            WeldConstraint.Part0 = Torso
            WeldConstraint.Part1 = v2.PrimaryPart
            WeldConstraint.Parent = v2.PrimaryPart
            v2.Parent = a2.Model
            a2.PositionOffset = a2.PositionOffset + Vector3.new(0, 3, 0)
            a2.FlyingAnimation = true
            Animation.new({
                Id = 107337155537008,
                Speed = 0.75,
                Target = v2.AnimationController,
                Properties = {Looped = true},
            }):Play()
            return a2
        end))
    end,
}