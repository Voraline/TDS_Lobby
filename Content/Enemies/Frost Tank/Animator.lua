-- Script path: ReplicatedStorage.Content.Enemies.Frost Tank.Animator
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.Executables = {
        Throw = function(a1_2, a2) -- Line: 14 -- upvalues: Animation (upval), a1 (val)
            (Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()).KeyframeReached:connect(function(a1_2) -- Line: 20 -- upvalues: a1 (upval)
                local Rocks = a1.Model.Rocks
                if a1_2 ~= "Stone Appear" then
                    if a1_2 == "Throw" then
                        for k, v in pairs(Rocks:GetChildren()) do
                            v.Transparency = 1
                        end
                    end
                    return
                end
                for k2, i in pairs(Rocks:GetChildren()) do
                    i.Transparency = 0
                end
                Rocks.Main.Hit:Play()
                a1.Model.HumanoidRootPart.Effect.Dirt.Enabled = true
                a1:Delay(0.5)
                a1.Model.HumanoidRootPart.Effect.Dirt.Enabled = false
            end)
        end,
    }
end

return v1