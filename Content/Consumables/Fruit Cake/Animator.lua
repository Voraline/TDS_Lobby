-- Script path: ReplicatedStorage.Content.Consumables.Fruit Cake.Animator
-- Decompile time: 2.32 ms

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
            local Fruitcake = ReplicatedStorage.Assets.Effects.Client:WaitForChild("Fruitcake")
            local v1 = {Fruitcake}
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(Character)):AddAccessories(v1)
            if Executor == LocalPlayer then
                local Animator = Character:WaitForChild("Humanoid").Animator
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Fruitcake.Animations.Idle,
                    Target = Animator,
                })
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Fruitcake.Animations.Equip,
                    Target = Animator,
                })
                v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Fruitcake.Animations.Eat,
                    Target = Animator,
                })
                v2:Play(0)
                v3:Play(0)
                a1.animations = {Idle = v2, Equip = v3, Eat = v1}
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 74 -- upvalues: TypedPromise (val), LocalPlayer (val), TimescaleUtilities (val), createSound (val)
        return TypedPromise.new(function(a1_2) -- Line: 75 -- upvalues: a1 (val), LocalPlayer (upval), TimescaleUtilities (upval), createSound (upval)
            local Executor = a1.Executor
            local Character = Executor.Character
            a1.eating = true
            if Executor == LocalPlayer and a1.animations then
                a1.animations.Eat:Play()
            end
            task.spawn(function() -- Line: 87 -- upvalues: Character (val), TimescaleUtilities (upval)
                local Fruitcake = Character:FindFirstChild("Fruitcake")
                if not Fruitcake then
                    return
                end
                TimescaleUtilities.Wait(0.5)
                local v1 = Fruitcake["Fruitcake" .. 3]
                v1.Transparency = 1
                TimescaleUtilities.Wait(0.5)
                v1 = Fruitcake["Fruitcake" .. 2]
                v1.Transparency = 1
                TimescaleUtilities.Wait(0.5)
                v1 = Fruitcake["Fruitcake" .. 1]
                v1.Transparency = 1
            end)
            createSound("rbxassetid://122394077610728", Character.Head)
            TimescaleUtilities.Delay(2, function() -- Line: 100 -- upvalues: a1 (upval)
                if a1.clearAccessories then
                    a1.clearAccessories()
                    a1.clearAccessories = nil
                end
            end)
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 111 -- upvalues: TypedPromise (val), LocalPlayer (val)
        return TypedPromise.new(function(a1_2) -- Line: 112 -- upvalues: a1 (val), LocalPlayer (upval)
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