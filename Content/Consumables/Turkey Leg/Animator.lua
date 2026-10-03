-- Script path: ReplicatedStorage.Content.Consumables.Turkey Leg.Animator
-- Decompile time: 1.99 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local LocalPlayer = Players.LocalPlayer

local function createSound(a1, a2) -- Line: 14 -- upvalues: Create (val) -- types: a1: string, a2: userdata
    local u5 = Create("Sound", {Volume = 1, SoundId = a1, Parent = a2})
    u5:Play()
    u5.Ended:Connect(function() -- Line: 21 -- upvalues: u5 (val)
        u5:Destroy()
    end)
    return u5
end

return {
    OnEquip = function(a1) -- Line: 29
        -- upvalues: TypedPromise (val), ReplicatedStorage (val), PlayerCharacterReplicator (val), LocalPlayer (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2) -- Line: 30
            -- upvalues: a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval), LocalPlayer (upval)
            -- upvalues: Animation (upval)
            local Executor = a1.Executor
            local Character = Executor.Character
            local v1 = ReplicatedStorage.Assets.Effects.Client:WaitForChild("Turkey Leg")
            local v2 = {v1}
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(Character)):AddAccessories(v2)
            if Executor == LocalPlayer then
                local Animator = Character:WaitForChild("Humanoid").Animator
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Idle,
                    Target = Animator,
                })
                local v4 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Equip,
                    Target = Animator,
                })
                v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Eat,
                    Target = Animator,
                })
                v3:Play(0)
                v4:Play(0)
                a1.animations = {Idle = v3, Equip = v4, Eat = v2}
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 74 -- upvalues: TypedPromise (val), LocalPlayer (val), createSound (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2) -- Line: 75 -- upvalues: a1 (val), LocalPlayer (upval), createSound (upval), TimescaleUtilities (upval)
            local Executor = a1.Executor
            local Character = Executor.Character
            a1.eating = true
            if Executor == LocalPlayer and a1.animations then
                a1.animations.Eat:Play()
            end
            createSound("rbxassetid://122394077610728", Character.Head)
            TimescaleUtilities.Delay(2, function() -- Line: 89 -- upvalues: a1 (upval)
                if a1.clearAccessories then
                    a1.clearAccessories()
                    a1.clearAccessories = nil
                end
            end)
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 100 -- upvalues: TypedPromise (val), LocalPlayer (val)
        return TypedPromise.new(function(a1_2) -- Line: 101 -- upvalues: a1 (val), LocalPlayer (upval)
            local Executor = a1.Executor
            if not a1.eating and a1.clearAccessories then
                a1.clearAccessories()
                a1.clearAccessories = nil
            end
            if Executor == LocalPlayer then
                a1.animations.Idle:Stop()
                a1.animations.Equip:Stop()
            end
            a1_2()
        end)
    end,
}