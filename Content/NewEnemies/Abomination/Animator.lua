-- Script path: ReplicatedStorage.Content.NewEnemies.Abomination.Animator
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val), TweenService (val)
    a1.Executables = {
        Revive = function() -- Line: 14 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2
            Animation.new({
                Track = a1.Model.Animations.Revive,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Revive:Play()
            a1:Delay(2.3)
            a1.Model.Head.Blood:Play()
            a1.Model.Head.Bits:Emit(40)
            a1.Model.Head.Effect.Blood.Enabled = true
            a1.Model.Head1.Transparency = 1
            a1.Model.Spot.Transparency = 0
            a1:Delay(0.5)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if not v:IsA("ParticleEmitter") then
                    if v:IsA("BasePart") and v.Name == "Vein" then
                        v1 = TweenService
                        v2 = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                        v1:Create(v, v2, {Transparency = 0}):Play()
                    end
                elseif v.Name == "Rage" then
                    v.Enabled = true
                elseif v:IsA("BasePart") and v.Name == "Vein" then
                    v1 = TweenService
                    v2 = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v1:Create(v, v2, {Transparency = 0}):Play()
                end
            end
            a1.Name = "Reanimated"
        end,
    }
end

return v1