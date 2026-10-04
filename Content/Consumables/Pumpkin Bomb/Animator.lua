-- Script path: ReplicatedStorage.Content.Consumables.Pumpkin Bomb.Animator
-- Decompile time: 2.98 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    OnEquip = function(a1) -- Line: 14
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Create (val), TimescaleUtilities (val), Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 15
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Create (upval), TimescaleUtilities (upval), Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Pumpkin_2 = ReplicatedStorage.Assets.Effects.Client.Pumpkin
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({Pumpkin_2})
            local Pumpkin = PlayerByUserId.Character:FindFirstChild("Pumpkin")
            local u33 = Create("Sound", {SoundId = "rbxassetid://125506278754588", Volume = 1.5})
            u33.Parent = PlayerByUserId.Character.Head
            u33:Play()
            u33.Ended:Connect(function() -- Line: 32 -- upvalues: u33 (val)
                u33:Destroy()
            end)
            TimescaleUtilities.Delay(0.3, function() -- Line: 36 -- upvalues: Pumpkin (val)
                if Pumpkin and Pumpkin.Parent then
                    Pumpkin.Handle[2].SharpTrail.Enabled = false
                end
            end)
            if a1.Executor == Players.LocalPlayer then
                local v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Pumpkin_2.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Pumpkin_2.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = Pumpkin_2.Animations.Throw,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2:Play(0)
                v1:Play(0)
                a1.currentAnimations = {v2, v1, throw = v3}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 73 -- upvalues: TypedPromise (val), Players (val)
        return TypedPromise.new(function(a1_2) -- Line: 74 -- upvalues: Players (upval), a1 (val)
            if not Players:GetPlayerByUserId(a1.PlayerId).Character then
                return
            end
            if a1.clearAccessories then
                a1.clearAccessories()
                a1.clearAccessories = nil
            end
            if a1.Executor == Players.LocalPlayer then
                for i, j in a1.currentAnimations do
                    if i ~= "throw" then
                        j:Stop(0)
                    end
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 98
        -- upvalues: Players (val), TypedPromise (val), ReplicatedStorage (val), Create (val), ItemDrop (val)
        -- upvalues: EmitterManager (val)
        if a1.currentAnimations then
            a1.currentAnimations.throw:Play(0)
        end
        local Context = a1.Context
        local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
        return TypedPromise.new(function(a1, a2) -- Line: 109
            -- upvalues: PlayerByUserId (val), ReplicatedStorage (upval), Create (upval), ItemDrop (upval)
            -- upvalues: Context (val), EmitterManager (upval)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            if PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("RightHand") then
                local u22 = ReplicatedStorage.Assets.Effects.Client.Pumpkin.Handle:Clone()
                u22.CanCollide = false
                u22.Anchored = true
                u22.Position = PlayerByUserId.Character.RightHand.Position
                u22.Parent = workspace
                local v1 = Create("Sound", {SoundId = "rbxassetid://17431361115", Volume = 1})
                v1.Parent = u22
                v1:Play()
                ;((ItemDrop.Drop(u22.Position, Context.position, u22, Context.dtMultiplier, Context.gravity, Context.velocity, function(a1, a2, a3) -- Line: 141
                    return ((CFrame.lookAt(a3, a2)) * CFrame.Angles(math.rad(a1 * 95), math.rad(a1 * 25), 0)).Rotation
                end)):andThen(function() -- Line: 147 -- upvalues: EmitterManager (upval), Context (upval)
                    EmitterManager.Emit(
                        if Context.use ~= "buff" then "PumpkinExplosion" else "PumpkinExplosionDebuff",
                        (CFrame.new(Context.position)) * CFrame.new(0, 2, 0),
                        Context.useData.explosionRadius,
                        1,
                        true
                    )
                end)):finally(function() -- Line: 156 -- upvalues: u22 (val), a1 (val)
                    u22:Destroy()
                    a1()
                end)
                return
            end
            a2("Invalid player character")
        end)
    end,
}