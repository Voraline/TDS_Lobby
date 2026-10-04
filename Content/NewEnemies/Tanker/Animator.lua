-- Script path: ReplicatedStorage.Content.NewEnemies.Tanker.Animator
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: Animation (val), ReplicatedStorage (val), spr (val), TimescaleUtilities (val), EmitterManager (val)
    a1._deathAnimation = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations:WaitForChild("Death"),
        Target = a1.Model.AnimationController.Animator,
    })
    a1.Executables = {
        Death = function() -- Line: 21 -- upvalues: a1 (val)
            a1._deathAnimation:Play()
        end,
        Gas = function(a1_2, a2) -- Line: 25
            -- upvalues: ReplicatedStorage (upval), a1 (val), spr (upval), TimescaleUtilities (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Particles.TankerSmoke:Clone()
            u9:PivotTo(a1.Model.HumanoidRootPart.CFrame * (CFrame.new(0, -a1.Height, 0)))
            u9.Parent = workspace
            spr.target(u9, 1, 0.25, {Scale = a1_2})
            TimescaleUtilities.Delay(a2, function() -- Line: 31 -- upvalues: u9 (val)
                for i, v in ipairs(u9:GetDescendants()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                end
            end)
            TimescaleUtilities.CleanUp(u9, a2 + 5)
        end,
        Explode = function(a1_2) -- Line: 41
            -- upvalues: ReplicatedStorage (upval), a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            local v1 = ReplicatedStorage.Assets.Effects.Particles.BoomerBile:Clone()
            v1:PivotTo(a1.Model.HumanoidRootPart.CFrame)
            v1:ScaleTo(a1_2)
            v1.Parent = workspace
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 5)
        end,
    }
end

return v1