-- Script path: ReplicatedStorage.Content.NewEnemies.Unstable Ice.Animator
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val), ItemDrop (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1.Executables = {
        Fly = function(a1_2) -- Line: 22 -- upvalues: a1 (val), ItemDrop (upval), EmitterManager (upval)
            local v1 = Vector3.new(a1_2.X, a1.Model.HumanoidRootPart.Position.Y, a1_2.Z)
            a1.Model.HumanoidRootPart.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Position, v1)
            a1._animations.Jump:Play()
            a1:Delay(0.5)
            a1._animations.Fall:Play()
            local u37 = {}
            u37.startPosition = a1.Model.HumanoidRootPart.Position
            u37.endPosition = a1_2
            for i, j in a1.Stats.ProjectileData do
                u37[i] = j
            end
            ;(ItemDrop.Drop(u37.startPosition, u37.endPosition, a1.Model, u37.dtMultiplier, u37.gravity, u37.velocity, function(a1, a2, a3) -- Line: 51
                return CFrame.new(a2).Rotation
            end)):andThen(function() -- Line: 57 -- upvalues: EmitterManager (upval), u37 (val), a1 (upval)
                EmitterManager.Emit("UnstableIceExplosion", CFrame.new(u37.endPosition), a1.Stats.ExplosionRange)
                a1.Model.Parent = nil
            end)
        end,
    }
end

return v1