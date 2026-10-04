-- Script path: ReplicatedStorage.Content.Consumables.Molotov.Animator
-- Decompile time: 2.94 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    OnEquip = function(a1) -- Line: 13
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Create (val), Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 14
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Create (upval), Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Molotov = ReplicatedStorage.Assets.Effects.Client.Molotov
            local v1 = {Molotov}
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories(v1)
            local u28 = Create("Sound", {SoundId = "rbxassetid://17437522964", Volume = 0.5})
            u28.Parent = PlayerByUserId.Character.Head
            u28:Play()
            u28.Ended:Connect(function() -- Line: 29 -- upvalues: u28 (val)
                u28:Destroy()
            end)
            if a1.Executor == Players.LocalPlayer then
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Molotov.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Molotov.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = Molotov.Animations.Throw,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v3:Play(0)
                v2:Play(0)
                a1.currentAnimations = {v3, v2, throw = v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 64 -- upvalues: TypedPromise (val), Players (val)
        return TypedPromise.new(function(a1_2) -- Line: 65 -- upvalues: Players (upval), a1 (val)
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
    OnUse = function(a1) -- Line: 89
        -- upvalues: Players (val), TypedPromise (val), ReplicatedStorage (val), Create (val), Projectile (val)
        -- upvalues: EmitterManager (val)
        if a1.currentAnimations then
            a1.currentAnimations.throw:Play(0)
        end
        local Context = a1.Context
        local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
        local u16 = Context.lifeTime or 3
        return TypedPromise.new(function(a1, a2) -- Line: 100
            -- upvalues: PlayerByUserId (val), ReplicatedStorage (upval), Create (upval), Projectile (upval), u16 (val)
            -- upvalues: Context (val), EmitterManager (upval)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            if PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("RightHand") then
                local u14 = 0
                local u22 = ReplicatedStorage.Assets.Effects.Client.Molotov:Clone()
                local Handle = u22.Handle
                Handle.Anchored = true
                Handle:PivotTo(PlayerByUserId.Character.RightHand.CFrame)
                Handle.Parent = workspace
                local u36 = Create("Sound", {SoundId = "rbxassetid://17437522781", Volume = 0.5})
                u36.Parent = PlayerByUserId.Character.RightHand
                u36:Play()
                u36.Ended:Connect(function() -- Line: 125 -- upvalues: u36 (val)
                    u36:Destroy()
                end)
                ;((Projectile:throwWithPhysics({
                    asset = Handle,
                    duration = u16,
                    start = Handle.Position,
                    target = Context.position,
                    rotation = function(a1) -- Line: 134 -- upvalues: u14 (ref), Context (upval) -- types: a1: vector
                        u14 = u14 + 0.1 * a1.Magnitude / 2
                        return CFrame.Angles(Context.noise + u14, Context.noise + u14, 0)
                    end,
                    include = {
                        workspace:WaitForChild("Map"),
                        workspace:WaitForChild("Cliff"),
                        (workspace:WaitForChild("Ground")),
                    },
                })):andThen(function(a1) -- Line: 144 -- upvalues: EmitterManager (upval) -- types: a1: vector
                    EmitterManager.Emit("NapalmStrike", (CFrame.new(a1)) * CFrame.new(0, -1, 0), 0.5, 1, false)
                end)):finally(function() -- Line: 153 -- upvalues: Handle (val), u22 (val), a1 (val)
                    Handle:Destroy()
                    u22:Destroy()
                    a1()
                end)
                return
            end
            a2("Invalid player character")
        end)
    end,
}