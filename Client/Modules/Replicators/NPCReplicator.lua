-- Script path: ReplicatedStorage.Client.Modules.Replicators.NPCReplicator
-- Decompile time: 87.16 ms

local Highlight, Model, scanReplace, v1
local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local CharmUtil = require(ReplicatedStorage.Shared.Modules.CharmUtil)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
require(ReplicatedStorage.Client.Modules.Replicators.ClientGameMiddleware)
local DebugController = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local HumanoidUtil = require(ReplicatedStorage.Shared.Modules.HumanoidUtil)
local NPCUtils = require(ReplicatedStorage.Shared.Modules.NPCUtils)
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SpringValue = require(ReplicatedStorage.Client.Interfaces.Hooks.Utility.SpringValue)
local StatusEffectRenderer = require(ReplicatedStorage.Client.Modules.StatusEffects.StatusEffectRenderer)
local TaggedInstances = require(ReplicatedStorage.Shared.Modules.TaggedInstances)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TransientVFX = require(ReplicatedStorage.Client.Modules.TransientVFX)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Upgrades = require(ReplicatedStorage.Shared.Modules.Upgrades)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local u378 = {}
u378.__index = u378

function u378.__tostring(a1) -- Line: 47
    return "NPC_" .. a1.Name
end

local Folder = Instance.new("Folder")
Folder.Name = "NPCs"
Folder.Parent = workspace
local v2 = {"Red", "Blue"}
local v3 = nil
local v4 = nil
for i, j in v2, v3, v4 do
    Model = Instance.new("Model")
    Model.Name = j
    Model.Parent = Folder
    Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 1
    Highlight.OutlineTransparency = 0.5
    v1 = not (j ~= "Red") and Color3.fromRGB(255, 71, 71) or Color3.fromRGB(0, 170, 255)
    Highlight.OutlineColor = v1
    Highlight.Parent = Model
end
local Enemies = ReplicatedStorage.Assets.Enemies
local NewEnemies = ReplicatedStorage.Assets.NewEnemies
local u187 = Random.new()
local u188 = {}
local u189 = {}
local u190 = {}
local u191 = {}

function scanReplace(a1) -- Line: 83 -- upvalues: ReplicatedStorage (val), scanReplace (val), u378 (val)
    local v1
    local UnitReplicator = require(ReplicatedStorage.Client.Modules.Replicators.UnitReplicator)
    require(ReplicatedStorage.Shared.Modules.HumanoidUtil)
    for k, v in pairs(a1) do
        if typeof(v) == "table" then
            scanReplace(v)
        end
        if typeof(v) == "Instance" and v:IsA("Folder") then
            v1 = u378.GetNPCFromFolder(v) or UnitReplicator.GetNPCFromFolder(v)
            if v1 then
                v2[k] = v1.Model
            end
        end
    end
end

local function lerp(a1, a2, a3) -- Line: 103
    return a1 * (1 - a3) + a2 * a3
end

local Gizmo = DebugController.Gizmo
DebugController.createGizmo("Enemy Hitboxes", function() -- Line: 109 -- upvalues: Gizmo (val), u190 (val)
    Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(255, 141, 141))
    for i, j in u190 do
        if j.Type ~= "Units" then
            Gizmo.Box:Draw(j.Hitbox.CFrame, j.Hitbox.Size, false)
        end
    end
end)
DebugController.createGizmo("Unit Hitboxes", function() -- Line: 119 -- upvalues: Gizmo (val), u190 (val)
    Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(141, 166, 255))
    for i, j in u190 do
        if j.Type == "Units" then
            Gizmo.Box:Draw(j.Hitbox.CFrame, j.Hitbox.Size, false)
        end
    end
end)
;(Network.Channel("Replicate")):On("NPCInstance", function(a1) -- Line: 129 -- upvalues: u189 (val), scanReplace (val)
    for i, j in a1 do
        task.spawn(function() -- Line: 131 -- upvalues: j (val), u189 (upval), scanReplace (upval)
            local v1 = j[2]
            local v2 = j[1]
            local v3 = {(unpack(j, 3))}
            local v4 = u189[v1]
            if v4 then
                scanReplace(v3)
                if not v4.Executables[v2] then
                    warn("NPC " .. v4.Name .. " has no executable " .. v2)
                    return
                end
                v4.Executables[v2](unpack(v3))
            end
        end)
    end
end)

