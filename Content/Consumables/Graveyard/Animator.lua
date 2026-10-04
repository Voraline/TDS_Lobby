-- Script path: ReplicatedStorage.Content.Consumables.Graveyard.Animator
-- Decompile time: 3.99 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Tombstone = ReplicatedStorage.Assets.Effects.Client.Tombstone
local GraveyardShovel = ReplicatedStorage.Assets.Effects.Client.GraveyardShovel

local function lookAtPos(a1, a2) -- Line: 21 -- types: a1: vector, a2: vector
    return CFrame.lookAt(a1, (Vector3.new(a2.X, a1.Y, a2.Z)))
end

local function createGraveyard(a1, a2) -- Line: 25 -- upvalues: GameState (val), Tombstone (val)
    local pathName = a2.State.Context.pathName
    local pathToEnd = a2.State.Context.pathToEnd
    local v1 = GameState.getPath(a1, pathName)
    local v2 = v1.PathDistance - pathToEnd
    local v3 = CFrame.lookAt(v1:GetScalar(v2), (v1:GetScalar(v2 - 0.1)))
    local v4 = Tombstone:Clone()
    v4.Parent = workspace.Consumables
    v4:PivotTo(v3)
    return v4
end

return {
    OnEquip = function(a1) -- Line: 43
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), GraveyardShovel (val)
        -- upvalues: Animation (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 44
            -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval), GraveyardShovel (upval)
            -- upvalues: Animation (upval), TimescaleUtilities (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({GraveyardShovel})
            a1.digging = false
            if a1.Executor == Players.LocalPlayer and not a1.currentAnimations then
                a1.currentAnimations = {
                    idle = Animation.new({
                        IsPersistent = true,
                        Preload = true,
                        Track = GraveyardShovel.Animations.Idle,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                    equip = Animation.new({
                        IsPersistent = true,
                        Preload = true,
                        Track = GraveyardShovel.Animations.Equip,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                    dig = Animation.new({
                        IsPersistent = true,
                        IgnorePriority = true,
                        Preload = true,
                        Track = GraveyardShovel.Animations.Dig,
                        Target = PlayerByUserId.Character.Humanoid.Animator,
                    }),
                }
                a1.currentAnimations.equip:Play()
                TimescaleUtilities.Wait(0.73)
                a1.currentAnimations.idle:Play()
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 89 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 90 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            if not a1.digging then
                v1:RemoveAccessories(true)
            end
            if a1.Executor == Players.LocalPlayer then
                a1.currentAnimations.idle:Stop()
                a1.currentAnimations.equip:Stop()
                a1.currentAnimations.dig:Stop()
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 109
        -- upvalues: TypedPromise (val), Players (val), PlayerReplicator (val), PlayerCharacterReplicator (val)
        -- upvalues: Enum (val), createGraveyard (val), EasySound (val), TimescaleUtilities (val), RunService (val)
        -- upvalues: lookAtPos (val), EmitterManager (val), spr (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 111
            -- upvalues: a1 (val), Players (upval), PlayerReplicator (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Enum (upval), createGraveyard (upval), EasySound (upval), TimescaleUtilities (upval)
            -- upvalues: RunService (upval), lookAtPos (upval), EmitterManager (upval), spr (upval)
            local Replicator = a1.Replicator
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = PlayerReplicator.GetEntityFromPlayer(PlayerByUserId)
            local u19 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            local Blue = if v1.Team ~= Enum.Team.Red then Enum.Team.Red else Enum.Team.Blue
            a1.digging = true
            local u37 = createGraveyard(Blue, Replicator)
            local v2 = u37.Root.CFrame + Vector3.new(0, 1, 0)
            u37.Root.CFrame = v2 * CFrame.new(0, -4, 0)
            EasySound.Play({
                id = "rbxassetid://124953984393636",
                volume = 0.5,
                destroyOnEnd = true,
                soundGroupName = "Towers",
                parent = u37,
            })
            local u86 = nil
            if a1.Executor == Players.LocalPlayer then
                a1.currentAnimations.idle:Stop()
                a1.currentAnimations.equip:Stop()
                a1.currentAnimations.dig:Play()
                task.spawn(function() -- Line: 143 -- upvalues: a1 (upval), TimescaleUtilities (upval)
                    for i = 1, 3 do
                        if not a1.digging then
                            return
                        end
                        if not a1.currentAnimations.dig.Controller.IsPlaying then
                            a1.currentAnimations.dig:Play()
                        end
                        TimescaleUtilities.Wait(0.1)
                    end
                end)
                u86 = RunService.RenderStepped:Connect(function() -- Line: 155 -- upvalues: PlayerByUserId (val), lookAtPos (upval), u37 (val)
                    local Character = PlayerByUserId.Character
                    if not Character then
                        return
                    end
                    Character:PivotTo((lookAtPos((Character:GetPivot()).Position, (u37:GetPivot()).Position)))
                end)
            end
            a3(function() -- Line: 167 -- upvalues: a1 (upval), u19 (val), u86 (ref)
                a1.digging = false
                u19:RemoveAccessories(true)
                if u86 then
                    u86:Disconnect()
                end
            end)
            EmitterManager.toggle(u37.PrimaryPart, true)
            spr.target(u37.Root, 0.7, 0.5, {CFrame = v2})
            TimescaleUtilities.Wait(a1.Context.animTime)
            EmitterManager.toggle(u37.PrimaryPart, false)
            a1.digging = false
            u19:RemoveAccessories(true)
            if u86 then
                u86:Disconnect()
            end
            TimescaleUtilities.Wait(a1.Context.lifetime - a1.Context.animTime)
            spr.target(u37.Root, 0.7, 0.5, {CFrame = v2 * CFrame.new(0, -4, 0)})
            TimescaleUtilities.Wait(2)
            u37:Destroy()
            a1_2()
        end)
    end,
}