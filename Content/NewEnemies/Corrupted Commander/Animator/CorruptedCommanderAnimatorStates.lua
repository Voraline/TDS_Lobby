-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Commander.Animator.CorruptedCommanderAnimatorStates
-- Decompile time: 2.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local CorruptedCommander = ReplicatedStorage.Assets.Effects.Mob.CorruptedCommander
local v1 = {
    name = "FireWeapon",
    onEnter = function(a1, a2) -- Line: 16
        -- upvalues: CorruptedCommander (val), TweenService (val), TimescaleUtilities (val), EmitterManager (val)
        local v1 = a1:animate("Fire")
        local u6 = 1
        if a2 and a2[u6] then
            a1:Face(a2[u6], TweenInfo.new(0.5), true)
        end
        local v2 = (v1:GetMarkerReachedSignal("Shoot")):Connect(function() -- Line: 25
            -- upvalues: u6 (ref), a2 (val), a1 (val), CorruptedCommander (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), EmitterManager (upval)
            u6 = u6 + 1
            if a2 and a2[u6] then
                a1:Face(a2[u6], TweenInfo.new(0.1), true)
            end
            local u21 = CorruptedCommander.Bullet:Clone()
            u21.Parent = workspace
            if not a2 or not a2[u6 - 1] then
                u21.CFrame = a1.Model.MuzzleFlash.Value.WorldCFrame
                local u99 = a1.Model.MuzzleFlash.Value.WorldPosition + a1.Model.MuzzleFlash.Value.WorldCFrame.LookVector * 50
                TweenService:Create(
                    u21["1"],
                    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {WorldPosition = u99}
                ):Play()
                TimescaleUtilities.Delay(0.15, function() -- Line: 84 -- upvalues: TweenService (upval), u21 (val), u99 (val)
                    TweenService:Create(
                        u21["2"],
                        TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {WorldPosition = u99}
                    ):Play()
                end)
                TimescaleUtilities.CleanUp(u21, 1.35)
            else
                u21.CFrame = CFrame.new(a1.Model.MuzzleFlash.Value.WorldPosition, a2[u6 - 1])
                local v1 = (a1.Model.MuzzleFlash.Value.WorldPosition - a2[u6 - 1]).Magnitude / 40
                local u56 = a2[u6 - 1] + Vector3.new(0, 1, 0)
                TweenService:Create(
                    u21["1"],
                    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {WorldPosition = u56}
                ):Play()
                TimescaleUtilities.Delay(0.15, function() -- Line: 51 -- upvalues: TweenService (upval), u21 (val), u56 (val)
                    TweenService:Create(
                        u21["2"],
                        TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {WorldPosition = u56}
                    ):Play()
                end)
                TimescaleUtilities.CleanUp(u21, v1 + 0.1)
            end
            TweenService:Create(u21.PointLight, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {Brightness = 0}):Play()
            EmitterManager.manualEmit(a1.Model.MuzzleFlash.Value)
            a1:playSound("Shoot")
        end)
        a1:Delay(v1.Length)
        v2:Disconnect()
    end,
}
local v2 = {
    name = "SummonAPCs",
    onEnter = function(a1) -- Line: 120 -- upvalues: EmitterManager (val)
        a1:animate("CallToArms")
        EmitterManager.manualEmit(a1.Model.RadioEffect.Value)
        a1:playSound("SummonAPCs")
    end,
}
local v3 = {
    name = "CallToWar",
    onEnter = function(a1) -- Line: 129 -- upvalues: CorruptedCommander (val), EmitterManager (val), TimescaleUtilities (val)
        a1:animate("WarCry")
        local v1 = CorruptedCommander.Scream:Clone()
        v1.Position = a1.Model.PrimaryPart.Node.WorldPosition + Vector3.new(0, 0.20000000298023224, 0)
        v1.Parent = a1.Model.PrimaryPart
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 5)
        a1:playSound("CallToWar")
    end,
}
local v4 = {
    name = "Death",
    onEnter = function(a1) -- Line: 143 -- upvalues: CorruptedCommander (val), EmitterManager (val), TimescaleUtilities (val)
        a1:animate("Death")
        a1:playSound("Death")
        a1:Delay(5)
        local v1 = CorruptedCommander.DeathEffect:Clone()
        v1.Position = a1.Model.PrimaryPart.Node.WorldPosition + Vector3.new(0, 0.20000000298023224, 0)
        v1.Parent = workspace
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 5)
        a1:Delay(0.02)
    end,
}
return {
    v1,
    {
        name = "Walk",
        onEnter = function(a1) end,
    },
    v2,
    v3,
    v4,
}