function u378.new(a1, a2) -- Line: 154
    -- upvalues: Asset (val), GameState (val), NewEnemies (val), Enemies (val), u378 (val), Maid (val)
    -- upvalues: HumanoidUtil (val), Signal (val), TaggedInstances (val), CollectionService (val), Upgrades (val)
    -- upvalues: SpringValue (val), u191 (val), Folder (val), NPCUtils (val), ReplicatedStorage (val), u187 (val)
    -- upvalues: TimescaleUtilities (val), TagReplicator (val), StatusEffectRenderer (val), u190 (val), u189 (val)
    -- upvalues: u188 (val), ParticleLODController (val), TweenService (val), ClientAtoms (val), CharmUtil (val)
    local v1
    local StatusEffects = a2.Folder:WaitForChild("StatusEffects", 5)
    if not StatusEffects then
        return
    end
    local v2 = Asset("NewEnemies", a2:WaitForState("ModelName"))
    local Animator = v2.Animator
    local v3 = a2:Get("Legacy")
    local v4 = a2:WaitForState("ModelName")
    local v5 = a2:Get("EnemySkinName")
    local NewGameModes = GameState.NewGameModes and not v3
    local v6 = (NewGameModes and NewEnemies or Enemies):FindFirstChild(v4)
    if v3 then
        v6 = (NewGameModes and NewEnemies or Enemies):FindFirstChild((("%* Legacy"):format(v4))) or v6
    end
    assert(v6, "Enemy model " .. v4 .. " does not exist.")
    local v7 = Animator and setmetatable(Animator, u378) or u378
    local u88 = setmetatable({}, v7)
    u88.Maid = Maid.new()
    local v8 = a2:Get("HasNewModel") == true
    local NewModel = if not v5 then v8 and v6:FindFirstChild("NewModel") and v6.NewModel or v6.Model else v6[v5]
    u88.FBXModel = HumanoidUtil.findFirstRigBone(NewModel)
    u88.Model = NewModel:Clone()
    u88.Model.Name = ("%*Enemy"):format(v4)
    u88.BoneVFX = u88.Model:FindFirstChild("BoneVFX")
    local v9, v10 = HumanoidUtil.createAnimationHost(u88.Model, u88.FBXModel ~= nil)
    u88.AnimationController = v9
    u88.AnimationAnimator = v10
    u88.BaseScale = u88.Model:GetScale()
    u88.StateScale = a2:Get("Scale") or 1
    if u88.StateScale ~= 1 then
        u88.Model:ScaleTo(u88.StateScale * u88.BaseScale)
    end
    u88.Model.PrimaryPart.Anchored = true
    u88.PrimaryPart = u88.Model.PrimaryPart
    u88.HumanoidRootPart = u88.Model.PrimaryPart
    u88.OnDestroy = Signal.new()
    u88.Tagged = TaggedInstances.getTaggedInstances(u88.Model)
    local ExtentsSize = u88.Model:GetExtentsSize()
    v10 = (ExtentsSize.X + ExtentsSize.Z) / 3
    u88.Height = ExtentsSize.Y / 2
    u88.HeightYOffset = 0
    u88.RenderRadius = ExtentsSize.Magnitude / 2
    if u88.Model:FindFirstChild("Hitbox") then
        u88.Hitbox = u88.Model.Hitbox
    else
        local Part = Instance.new("Part")
        Part.Name = "Hitbox"
        Part.Anchored = false
        Part.CanCollide = false
        Part.CanTouch = false
        Part.CanQuery = true
        Part.Transparency = 1
        Part.Size = Vector3.new(v10, math.abs(u88.PrimaryPart.Node.Position.Y) * 2, v10)
        Part.CFrame = u88.Model:GetPivot()
        Part.Parent = u88.Model
        u88.Hitbox = Part
        CollectionService:AddTag(Part, "NPCHitbox")
    end
    local WeldConstraint = Instance.new("WeldConstraint")
    WeldConstraint.Part0 = u88.Model.PrimaryPart
    WeldConstraint.Part1 = u88.Hitbox
    WeldConstraint.Parent = u88.Model.PrimaryPart
    local Death = u88.Model:FindFirstChild("Death")
    if Death then
        local Death_2 = Death:FindFirstChild("Death")
        if Death_2 and Death_2:IsA("Sound") then
            Death_2.PlaybackSpeed = (Random.new():NextNumber(0.8, 1.2)) * Death_2.PlaybackSpeed
            u88.Model.Head.Death.PlayOnRemove = true
        end
    end
    u88.Type = a2:WaitForState("Type")
    u88.Upgrade = a2:Get("Upgrade") or 0
    if u88.Type == "Units" and u88.Model:FindFirstChild("UpgradesModule") then
        local Upgrade = u88.Upgrade
        for i = 1, Upgrade do
            Upgrades.upgrade(u88, i, "unit")
        end
    end
    u88.FolderPointer = Instance.new("ObjectValue")
    u88.FolderPointer.Name = "RootPointer"
    u88.FolderPointer.Value = a1
    u88.FolderPointer.Parent = u88.Model
    u88.ShouldLoop = a2:Get("ShouldLoop")
    u88.ScalePositionOffset = Vector3.new(1, 1, 1)
    u88.PositionOffset = -u88.PrimaryPart.Node.Position
    u88.PositionOffsetScaleBaseline = u88.Model:GetScale()
    u88.AdditiveOffset = a2:Get("PositionOffset")
    u88.DisableSpawnTween = a2:Get("DisableSpawnTween")
    u88.EntityId = a2:Get("ID")
    u88.ForcePosition = a2:Get("ForcePosition")
    u88._forcePositionChanged = u88.ForcePosition ~= nil
    u88.Maid:Mark(((a2:GetStateChangedSignal("ForcePosition")):Connect(function(a1) -- Line: 277 -- upvalues: u88 (val), a2 (val)
        u88.ForcePosition = a1
        u88._forcePositionChanged = true
        if a1 == nil then
            local PathDistance = a2:Get("PathDistance") or u88.PathDistance
            u88.PathDistance = PathDistance
        end
    end)))
    u88.Team = a2:WaitForState("Team")
    local v11 = a2:WaitForState("PathName")
    local v12 = a2:WaitForState("PathTeam")
    u88.PathName = v11
    u88.PathTeam = tostring(v12)
    u88.UpdateScale = false
    u88.ScaleSpring = SpringValue.new(1, 5, 0.5)
    u88.ControllerStats = v2.Stats.ControllerStats
    u88.Stats = v2.Stats
    u88.IntroPathName = a2:Get("IntroPathName")
    if u88.IntroPathName then
        u88.IntroPath = GameState.Paths[u88.PathTeam][u88.IntroPathName]
        u88.IntroDone = false
    end
    local v13 = GameState.Paths[u88.PathTeam][tonumber(v11)] or GameState.Paths[u88.PathTeam][v11]
    u88.Path = v13
    if not u191[v13] then
        u191[v13] = {}
    end
    local v14 = u191[v13]
    v14[u88] = true
    u88.Replicator = a2
    u88.PathDistance = a2:Get("PathDistance") or 0
    u88.LastPathDistance = u88.PathDistance
    if u88.Path then
        pcall(function() -- Line: 320 -- upvalues: u88 (val)
            local Scalar = u88.Path:GetScalar(u88.PathDistance)
            u88.Model:PivotTo((CFrame.new(Scalar)))
            u88.Position = Scalar
        end)
    end
    local u493 = Folder
    u88.Model.Parent = u493
    NPCUtils.configureModelParts(u88.Model)
    local Magnitude = (u88.Model:GetExtentsSize()).Magnitude
    local v15 = if ReplicatedStorage.State.Mode.Value == "DefendTheCenter" then 0 else if ReplicatedStorage.State.Mode.Value ~= "Duck Hunt" then math.clamp((15 - Magnitude) / 15, 0, 1) else 0
    if u88.Type ~= "Units" then
        v1 = ReplicatedStorage.Assets.Effects.Mob.DeathEffect:Clone()
        u88.Effect = v1
        u88.Particles = {}
        local Head = u88.Model:FindFirstChild("Head") or u88.Model:FindFirstChild("Torso") or u88.Model.PrimaryPart
        local v16 = u88.Model:FindFirstChild("Torso") or Head
        if not u88.HumanoidRootPart:FindFirstChild("DeathParticle") then
            for k, v in pairs(v1.MainAttachment:GetChildren()) do
                table.insert(u88.Particles, v)
                v.Enabled = false
                if v.Name ~= "Chunks2" then
                    v.Color = ColorSequence.new(Head.Color)
                else
                    v.Color = ColorSequence.new(v16.Color)
                end
            end
        else
            local v17
            for k2, j in pairs(u88.HumanoidRootPart.DeathParticle:GetChildren()) do
                v17 = j:Clone()
                v17.Parent = v1.MainAttachment
                table.insert(u88.Particles, v17)
            end
        end
    end
    v1 = a2:Get("PathOffset") or u187:NextNumber(-v15, v15)
    u88.PathOffset = v1
    u88.Lifespan = a2:Get("Lifespan")
    u88.Health = a2:WaitForState("Health")
    u88.MaxHealth = a2:WaitForState("MaxHealth")
    u88.Shield = a2:Get("Shield") or 0
    u88.MaxShield = a2:Get("MaxShield") or 0
    ;(u88.Replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 377 -- upvalues: u88 (val)
        u88.Health = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("Shield")):Connect(function(a1) -- Line: 380 -- upvalues: u88 (val)
        u88.Shield = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("MaxHealth")):Connect(function(a1) -- Line: 383 -- upvalues: u88 (val)
        u88.MaxHealth = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("Scale")):Connect(function(a1) -- Line: 386 -- upvalues: u88 (val)
        u88.StateScale = a1 or 1
        local Value = u88.ScaleSpring:GetValue()
        if not u88.FBXModel then
            u88.Model:ScaleTo(u88.BaseScale * u88.StateScale * Value)
            u88.RenderRadius = u88.Model:GetExtentsSize().Magnitude / 2
        end
        u88.ScalePositionOffset = Vector3.new(1, Value, 1)
    end)
    u88.BaseSpeed = a2:WaitForState("BaseSpeed")
    u88.SpeedLerp = a2:Get("SpeedLerp")
    u88.Speed = a2:WaitForState("Speed")
    u88.NewSpeed = u88.Speed
    u88.ForceSpeed = a2:Get("ForceSpeed") or 0
    u88.FakeUnit = a2:Get("FakeUnit") == true
    ;(u88.Replicator:GetStateChangedSignal("FakeUnit")):Connect(function(a1) -- Line: 403 -- upvalues: u88 (val), TimescaleUtilities (upval)
        u88.FakeUnit = a1
        if u88.FakeUnit then
            u88.Type = "Units"
            TimescaleUtilities.Delay(0.1, function() -- Line: 408 -- upvalues: u88 (upval)
                for i, j in u88.AnimationAnimator:GetPlayingAnimationTracks() do
                    if j.Name:lower():sub(1, 4) ~= "walk" then
                        j:Stop()
                        j:Destroy()
                    end
                end
            end)
        end
    end)
    u88.TimeScaled = a2:Get("TimeScaled")
    ;(u88.Replicator:GetStateChangedSignal("TimeScaled")):Connect(function(a1) -- Line: 422 -- upvalues: u88 (val)
        u88.TimeScaled = a1
    end)
    u88.Reverse = a2:Get("Reverse")
    ;(u88.Replicator:GetStateChangedSignal("Reverse")):Connect(function(a1) -- Line: 427 -- upvalues: u88 (val)
        u88.Reverse = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("SpeedLerp")):Connect(function(a1) -- Line: 431 -- upvalues: u88 (val)
        u88.SpeedLerp = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1) -- Line: 435 -- upvalues: u88 (val)
        if u88.Speed ~= a1 then
            u88.Speed = a1
            u88._pendingAdjustWalkSpeed = true
        end
        u88.NewSpeed = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("ForceSpeed")):Connect(function(a1) -- Line: 447 -- upvalues: u88 (val)
        u88.ForceSpeed = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("Lifespan")):Connect(function(a1) -- Line: 450 -- upvalues: u88 (val)
        u88.Lifespan = a1
    end)
    ;(u88.Replicator:GetStateChangedSignal("PathDistance")):Connect(function(a1) -- Line: 454 -- upvalues: u88 (val)
        if u88.NewSpeed == 0 or 0.5 < (math.abs(u88.PathDistance - a1)) then
            u88.PathDistance = a1
        end
    end)
    u88.TimeScaleChanged = (GameState.Replicator:GetStateChangedSignal("TimeScale")):Connect(function(a1) -- Line: 464 -- upvalues: u88 (val)
        u88:AdjustWalkSpeed(a1)
    end)
    task.defer(function() -- Line: 469 -- upvalues: u88 (val), u493 (val)
        while u88.Model.Parent ~= u493 do
            task.wait()
        end
        if not u88.Model.Animations:FindFirstChild("Walk") then
            return
        end
        local Walk = if not u88.Model.Animations.Walk:IsA("Folder") then u88.Model.Animations.Walk else (u88.Model.Animations.Walk:GetChildren())[math.random(1, #u88.Model.Animations.Walk:GetChildren())]
        local RageWalk = u88.Model.Animations:FindFirstChild("RageWalk")
        if RageWalk then
            RageWalk = u88.AnimationAnimator:LoadAnimation(RageWalk)
        end
        u88.RageWalkAnimation = RageWalk
        local v1 = u88.AnimationAnimator:LoadAnimation(Walk)
        local AnimSpeed = u88.PrimaryPart:FindFirstChild("AnimSpeed")
        local Attribute = Walk:GetAttribute("Speed")
        u88.WalkAnimSpeed = AnimSpeed and AnimSpeed.Value or Attribute or 1
        u88.WalkTrack = v1
        while u88.WalkTrack.Length == 0 do
            task.wait()
        end
        u88:AdjustWalkSpeed()
    end)
    ;(u88.Replicator:GetStateChangedSignal("RageWalk")):Connect(function() -- Line: 511 -- upvalues: u88 (val)
        if not u88.RageWalkAnimation then
            return
        end
        if u88.WalkTrack then
            u88.WalkTrack:Stop(0)
        end
        u88.WalkTrack = u88.RageWalkAnimation
        u88.WalkTrack:Play()
        u88:AdjustWalkSpeed()
    end)
    if u88.Replicator:Get("RageWalk") and u88.RageWalkAnimation then
        if u88.WalkTrack then
            u88.WalkTrack:Stop(0)
        end
        u88.WalkTrack = u88.RageWalkAnimation
        u88.WalkTrack:Play()
        u88:AdjustWalkSpeed()
    end
    u88._onStepFunctions = {}
    u88.Maid:Mark(function() -- Line: 530 -- upvalues: u88 (val), u191 (upval)
        table.clear(u88._onStepFunctions)
        local Path = u88.Path
        local v1 = u191[Path]
        if not v1 then
            return
        end
        v1[u88] = nil
        if not next(v1) then
            u191[Path] = nil
        end
    end)
    pcall(function() -- Line: 546 -- upvalues: u88 (val)
        u88.Model:PivotTo((CFrame.new((u88.Path:GetScalar(u88.PathDistance)) + Vector3.new(0, u88.PositionOffset.Y, 0))))
    end)
    u88.Stopped = a2:Get("Stopped")
    ;(u88.Replicator:GetStateChangedSignal("Stopped")):Connect(function(a1) -- Line: 553 -- upvalues: u88 (val)
        u88.Stopped = a1
    end)
    u88.OwnerName = a2:Get("OwnerName")
    u88.Defense = a2:Get("Defense")
    ;(u88.Replicator:GetStateChangedSignal("Defense")):Connect(function(a1) -- Line: 559 -- upvalues: u88 (val)
        u88.Defense = a1
    end)
    local v18 = a2:Get("DisplayName") or a2:Get("ModelName")
    u88.Name = v18
    ;(u88.Replicator:GetStateChangedSignal("DisplayName")):Connect(function(a1) -- Line: 564 -- upvalues: u88 (val)
        u88.Name = a1
    end)
    u88.Modifiers = TagReplicator.getReplicatorEntityFromFolder(StatusEffects)
    u88.Maid:Mark(u88.Modifiers)
    u88.StatusEffectRenderer = StatusEffectRenderer.new(u88, StatusEffects, u88.Modifiers)
    u88.Maid:Mark(u88.StatusEffectRenderer)
    u190[u88.Model] = u88
    u189[a1] = u88
    table.insert(u188, u88)
    ParticleLODController.registerModel(u88.Model, function() -- Line: 579 -- upvalues: u88 (val)
        return u88.Model.PrimaryPart and u88.Model.PrimaryPart.Position or Vector3.new(0, 0, 0)
    end)
    u88.Maid:Mark(function() -- Line: 583 -- upvalues: u188 (upval), u88 (val)
        local v1 = table.find(u188, u88)
        if v1 then
            table.remove(u188, v1)
        end
    end)
    u88.Maid:Mark(function() -- Line: 590 -- upvalues: u189 (upval), a1 (val)
        u189[a1] = nil
    end)
    u88.Maid:Mark(function() -- Line: 594 -- upvalues: ParticleLODController (upval), u88 (val), u190 (upval)
        ParticleLODController.unregisterModel(u88.Model)
        u190[u88.Model] = nil
        u88.Model:Destroy()
    end)
    if u88.Initialize then
        u88:Initialize()
    end
    task.delay(0, function() -- Line: 604 -- upvalues: a1 (val), u88 (val)
        local LayeredHats = a1:WaitForChild("LayeredHats", 1)
        if LayeredHats then
            for k, v in pairs(LayeredHats:GetChildren()) do
                u88:EquipHat(v.Value, true, not (v.Value:GetAttribute("NoLayer")))
            end
        end
    end)
    if not u88.Executables then
        u88.Executables = {}
    end

    function u88.Executables.LegacyFace(a1, a2) -- Line: 618 -- upvalues: u88 (val), TweenService (upval)
        local HumanoidRootPart = u88.HumanoidRootPart
        if a2 then
            TweenService:Create(HumanoidRootPart, a2, {
                CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1.X, HumanoidRootPart.Position.Y, a1.Z))),
            }):Play()
            return
        end
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1.X, HumanoidRootPart.Position.Y, a1.Z)))
    end

    if u88.FakeUnit then
        u88.Type = "Units"
    end
    ClientAtoms.enemyReplicators(function(a1_2) -- Line: 640 -- upvalues: CharmUtil (upval), a1 (val), u88 (val)
        return CharmUtil.set(a1_2, a1, u88)
    end)
    u88.Maid:Mark(function() -- Line: 644 -- upvalues: ClientAtoms (upval), CharmUtil (upval), a1 (val)
        ClientAtoms.enemyReplicators(function(a1_2) -- Line: 645 -- upvalues: CharmUtil (upval), a1 (upval)
            return CharmUtil.deleteKey(a1_2, a1)
        end)
    end)
    return u88
