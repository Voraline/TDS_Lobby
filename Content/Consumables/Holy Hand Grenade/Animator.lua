-- Script path: ReplicatedStorage.Content.Consumables.Holy Hand Grenade.Animator
-- Decompile time: 4.23 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    OnEquip = function(a1) -- Line: 16
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Create (val), Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 17
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Create (upval), Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = ReplicatedStorage.Assets.Effects.Client.HolyHandGrenade:Clone()
            local v2 = {v1}
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories(v2)
            local u31 = Create("Sound", {SoundId = "rbxassetid://17428226590", Volume = 0.5})
            u31.Parent = PlayerByUserId.Character.Head
            u31:Play()
            u31.Ended:Connect(function() -- Line: 32 -- upvalues: u31 (val)
                u31:Destroy()
            end)
            if a1.Executor == Players.LocalPlayer then
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v4 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = v1.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = v1.Animations.Throw,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v4:Play(0)
                v3:Play(0)
                a1.currentAnimations = {v4, v3, throw = v2}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 67 -- upvalues: TypedPromise (val), Players (val)
        return TypedPromise.new(function(a1_2) -- Line: 68 -- upvalues: Players (upval), a1 (val)
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
    OnUse = function(a1) -- Line: 92
        -- upvalues: Players (val), TypedPromise (val), ReplicatedStorage (val), Create (val), Projectile (val)
        -- upvalues: TimescaleUtilities (val), TweenService (val), Shaker (val), EffectsController (val)
        if a1.currentAnimations then
            a1.currentAnimations.throw:Play(0)
        end
        local Context = a1.Context
        local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
        local u16 = Context.lifeTime or 3
        return TypedPromise.new(function(a1, a2) -- Line: 103
            -- upvalues: PlayerByUserId (val), ReplicatedStorage (upval), Create (upval), Projectile (upval), u16 (val)
            -- upvalues: Context (val), TimescaleUtilities (upval), TweenService (upval), Shaker (upval)
            -- upvalues: EffectsController (upval)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            if PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("RightHand") then
                local u14 = 0
                local v1 = ReplicatedStorage.Assets.Effects.Client.HolyHandGrenade:Clone()
                v1.Parent = workspace
                local Handle = v1.Handle
                Handle.Anchored = true
                local CFrame = PlayerByUserId.Character.RightHand.CFrame
                Handle:PivotTo(CFrame)
                local u36 = Create("Sound", {SoundId = "rbxassetid://17437371807", Volume = 0.5})
                u36.Parent = PlayerByUserId.Character.RightHand
                u36:Play()
                u36.Ended:Connect(function() -- Line: 128 -- upvalues: u36 (val)
                    u36:Destroy()
                end)
                ;((Projectile:throwWithPhysics({
                    asset = Handle,
                    duration = u16,
                    start = Handle.Position,
                    target = Context.position,
                    rotation = function(a1) -- Line: 137 -- upvalues: u14 (ref), Context (upval) -- types: a1: vector
                        u14 = u14 + 0.1 * a1.Magnitude / 10
                        return CFrame.Angles(Context.noise + u14, Context.noise + u14, 0)
                    end,
                    include = {
                        workspace:WaitForChild("Map"),
                        workspace:WaitForChild("Cliff"),
                        (workspace:WaitForChild("Ground")),
                    },
                })):andThen(function(a1) -- Line: 147
                    -- upvalues: Handle (ref), Create (upval), TimescaleUtilities (upval), TweenService (upval)
                    -- upvalues: Shaker (upval), EffectsController (upval)
                    Handle.Anchored = true
                    local u6 = Create("Sound", {SoundId = "rbxassetid://106195107817261", Volume = 1})
                    u6.Parent = Handle
                    u6:Play()
                    TimescaleUtilities.Delay(1, function() -- Line: 157 -- upvalues: TweenService (upval), u6 (val)
                        TweenService:Create(u6, TweenInfo.new(1.5), {Volume = 0}):Play()
                    end)
                    u6.Ended:Connect(function() -- Line: 161 -- upvalues: u6 (val)
                        u6:Destroy()
                    end)
                    TimescaleUtilities.Wait(2)
                    local v1 = next
                    local Children, Children_2 = Handle.Attachment:GetChildren()
                    for k, v in v1, Children, Children_2 do
                        if v:IsA("ParticleEmitter") then
                            v.Lifetime = NumberRange.new(0)
                        end
                    end
                    TimescaleUtilities.Wait(1.5)
                    v1 = Shaker:Shake({17, 12, 0, 1.5}, 0.2, 0.25)
                    v1.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448)
                    v1.RotationInfluence = Vector3.new(2, 1, 4)
                    EffectsController.HolyExplosion({Radius = 1.5, Position = a1})
                end)):finally(function() -- Line: 182 -- upvalues: Handle (ref), a1 (val)
                    Handle:Destroy()
                    a1()
                end)
                return
            end
            a2("Invalid player character")
        end)
    end,
}