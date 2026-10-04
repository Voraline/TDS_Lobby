-- Script path: ReplicatedStorage.Client.Modules.Replicators.UnitReplicator
-- Decompile time: 47.77 ms

local scanReplace
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u10 = {}
u10.__index = u10

function u10.__tostring(a1) -- Line: 6
    return "Unit_" .. tostring(a1.Name)
end

local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local DebugController = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
local HumanoidUtil = require(ReplicatedStorage.Shared.Modules.HumanoidUtil)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local NPCUtils = require(ReplicatedStorage.Shared.Modules.NPCUtils)
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local StatusEffectRenderer = require(ReplicatedStorage.Client.Modules.StatusEffects.StatusEffectRenderer)
local TaggedInstances = require(ReplicatedStorage.Shared.Modules.TaggedInstances)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Upgrades = require(ReplicatedStorage.Shared.Modules.Upgrades)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local Folder = Instance.new("Folder")
Folder.Name = "ClientUnits"
Folder.Parent = workspace
local GoldenPerks = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Particles")):WaitForChild("GoldenPerks")
local Streaming = Network.Channel("Streaming")
local u130 = Random.new()
local u131 = {}
local u132 = {}
local Gizmo = DebugController.Gizmo
DebugController.createGizmo("Unit Hitboxes", function() -- Line: 46 -- upvalues: Gizmo (val), u132 (val)
    Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(141, 166, 255))
    for i, j in u132 do
        Gizmo.Box:Draw(j.Hitbox.CFrame, j.Hitbox.Size, false)
    end
end)