end

function u378.SetWalkAnimation(a1, a2) -- Line: 653 -- types: a1: table, a2: string
    local v1 = a1.Model.Animations:FindFirstChild(a2)
    if not v1 then
        return
    end
    a1.WalkTrack:Stop(0)
    a1.WalkTrack = a1.AnimationAnimator:LoadAnimation(v1)
    a1.WalkTrack:Play()
    a1:AdjustWalkSpeed()
end

function u378.LoadAnimations(a1) -- Line: 665 -- upvalues: Animation (val)
    a1._animations = {}
    for i, j in a1.Model:WaitForChild("Animations"):GetChildren() do
        if j:IsA("Animation") and j.Name ~= "Walk" then
            a1._animations[j.Name] = (Animation.new({
                IsPersistent = true,
                IgnorePriority = true,
                Preload = true,
                Track = j,
                Target = a1.AnimationAnimator,
                Entity = a1,
            }))
        end
    end
end

function u378.PlayAnimation(a1, a2, a3) -- Line: 681
    a1._animations[a2]:Play(a3)
end

function u378.StopAnimation(a1, a2) -- Line: 685
    a1._animations[a2]:Stop()
end

function u378.WaitForAnimationFrame(a1, a2, a3) -- Line: 689
    return a1._animations[a2].Controller:GetMarkerReachedSignal(a3):Wait()
