-- Script path: ReplicatedStorage.Content.Unit.Ivy.Animator
-- Decompile time: 1.89 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

local function stepProjectile(a1) -- Line: 14
    local alpha = a1.alpha
    local start = a1.start
    local goal = a1.goal
    local Magnitude = (start - goal).Magnitude
    local v1 = start:Lerp(goal, alpha)
    local v2 = alpha * 3.141592653589793
    local v3 = v1 + Vector3.new(0, 1, 0) * (math.sin(v2) * Magnitude / 2)
    return CFrame.lookAlong(v3, v3 - a1.lastCFrame.Position)
end

local function projOnFinish(a1) -- Line: 28 -- upvalues: EmitterManager (val), EasySound (val), Debris (val)
    local goal = a1.goal
    EmitterManager.Emit(("Ivy%*Explosion"):format(if not a1.isMax then "Base" else "Max"), CFrame.new(goal), a1.radius)
    EasySound.Play({destroyOnEnd = true, soundGroupName = "Towers", id = a1.soundId, position = goal})
    Debris:AddItem(a1.part, 1.5)
end

function v1.Initialize(a1) -- Line: 41
    -- upvalues: Animation (val), EmitterManager (val), ReplicatedStorage (val), CustomProjectile (val)
    -- upvalues: stepProjectile (val), projOnFinish (val)
    local v1
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({IgnorePriority = true, Preload = true, Target = AnimationController, Track = j})
        a1._animations[j.Name] = v1
    end
    a1._animations.Idle:Play()
    a1.Executables = {
        Fire = function(a1_2, a2, a3) -- Line: 59
            -- upvalues: a1 (val), EmitterManager (upval), ReplicatedStorage (upval), CustomProjectile (upval)
            -- upvalues: stepProjectile (upval), projOnFinish (upval)
            local v1
            local PrimaryPart = a1.Model.PrimaryPart
            local Start = PrimaryPart.Start
            local WorldPosition = Start.WorldPosition
            local v2 = ("Ivy%*Projectile"):format(if not (3 <= (a1.Replicator:Get("Upgrade"))) then "Base" else "Max")
            a1._animations.Fire:Play()
            a1:Wait(0.5)
            if not a1:IsAlive() then
                return
            end
            PrimaryPart.Fire:Play()
            EmitterManager.manualEmit(Start.Fire)
            local v3 = ReplicatedStorage.Assets.Effects.Projectile.Biologist[v2]:Clone()
            v3.Position = WorldPosition
            v3.Parent = workspace.CurrentCamera
            CustomProjectile:ThrowProjectile(WorldPosition, a1_2, a2, v3, stepProjectile, projOnFinish, {
                isMax = v1,
                radius = a3,
                skin = a1.Model.Name,
                soundId = PrimaryPart.Explode.SoundId,
            })
        end,
    }
end

return v1