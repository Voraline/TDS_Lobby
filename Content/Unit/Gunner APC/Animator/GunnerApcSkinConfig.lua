-- Script path: ReplicatedStorage.Content.Unit.Gunner APC.Animator.GunnerApcSkinConfig
-- Decompile time: 0.96 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
return {
    Overrides = {
        Bullet = {
            Wonderland = function(a1, a2, a3) -- Line: 14
                -- upvalues: ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
                local u5 = (a2 - a3).Magnitude / 100
                local u13 = ReplicatedStorage.Assets.Effects.Projectile.WonderlandApcBullet:Clone()
                u13.Parent = workspace.Trash
                u13.CFrame = CFrame.lookAt(a2, a3)
                TweenService:Create(u13.Front, TweenInfo.new(u5, Enum.EasingStyle.Linear), {WorldPosition = a3}):Play()
                TimescaleUtilities.Delay(0.05, function() -- Line: 27 -- upvalues: TweenService (upval), u13 (val), u5 (val), a3 (val)
                    TweenService:Create(u13.Back, TweenInfo.new(u5, Enum.EasingStyle.Linear), {WorldPosition = a3}):Play()
                end)
                TimescaleUtilities.CleanUp(u13, 0.05 + u5)
            end,
        },
        DeathExplosion = {
            Wonderland = function(a1) -- Line: 39 -- upvalues: ReplicatedStorage (val), EmitterManager (val), Debris (val)
                local v1 = ReplicatedStorage.Assets.Effects.SingleEmit.WonderlandApcDeath:Clone()
                v1.CFrame = a1.Model.PrimaryPart.Node.WorldCFrame
                v1.Parent = workspace.Trash
                EmitterManager.manualEmit(v1)
                Debris:AddItem(v1, 2)
            end,
        },
    },
    DeathExplosion = {},
}