end

function u378.SetYHeight(a1, a2) -- Line: 693 -- types: a1: table, a2: number
    a1.HeightYOffset = a2
end

function u378.AnimateYOffset(a1, a2, a3) -- Line: 697
    -- upvalues: RunService (val), TweenService (val)
    local HeightYOffset = a1.HeightYOffset
    local u4 = 0
    local u5 = nil
    local v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 704
        -- upvalues: u4 (ref), a3 (val), TweenService (upval), HeightYOffset (val), a2 (val), a1 (val), u5 (ref)
        local v1 = u4
        u4 = v1 + a1_2 / (a3 and a3.Time or 0.5)
        local Value = TweenService:GetValue(u4, a3.EasingStyle, a3.EasingDirection)
        a1.HeightYOffset = HeightYOffset * (1 - Value) + a2 * Value
        if u4 >= 1 then
            a1.HeightYOffset = a2
            u5:Disconnect()
        end
    end)
end

function u378:IsAlive() -- Line: 717
    local v1 = false
    if 0 < self.Health then
        v1 = self.Maid ~= nil
    end
    return v1
end

function u378.GetNPCFromFolder(a1) -- Line: 721 -- upvalues: u189 (val)
    return u189[a1]
end

function u378.GetNPCFromModel(a1) -- Line: 725 -- upvalues: u190 (val)
    return u190[a1]
