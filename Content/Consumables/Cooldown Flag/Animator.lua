-- Script path: ReplicatedStorage.Content.Consumables.Cooldown Flag.Animator
-- Decompile time: 7.43 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local FlagDecay = require(ReplicatedStorage.Client.Interfaces.Game.Components.FlagDecay)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Assets = ReplicatedStorage.Assets
local CurrentCamera = workspace.CurrentCamera
local CooldownFlag = Assets.Effects.Client.CooldownFlag
local GameGui = Players.LocalPlayer.PlayerGui:WaitForChild("GameGui")
local createElement = React.createElement
local u88 = nil
local u89 = nil
local u90 = {}

local function map(a1, a2) -- Line: 30 -- upvalues: u90 (val)
    local p = u90[a1].p
    return CFrame.new() * CFrame.Angles(p.X, p.Y, p.Z)
end

local function updateBones() -- Line: 35 -- upvalues: u90 (val)
    local p
    for k, v in pairs(u90) do
        p = u90[k].p
        k.Transform = CFrame.new() * CFrame.Angles(p.X, p.Y, p.Z)
    end
end

local function createPlacementRig() -- Line: 41
    -- upvalues: CooldownFlag (val), CurrentCamera (val), SpringClass (val), u90 (val)
    local v1 = CooldownFlag:Clone()
    v1.Parent = CurrentCamera
    local Bone = v1:WaitForChild("Pole"):FindFirstChildOfClass("Bone")
    while Bone do
        if Bone.Name ~= "FlagBone" and Bone.Name ~= "Bone" then
            u90[Bone] = (SpringClass.new(Vector3.new(), 0.35, 12))
        end
        Bone = Bone:FindFirstChildOfClass("Bone")
    end
    return v1
end

local function cleanPlacementRig() -- Line: 59 -- upvalues: u89 (ref), u88 (ref), u90 (val)
    if u89 then
        u89:Disconnect()
        u89 = nil
    end
    if u88 then
        u88:Destroy()
        u88 = nil
    end
    table.clear(u90)
end

local function flagToCursor() -- Line: 73
    -- upvalues: PathPlacementCursorController (val), u90 (val), u88 (ref), u89 (ref), RunService (val)
    local CurrentPosition = PathPlacementCursorController.CurrentPosition

    local function updatePos() -- Line: 76
        -- upvalues: PathPlacementCursorController (upval), CurrentPosition (ref), u90 (upval), u88 (upval)
        local CurrentPosition_2 = PathPlacementCursorController.CurrentPosition
        if CurrentPosition_2 then
            local v1 = CurrentPosition - CurrentPosition_2
            local v2 = Vector3.new(math.rad(v1.Z), 0, -(math.rad(v1.X))) * 10
            for k, v in pairs(u90) do
                v.v = v.v + v2
            end
            u88:PivotTo((CFrame.new(CurrentPosition_2)))
            CurrentPosition = CurrentPosition_2
        end
    end

    u89 = RunService.RenderStepped:Connect(function(a1) -- Line: 93 -- upvalues: updatePos (val), u90 (upval)
        local p
        updatePos()
        for k, v in pairs(u90) do
            p = u90[k].p
            k.Transform = CFrame.new() * CFrame.Angles(p.X, p.Y, p.Z)
        end
    end)
end

local function flagIntro() -- Line: 99 -- upvalues: u90 (val)
    for k, v in pairs(u90) do
        v.p = Vector3.new(-0.7853981852531433, 0, 0)
        v.v = Vector3.new(1.0471975803375244, 0, 0)
    end
end

local function animateFlag(a1) -- Line: 108 -- upvalues: RunService (val) -- types: a1: userdata
    local Attachment1 = a1:WaitForChild("Flag").Attachment1
    local Parent = Attachment1.Parent
    local Parent_2 = Parent.Parent
    local a0 = Parent_2.Parent.a0
    local u10 = 0
    local u11 = nil
    local v1 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 117
        -- upvalues: a1 (val), u11 (ref), u10 (ref), a0 (val), Attachment1 (val), Parent (val), Parent_2 (val)
        if a1.Parent == nil then
            u11:Disconnect()
            return
        end
        local v1 = Vector3.new(0, math.sin(u10 * 6) * 30, 0)
        local v2 = -(math.sin(u10 * 6 - 1.5707963267948966) + 1) / 5
        local v3 = math.sin(u10 * 6 / 2) / 5
        local v4 = math.sin(u10 * 6 / 3) / 10
        a0.Orientation = v1
        Attachment1.Orientation = v1
        Parent.WorldCFrame = Parent_2.WorldCFrame * CFrame.new(v2, v4, v3)
        u10 = (u10 + a1_2) % 6.283185307179586
    end)
