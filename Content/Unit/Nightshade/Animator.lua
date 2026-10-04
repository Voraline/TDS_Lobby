-- Script path: ReplicatedStorage.Content.Unit.Nightshade.Animator
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

local function bulletOnStep(a1) -- Line: 12
    local v1 = a1.start:Lerp(a1.goal, a1.alpha)
    return CFrame.lookAlong(v1, v1 - a1.lastCFrame.Position)
end

local function bulletOnFinish(a1) -- Line: 20 -- upvalues: EmitterManager (val)
    a1.part:Destroy()
    EmitterManager.Emit("NightshadeHit", CFrame.new(a1.goal))
end

function v1.Initialize(a1) -- Line: 25 -- upvalues: Animation (val)
    local v1
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({IgnorePriority = true, Preload = true, Target = AnimationController, Track = j})
        a1._animations[j.Name] = v1
    end
    a1._animations.Idle:Play()
    a1:Thread(function() -- Line: 42 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:_fireAt(v1)
        end
    end)
end

function v1._bullet(a1, a2, a3) -- Line: 50
    -- upvalues: ReplicatedStorage (val), CustomProjectile (val), bulletOnStep (val), bulletOnFinish (val)
    local v1 = (a3 - a2).Magnitude / 70
    local v2 = ReplicatedStorage.Assets.Effects.Projectile.Biologist.NightshadeBullet:Clone()
    v2.Parent = workspace.CurrentCamera
    CustomProjectile:ThrowProjectile(a2, a3, v1, v2, bulletOnStep, bulletOnFinish)
end

function v1:_fireAt(a2) -- Line: 66 -- upvalues: EmitterManager (val)
    local Position = a2.PrimaryPart.Position
    local Start = self.Model.Nightshade.DEF_STEM_1.DEF_STEM_3.DEF_STEM_5.DEF_STEM_6.DEF_STEM_7.DEF_PISTIL.Start
    local WorldPosition = Start.WorldPosition
    self:Face(Position)
    EmitterManager.manualEmit(Start.Fire)
    self:_bullet(WorldPosition, Position)
    self._animations.Fire:Play()
    self.Model.PrimaryPart.Fire:Play()
    self:Wait((self.Replicator:Get("Cooldown")))
end

return v1