end

function u378.Wait(a1, a2) -- Line: 729 -- upvalues: TimescaleUtilities (val)
    return TimescaleUtilities.Wait(a2)
end

function u378.Delay(a1, a2, a3) -- Line: 733 -- upvalues: TimescaleUtilities (val)
    if a3 then
        return TimescaleUtilities.Delay(a2, a3)
    end
    return TimescaleUtilities.Wait(a2)
end

function u378.Tween(a1, a2, a3, a4) -- Line: 742
    -- upvalues: GameState (val), TweenService (val)
    local TimeScale = a1.TimeScaled and GameState.TimeScale or 1
    return TweenService:Create(
        a2,
        TweenInfo.new(a3.Time / TimeScale, a3.EasingStyle, a3.EasingDirection, a3.RepeatCount, a3.Reverses, a3.DelayTime / TimeScale),
        a4
    )
end

function u378:AdjustWalkSpeed(a2) -- Line: 757
    -- upvalues: GameState (val), u187 (val)
    local v1 = a2 or GameState.TimeScale
    if not self.TimeScaled then
        v1 = 1
    end
    if not self.WalkTrack then
        return
    end
    if not self.WalkTrack.IsPlaying then
        self.WalkTrack:Play()
        task.defer(function() -- Line: 774 -- upvalues: self (val), u187 (upval)
            self.WalkTrack.TimePosition = u187:NextNumber(0, self.WalkTrack.Length)
        end)
    end
    self.WalkTrack:AdjustSpeed(self.Speed / (self.WalkTrack.Length * 2.7) * self.WalkAnimSpeed * v1)
end

local function findHeadBone(a1) -- Line: 785 -- types: a1: userdata
    local v1
    local v2 = nil
    for i, j in a1:GetDescendants() do
        if j:IsA("Bone") and not j:FindFirstAncestor("BoneVFX") then
            v1 = string.lower(j.Name)
            if v1 == "head" then
                return j
            end
            if not v2 and string.find(v1, "head", 1, true) then
                v2 = j
            end
        end
    end
    return v2
end

function u378:EquipBoneHat(a2, a3, a4) -- Line: 803 -- types: self: table, a2: userdata, a3: userdata, a4: boolean
    local PrimaryPart = if not a2:IsA("BasePart") then a2.PrimaryPart else a2
    local v1 = a3:FindFirstAncestorWhichIsA("BasePart")
    if PrimaryPart and v1 then
        local FBXHeadHeight = self.FBXHeadHeight or self.Model:GetExtentsSize().Y * 0.2 / self.Model:GetScale()
        self.FBXHeadHeight = FBXHeadHeight
        local v2 = self.FBXHeadHeight * self.Model:GetScale()
        if a4 then
            local v3 = v2 / 0.5709999799728394
            if not a2:IsA("BasePart") then
                a2:ScaleTo((a2:GetScale()) * v3)
            else
                a2.Size = a2.Size * v3
            end
        end
        local TransformedWorldCFrame = a3.TransformedWorldCFrame
        local v4 = TransformedWorldCFrame:ToObjectSpace((v1.CFrame.Rotation + TransformedWorldCFrame.Position + v1.CFrame.UpVector * v2 * 0.9) * (PrimaryPart.CFrame:ToObjectSpace((a2:GetPivot())):Inverse()))
        for i, j in if not a2:IsA("BasePart") then a2:GetDescendants() else {a2} do
            if j:IsA("BasePart") then
                j.Anchored = false
                j.CanCollide = false
                j.Massless = true
            end
        end
        local Weld = Instance.new("Weld")
        Weld.Part0 = v1
        Weld.Part1 = PrimaryPart
        Weld.C0 = v1.CFrame:ToObjectSpace(TransformedWorldCFrame * v4)
        Weld.Parent = PrimaryPart
        a2.Parent = self.Model
        local BoneHats = self.BoneHats or {}
        self.BoneHats = BoneHats
        table.insert(self.BoneHats, {weld = Weld, bone = a3, offset = v4, scale = self.Model:GetScale()})
        return true
    end
    a2:Destroy()
    return false
end

function u378:UpdateBoneHats() -- Line: 857
    local Part0, offset, v1
    local Scale = self.Model:GetScale()
    for i = #self.BoneHats, 1, -1 do
        v1 = self.BoneHats[i]
        Part0 = v1.weld.Part0
        if not v1.weld.Parent then
            table.remove(self.BoneHats, i)
        elseif Part0 then
            offset = v1.offset
            if Scale ~= v1.scale then
                offset = offset.Rotation + offset.Position * (Scale / v1.scale)
            end
            v1.weld.C0 = Part0.CFrame:ToObjectSpace(v1.bone.TransformedWorldCFrame * offset)
        else
            table.remove(self.BoneHats, i)
        end
    end
    if #self.BoneHats == 0 then
        self.BoneHats = nil
    end
end

