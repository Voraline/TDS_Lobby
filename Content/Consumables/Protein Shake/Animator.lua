-- Script path: ReplicatedStorage.Content.Consumables.Protein Shake.Animator
-- Decompile time: 1.36 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local ProteinShake = ReplicatedStorage.Assets.Effects.Client.ProteinShake
return {
    OnEquip = function(a1) -- Line: 19
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), ProteinShake (val)
        -- upvalues: TimescaleUtilities (val), EasySound (val), Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 20
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), ProteinShake (upval)
            -- upvalues: TimescaleUtilities (upval), EasySound (upval), Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            v1:AddAccessories({ProteinShake})
            local ProteinShake_2 = PlayerByUserId.Character:FindFirstChild("ProteinShake")
            local Handle = ProteinShake_2
            if Handle then
                Handle = ProteinShake_2:FindFirstChild("Handle")
            end
            if Handle and Handle:IsA("BasePart") then
                TimescaleUtilities.Delay(2.5, function() -- Line: 31 -- upvalues: Handle (val)
                    Handle.Transparency = 1
                end)
            end
            local Play = EasySound.Play
            local v2 = {
                id = "rbxassetid://73900097448970",
                volume = 0.5,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = PlayerByUserId.Character,
            }
            Play(v2, 1)
            if a1.Executor ~= Players.LocalPlayer or a1.currentAnimations then
                TimescaleUtilities.Wait(3.57)
            else
                local v3 = Animation.new({
                    IsPersistent = true,
                    Preload = true,
                    Track = ProteinShake.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = ProteinShake.Animations.Activate,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v3:Play()
                TimescaleUtilities.Wait(1)
                v2:Play()
                TimescaleUtilities.Wait(2.57)
            end
            v1:RemoveAccessories(true)
            a1_2()
        end)
    end,
}