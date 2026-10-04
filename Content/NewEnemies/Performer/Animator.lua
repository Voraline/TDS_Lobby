-- Script path: ReplicatedStorage.Content.NewEnemies.Performer.Animator
-- Decompile time: 1.54 ms

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
            local u20 = {}
            u20.startPosition = a1.Model.HumanoidRootPart.Position
            u20.endPosition = a1_2
            for i, j in a1.Stats.ProjectileData do
                u20[i] = j
            end
            ;(ItemDrop.Drop(u20.startPosition, u20.endPosition, a1.Model, u20.dtMultiplier, u20.gravity, u20.velocity, function(a1, a2, a3) -- Line: 47
                return CFrame.new(a2).Rotation
            end)):andThen(function() -- Line: 53 -- upvalues: EmitterManager (upval), u20 (val), a1 (upval)
                EmitterManager.Emit("PerformerExplosion", CFrame.new(u20.endPosition), a1.Stats.ExplosionRange)
                a1.Model.Parent = nil
            end)
        end,
    }
end

return v1