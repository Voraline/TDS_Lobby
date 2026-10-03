-- Script path: ReplicatedStorage.Content.Consumables.Slingshot.Animator
-- Decompile time: 1.27 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Slingshot = ReplicatedStorage.Assets.Effects.Client.Slingshot
return {
    OnEquip = function(a1) -- Line: 18
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), Slingshot (val)
        -- upvalues: EasySound (val), Animation (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 19
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), Slingshot (upval)
            -- upvalues: EasySound (upval), Animation (upval), TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            v1:AddAccessories({Slingshot})
            local Play = EasySound.Play
            local v2 = {
                id = "rbxassetid://106960324425526",
                volume = 0.5,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = PlayerByUserId.Character,
            }
            Play(v2, 1)
            if a1.Executor ~= Players.LocalPlayer then
                TimescaleUtilities.Wait(2.4299999999999997)
            else
                local v3 = Animation.new({
                    IsPersistent = true,
                    Preload = true,
                    Track = Slingshot.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = Slingshot.Animations.Activate,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v3:Play()
                TimescaleUtilities.Wait(1)
                v2:Play()
                TimescaleUtilities.Wait(1.43)
            end
            v1:RemoveAccessories(true)
            a1_2()
        end)
    end,
}