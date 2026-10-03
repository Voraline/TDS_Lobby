-- Script path: ReplicatedStorage.Content.Enemies.Creator.Animator
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val), Laser (val)
    a1.Executables = {
        SpawnTroops = function(a1_2, a2) -- Line: 15 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Spawn,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Hand.Trail.Enabled = true
            a1:Delay(2)
            a1.Model.Hand.Trail.Enabled = false
        end,
        Angry = function() -- Line: 25 -- upvalues: a1 (val)
            a1.Model.Head.Angry:Play()
        end,
        Stomp = function(a1_2, a2) -- Line: 29
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            a1.Model.Head.Scream:Play()
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.8)
            a1.Model.Head.Stomp:Play()
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(u9, TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = v1}):Play()
            TweenService:Create(u9, TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 61 -- upvalues: u9 (val)
                u9:Destroy()
            end)
        end,
        Lightning = function(a1) -- Line: 66 -- upvalues: Laser (upval), TimescaleUtilities (upval)
            local v1 = {
                Start = a1.Start,
                Pos = a1.Position,
                Color = BrickColor.new("Royal purple"),
                Transparency = 0.1,
                Size = 0.3,
                Fade = 2,
                Type = "Fade",
            }
            Laser:Bolt(v1)
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://821439273"
            Sound.Parent = a1.Head
            Sound.Volume = 1
            Sound:Play()
            TimescaleUtilities.Delay(5, function() -- Line: 85 -- upvalues: Sound (val)
                Sound:Destroy()
            end)
        end,
        Scream = function(a1_2) -- Line: 90 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Scream,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Yell:Play()
        end,
        Spin = function() end,
    }
end

return v1