function u10.new(a1, a2) -- Line: 54
    -- upvalues: Streaming (val), Asset (val), u10 (val), Maid (val), Folder (val), HumanoidUtil (val), NPCUtils (val)
    -- upvalues: TaggedInstances (val), Signal (val), GoldenPerks (val), Upgrades (val), u130 (val), TagReplicator (val)
    -- upvalues: StatusEffectRenderer (val), GameState (val), u131 (val), ParticleLODController (val), u132 (val)
    local v1, v2
    local v3 = a2:WaitForState("ModelName")
    local v4 = a2:Get("Skin") or "Default"
    local v5 = Streaming:InvokeServer("SelectUnit", v3, v4, true)
    if not v5 or v5 < 1 then
        Streaming:FireServer("SelectUnit", v3, "Default", true)
    end
    local v6 = Asset("NewUnits", v3)
    assert(v6, "Unit data " .. v3 .. " does not exist.")
    local v7 = Asset("NewUnitsModel", v3, v4)
    assert(v7, "Unit model " .. v3 .. " does not exist.")
    local StatusEffects = a1:WaitForChild("StatusEffects", 5)
    if not StatusEffects then
        return
    end
    local v8 = v6.Animator and setmetatable(v6.Animator, u10) or u10
    local u73 = setmetatable({}, v8)
    u73.Maid = Maid.new()
    u73.PathTeam = a2:Get("PathTeam")
    local u89 = v7:Clone()
    u73.BaseScale = u89:GetScale()
    u89:ScaleTo((a2:Get("Scale")) * u73.BaseScale)
    u73.TimeScaled = true
    u73.Name = v3
    u73.Model = u89
    u73.Model.PrimaryPart.Anchored = true
    u73.Model.Parent = Folder
    u73.PrimaryPart = u73.Model.PrimaryPart
    u73.FBXModel = HumanoidUtil.findFirstRigBone(u73.Model)
    v8, v1 = HumanoidUtil.createAnimationHost(u73.Model, u73.FBXModel ~= nil)
    u73.AnimationController = v8
    u73.AnimationAnimator = v1
    NPCUtils.configureModelParts(u73.Model)
    u73.BoneVFX = u73.Model:FindFirstChild("BoneVFX")
    u73.Tagged = TaggedInstances.getTaggedInstances(u73.Model)
    u73.Golden = a2:Get("Golden")
    u73.Upgrade = a2:Get("Upgrade") or 0
    u73.OnDestroy = Signal.new()
    if u73.Golden then
        for i, j in u73.Model:GetDescendants() do
            if j:IsA("BasePart") and j.Name == "Torso" and not j:FindFirstChild("Shine") then
                GoldenPerks.Shine:Clone().Parent = j
            end
        end
    end
    if u73.Model:FindFirstChild("UpgradesModule") then
        local Upgrade = u73.Upgrade
        for k = 1, Upgrade do
            Upgrades.upgrade(u73, k, "unit")
        end
    end
    if not v6.NewStats then
        local Stats = v6.Stats
        v8 = Stats[if not u73.Golden then "Default" else "Golden"] or v6.Stats.Default
    else
        local NewStats = v6.NewStats
        local Default = NewStats[if not u73.Golden then "Default" else "Golden"] or v6.NewStats.Default
        v8 = Default.Upgrades[math.clamp(u73.Upgrade, 0, #Default.Upgrades)] or Default.Defaults
    end
    u73.Stats = v8
    if u73.Model:FindFirstChild("Effects") then
        u73.Effects = require(u73.Model.Effects)
    end
    local Hitbox = u73.Model:FindFirstChild("Hitbox")
    local Size = Hitbox and Hitbox.Size or u73.Model:GetExtentsSize()
    local v9 = math.max(Size.X, Size.Z)
    u73.RenderRadius = Size.Magnitude / 2
    local Part = Hitbox or Instance.new("Part")
    Part.Anchored = false
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = true
    Part.Transparency = 1
    Part.CFrame = u73.Model:GetPivot()
    if not Hitbox then
        Part.Name = "Hitbox"
        Part.Size = Vector3.new(v9, math.abs(u73.PrimaryPart.Node.Position.Y * 2), v9)
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = u73.Model.PrimaryPart
        WeldConstraint.Part1 = Part
        WeldConstraint.Parent = u73.Model.PrimaryPart
        Part.Parent = u73.Model
    end
    u73.Hitbox = Part
    u73.FolderPointer = Instance.new("ObjectValue")
    u73.FolderPointer.Name = "RootPointer"
    u73.FolderPointer.Value = a1
    u73.FolderPointer.Parent = u73.Model
    local v10 = math.clamp((15 - u73.Model:GetExtentsSize().Magnitude) / 15, 0, 1)
    u73.PositionHeightOffset = -u73.PrimaryPart.Node.Position
    u73.EntityId = a2:Get("ID")
    u73.Type = a2:Get("Type")
    u73.Rotation = CFrame.new()
    u73.Replicator = a2
    u73.Scale = a2:Get("Scale")
    u73.PathDistance = a2:Get("PathDistance")
    u73.SendTime = a2:Get("SendTime")
    u73.LastPathDistance = u73.PathDistance
    u73.PathOffset = u130:NextNumber(-v10, v10)
    u73.ForcePosition = a2:Get("ForcePosition")
    u73.AdditiveOffset = a2:Get("PositionOffset")
    u73.Lifetime = a2:Get("Lifetime")
    u73.Modifiers = TagReplicator.getReplicatorEntityFromFolder(StatusEffects)
    u73.Maid:Mark(u73.Modifiers)
    u73.StatusEffectRenderer = StatusEffectRenderer.new(u73, StatusEffects, u73.Modifiers)
    u73.StatusEffects = u73.StatusEffectRenderer
    u73.Maid:Mark(u73.StatusEffectRenderer)
    if not u73.ForcePosition then
        v2 = GameState.Paths[u73.PathTeam][a2:Get("PathName")] or GameState.Paths[u73.PathTeam][tonumber((a2:Get("PathName")))]
        u73.Path = v2
    end
    u73.Lifespan = a2:Get("Lifespan")
    u73.MaxLifespan = a2:Get("MaxLifespan")
    ;(u73.Replicator:GetStateChangedSignal("Lifespan")):Connect(function(a1) -- Line: 210 -- upvalues: u73 (val)
        u73.Lifespan = a1
    end)
    ;(u73.Replicator:GetStateChangedSignal("MaxLifespan")):Connect(function(a1) -- Line: 213 -- upvalues: u73 (val)
        u73.MaxLifespan = a1
    end)
    u73.Reverse = a2:Get("Reverse")
    ;(u73.Replicator:GetStateChangedSignal("Reverse")):Connect(function(a1) -- Line: 218 -- upvalues: u73 (val)
        u73.Reverse = a1
    end)
    u73.Cooldown = a2:Get("Cooldown")
    ;(u73.Replicator:GetStateChangedSignal("Cooldown")):Connect(function(a1) -- Line: 223 -- upvalues: u73 (val)
        u73.Cooldown = a1
    end)
    u73.Speed = a2:Get("Speed")
    ;(u73.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1) -- Line: 228 -- upvalues: u73 (val)
        u73.Speed = a1
    end)
    u73.Stopped = false
    ;(u73.Replicator:GetStateChangedSignal("Stopped")):Connect(function(a1) -- Line: 233 -- upvalues: u73 (val)
        u73.Stopped = a1
    end)
    task.defer(function() -- Line: 238 -- upvalues: a1 (val), u73 (val)
        a1:SetAttribute("Speed", u73.Speed)
    end)
    ;(u73.Replicator:GetStateChangedSignal("PathDistance")):Connect(function(a1) -- Line: 242 -- upvalues: u73 (val)
        if 0.5 < (math.abs(u73.PathDistance - a1)) then
            u73.PathDistance = a1
        end
    end)
    ;(u73.Replicator:GetStateChangedSignal("Scale")):Connect(function(a1) -- Line: 249 -- upvalues: u89 (val), u73 (val)
        u89:ScaleTo(a1 * u73.BaseScale)
        u73.RenderRadius = u89:GetExtentsSize().Magnitude / 2
    end)
    u73.Replicator:Hook(u73)
    v2 = a2:Get("DisplayName") or a2:Get("ModelName")
    u73.Name = v2
    ;(u73.Replicator:GetStateChangedSignal("DisplayName")):Connect(function(a1) -- Line: 256 -- upvalues: u73 (val)
        u73.Name = a1 or u73.Replicator:Get("ModelName")
    end)
    u73.Connections = u73.Maid
    u73.Dead = false
    table.insert(u131, u73)
    ParticleLODController.registerModel(u73.Model, function() -- Line: 266 -- upvalues: u73 (val)
        return u73.Model.PrimaryPart and u73.Model.PrimaryPart.Position or Vector3.new(0, 0, 0)
    end)
    u73.Maid:Mark(function() -- Line: 269 -- upvalues: ParticleLODController (upval), u73 (val)
        ParticleLODController.unregisterModel(u73.Model)
    end)
    u73.Maid:Mark(u73.Model)
    u73.Maid:Mark(function() -- Line: 273 -- upvalues: u73 (val), u131 (upval)
        u73.Connections = nil
        local v1 = table.find(u131, u73)
        if v1 then
            table.remove(u131, v1)
        end
    end)
    u132[a1] = u73
    u73.Maid:Mark(function() -- Line: 283 -- upvalues: u132 (upval), a1 (val)
        u132[a1] = nil
    end)
    u73:Initialize()
    u73.Model:PivotTo((CFrame.new((if not u73.ForcePosition then u73.Path:GetScalar(u73.PathDistance, u73.PathOffset) else u73.ForcePosition) + u73.PositionHeightOffset)))
    if u73.Effects then
        u73.Effects.Initialize(u73)
    end
    return u73
end

function u10.Thread(a1, a2) -- Line: 302
    a1.ThreadFunction = a2
    a1._threadCo = nil
    a1._threadDelayRemaining = 0
end

function u10.Wait(a1, a2) -- Line: 308 -- upvalues: TimescaleUtilities (val)
    return TimescaleUtilities.Wait(a2)
end

function u10.Delay(a1, a2, a3) -- Line: 312 -- upvalues: TimescaleUtilities (val)
    if a3 then
        return TimescaleUtilities.Delay(a2, a3)
    end
    a1:Wait(a2)
end

function u10:IsAlive() -- Line: 321
    local v1 = false
    if self.Maid ~= nil then
        v1 = not self.Dead
    end
    return v1
end

function u10.GetNPCFromFolder(a1) -- Line: 325 -- upvalues: u132 (val)
    return u132[a1]
end

function scanReplace(a1) -- Line: 329 -- upvalues: scanReplace (val), u10 (val), NPCReplicator (val)
    local v1
    local v2 = a1
    for k, v in pairs(a1) do
        if typeof(v2[k]) == "table" then
            scanReplace(v2[k])
        end
        if typeof(v2[k]) == "Instance" and v2[k]:IsA("Folder") then
            v1 = u10.GetNPCFromFolder(v2[k]) or NPCReplicator.GetNPCFromFolder(v2[k])
            if v1 then
                v2[k] = v1.Model
            end
        end
    end
end

;(Network.Channel("Replicate")):On("UnitInstance", function(a1) -- Line: 344 -- upvalues: u132 (val), scanReplace (val)
    debug.profilebegin("UnitInstanceDispatch")
    for i, j in a1 do
        task.spawn(function() -- Line: 347 -- upvalues: j (val), u132 (upval), scanReplace (upval)
            local v1 = j[2]
            local v2 = j[1]
            local v3 = {(unpack(j, 3))}
            local v4 = u132[v1]
            if v4 then
                debug.profilebegin("UnitInstanceScanReplace")
                scanReplace(v3)
                debug.profileend()
                v4.Executables[v2](unpack(v3))
            end
        end)
    end
    debug.profileend()
end)

function u10.Bullet(a1, a2) -- Line: 366 -- upvalues: u130 (val), Laser (val)
    if a2.End ~= nil and a2.Start ~= nil then
        local Magnitude = (a2.Start - a2.End).Magnitude
        local v1 = (CFrame.new(a2.Start, a2.End)) * CFrame.Angles(
            math.rad((u130:NextNumber(-a2.Spread, a2.Spread)) / Magnitude),
            math.rad((u130:NextNumber(-a2.Spread, a2.Spread)) / Magnitude),
            0
        )
        Laser:Cast({
            Start = v1.p,
            Pos = v1 * CFrame.new(0, 0, -Magnitude).Position,
            Color = not a2.NoColor and (a2.Color or BrickColor.new("Cork").Color),
            Transparency = a2.Transparency or 0.1,
            Size = a2.Size or 0.04,
            Fade = a2.Speed or 90,
            Type = "Bullet",
            Bullet = a2.Bullet or "Normal",
            Reversed = a2.Reversed or false,
        })
        return
    end
end

function u10.FindTarget(a1) -- Line: 393 -- upvalues: NPCReplicator (val)
    local Target = a1.Replicator.Folder:FindFirstChild("Target")
    if not Target then
        return
    end
    local v1 = NPCReplicator.GetNPCFromFolder(Target.Value)
    return v1 and v1.Model or nil
end

function u10.Animate(a1, a2, a3) -- Line: 402
    local Animations = a1.Model:FindFirstChild("Animations")
    if not Animations then
        return
    end
    if not a1.LoadedAnimations then
        a1.LoadedAnimations = {}
    end
    if not a1.LoadedAnimations[a2] then
        a1.LoadedAnimations[a2] = (a1.AnimationAnimator:LoadAnimation((Animations:FindFirstChild(a2))))
    end
    local v1 = a1.LoadedAnimations[a2]
    if v1 and v1 then
        if a3 then
            for k, v in pairs(a3) do
                v1[k] = v
            end
        end
        return v1
    end
end

function u10.Face(a1, a2, a3) -- Line: 434
    -- upvalues: TweenService (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local v1 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    a1.Rotation = CFrame.new() * v1.Rotation
    if a3 then
        TweenService:Create(PrimaryPart, a3, {CFrame = v1}):Play()
        return v1
    end
    PrimaryPart.CFrame = v1
    return v1
end

function u10:Destroy() -- Line: 450
    if self.Maid then
        self.OnDestroy:Fire()
        self.Dead = true
        self.Maid:Sweep()
        self.Maid = nil
    end
end

local function currentTimeScale() -- Line: 460 -- upvalues: GameState (val)
    local State = GameState.State
    return State and State.TimeScale or GameState.TimeScale or 1
end

function u10.Step(a1, a2) -- Line: 466 -- upvalues: NPCUtils (val), GameState (val)
    local stepThread = NPCUtils.stepThread
    local State = GameState.State
    stepThread(a1, a2 * (State and State.TimeScale or GameState.TimeScale or 1))
end

local Hz15 = Enum.StepFrequency.Hz15
local u161 = {}
local u162 = {}

local function queueRenderTarget(a1, a2, a3) -- Line: 479 -- types: a2: Vector2, a3: number
    a1.RenderPart = a1.PrimaryPart
    a1.PrevRenderCFrame = a1.TargetRenderCFrame or a2
    a1.TargetRenderCFrame = a2
    a1.RenderStepStartTime = a3
    a1.RenderStepDuration = 0.06666666666666667
end

local function isOffScreen(a1, a2, a3, a4, a5, a6, a7) -- Line: 487
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

Scheduler.bindToSimulation("UnitReplicator", function(a1) -- Line: 517 -- upvalues: u131 (val), GameState (val)
    local AdditiveOffset_3, LastPathDistance, Rotation, Scalar, Scalar_2, Scalar_3, Scalar_4, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local ServerTimeNow = workspace:GetServerTimeNow()
    if #u131 <= 0 then
        return
    end
    local v10 = a1 * GameState.TimeScale
    debug.profilebegin("StepUnits")
    for i, v in ipairs(u131) do
        if v.FolderPointer.Value.Parent == nil then
            v._pendingDestroy = true
        elseif v:IsAlive() then
            v8 = if not v.TimeScaled then a1 else v10
            v._pendingStepDt = (v._pendingStepDt or 0) + v8
            if v.ForcePosition then
                v9 = v.AdditiveOffset or Vector3.new(0, 0, 0)
                v1 = not v._stationaryRenderInitialized
                if not (0.001 < v9.Magnitude) then
                    v.AdditiveOffset = Vector3.new(0, 0, 0)
                else
                    debug.profilebegin("AdditiveOffset")
                    v5 = v8 * v.Speed
                    v9 = v9:Lerp(Vector3.new(0, 0, 0), v5)
                    if v9.Magnitude <= 0.001 then
                        v9 = Vector3.new(0, 0, 0)
                    end
                    v.AdditiveOffset = v9
                    v1 = true
                    debug.profileend()
                end
                if v1 then
                    v2 = (CFrame.new(v.ForcePosition + v.PositionHeightOffset + v9)) * v.Rotation
                    v.RenderPart = v.PrimaryPart
                    v.PrevRenderCFrame = v.TargetRenderCFrame or v2
                    v.TargetRenderCFrame = v2
                    v.RenderStepStartTime = ServerTimeNow
                    v.RenderStepDuration = 0.06666666666666667
                    v._stationaryRenderInitialized = true
                end
            elseif v.Speed ~= 0 and not v.Stopped then
                if not v.Reverse then
                    v.PathDistance = v.PathDistance + v8 * v.Speed
                else
                    v.PathDistance = v.PathDistance - v8 * v.Speed
                end
                debug.profilebegin("AdditiveOffset")
                AdditiveOffset_3 = v.AdditiveOffset
                v2 = Vector3.new()
                v3 = v8 * v.Speed
                v.AdditiveOffset = AdditiveOffset_3:Lerp(v2, v3)
                debug.profileend()
                debug.profilebegin("GetPath")
                Scalar, Scalar_2, Scalar_3, Scalar_4 = v.Path:GetScalar(v.PathDistance, v.PathOffset)
                v2 = Scalar_3
                v3 = Scalar_4
                v9 = Scalar + v.PositionHeightOffset
                debug.profileend()
                if v.LastPosition then
                    if not v.Reverse then
                        v4 = v.LastPathDistance < v.PathDistance
                    else
                        LastPathDistance = v.LastPathDistance
                        v4 = v.PathDistance < LastPathDistance
                    end
                    if v4 and v.LastPosition ~= v9 and v2 and v3 then
                        debug.profilebegin("CFrameLook")
                        if GameState.Difficulty == "Duck Hunt" then
                            v2 = v2 - Vector3.new(0, v2.Y, 0)
                            v3 = v3 - Vector3.new(0, v3.Y, 0)
                        end
                        v4 = if not v.Reverse then CFrame.lookAt(v2, v3) else CFrame.lookAt(v3, v2)
                        debug.profileend()
                        if not v.Rotation then
                            v.Rotation = v4 - v4.Position
                        else
                            Rotation = v.Rotation
                            v6 = v4 - v4.Position
                            v7 = v8 * v.Speed
                            v.Rotation = Rotation:Lerp(v6, v7)
                        end
                    end
                end
                v.LastPosition = v9
                v.LastPathDistance = v.PathDistance
                if v.Rotation and not v.Stopped then
                    if GameState.Difficulty == "Duck Hunt" then
                        v9 = Vector3.new(v9.X, 4.1 + v.PositionHeightOffset.Y, v9.Z)
                    end
                    v4 = (CFrame.new(v9)) * v.Rotation + v.AdditiveOffset
                    v.RenderPart = v.PrimaryPart
                    v.PrevRenderCFrame = v.TargetRenderCFrame or v4
                    v.TargetRenderCFrame = v4
                    v.RenderStepStartTime = ServerTimeNow
                    v.RenderStepDuration = 0.06666666666666667
                end
            end
        end
    end
    debug.profileend()
end, Hz15)
Scheduler.add("UnitReplicatorRender", RunService.Heartbeat, function() -- Line: 642 -- upvalues: u131 (val), u161 (val), u162 (val), isOffScreen (val)
    local PrevRenderCFrame, RenderPart, TargetRenderCFrame, _pendingStepDt, v1, v2, v3, v4, v5, v6, v7, v8
    if #u131 <= 0 then
        return
    end
    local ServerTimeNow = workspace:GetServerTimeNow()
    table.clear(u161)
    table.clear(u162)
    local v9 = 1
    local CurrentCamera = workspace.CurrentCamera
    local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.zero
    local v10 = ViewportSize.X * 0.15
    local v11 = ViewportSize.Y * 0.15
    local v12 = CurrentCamera and math.rad(CurrentCamera.FieldOfView) or 0
    debug.profilebegin("RenderUnits")
    for i, v in ipairs(u131) do
        if not v._pendingDestroy then
            _pendingStepDt = v._pendingStepDt
            if _pendingStepDt and _pendingStepDt > 0 then
                debug.profilebegin("RenderUnitsStep")
                v._pendingStepDt = nil
                if v:IsAlive() then
                    v:Step(_pendingStepDt)
                end
                if v.OnStepFunction then
                    v.OnStepFunction(_pendingStepDt)
                end
                debug.profileend()
            end
            RenderPart = v.RenderPart
            TargetRenderCFrame = v.TargetRenderCFrame
            PrevRenderCFrame = v.PrevRenderCFrame
            if RenderPart and TargetRenderCFrame and PrevRenderCFrame then
                v1 = v.RenderStepDuration or 0.06666666666666667
                debug.profilebegin("RenderUnitsInterpolate")
                v2 = PrevRenderCFrame:Lerp(
                    TargetRenderCFrame,
                    if not (v1 > 0) then 1 else math.clamp((ServerTimeNow - v.RenderStepStartTime) / v1, 0, 1)
                )
                debug.profileend()
                if v2 ~= v.LastCFrame then
                    v3 = false
                    if CurrentCamera then
                        debug.profilebegin("RenderUnitsVisibility")
                        v4 = v.RenderRadius or 0
                        v5, v6 = CurrentCamera:WorldToViewportPoint(v2.Position)
                        v7, v8 = CurrentCamera:WorldToViewportPoint(RenderPart.Position)
                        v3 = isOffScreen(v5, v6, v4, ViewportSize, v10, v11, v12) and isOffScreen(v7, v8, v4, ViewportSize, v10, v11, v12)
                        debug.profileend()
                    end
                    if not v3 then
                        debug.profilebegin("RenderUnitsQueueMove")
                        u161[v9] = v2
                        u162[v9] = RenderPart
                        v9 = v9 + 1
                        v.LastCFrame = v2
                        debug.profileend()
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
        debug.profilebegin("RenderUnitsBulkMoveTo")
        workspace:BulkMoveTo(u162, u161, Enum.BulkMoveMode.FireCFrameChanged)
        debug.profileend()
    end
end)
TagReplicator.hook("Units", function(a1, a2) -- Line: 749 -- upvalues: u10 (val)
    return (u10.new(a1, a2))
end)
return u10