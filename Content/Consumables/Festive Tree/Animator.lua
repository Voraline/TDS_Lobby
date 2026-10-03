-- Script path: ReplicatedStorage.Content.Consumables.Festive Tree.Animator
-- Decompile time: 3.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local ConsumablesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.ConsumablesStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u64 = Color3.fromRGB(91, 154, 76)
local Assets = ReplicatedStorage.Assets
local CurrentCamera = workspace.CurrentCamera
local v1 = Assets.Effects.Client.ChristmasConsumables:WaitForChild("Festive Tree")
local Tree = v1.Tree
local Particles = v1.Particles
local u77 = nil
local u78 = nil

local function startPlacement(a1) -- Line: 29
    -- upvalues: u77 (ref), Tree (val), spr (val), Create (val), CurrentCamera (val), ConsumablesStore (val), u64 (val)
    -- upvalues: SpringClass (val), PathPlacementCursorController (val), u78 (ref), RunService (val)
    u77 = Tree:Clone()
    local PrimaryPart = u77.PrimaryPart
    u77:ScaleTo(0.1)
    spr.target(u77, 0.6, 1.75, {Scale = 1})
    Create("Highlight", {FillTransparency = 1, Parent = u77})
    local Tree_2 = PrimaryPart:WaitForChild("Tree")
    u77.Parent = CurrentCamera
    ConsumablesStore.create({range = 16, id = a1.Id, target = PrimaryPart, color = u64})
    local u42 = SpringClass.new(Vector3.new(), 0.8, 10)
    local CurrentPosition = PathPlacementCursorController.CurrentPosition
    u78 = RunService.Stepped:Connect(function(a1, a2) -- Line: 53
        -- upvalues: PathPlacementCursorController (upval), CurrentPosition (ref), u42 (val), Tree_2 (val), u77 (upval)
        local CurrentPosition_2 = PathPlacementCursorController.CurrentPosition
        local v1 = CurrentPosition_2 - CurrentPosition
        local Magnitude = v1.Magnitude
        u42.t = Vector3.new(
            math.clamp(v1.X / 2, -0.7853981633974483, 0.7853981633974483),
            0,
            (math.clamp(-v1.Z / 2, -0.7853981633974483, 0.7853981633974483))
        )
        Tree_2.Transform = CFrame.new() * CFrame.Angles(u42.p.Z, 0, 0) * CFrame.Angles(0, 0, u42.p.X)
        if Magnitude > 0 then
            u77:PivotTo((CFrame.new(CurrentPosition_2)))
            CurrentPosition = CurrentPosition_2
        end
    end)
end

local function stopPlacement(a1) -- Line: 75 -- upvalues: ConsumablesStore (val), u77 (ref), u78 (ref)
    ConsumablesStore.remove(a1.Id)
    if u77 then
        u77:Destroy()
        u77 = nil
    end
    if u78 then
        u78:Disconnect()
        u78 = nil
    end
end

return {
    OnEquip = function(a1) -- Line: 90
        -- upvalues: TypedPromise (val), startPlacement (val), ConsumablesStore (val), u77 (ref), u78 (ref)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 91
            -- upvalues: startPlacement (upval), a1 (val), ConsumablesStore (upval), u77 (upval), u78 (upval)
            startPlacement(a1)
            a3(function() -- Line: 93 -- upvalues: a1 (upval), ConsumablesStore (upval), u77 (upval), u78 (upval)
                local v1 = a1
                ConsumablesStore.remove(v1.Id)
                if u77 then
                    u77:Destroy()
                    u77 = nil
                end
                if u78 then
                    u78:Disconnect()
                    u78 = nil
                end
            end)
            a1_2(true)
        end)
    end,
    OnUnequip = function(a1) -- Line: 100 -- upvalues: TypedPromise (val), ConsumablesStore (val), u77 (ref), u78 (ref)
        return TypedPromise.new(function(a1_2) -- Line: 101 -- upvalues: a1 (val), ConsumablesStore (upval), u77 (upval), u78 (upval)
            ConsumablesStore.remove(a1.Id)
            if u77 then
                u77:Destroy()
                u77 = nil
            end
            if u78 then
                u78:Disconnect()
                u78 = nil
            end
            a1_2(true)
        end)
    end,
    OnUse = function(a1) -- Line: 106
        -- upvalues: TypedPromise (val), Tree (val), Particles (val), CurrentCamera (val), TimescaleUtilities (val)
        -- upvalues: EmitterManager (val), spr (val), ConsumablesStore (val), u64 (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 107
            -- upvalues: a1 (val), Tree (upval), Particles (upval), CurrentCamera (upval), TimescaleUtilities (upval)
            -- upvalues: EmitterManager (upval), spr (upval), ConsumablesStore (upval), u64 (upval)
            local Context = a1.Context
            local Replicator = a1.Replicator
            local Folder = Replicator.Folder
            local u11 = Tree:Clone()
            local PrimaryPart = u11.PrimaryPart
            u11:PivotTo((CFrame.new(Context.position)))
            u11.Parent = workspace
            local v1 = Particles:Clone()
            v1.Position = Context.position + Vector3.new(0, v1.Size.Y / 2, 0)
            v1.Parent = CurrentCamera
            TimescaleUtilities.CleanUp(v1, 5)
            EmitterManager.manualEmit(v1)
            PrimaryPart.Place:Play()
            u11:ScaleTo(0.1)
            spr.target(u11, 0.6, 1.75, {Scale = 1})
            task.delay(0.1, function() -- Line: 128
                -- upvalues: ConsumablesStore (upval), a1 (upval), PrimaryPart (val), u64 (upval), Context (val)
                -- upvalues: Replicator (val)
                ConsumablesStore.create({
                    infoOffset = Vector3.new(0, 7, 0),
                    id = a1.Id,
                    target = PrimaryPart,
                    color = u64,
                    range = Context.radius,
                    owner = a1.Executor,
                    replicator = Replicator,
                })
            end)

            local function cleanUp() -- Line: 140
                -- upvalues: u11 (val), ConsumablesStore (upval), a1 (upval), Particles (upval), Context (val)
                -- upvalues: CurrentCamera (upval), TimescaleUtilities (upval), EmitterManager (upval)
                u11:Destroy()
                ConsumablesStore.remove(a1.Id)
                local v1 = Particles:Clone()
                v1.Position = Context.position + Vector3.new(0, v1.Size.Y / 2, 0)
                v1.Parent = CurrentCamera
                TimescaleUtilities.CleanUp(v1, 5)
                EmitterManager.manualEmit(v1)
            end

            Folder.Destroying:Once(function() -- Line: 151 -- upvalues: cleanUp (val), a1_2 (val)
                cleanUp()
                a1_2()
            end)
        end)
    end,
}