end

local function createFlag(a1, a2) -- Line: 134
    -- upvalues: CooldownFlag (val), RunService (val), TweenService (val), Enum (val)
    local u5 = CooldownFlag:Clone()
    u5.Parent = workspace.Consumables
    u5:PivotTo((CFrame.new(a2.position)))
    local Attachment1 = u5:WaitForChild("Flag").Attachment1
    local Parent = Attachment1.Parent
    local Parent_2 = Parent.Parent
    local a0 = Parent_2.Parent.a0
    local u23 = 0
    local u24 = nil
    local v1 = RunService.RenderStepped:Connect(function(a1) -- Line: 117
        -- upvalues: u5 (val), u24 (ref), u23 (ref), a0 (val), Attachment1 (val), Parent (val), Parent_2 (val)
        if u5.Parent == nil then
            u24:Disconnect()
            return
        end
        local v1 = Vector3.new(0, math.sin(u23 * 6) * 30, 0)
        local v2 = -(math.sin(u23 * 6 - 1.5707963267948966) + 1) / 5
        local v3 = math.sin(u23 * 6 / 2) / 5
        local v4 = math.sin(u23 * 6 / 3) / 10
        a0.Orientation = v1
        Attachment1.Orientation = v1
        Parent.WorldCFrame = Parent_2.WorldCFrame * CFrame.new(v2, v4, v3)
        u23 = (u23 + a1) % 6.283185307179586
    end)
    local Range = u5.Range
    Range.SurfaceGui.Enabled = true
    Range.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.05000000074505806)
    TweenService:Create(
        Range,
        TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Size = Vector3.new(a2.radius * 2, 0.1, a2.radius * 2)}
    ):Play()
    return u5
end

