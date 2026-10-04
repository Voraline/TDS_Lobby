-- Script path: ReplicatedStorage.Content.Consumables.Barricade.Animator
-- Decompile time: 4.90 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ConsumableHealth = require(ReplicatedStorage.Client.Interfaces.Game.Components.ConsumableHealth)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local Barricade = ReplicatedStorage.Assets.Effects.Client.Barricade
local GameGui = Players.LocalPlayer.PlayerGui:WaitForChild("GameGui")

local function lookAtPos(a1, a2) -- Line: 26 -- types: a1: vector, a2: vector
    return CFrame.lookAt(a1, (Vector3.new(a2.X, a1.Y, a2.Z)))
end

local function createSound(a1, a2) -- Line: 30 -- upvalues: Create (val) -- types: a1: string, a2: userdata
    local u5 = Create("Sound", {Volume = 1, SoundId = a1, Parent = a2})
    u5:Play()
    u5.Ended:Connect(function() -- Line: 37 -- upvalues: u5 (val)
        u5:Destroy()
    end)
    return u5
end

local function createBarricade(a1, a2) -- Line: 44 -- upvalues: GameState (val), Barricade (val)
    local pathName = a2.State.Context.pathName
    local pathToEnd = a2.State.Context.pathToEnd
    local v1 = GameState.getPath(a1, pathName)
    local v2 = v1.PathDistance - pathToEnd
    local v3 = CFrame.lookAt(v1:GetScalar(v2), (v1:GetScalar(v2 - 0.1)))
    local v4 = Barricade:Clone()
    v4.Parent = workspace.Consumables
    v4:PivotTo(v3)
    return v4
end

return {
    OnEquip = function(a1) -- Line: 62
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: createSound (val), Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 63
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: createSound (upval), Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Hammer = ReplicatedStorage.Assets.Effects.Client.Hammer
            local v1 = {Hammer}
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories(v1)
            a1.equipSound = createSound(Hammer.Handle.Sound.SoundId, PlayerByUserId.Character.HumanoidRootPart)
            a1.building = false
            if a1.Executor == Players.LocalPlayer then
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Hammer.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Hammer.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Hammer.Animations.Build,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2:Play(0)
                v3:Play(0)
                a1.currentAnimations = {idle = v2, equip = v3, build = v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 111 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 112 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local v1 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            if not a1.building then
                v1:RemoveAccessories(true)
            end
            a1.equipSound:Stop()
            a1.equipSound = nil
            if a1.Executor == Players.LocalPlayer then
                a1.currentAnimations.idle:Stop()
                a1.currentAnimations.equip:Stop()
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 135
        -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val), PlayerReplicator (val)
        -- upvalues: createBarricade (val), spr (val), React (val), ConsumableHealth (val), Create (val), GameGui (val)
        -- upvalues: ReactRoblox (val), createSound (val), TimescaleUtilities (val), RunService (val), lookAtPos (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 136
            -- upvalues: a1 (val), Players (upval), PlayerCharacterReplicator (upval), PlayerReplicator (upval)
            -- upvalues: createBarricade (upval), spr (upval), React (upval), ConsumableHealth (upval), Create (upval)
            -- upvalues: GameGui (upval), ReactRoblox (upval), createSound (upval), TimescaleUtilities (upval)
            -- upvalues: RunService (upval), lookAtPos (upval)
            local Replicator = a1.Replicator
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local u15 = PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)
            local v1 = PlayerReplicator.GetEntityFromPlayer(PlayerByUserId)
            local u23 = createBarricade(v1.Team, Replicator)
            local CFrame_2 = u23.Root.CFrame
            u23.Root.CFrame = CFrame_2 * CFrame.new(0, -4, 0)
            spr.target(u23.Root, 0.7, 0.5, {CFrame = CFrame_2})
            local v2 = React.createElement(ConsumableHealth, {
                health = Replicator.State.Health,
                maxHealth = Replicator.State.MaxHealth,
                adornee = u23.Root,
                replicator = Replicator,
            })
            local u54 = Create("Folder", {Name = "Barricade", Parent = GameGui})
            local u58 = ReactRoblox.createRoot(u54)
            u58:render(v2)
            local Health = Replicator.State.Health
            local u65 = nil
            u65 = (Replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 171
                -- upvalues: Health (ref), createSound (upval), u23 (val), u65 (ref), u58 (val), u54 (val)
                -- upvalues: TimescaleUtilities (upval), a1_2 (val)
                if a1 < Health then
                    createSound(u23.Particles.Hit.SoundId, u23.Particles)
                end
                Health = a1
                if a1 <= 0 then
                    u65:Disconnect()
                    local Particles = u23.Particles
                    Particles.Anchored = true
                    Particles.Parent = u23.Parent
                    u23:Destroy()
                    u58:unmount()
                    u54:Destroy()
                    Particles.Smoke.Enabled = false
                    Particles.Dirt.Enabled = false
                    Particles.Smoke:Emit(50)
                    Particles.Break:Play()
                    TimescaleUtilities.Wait(4)
                    Particles:Destroy()
                    a1_2()
                end
            end)
            local u86 = nil
            if a1.Executor == Players.LocalPlayer then
                u86 = RunService.RenderStepped:Connect(function() -- Line: 199 -- upvalues: PlayerByUserId (val), lookAtPos (upval), u23 (val)
                    local Character = PlayerByUserId.Character
                    if not Character then
                        return
                    end
                    Character:PivotTo((lookAtPos((Character:GetPivot()).Position, (u23:GetPivot()).Position)))
                end)
            end
            a3(function() -- Line: 211 -- upvalues: u65 (ref), u86 (ref), u58 (val), u54 (val), u23 (val)
                if u65 then
                    u65:Disconnect()
                end
                if u86 then
                    u86:Disconnect()
                end
                u58:unmount()
                u54:Destroy()
                u23:Destroy()
            end)
            a1.building = true
            u23.Particles.Poof:Play()
            u23.Particles.Build:Play()
            u23.Particles.Smoke.Enabled = true
            u23.Particles.Dirt.Enabled = true
            task.spawn(function() -- Line: 231 -- upvalues: a1 (upval), TimescaleUtilities (upval), u23 (val), u15 (val), u86 (ref)
                for i = 1, 3 do
                    if a1.currentAnimations then
                        a1.currentAnimations.build:Play()
                    end
                    TimescaleUtilities.Wait(0.5)
                end
                if u23.Parent ~= nil then
                    u23.Particles.Smoke.Enabled = false
                    u23.Particles.Dirt.Enabled = false
                end
                u15:RemoveAccessories(true)
                if u86 then
                    u86:Disconnect()
                end
            end)
        end)
    end,
}