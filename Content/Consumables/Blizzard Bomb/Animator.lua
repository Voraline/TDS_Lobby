-- Script path: ReplicatedStorage.Content.Consumables.Blizzard Bomb.Animator
-- Decompile time: 3.42 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)

local function createSound(a1) -- Line: 13 -- upvalues: GameState (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://17410058511"
    if not Sound.Loaded then
        Sound.Loaded:Wait()
    end
    Sound.PlaybackSpeed = 1 * GameState.TimeScale
    Sound.Parent = a1
    Sound:Play()
    Sound.Ended:Connect(function() -- Line: 22 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
end

return {
    OnEquip = function(a1) -- Line: 28
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 29
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Radio = ReplicatedStorage.Assets.Effects.Client.Radio
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({Radio})
            if a1.Executor == Players.LocalPlayer then
                local v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Radio.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Radio.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2:Play(0)
                v1:Play(0)
                a1.currentAnimations = {v2, v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 62 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2) -- Line: 63 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character):RemoveAccessories(true)
            if a1.Executor == Players.LocalPlayer then
                for i, j in a1.currentAnimations do
                    j:Stop(0)
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 81
        -- upvalues: Players (val), createSound (val), TypedPromise (val), ReplicatedStorage (val), ItemDrop (val)
        -- upvalues: EmitterManager (val), GameState (val), TimescaleUtilities (val)
        task.spawn(function() -- Line: 82 -- upvalues: Players (upval), a1 (val), createSound (upval)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                createSound(Character.HumanoidRootPart)
            end
        end)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 89
            -- upvalues: a1 (val), ReplicatedStorage (upval), ItemDrop (upval), EmitterManager (upval)
            -- upvalues: GameState (upval), TimescaleUtilities (upval)
            local dropInfo = a1.Context.dropInfo
            local u6 = nil
            local u14 = ReplicatedStorage.Assets.Effects.Client.BlizzardBomb:Clone()
            u14:PivotTo((CFrame.new(dropInfo.startPosition)))
            u14.Parent = workspace
            ;(ItemDrop.Drop(dropInfo.startPosition, dropInfo.endPosition, u14, dropInfo.deltaMultiplier, dropInfo.gravity, dropInfo.velocity, function(a1, a2, a3) -- Line: 104
                return ((CFrame.new(a3, a2)) * CFrame.Angles(math.rad(a1 * 90), 0, (math.rad(a1 * 10)))).Rotation
            end)):andThen(function() -- Line: 111
                -- upvalues: EmitterManager (upval), dropInfo (val), u14 (val), u6 (ref), ReplicatedStorage (upval)
                -- upvalues: GameState (upval), TimescaleUtilities (upval), a1 (upval), a1_2 (val)
                EmitterManager.Emit("IcicleExplosion", CFrame.new(dropInfo.endPosition), 10)
                u14:Destroy()
                u6 = ReplicatedStorage.Assets.Effects.Client.BlizzardEffect:Clone()
                u6:PivotTo((CFrame.new(dropInfo.endPosition)) * (CFrame.Angles(0, 0, 1.5707963267948966)))
                u6.Parent = workspace.Terrain
                u6.PrimaryPart.Start.PlaybackSpeed = 1 * GameState.TimeScale
                u6.PrimaryPart.Loop.PlaybackSpeed = 1 * GameState.TimeScale
                u6.PrimaryPart.End.PlaybackSpeed = 1 * GameState.TimeScale
                u6.PrimaryPart.Start:Play()
                local u65 = nil
                local v1 = u6.PrimaryPart.Start.Ended:Connect(function() -- Line: 126 -- upvalues: u65 (ref), u6 (upval)
                    u65:Disconnect()
                    u6.PrimaryPart.Loop:Play()
                end)
                TimescaleUtilities.Delay(a1.Context.lifeTime, function() -- Line: 131 -- upvalues: u6 (upval), a1_2 (upval)
                    u6.PrimaryPart.Loop:Stop()
                    u6.PrimaryPart.End:Play()
                    for i, j in u6:GetDescendants() do
                        if j:IsA("ParticleEmitter") then
                            j.Enabled = false
                        end
                    end
                    task.delay(15, function() -- Line: 140 -- upvalues: u6 (upval), a1_2 (upval)
                        u6:Destroy()
                        a1_2()
                    end)
                end)
            end)
            a3(function() -- Line: 147 -- upvalues: u14 (val), u6 (ref)
                if u14 then
                    u14:Destroy()
                end
                if u6 then
                    u6:Destroy()
                end
            end)
        end)
    end,
}