return {
    OnUse = function(a1) -- Line: 153
        -- upvalues: TypedPromise (val), u89 (ref), u88 (ref), u90 (val), createFlag (val), createElement (val)
        -- upvalues: FlagDecay (val), Create (val), GameGui (val), ReactRoblox (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 154
            -- upvalues: a1 (val), u89 (upval), u88 (upval), u90 (upval), createFlag (upval), createElement (upval)
            -- upvalues: FlagDecay (upval), Create (upval), GameGui (upval), ReactRoblox (upval)
            -- upvalues: TimescaleUtilities (upval)
            local Context = a1.Context
            if u89 then
                u89:Disconnect()
                u89 = nil
            end
            if u88 then
                u88:Destroy()
                u88 = nil
            end
            table.clear(u90)
            local Replicator = a1.Replicator
            local u27 = createFlag(Replicator, Context)
            u27.Particles.Poof:Play()
            u27.Particles.Particle.Smoke:Emit(30)
            u27.Particles.Place:Play()
            local v1 = createElement(FlagDecay, {
                ownerId = Context.playerId,
                adornee = u27:WaitForChild("Pole"),
                timeLeft = Replicator.State.TimeLeft,
                lifeTime = Replicator.State.LifeTime,
                color3 = Color3.fromRGB(255, 255, 0),
                replicator = Replicator,
            })
            local v2 = Create("Folder", {Name = "CooldownFlag", Parent = GameGui})
            local u71 = ReactRoblox.createRoot(v2)
            u71:render(v1)

            local function cleanUp() -- Line: 182 -- upvalues: u71 (val), u27 (val)
                u71:render(nil)
                u27:Destroy()
            end

            Replicator.Folder.Destroying:Connect(function() -- Line: 187 -- upvalues: u27 (val), TimescaleUtilities (upval), u71 (val), a1_2 (val)
                local Particles = u27.Particles
                Particles.Parent = workspace.CurrentCamera
                Particles.Smoke:Emit(50)
                Particles.Poof:Play()
                TimescaleUtilities.Delay(3, function() -- Line: 193 -- upvalues: Particles (val)
                    Particles:Destroy()
                end)
                u71:render(nil)
                u27:Destroy()
                a1_2()
            end)
            a3(function() -- Line: 201 -- upvalues: u71 (val), u27 (val)
                u71:render(nil)
                u27:Destroy()
            end)
        end)
    end,
    OnEquip = function(a1) -- Line: 207
        -- upvalues: TypedPromise (val), Players (val), u88 (ref), createPlacementRig (val), u90 (val), RunService (val)
        -- upvalues: PathPlacementCursorController (val), u89 (ref)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 208
            -- upvalues: a1 (val), Players (upval), u88 (upval), createPlacementRig (upval), u90 (upval)
            -- upvalues: RunService (upval), PathPlacementCursorController (upval), u89 (upval)
            if a1.Executor ~= Players.LocalPlayer then
                return
            end
            u88 = createPlacementRig()
            u88.Particles.Equip:Play()
            for k, v in pairs(u90) do
                v.p = Vector3.new(-0.7853981852531433, 0, 0)
                v.v = Vector3.new(1.0471975803375244, 0, 0)
            end
            local u27 = u88
            local Attachment1 = u27:WaitForChild("Flag").Attachment1
            local Parent = Attachment1.Parent
            local Parent_2 = Parent.Parent
            local a0 = Parent_2.Parent.a0
            local u37 = 0
            local u38 = nil
            local v1 = RunService.RenderStepped:Connect(function(a1) -- Line: 117
                -- upvalues: u27 (val), u38 (ref), u37 (ref), a0 (val), Attachment1 (val), Parent (val), Parent_2 (val)
                if u27.Parent == nil then
                    u38:Disconnect()
                    return
                end
                local v1 = Vector3.new(0, math.sin(u37 * 6) * 30, 0)
                local v2 = -(math.sin(u37 * 6 - 1.5707963267948966) + 1) / 5
                local v3 = math.sin(u37 * 6 / 2) / 5
                local v4 = math.sin(u37 * 6 / 3) / 10
                a0.Orientation = v1
                Attachment1.Orientation = v1
                Parent.WorldCFrame = Parent_2.WorldCFrame * CFrame.new(v2, v4, v3)
                u37 = (u37 + a1) % 6.283185307179586
            end)
            local CurrentPosition = PathPlacementCursorController.CurrentPosition

            local function updatePos() -- Line: 76
                -- upvalues: PathPlacementCursorController (upval), CurrentPosition (ref), u90 (upval), u88 (upval)
                local CurrentPosition_2 = PathPlacementCursorController.CurrentPosition
                if CurrentPosition_2 then
                    local v1 = CurrentPosition - CurrentPosition_2
                    local v2 = Vector3.new(math.rad(v1.Z), 0, -(math.rad(v1.X))) * 10
                    for k, v in pairs(u90) do
                        v.v = v.v + v2
                    end
                    u88:PivotTo((CFrame.new(CurrentPosition_2)))
                    CurrentPosition = CurrentPosition_2
                end
            end

            u89 = RunService.RenderStepped:Connect(function(a1) -- Line: 93 -- upvalues: updatePos (val), u90 (upval)
                local p
                updatePos()
                for k, v in pairs(u90) do
                    p = u90[k].p
                    k.Transform = CFrame.new() * CFrame.Angles(p.X, p.Y, p.Z)
                end
            end)
            a1_2(true)
        end)
    end,
    OnUnequip = function(a1) -- Line: 223 -- upvalues: TypedPromise (val), Players (val), u89 (ref), u88 (ref), u90 (val)
        return TypedPromise.new(function(a1_2) -- Line: 224 -- upvalues: a1 (val), Players (upval), u89 (upval), u88 (upval), u90 (upval)
            if a1.Executor ~= Players.LocalPlayer then
                return
            end
            if u89 then
                u89:Disconnect()
                u89 = nil
            end
            if u88 then
                u88:Destroy()
                u88 = nil
            end
            table.clear(u90)
            a1_2(true)
        end)
    end,
}