function u378:EquipHat(a2, a3, a4) -- Line: 877
    -- upvalues: findHeadBone (val)
    if self.Hat and not a4 then
        self.Hat:Destroy()
    end
    local v1 = if not self.FBXModel then nil else findHeadBone(self.Model)
    if v1 then
        local v2 = a2:Clone()
        if self:EquipBoneHat(v2, v1, a3) and not a4 then
            self.Hat = v2
        end
        return
    end
    local Head = self.Model:FindFirstChild("Head")
    if Head then
        local v3 = a2:Clone()
        v3:PivotTo(Head.CFrame * (CFrame.new(0, Head.Size.Y * 0.49, 0)))
        if a3 then
            v3.Size = v3.Size * ((math.max(Head.Size.X, Head.Size.Y, Head.Size.Z)) / 0.5709999799728394)
        end
        v3.Parent = Head.Parent
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = Head
        WeldConstraint.Part1 = v3
        WeldConstraint.Parent = v3
        if not a4 then
            self.Hat = v3
        end
    end
end

function u378.RefreshAllNPCsByPath(a1, a2) -- Line: 914 -- upvalues: u191 (val) -- types: a2: number?
    if not u191[a1] then
        return
    end
    for i, j in u191[a1] do
        if i:IsAlive() and i.PathDistance <= (a2 or (1 / 0)) then
            i:RefreshPath()
        end
    end
end

function u378:RefreshPath(a2, a3, a4) -- Line: 926
    -- upvalues: u191 (val), GameState (val), EmitterManager (val)
    local Path = self.Path
    local v1 = u191[Path]
    v1[self] = nil
    if not next(u191[Path]) then
        u191[Path] = nil
    end
    v1 = GameState.Paths[self.PathTeam][self.PathName] or GameState.Paths[self.PathTeam][tonumber(self.PathName)]
    self.Path = v1
    if not u191[self.Path] then
        u191[self.Path] = {}
    end
    v1 = u191[self.Path]
    v1[self] = true
    if not a4 then
        EmitterManager.Emit(a2 or "SnowExplosion", CFrame.new(self.Position))
    end
    if not a4 and not a3 then
        self.PathDistance = self.PathDistance / 2
    end
    self.DistanceToEnd = self.Path:GetDistanceToEnd(self.PathDistance)
    self.Position = self.Path:GetScalar(self.PathDistance)
    task.delay(0, function() -- Line: 954 -- upvalues: a4 (val), EmitterManager (upval), a2 (val), self (val)
        if a4 then
            return
        end
        local v1 = a2 or "SnowExplosion"
        EmitterManager.Emit(v1, CFrame.new(self.Position))
    end)
end

function u378.ScaleBy(a1, a2, a3, a4) -- Line: 962 -- types: a1: table, a2: number, a3: number?, a4: number?
    if a1.Model:FindFirstChild("Head") and a1.Model.Head:FindFirstChild("Death") then
        local Death = a1.Model.Head.Death
        Death.PlaybackSpeed = Death.PlaybackSpeed / a2
    end
    if a1.FBXModel then
        a1.Model:ScaleTo(a2 * a1.PositionOffsetScaleBaseline)
        a1.ScalePositionOffset = Vector3.new(1, a2, 1)
        return
    end
    if a3 then
        a1.ScaleSpring:SetSpeed(a3)
    end
    if a4 then
        a1.ScaleSpring:SetDamper(a4)
    end
    a1.ScaleSpring:SetGoal(a2)
    a1.UpdateScale = true
end

function u378.BindToStep(a1, a2, a3) -- Line: 987 -- types: a1: table, a2: string, a3: function
    a1._onStepFunctions[a2] = a3
end

function u378:Destroy() -- Line: 991 -- upvalues: TransientVFX (val), SoundService (val)
    if self.TimeScaleChanged then
        self.TimeScaleChanged:Disconnect()
        self.TimeScaleChanged = nil
    end
    if self.Maid then
        if self.Type ~= "Units" then
            local Attribute_2
            debug.profilebegin("VFX_NPCDeathEffectEmit")
            self.Effect.Parent = workspace.Trash
            self.Effect:PivotTo((CFrame.new(self.Model:FindFirstChild("Head") and self.Model.Head.Position or self.Model.PrimaryPart.Position)))
            TransientVFX.track(self.Effect, {ttl = 3, profileName = "NPCDeathEffect"})
            for k, v in pairs(self.Particles) do
                Attribute_2 = v:GetAttribute("EmitCount")
                v:Emit(Attribute_2 or 7)
            end
            local HumanoidRootPart = self.Model:FindFirstChild("HumanoidRootPart") and self.HumanoidRootPart:FindFirstChild("DeathEffect")
            if HumanoidRootPart then
                local v1
                local v2 = HumanoidRootPart:Clone()
                local WorldPosition = v2.WorldPosition
                v2.Parent = workspace.Trash
                v2.WorldPosition = WorldPosition
                local v3 = 0
                for k2, i in pairs(v2:GetDescendants()) do
                    if i:IsA("ParticleEmitter") then
                        v3 = math.max(v3, i.Lifetime.Max)
                        v1 = tonumber((i:GetAttribute("EmitCount")))
                        i:Emit(v1 or 1)
                    elseif i:IsA("Sound") then
                        SoundService:PlayLocalSound(i)
                    end
                end
                TransientVFX.track(v2, {profileName = "NPCDeathAttachment", ttl = v3 + 1})
            end
            debug.profileend()
        end
        self.OnDestroy:Fire()
        self.Maid:Sweep()
        self.Maid = nil
    end
end

function u378:Step(a2) -- Line: 1045 -- types: self: table, a2: number
    for i, j in self._onStepFunctions do
        j(a2)
    end
end

function u378.GetLookCFrame(a1) -- Line: 1051
    return a1.Model.PrimaryPart.CFrame
end

function u378.Face(a1, a2, a3, a4) -- Line: 1055
    -- upvalues: TweenService (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local v1 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    if a4 or true then
        a1.Rotation = CFrame.new() * v1.Rotation
        if a3 then
            TweenService:Create(PrimaryPart, a3, {CFrame = v1}):Play()
            return v1
        end
        PrimaryPart.CFrame = v1
    end
    return v1
end

function u378.CreateAreaIndicator(a1, a2) -- Line: 1075
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u6 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2.angle < 360) then "full" else "normal", radius = a2.radius}
    local v2 = false
    if a2.angle < 360 then
        v2 = 0
    end
    v1.initialAngle = v2
    local angle = false
    if a2.angle < 360 then
        angle = a2.angle
    end
    v1.desiredAngle = angle
    local color = a2.color or Color3.fromRGB(255, 0, 64)
    v1.color3 = color
    local cframe = false
    if a2.angle < 360 then
        cframe = a2.cframe
    end
    v1.cframe = cframe
    local Position = false
    if a2.angle == 360 then
        Position = a2.cframe.Position
    end
    v1.position = Position
    v1.tweenInfo = TweenInfo.new(0.25)
    v1.lifeTime = a2.openTime
    create(u6, v1)
    TimescaleUtilities.Delay(a2.openTime + 1, function() -- Line: 1088 -- upvalues: AreaIndicatorStore (upval), u6 (val)
        AreaIndicatorStore.remove(u6)
    end)
    return u6
