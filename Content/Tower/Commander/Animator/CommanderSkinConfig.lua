-- Script path: ReplicatedStorage.Content.Tower.Commander.Animator.CommanderSkinConfig
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {
    Overrides = {
        Bullet = {
            Aqua = function(a1, a2, a3) -- Line: 11
                -- upvalues: TweenService (val), TimescaleUtilities (val)
                local u7 = a1.Model.Bullet:Clone()
                local u10 = (a2 - a3).Magnitude * 0.015
                u7.Front.Beam.Enabled = true
                u7.CFrame = (CFrame.new(a2, a3)) * CFrame.Angles(0, 0, 3.141592653589793)
                TweenService:Create(u7.Front, TweenInfo.new(0.025, Enum.EasingStyle.Linear), {WorldPosition = a3}):Play()
                TimescaleUtilities.Delay(0.025, function() -- Line: 22 -- upvalues: TweenService (upval), u7 (val), u10 (val), a3 (val)
                    TweenService:Create(u7.Back, TweenInfo.new(u10, Enum.EasingStyle.Linear), {WorldPosition = a3}):Play()
                end)
                TimescaleUtilities.CleanUp(u7, 0.025 + u10 * 2)
                u7.Parent = workspace.Trash
            end,
            Wonderland = function(a1, a2, a3) -- Line: 32
                -- upvalues: TweenService (val), TimescaleUtilities (val)
                local u5 = (a2 - a3).Magnitude / 100
                local u10 = a1.Model.Bullet:Clone()
                u10.Parent = workspace.Trash
                u10.CFrame = CFrame.lookAt(a2, a3)
                u10.Front.Beam.Enabled = true
                TweenService:Create(u10.Front, TweenInfo.new(u5, Enum.EasingStyle.Linear), {WorldPosition = a3}):Play()
                TimescaleUtilities.Delay(0.05, function() -- Line: 47 -- upvalues: TweenService (upval), u10 (val), u5 (val), a3 (val)
                    TweenService:Create(u10.Back, TweenInfo.new(u5, Enum.EasingStyle.Linear), {WorldPosition = a3}):Play()
                end)
                TimescaleUtilities.CleanUp(u10, 0.05 + u5)
            end,
            Referee = function(a1, a2, a3) -- Line: 57 -- upvalues: ItemDrop (val)
                local u7 = a1.Model.RedCard:Clone()
                u7.Size = u7.Size * 1.25
                u7.Transparency = 0
                u7.Parent = workspace.Trash
                u7.Position = a2
                ;(ItemDrop.Drop(a2, a3, u7, 7, -1, 1, function(a1, a2, a3_2) -- Line: 68 -- upvalues: a3 (val)
                    return (CFrame.lookAt(a2, a3)).Rotation * CFrame.Angles(math.rad(a1 * 280), 0, 0)
                end)):andThen(function() -- Line: 71 -- upvalues: u7 (val)
                    u7:Destroy()
                end)
            end,
        },
    },
}
v1.Overrides.Bullet.Werewolf = v1.Overrides.Bullet.Aqua
v1.Overrides.Bullet.Seal = v1.Overrides.Bullet.Wonderland
v1.Effects = {
    Unequip = {
        Patriotic = function(a1) -- Line: 82 -- upvalues: TimescaleUtilities (val)
            TimescaleUtilities.Wait(1)
            a1.Model.PrimaryPart.Nom:Play()
        end,
    },
}
return v1