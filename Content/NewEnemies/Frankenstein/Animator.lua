-- Script path: ReplicatedStorage.Content.NewEnemies.Frankenstein.Animator
-- Decompile time: 1.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), LightningBolt (val), Shaker (val), EmitterManager (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1.deathAnim = Animation.new({
        IgnorePriority = true,
        Target = AnimationController,
        Track = Animations:WaitForChild("Death"),
    })
    a1.reviveAnim = Animation.new({
        IgnorePriority = true,
        Target = AnimationController,
        Track = Animations:WaitForChild("Revive"),
    })

    function a1.ShockParticles(a1_2) -- Line: 30 -- upvalues: a1 (val) -- types: a1_2: boolean
        local Torso = a1.Model:FindFirstChild("Torso")
        if Torso then
            for k, v in pairs(Torso:GetChildren()) do
                if v:IsA("ParticleEmitter") and v.Name == "Lightning" then
                    v.Enabled = a1_2
                end
            end
        end
    end

    a1.Executables = {
        Death = function() -- Line: 42 -- upvalues: a1 (val)
            a1.WalkTrack:Stop()
            a1.deathAnim:Play()
            a1.ShockParticles(false)
        end,
        Revive = function(a1_2) -- Line: 48 -- upvalues: a1 (val), LightningBolt (upval), Shaker (upval), EmitterManager (upval)
            local HumanoidRootPart = a1.Model:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                local v1 = {}
                local v2 = {}
                v1.WorldPosition = a1.Model.PrimaryPart.Position + Vector3.new(0, 20, 0)
                v1.WorldAxis = Vector3.new(0, 0, 1)
                v1.WorldPosition = a1.Model.PrimaryPart.Position + Vector3.new(0, 20, 0)
                v1.WorldAxis = Vector3.new(0, 0, 1)
                v2.WorldPosition = HumanoidRootPart.Node.WorldCFrame.Position
                v2.WorldAxis = Vector3.new(0, 0, 1)
                local v3 = LightningBolt.new(v1, v2, 14)
                v3.Color = Color3.new(0.25098039215686274, 1, 0.8)
                v3.PulseSpeed = 20
                v3.Frequency = 2
                v3.AnimationSpeed = 20
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
                a1:Delay(a1_2)
                v3:DestroyDissipate()
                EmitterManager.Emit("EnergyExplosion", HumanoidRootPart.Node.WorldCFrame, 2)
                a1.Name = "Revived Frank"
                a1.deathAnim:Stop()
                ;(a1.reviveAnim:Play()).Ended:Connect(function() -- Line: 77 -- upvalues: a1 (upval)
                    a1.WalkTrack:Play()
                    a1.ShockParticles(true)
                end)
            end
        end,
    }
end

return v1