end

function u378:StepPath(a2) -- Line: 1095
    -- upvalues: ReplicatedStorage (val), u187 (val), GameState (val)
    local v1, v2
    if not self.Replicator.Folder:IsDescendantOf(ReplicatedStorage) then
        self._pendingDestroy = true
        return
    end
    if not self.PathDistance then
        self.PathDistance = 0
    end
    debug.profilebegin("NPCUpdate")
    if not self.ForcePosition then
        if not self.Stopped or self.ForceSpeed then
            local Speed = not self.Stopped and self.Speed or 0
            if not self.Reverse then
                self.PathDistance = self.PathDistance + a2 * (Speed + self.ForceSpeed)
            else
                self.PathDistance = self.PathDistance + a2 * (-Speed + self.ForceSpeed)
            end
            if not self.IntroPath or self.IntroDone then
                if not self.Reverse then
                    if self.Path.PathDistance <= self.PathDistance and self.ShouldLoop then
                        self.PathDistance = self.PathDistance - self.Path.PathDistance
                    end
                elseif self.PathDistance <= 0 and self.ShouldLoop then
                    self.PathDistance = self.PathDistance + self.Path.PathDistance
                end
            elseif self.IntroPath.PathDistance <= self.PathDistance then
                self.PathDistance = self.PathDistance - self.IntroPath.PathDistance
                self.IntroDone = true
            end
        end
    end
    debug.profilebegin("AdditiveOffset")
    if self.AdditiveOffset and not self.DisableSpawnTween then
        self.AdditiveOffset = self.AdditiveOffset:Lerp(Vector3.new(), a2 * self.Speed)
    end
    debug.profileend()
    if self:IsAlive() and self.UpdateScale then
        v1 = self.ScaleSpring:Update(a2)
        local Value = self.ScaleSpring:GetValue()
        v2 = self.BaseScale * self.StateScale * Value
        if not self.FBXModel then
            self._pendingScale = v2
        end
        self.ScalePositionOffset = Vector3.new(1, Value, 1)
        self.UpdateScale = v1
    end
    debug.profilebegin("GetPath")
    local ForcePosition = self.ForcePosition
    v2 = nil
    local v3 = nil
    if not self.ForcePosition then
        if not self.IntroPath or self.IntroDone then
            local Scalar_5, Scalar_6, Scalar_7, Scalar_8 = self.Path:GetScalar(self.PathDistance, self.PathOffset)
            v1 = Scalar_5
            v2 = Scalar_7
            v3 = Scalar_8
        else
            local Scalar, Scalar_2, Scalar_3, Scalar_4 = self.IntroPath:GetScalar(self.PathDistance, self.PathOffset)
            v1 = Scalar
            v2 = Scalar_3
            v3 = Scalar_4
        end
        ForcePosition = v1 + self.PositionOffset * self.ScalePositionOffset
        if self.HeightYOffset then
            ForcePosition = ForcePosition + Vector3.new(0, self.HeightYOffset, 0)
        end
        if self.FlyingAnimation then
            if not self.FlyingSeed then
                self.FlyingSeed = u187:NextNumber()
            end
            ForcePosition = ForcePosition + Vector3.new(0, math.sin(((tick()) + self.FlyingSeed) * 6) * 0.8, 0)
        end
    end
    debug.profileend()
    if self:IsAlive() then
        self._pendingStepDt = (self._pendingStepDt or 0) + a2
    end
    if self.LastPosition
        and self.LastPathDistance ~= self.PathDistance
        and self.LastPosition ~= ForcePosition
        and v2
        and v3 then
        debug.profilebegin("CFrameLook")
        if GameState.Difficulty == "Duck Hunt" then
            v2 = v2 - Vector3.new(0, v2.Y, 0)
            v3 = v3 - Vector3.new(0, v3.Y, 0)
        end
        local v4 = if not self.Reverse then CFrame.lookAt(v2, v3) else CFrame.lookAt(v3, v2)
        debug.profileend()
        if not self.Rotation then
            self.Rotation = v4.Rotation
        else
            self.Rotation = self.Rotation.Rotation:Lerp(v4.Rotation, (math.clamp(a2 * self.Speed * (self.TimeScaled and GameState.TimeScale or 1), 0, 1)))
        end
    end
    local PrimaryPart = nil
    local v5 = nil
    if self.Rotation or self.ForcePosition then
        if self.PathDistance ~= self.LastPathDistance or self._forcePositionChanged then
            local v6
            debug.profilebegin("TableSet")
            local v7 = self.AdditiveOffset or Vector3.new(0, 0, 0)
            if GameState.Difficulty == "Duck Hunt" then
                ForcePosition = Vector3.new(ForcePosition.X, 4.1 + self.PositionOffset.Y, ForcePosition.Z)
            end
            if not self.ForcePosition then
                v6 = (CFrame.new(ForcePosition)) * self.Rotation + v7
            else
                local v8 = CFrame.new(self.ForcePosition)
                local Rotation_3 = self.Rotation or CFrame.identity
                v6 = v8 * Rotation_3 + v7 or (CFrame.new(ForcePosition)) * self.Rotation + v7
            end
            v5 = v6
            PrimaryPart = self.PrimaryPart
            debug.profileend()
        end
    end
    self._forcePositionChanged = false
    self.LastPosition = ForcePosition
    self.LastPathDistance = self.PathDistance
    debug.profileend()
    return PrimaryPart, v5
end

local Hz15 = Enum.StepFrequency.Hz15
local u269 = {}
local u270 = {}

