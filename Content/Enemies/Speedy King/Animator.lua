-- Script path: ReplicatedStorage.Content.Enemies.Speedy King.Animator
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: Laser (val), ReplicatedStorage (val), TimescaleUtilities (val), Animation (val)
    a1.Executables = {
        Lightning = function(a1, a2, a3) -- Line: 13 -- upvalues: Laser (upval), ReplicatedStorage (upval), TimescaleUtilities (upval)
            local v1 = {
                Start = a1.Start + a2.HumanoidRootPart.Position,
                Pos = a2.HumanoidRootPart.Position,
                Color = BrickColor.new("Medium blue"),
                Transparency = 0.1,
                Size = 0.3,
                Fade = 2,
                Type = "Fade",
            }
            Laser:Bolt(v1)
            local u29 = ReplicatedStorage.Assets.Effects.Client.ChargedBuff:Clone()
            u29.Parent = a2
            u29.Enabled = true
            TimescaleUtilities.Delay(a3, function() -- Line: 30 -- upvalues: u29 (val)
                u29:Destroy()
            end)
        end,
        Death = function() -- Line: 35 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
    }
end

return v1