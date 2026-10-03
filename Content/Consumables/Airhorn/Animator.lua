-- Script path: ReplicatedStorage.Content.Consumables.Airhorn.Animator
-- Decompile time: 1.35 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Airhorn = ReplicatedStorage.Assets.Effects.Client.Airhorn
return {
    OnEquip = function(a1) -- Line: 18
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), Airhorn (val), EasySound (val)
        -- upvalues: Animation (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 19
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), Airhorn (upval)
            -- upvalues: EasySound (upval), Animation (upval), TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            v1:AddAccessories({Airhorn})
            local Play = EasySound.Play
            local v2 = {
                id = "rbxassetid://105240638886404",
                volume = 0.5,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = PlayerByUserId.Character,
            }
            Play(v2, 0.67)
            if a1.Executor ~= Players.LocalPlayer or a1.currentAnimations then
                TimescaleUtilities.Wait(2.34)
            else
                local v3 = Animation.new({
                    IsPersistent = true,
                    Preload = true,
                    Track = Airhorn.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = Airhorn.Animations.Activate,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v3:Play()
                TimescaleUtilities.Wait(0.67)
                v2:Play()
                TimescaleUtilities.Wait(1.67)
            end
            v1:RemoveAccessories(true)
            a1_2()
        end)
    end,
}