local function isOffScreen(a1, a2, a3, a4, a5, a6, a7) -- Line: 1255
    -- upvalues: 
    if a2 then
        return false
    end
    local v1 = math.max(a1.Z, 1)
    local v2 = a3 * (a4.Y / (math.tan(a7 / 2) * 2 * v1))
    local v3 = a5 + v2
    local v4 = a6 + v2
    local v5 = true
    if not (a1.X < -v3) then
        v5 = true
        local X = a1.X
        if not (a4.X + v3 < X) then
            v5 = true
            if not (a1.Y < -v4) then
                local Y_2 = a1.Y
                v5 = a4.Y + v4 < Y_2
            end
        end
    end
    return v5
end

Scheduler.bindToSimulation("NPCReplicator", function(a1) -- Line: 1284 -- upvalues: u188 (val), GameState (val)
    local v1, v2, v3
    local ServerTimeNow = workspace:GetServerTimeNow()
    if #u188 <= 0 then
        return
    end
    local v4 = a1 * GameState.TimeScale
    debug.profilebegin("StepNPCs")
    for i, v in ipairs(u188) do
        v1 = if not v.TimeScaled then a1 else v4
        v2, v3 = v:StepPath(v1)
        if v2 and v3 then
            v.RenderPart = v2
            if v._renderTargetDirty then
                v.PrevRenderCFrame = v.TargetRenderCFrame or v3
            else
                v.PrevRenderCFrame = v2.CFrame
            end
            v._renderTargetDirty = true
            v.TargetRenderCFrame = v3
            v.RenderStepStartTime = ServerTimeNow
            v.RenderStepDuration = 0.06666666666666667
        end
    end
    debug.profileend()
end, Hz15)
Scheduler.add("NPCReplicatorRender", RunService.Heartbeat, function() -- Line: 1322 -- upvalues: u188 (val), u269 (val), u270 (val), isOffScreen (val)
    local PrevRenderCFrame, RenderPart, TargetRenderCFrame, _pendingScale, _pendingStepDt, v1, v2, v3, v4, v5, v6, v7, v8
    if #u188 <= 0 then
        return
    end
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v9 = 1
    table.clear(u269)
    table.clear(u270)
    debug.profilebegin("RenderNPCs")
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.zero
    local v10 = ViewportSize.X * 0.15
    local v11 = ViewportSize.Y * 0.15
    local v12 = CurrentCamera and math.rad(CurrentCamera.FieldOfView) or 0
    for i, v in ipairs(u188) do
        if not v._pendingDestroy then
            if v._pendingScale then
                _pendingScale = v._pendingScale
                v._pendingScale = nil
                if v.Model and not v.FBXModel then
                    v.Model:ScaleTo(_pendingScale)
                    v.RenderRadius = v.Model:GetExtentsSize().Magnitude / 2
                end
            end
            if v._pendingAdjustWalkSpeed then
                v._pendingAdjustWalkSpeed = nil
                v:AdjustWalkSpeed()
            end
            _pendingStepDt = v._pendingStepDt
            if _pendingStepDt and _pendingStepDt > 0 then
                v._pendingStepDt = nil
                if v:IsAlive() then
                    v:Step(_pendingStepDt)
                end
                if v.OnStepFunction and not v.FakeUnit then
                    v.OnStepFunction(_pendingStepDt)
                end
            end
            RenderPart = v.RenderPart
            TargetRenderCFrame = v.TargetRenderCFrame
            PrevRenderCFrame = v.PrevRenderCFrame
            if RenderPart and TargetRenderCFrame and PrevRenderCFrame then
                v1 = v.RenderStepDuration or 0.06666666666666667
                v2 = if not (v1 > 0) then 1 else math.clamp((ServerTimeNow - v.RenderStepStartTime) / v1, 0, 1)
                if not (v2 >= 1) then
                    v3 = PrevRenderCFrame:Lerp(TargetRenderCFrame, v2)
                    if not CurrentCamera then
                        u270[v9] = RenderPart
                        u269[v9] = v3
                        v9 = v9 + 1
                    else
                        v4 = v.RenderRadius or 0
                        v5, v6 = CurrentCamera:WorldToViewportPoint(v3.Position)
                        v7, v8 = CurrentCamera:WorldToViewportPoint(RenderPart.Position)
                        if not isOffScreen(v5, v6, v4, ViewportSize, v10, v11, v12)
                            or not isOffScreen(v7, v8, v4, ViewportSize, v10, v11, v12) then
                            u270[v9] = RenderPart
                            u269[v9] = v3
                            v9 = v9 + 1
                        end
                    end
                elseif v._renderTargetDirty then
                    v._renderTargetDirty = nil
                    v3 = PrevRenderCFrame:Lerp(TargetRenderCFrame, v2)
                    if not CurrentCamera then
                        u270[v9] = RenderPart
                        u269[v9] = v3
                        v9 = v9 + 1
                    else
                        v4 = v.RenderRadius or 0
                        v5, v6 = CurrentCamera:WorldToViewportPoint(v3.Position)
                        v7, v8 = CurrentCamera:WorldToViewportPoint(RenderPart.Position)
                        if not isOffScreen(v5, v6, v4, ViewportSize, v10, v11, v12)
                            or not isOffScreen(v7, v8, v4, ViewportSize, v10, v11, v12) then
                            u270[v9] = RenderPart
                            u269[v9] = v3
                            v9 = v9 + 1
                        end
                    end
                end
            end
        else
            v._pendingDestroy = nil
            v:Destroy()
        end
    end
    debug.profileend()
    if v9 > 1 then
        workspace:BulkMoveTo(u270, u269, Enum.BulkMoveMode.FireCFrameChanged)
    end
end)
Scheduler.add("NPCAnimations", RunService.Heartbeat, function(a1) -- Line: 1445 -- upvalues: u188 (val)
    for i, v in ipairs(u188) do
        if v then
            if v.StepAnimations then
                v.StepAnimations(a1)
            end
            if v.BoneHats then
                v:UpdateBoneHats()
            end
        else
            warn("NPC is nil")
        end
    end
end)
task.delay(1, function() -- Line: 1463 -- upvalues: TagReplicator (val), LegacyMiddleware (val), Enum_2 (val), u378 (val)
    TagReplicator.hook("Enemies", function(a1, a2) -- Line: 1464 -- upvalues: LegacyMiddleware (upval), Enum_2 (upval), u378 (upval)
        return LegacyMiddleware:RunFunction(Enum_2.HookType.SpawnEnemy, nil, u378.new, a1, a2)
    end)
end)
return u378