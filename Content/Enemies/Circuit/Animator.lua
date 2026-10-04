-- Script path: ReplicatedStorage.Content.Enemies.Circuit.Animator
-- Decompile time: 0.67 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 14 -- upvalues: Laser (val), ReplicatedStorage (val), TimescaleUtilities (val)
    a1.Executables = {
        Lightning = function(a1_2, a2, a3) -- Line: 16
            -- upvalues: a1 (val), Laser (upval), ReplicatedStorage (upval), TimescaleUtilities (upval)
            if a1.Model.Head.Strike.IsPlaying == false then
                a1.Model.Head.Strike:Play()
            end
            local v1 = {
                Start = a1_2.Start + a2.HumanoidRootPart.Position,
                Pos = a2.HumanoidRootPart.Position,
                Color = BrickColor.new("Medium blue"),
                Transparency = 0.1,
                Size = 0.3,
                Fade = 2,
                Type = "Fade",
            }
            Laser:Bolt(v1)
            local u43 = ReplicatedStorage.Assets.Effects.Client.ChargedBuff:Clone()
            u43.Parent = a2
            u43.Enabled = true
            TimescaleUtilities.Delay(a3, function() -- Line: 37 -- upvalues: u43 (val)
                u43.Enabled = false
            end)
        end,
    }
end

return v1