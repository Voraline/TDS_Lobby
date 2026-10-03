-- Script path: ReplicatedStorage.Content.Enemies.Yeti.Animator
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
    local u1 = true
    a1.Executables = {
        Slash = function() -- Line: 14
            -- upvalues: u1 (ref), Animation (upval), a1 (val), ReplicatedStorage (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local v1
            if not u1 then
                Animation.new({
                    Track = a1.Model.Animations.LClaw,
                    Target = a1.Model.AnimationController,
                }):Play()
                v1 = -1
            else
                Animation.new({
                    Track = a1.Model.Animations.RClaw,
                    Target = a1.Model.AnimationController,
                }):Play()
                v1 = 1
            end
            a1:Delay(0.1)
            a1.Model.Head.Slash:Play()
            local u49 = ReplicatedStorage.Effects.SlashTrail:Clone()
            u49.CFrame = a1.Model.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4) * CFrame.Angles(0, math.rad(v1 * -90), (math.rad(v1 * 35)))
            u49.Parent = a1.Model
            local v2 = u49.CFrame * CFrame.Angles(0, math.rad(v1 * 180), 0)
            TweenService:Create(u49, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {CFrame = v2}):Play()
            TimescaleUtilities.Delay(0.525, function() -- Line: 45 -- upvalues: u49 (val)
                u49:Destroy()
            end)
            u1 = not u1
        end,
    }
end

return v1