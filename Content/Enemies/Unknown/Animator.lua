-- Script path: ReplicatedStorage.Content.Enemies.Unknown.Animator
-- Decompile time: 1.11 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 15
    -- upvalues: ReplicatedStorage (val), Animation (val), TweenService (val), TimescaleUtilities (val)
    a1.Executables = {
        Stomp = function(a1_2, a2) -- Line: 17
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            u9.BrickColor = BrickColor.new("Black")
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.75)
            a1.Model.Head.Stomp:Play()
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 45 -- upvalues: u9 (val)
                u9:Destroy()
            end)
        end,
        Death = function() -- Line: 50 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
    }
end

return v1