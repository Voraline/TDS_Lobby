-- Script path: ReplicatedStorage.Content.NewEnemies.Demon.Animator
-- Decompile time: 1.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 18
    -- upvalues: Animation (val), EmitterManager (val), TweenService (val), Shaker (val)
    a1.Executables = {
        Death = function(a1_2) -- Line: 20
            -- upvalues: Animation (upval), a1 (val), EmitterManager (upval), TweenService (upval), Shaker (upval)
            local u11 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u11:Play()
            task.defer(function() -- Line: 28
                -- upvalues: u11 (val), a1 (upval), EmitterManager (upval), a1_2 (val), TweenService (upval)
                -- upvalues: Shaker (upval)
                local v1, v2, v3, v4
                while u11.Controller.Length == 0 do
                    a1:Delay(0.01)
                end
                a1:Delay(u11.Controller.Length * 0.95)
                u11:AdjustSpeed(0)
                local Torso = a1.Model:FindFirstChild("Torso")
                if Torso then
                    EmitterManager.Emit("DemonExplosion", Torso.CFrame, 3)
                end
                a1.Model:BreakJoints()
                local v5 = TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
                for k, v in pairs(a1.Model:GetChildren()) do
                    if v:IsA("MeshPart") and v.Transparency < 1 then
                        v.Anchored = true
                        v.TextureID = ""
                        v.Color = Color3.new(0.09803921568627451, 0.00784313725490196, 0.054901960784313725)
                        v.Material = Enum.Material.Basalt
                        v2 = CFrame.Angles(
                            Random.new():NextNumber(0, 6.283185307179586),
                            Random.new():NextNumber(0, 6.283185307179586),
                            Random.new():NextNumber(0, 6.283185307179586)
                        )
                        v3 = CFrame.new(Random.new():NextNumber(-1, 1), Random.new():NextNumber(-1, 1), Random.new():NextNumber(-1, 1))
                        v4 = TweenService
                        v1 = {Transparency = 1, CFrame = v.CFrame * v2 * v3}
                        v4:Create(v, v5, v1):Play()
                    end
                end
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            end)
        end,
    }
end

return v1