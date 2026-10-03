-- Script path: ReplicatedStorage.Client.Controllers.Game.NewPlacementController
-- Decompile time: 20.06 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local u53 = {}
local LocalPlayer = Players.LocalPlayer
local ExtraRangeRings = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.ExtraRangeRings)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local HotKey = require(ReplicatedStorage.Client.Modules.HotKey)
local Hotbar = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Hotbar)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MapManager = require(ReplicatedStorage.Shared.Modules.MapManager)
local Mobile = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Mobile)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local Quaternion = require(ReplicatedStorage.Shared.Modules.Standalone.Quaternion)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local SharedGameFunctions = require(ReplicatedStorage.Shared.Modules.SharedGameFunctions)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local upgradeHandler = require(ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Upgrade.upgradeHandler)
local u195 = {}
u195["Place Tower"] = {
    ActionText = "Place",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}
u195["Rotate Tower"] = {ActionText = "Rotate", Layout = 2, ScaleMultiplier = 0.4, Key = Enum.KeyCode.R}
u195["Cancel Placement"] = {ActionText = "Cancel", Layout = 3, ScaleMultiplier = 0.4, Key = Enum.KeyCode.Q}
u195["Quick Placement"] = {
    ActionText = "Quick Place",
    Layout = 4,
    ScaleMultiplier = 0.4,
    Key = Enum.KeyCode.LeftShift,
}

local function getPCPlacementBinds(a1) -- Line: 94 -- upvalues: u195 (val) -- types: a1: boolean
    if a1 then
        return u195
    end
    local v1 = table.clone(u195)
    v1["Quick Placement"] = nil
    return v1
end

local u205 = {}
u205["Place Tower"] = {ActionText = "Place", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
u205["Cancel Placement"] = {ActionText = "Cancel", Layout = 5, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonB}
u205["Rotate Tower"] = {ActionText = "Rotate", Layout = 2, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonL2}
u205["Cycle Right"] = {ActionText = "Cycle Right", Layout = 3, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR1}
u205["Cycle Left"] = {ActionText = "Cycle Left", Layout = 4, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonL1}
local Troops = Network.Channel("Troops")
u53.Place = Signal.new()
u53.Rotate = Signal.new()
u53.Finished = Signal.new()
local u226 = Maid.new()
local Model = Instance.new("Model")
Model.Name = "Cliff"
Model.Parent = workspace
local Model_2 = Instance.new("Model")
Model_2.Name = "Ground"
Model_2.Parent = workspace
local u238 = Maid.new()
local u239 = {}
local u240 = {}
local u241 = {}
local u242 = false
local u243 = nil
local u244 = nil

local function addHighlight(a1, a2) -- Line: 164
    local Highlight = Instance.new("Highlight")
    Highlight.OutlineTransparency = 1
    Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    Highlight.FillColor = Color3.fromRGB(119, 255, 149)
    Highlight.OutlineColor = Color3.new(1, 1, 1)
    Highlight.Adornee = a1
    Highlight.FillTransparency = 1
    Highlight.Parent = a1
    table.insert(a2, Highlight)
end

local function refreshMap(a1) -- Line: 177
    -- upvalues: u242 (ref), Model (val), Model_2 (val), u238 (val), u239 (ref), u244 (ref), u240 (ref), u241 (ref)
    -- upvalues: GameState (val), u243 (ref), addHighlight (val)
    local v1, v2
    u242 = true
    Model:ClearAllChildren()
    Model_2:ClearAllChildren()
    u238:Sweep()
    u239 = {}
    local Boundaries = a1:WaitForChild("Boundaries")
    local Model_3 = Instance.new("Model")
    Model_3.Name = "Boundaries"

    local function _addBoundary(a1) -- Line: 190 -- upvalues: Model_3 (val), u239 (upval) -- types: a1: userdata
        local v1 = a1:Clone()
        v1.Anchored = true
        v1.CanCollide = false
        v1.CanTouch = false
        v1.CanQuery = false
        v1.Transparency = 0.99
        v1.Parent = Model_3
        table.insert(u239, v1)
    end

    local v3 = a1
    for i, j in Boundaries:GetChildren() do
        if j:IsA("BasePart") then
            v2 = j:Clone()
            v2.Anchored = true
            v2.CanCollide = false
            v2.CanTouch = false
            v2.CanQuery = false
            v2.Transparency = 0.99
            v2.Parent = Model_3
            table.insert(u239, v2)
        elseif j:IsA("Model") then
            for k, v in pairs(j:GetChildren()) do
                v1 = v:Clone()
                v1.Anchored = true
                v1.CanCollide = false
                v1.CanTouch = false
                v1.CanQuery = false
                v1.Transparency = 0.99
                v1.Parent = Model_3
                table.insert(u239, v1)
            end
        elseif j:IsA("Folder") then
            for k2, k3 in pairs(j:GetChildren()) do
                v1 = k3:Clone()
                v1.Anchored = true
                v1.CanCollide = false
                v1.CanTouch = false
                v1.CanQuery = false
                v1.Transparency = 0.99
                v1.Parent = Model_3
                table.insert(u239, v1)
            end
        end
    end
    Instance.new("Humanoid").Parent = Model_3
    u244 = Instance.new("Highlight")
    u244.DepthMode = Enum.HighlightDepthMode.Occluded
    u244.FillColor = Color3.fromRGB(255, 119, 119)
    u244.OutlineColor = Color3.fromRGB(255, 157, 157)
    u244.Adornee = Model_3
    u244.FillTransparency = 1
    u244.OutlineTransparency = 1
    u244.Parent = Model_3
    u238:Mark(Model_3)
    u238:Mark(function() -- Line: 226 -- upvalues: u239 (upval), u244 (upval)
        u239 = {}
        u244 = nil
    end)
    Model_3.Parent = workspace
    u240 = {}
    u241 = {}
    local v4 = GameState.GameMode == "PVP"
    local v5 = v3.Parent:FindFirstChild(if v3.Name ~= "Red" then "Red" else "Blue")
    if v4 then
        u243 = v5 and v5:FindFirstChildOfClass("Highlight")
        if not u243 then
            u243 = Instance.new("Highlight")
            u243.FillTransparency = 1
            u243.OutlineTransparency = 1
            u243.DepthMode = Enum.HighlightDepthMode.Occluded
            u243.Adornee = v5
            u243.Parent = v5
        end
    end
    local Cliff = v3:WaitForChild("Cliff")
    local Ground = v3:WaitForChild("Ground")
    for k4, n in pairs(Ground:GetChildren()) do
        n.Parent = Model_2
    end
    Ground.DescendantAdded:Connect(function(a1) -- Line: 264 -- upvalues: Model_2 (upval)
        if a1:IsA("BasePart") then
            task.defer(function() -- Line: 266 -- upvalues: a1 (val), Model_2 (upval)
                a1.Parent = Model_2
            end)
        end
    end)
    for k5, m in pairs(Cliff:GetChildren()) do
        m.Parent = Model
    end
    Cliff.DescendantAdded:Connect(function(a1) -- Line: 276 -- upvalues: Model (upval)
        if a1:IsA("BasePart") then
            task.defer(function() -- Line: 278 -- upvalues: a1 (val), Model (upval)
                a1.Parent = Model
            end)
        end
    end)
    addHighlight(Model, u240)
    addHighlight(Model_2, u241)
end

;(MapManager.GetLoadedMap()):andThen(function(a1) -- Line: 288 -- upvalues: refreshMap (val), MapManager (val)
    refreshMap(a1)
    MapManager.MapChanged:Connect(refreshMap)
end)
u53.Active = false
u53.QuickPlacing = false

function u53.Stop(a1) -- Line: 300 -- upvalues: u226 (val), Mobile (val)
    u226:Sweep()
    Mobile.Enable(1)
end

function u53.Enable(a1) -- Line: 305 -- upvalues: u242 (ref)
    u242 = true
end

function u53.Disable(a1) -- Line: 309 -- upvalues: u242 (ref), u53 (val)
    u242 = false
    u53:Stop()
end

Mobile.Signals.Trash:Connect(function() -- Line: 314 -- upvalues: u53 (val)
    u53:Stop()
end)
Mobile.Signals.Rotate:Connect(function() -- Line: 318 -- upvalues: u53 (val)
    u53.Rotate:Fire()
end)

local function cleanHighlights() -- Line: 322 -- upvalues: u244 (ref), TweenService (val), u240 (ref)
    local v1, v2
    if u244 then
        TweenService:Create(u244, TweenInfo.new(0.3), {FillTransparency = 1, OutlineTransparency = 1}):Play()
    end
    for i, j in u240 do
        v1 = TweenService
        v2 = TweenInfo.new(0.3)
        v1:Create(j, v2, {FillTransparency = 1, OutlineTransparency = 1}):Play()
    end
end

local function showGroundHighlights() -- Line: 338 -- upvalues: u244 (ref), TweenService (val)
    if u244 then
        TweenService:Create(u244, TweenInfo.new(0.3), {FillTransparency = 0.2, OutlineTransparency = 0}):Play()
    end
end

local function showCliffHighlights() -- Line: 347 -- upvalues: u240 (ref), TweenService (val)
    local v1, v2
    for i, j in u240 do
        v1 = TweenService
        v2 = TweenInfo.new(0.3)
        v1:Create(j, v2, {FillTransparency = 0.6, OutlineTransparency = 0.3}):Play()
    end
end

function u53.GroundHighlights(a1) -- Line: 356 -- upvalues: showGroundHighlights (val)
    showGroundHighlights()
end

function u53.CliffHighlights(a1) -- Line: 360 -- upvalues: showCliffHighlights (val)
    showCliffHighlights()
end

function u53.CleanHighlights(a1) -- Line: 364 -- upvalues: cleanHighlights (val)
    cleanHighlights()
end

function u53.ShowHighlights(a1, a2) -- Line: 368 -- upvalues: Enum_2 (val), u53 (val)
    if a2 == Enum_2.TowerType.Both then
        u53:GroundHighlights()
        u53:CliffHighlights()
    end
    if a2 == Enum_2.TowerType.Cliff then
        u53:CliffHighlights()
        return
    end
    u53:GroundHighlights()
end

function u53:Start(a2) -- Line: 381
    -- upvalues: u53 (val), u242 (ref), MapManager (val), GameState (val), u243 (ref), TweenService (val), u226 (val)
    -- upvalues: cleanHighlights (val), Players (val), SpringClass (val), PathPlacementCursorController (val)
    -- upvalues: SandboxStore (val), Animation (val), PlayerReplicator (val), Scheduler (val), RunService (val)
    -- upvalues: SharedGameFunctions (val), UpgradesStore (val), Enum_2 (val), Quaternion (val), Sound (val)
    -- upvalues: ExtraRangeRings (val), GameRules (val), SharedGameConstants (val), Notification (val), Troops (val)
    -- upvalues: TowerReplicator (val), upgradeHandler (val), UserInputService (val), HotKey (val)
    -- upvalues: ToolTipKeybindStore (val), u205 (val), u195 (val), Mobile (val)
    local WorldPosition, v1
    u53:Stop()
    if not u242 then
        return
    end
    local u7 = true
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    local Model = a2.Model
    if Model then
        Model = a2.Model:Clone()
    end
    Model.Parent = CurrentCamera
    for k, v in pairs(Model:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
    if Model.PrimaryPart:FindFirstChild("HeightOffset") then
        v1 = Model.PrimaryPart.PivotOffset - Model.PrimaryPart.PivotOffset.Position
        Model.PrimaryPart.PivotOffset = v1 + Model.PrimaryPart.HeightOffset.Position
    end
    v1 = MapManager.GetLoadedMapRaw()
    if not v1 then
        return
    end
    u53.Active = true
    local Paths = v1:WaitForChild("Paths")
    local Name = a2.Name
    local Class = a2.Class
    local u63 = a2.QuickPlaceEnabled ~= false
    local u64 = 0
    local u65 = 0
    if GameState.GameMode == "PVP" and u243 then
        TweenService:Create(u243, TweenInfo.new(0.3), {FillTransparency = 0.5, OutlineTransparency = 0.3}):Play()
        task.defer(function() -- Line: 432 -- upvalues: u226 (upval), TweenService (upval), u243 (upval)
            u226:Mark(function() -- Line: 433 -- upvalues: TweenService (upval), u243 (upval)
                TweenService:Create(u243, TweenInfo.new(0.3), {FillTransparency = 1, OutlineTransparency = 1}):Play()
            end)
        end)
    end
    u53:ShowHighlights(Class)
    task.defer(function() -- Line: 444 -- upvalues: u226 (upval), cleanHighlights (upval)
        u226:Mark(cleanHighlights)
    end)
    local Mouse = Players.LocalPlayer:GetMouse()
    local u99 = false
    local u100 = Vector3.new(0, 0, 0)
    local u105 = CFrame.Angles(0, 0, 0)
    local u112 = SpringClass.new(Vector3.new(), 0.65, 16)
    local u119 = SpringClass.new(Vector3.new(), 0.8, 200)
    local u120 = {}
    local ClientUnits = workspace:WaitForChild("ClientUnits")
    local Towers = workspace:WaitForChild("Towers")
    local NPCs = workspace:WaitForChild("NPCs")
    u120[1] = ClientUnits
    u120[2] = Towers
    u120[3] = NPCs
    u120[4] = Paths
    u120[5] = CurrentCamera
    local u145 = RaycastParams.new()
    u145.FilterType = Enum.RaycastFilterType.Exclude
    u145.FilterDescendantsInstances = u120
    local v2 = workspace:Raycast(Mouse.UnitRay.Origin, Mouse.UnitRay.Direction * 1000, u145)
    if v2 then
        u119.init(v2.Position, (Vector3.new(0, 0, 0)))
    end

    local function _createConnection(a1) -- Line: 477 -- upvalues: u120 (val), u145 (val), u226 (upval)
        if a1.Character then
            table.insert(u120, a1.Character)
            u145.FilterDescendantsInstances = u120
        end
        u226:Mark((a1.CharacterAdded:Connect(function(a1) -- Line: 478 -- upvalues: u120 (upval), u145 (upval)
            table.insert(u120, a1)
            u145.FilterDescendantsInstances = u120
        end)))
        u226:Mark((a1.CharacterRemoving:Connect(function(a1) -- Line: 488 -- upvalues: u120 (upval), u145 (upval)
            for k, v in pairs(u120) do
                if v == a1 then
                    table.remove(u120, k)
                    u145.FilterDescendantsInstances = u120
                    return
                end
            end
        end)))
    end

    PathPlacementCursorController:Stop(true)
    u53.Active = true
    Model:FindFirstChild("AnimationController")
    for k2, i in pairs(Players:GetPlayers()) do
        _createConnection(i)
    end
    u226:Mark((Players.PlayerAdded:Connect(_createConnection)))
    PathPlacementCursorController:Stop(true)
    u53.Active = true
    local AnimationController = Model:FindFirstChild("AnimationController")
    SandboxStore.setDisabledModifier("tower_placement", true)
    u226:Mark(function() -- Line: 517 -- upvalues: SandboxStore (upval)
        SandboxStore.setDisabledModifier("tower_placement", false)
    end)
    if AnimationController then
        local Idle = (Model:WaitForChild("Animations")):FindFirstChild("Idle")
        if Idle then
            local new_3 = Animation.new
            new_3({
                Target = AnimationController,
                Properties = {Looped = true},
                Track = if not Idle:IsA("Animation") then Idle:FindFirstChild(0) else Idle,
            }):Play()
        end
    end
    local Team = (PlayerReplicator.GetLocalPlayerRaw()).Team
    u226:Mark((Scheduler.add("TowerPlacement", RunService.Heartbeat, function(a1) -- Line: 542
        -- upvalues: Mouse (val), u145 (val), SharedGameFunctions (upval), a2 (val), Team (val), u99 (ref)
        -- upvalues: UpgradesStore (upval), Model (val), u100 (ref), u7 (ref), u119 (val), u65 (ref), u64 (ref)
        -- upvalues: AnimationController (val), Class (val), Enum_2 (upval), u112 (val), Quaternion (upval)
        local v1 = workspace:Raycast(Mouse.UnitRay.Origin, Mouse.UnitRay.Direction * 1000, u145)
        if v1 then
            local v2
            local v3, v4 = SharedGameFunctions.CheckTowerCollisions(a2.Name, v1.Position, Team)
            if u99 ~= v3 then
                UpgradesStore.updateValid(Model, v3)
            end
            if v3 then
                u100 = v4.Position
            end
            if not u7 then
                u119.t = v1.Position
            else
                u7 = false
                u119.init(v1.Position, (Vector3.new(0, 0, 0)))
            end
            u65 = math.lerp(u65, u64, (math.min(a1 * 10, 1)))
            local v5 = (CFrame.new(u119.p)) * CFrame.Angles(0, math.rad(u65), 0)
            if not AnimationController then
                v2 = v5
            elseif Class ~= Enum_2.TowerType.Flying then
                u112.t = v5.p
                local v6 = (Quaternion(v1.Normal, v1.Normal + -0.01 * u112.v)) + u112.p
                v2 = v5 * (v6 - v6.p)
            else
                v2 = v5
            end
            Model:PivotTo((CFrame.new(v2.X, v1.Position.Y, v2.Z)) * (CFrame.Angles((v2:toEulerAnglesXYZ()))))
        end
    end)))
    u226:Mark(Model)
    u226:Mark((u53.Rotate:Connect(function() -- Line: 586 -- upvalues: u105 (ref), u64 (ref), Sound (upval)
        u105 = u105 * CFrame.Angles(0, 0.7853981633974483, 0)
        u64 = u64 + 45
        Sound("Rotate"):Play(true)
    end)))
    local FlightPos = Model:FindFirstChild("FlightPos")
    local PrimaryPart = Model.PrimaryPart or Model:FindFirstChild("HumanoidRootPart") or Model:FindFirstChild("RootPart")
    local u340 = a2.Range or 0
    local u342 = a2.Deadzone or 0
    local u344 = a2.Buildzone or 0
    local u353 = ExtraRangeRings.forPlacement(Name, a2.Asset)
    local u411 = nil
    if not PrimaryPart:FindFirstChild("HeightOffset") then
        local BoundingBox, BoundingBox_2 = Model:GetBoundingBox()
        WorldPosition = BoundingBox.Position - Vector3.new(0, BoundingBox_2.Y * 0.5, 0)
    else
        WorldPosition = PrimaryPart.HeightOffset.WorldPosition
    end

    local function getRangeSize() -- Line: 611 -- upvalues: u340 (val), GameState (upval), GameRules (upval)
        local v1 = u340
        if GameState.IsModifierEnabled("Fog") then
            v1 = math.round(v1 * 0.65)
        end
        local v2 = GameRules.Get("TowerRangeMultiplier") or 1
        if v2 ~= 1 then
            v1 = math.round(v1 * v2)
        end
        return v1
    end

    local u396 = u340
    if GameState.IsModifierEnabled("Fog") then
        u396 = math.round(u396 * 0.65)
    end
    local v3 = GameRules.Get("TowerRangeMultiplier") or 1
    if v3 ~= 1 then
        u396 = math.round(u396 * v3)
    end
    if FlightPos then
        u411 = (FlightPos.Position * Vector3.new(1, 0, 1) - WorldPosition * Vector3.new(1, 0, 1)).Magnitude
    end
    if a2.Asset.Animator.PreviewPlacement then
        task.defer(function() -- Line: 634 -- upvalues: Model (val), u226 (upval), u411 (ref), u396 (ref), a2 (val)
            a2.Asset.Animator:PreviewPlacement({model = Model, maid = u226, range = u411 or u396, data = a2.Asset})
        end)
    end
    local updateTower = UpgradesStore.updateTower
    local v4 = {
        enabled = false,
        showBoundaries = true,
        valid = self.Authorized,
        model = Model,
        tower = Name,
        range = u396,
        flightRange = u411,
        extraRings = u353,
    }
    local BoundarySize = a2.Asset.Properties.BoundarySize or SharedGameConstants.DEFAULT_BOUNDARY_SIZE
    v4.boundary = BoundarySize * 2
    v4.deadzone = u342
    v4.buildzone = u344
    updateTower(v4)

    local function refreshRange() -- Line: 662
        -- upvalues: u396 (ref), u340 (val), GameState (upval), GameRules (upval), UpgradesStore (upval), u411 (ref)
        -- upvalues: u353 (val), u342 (val), u344 (val)
        local v1 = u340
        if GameState.IsModifierEnabled("Fog") then
            v1 = math.round(v1 * 0.65)
        end
        local v2 = GameRules.Get("TowerRangeMultiplier") or 1
        if v2 ~= 1 then
            v1 = math.round(v1 * v2)
        end
        UpgradesStore.updateZone({
            range = v1,
            flightRange = u411,
            extraRings = u353,
            deadzone = u342,
            buildzone = u344,
        })
    end

    u226:Mark((GameRules.GetRuleChangedEvent("TowerRangeMultiplier"):Connect(refreshRange)))
    u226:Mark(((GameState.Replicator:GetStateChangedSignal("GlobalModifiersEnabled")):Connect(refreshRange)))
    u226:Mark(function() -- Line: 679 -- upvalues: u53 (upval), UpgradesStore (upval)
        u53.Active = false
        UpgradesStore.updateTower({
            enabled = false,
            showBoundaries = false,
            valid = false,
            range = 0,
            boundary = 0,
            deadzone = 0,
            buildzone = 0,
            extraRings = {},
        })
    end)
    u226:Mark((u53.Place:Connect(function() -- Line: 696
        -- upvalues: u99 (ref), Sound (upval), Notification (upval), u53 (upval), a2 (val), u100 (ref), u105 (ref)
        -- upvalues: Troops (upval), Name (val), TowerReplicator (upval), UpgradesStore (upval), upgradeHandler (upval)
        if not u99 then
            Sound("Error"):Play(true)
            Notification.Create({Text = "You cannot place here!", Color = Color3.fromRGB(236, 0, 0)})
            return
        end
        u53.Finished:Fire()
        if a2.OnPlace then
            a2.OnPlace(u100, u105)
            Sound("Place"):Play(true)
            return
        end
        local u44 = Troops:InvokeServer("Place", {Position = u100, Rotation = u105}, Name)
        if u44 and typeof(u44) == "Instance" then
            Sound("Place"):Play(true)
            if a2.Asset.Animator.Placed and u44:IsA("Model") then
                task.defer(function() -- Line: 725 -- upvalues: a2 (upval), u44 (val), u100 (upval), u105 (upval)
                    a2.Asset.Animator:Placed({model = u44, position = u100, rotation = u105, data = a2.Asset})
                end)
            end
            TowerReplicator.waitForTowerByModel(u44)
            task.delay(0.2, function() -- Line: 736 -- upvalues: UpgradesStore (upval), u53 (upval), upgradeHandler (upval), u44 (val)
                if UpgradesStore.getState().disabled or u53.Active then
                    return
                end
                upgradeHandler:selectTroop(u44)
            end)
            return
        end
        Sound("Error"):Play(true)
        Notification.Create({Text = u44, Color = Color3.fromRGB(236, 0, 0)})
    end)))
    if UserInputService.TouchEnabled then
        Mobile.Enable(2)
    else
        local v5, v6
        local u559 = HotKey.new("Rotate Tower")
        local u563 = HotKey.new("Cancel Placement")
        local u578 = if not u63 then nil else HotKey.new("Quick Placement")
        if u578 then
            u578.Pressed:Connect(function(a1) -- Line: 765 -- upvalues: u53 (upval)
                u53.QuickPlacing = a1
            end)
        end
        u559.Pressed:Connect(function(a1) -- Line: 770 -- upvalues: u53 (upval)
            local Rotate = u53.Rotate
            if a1 and Rotate then
                Rotate:Fire()
            end
        end)
        u563.Pressed:Connect(function(a1) -- Line: 778 -- upvalues: u53 (upval), Sound (upval)
            if a1 and u53.Active then
                Sound("Trash"):Play()
                u53:Stop()
            end
        end)
        u226:Mark(function() -- Line: 785 -- upvalues: u559 (val), u563 (val), u578 (val), u53 (upval), ToolTipKeybindStore (upval)
            u559:Destroy()
            u563:Destroy()
            if u578 then
                u578:Destroy()
            end
            u53.QuickPlacing = false
            ToolTipKeybindStore.reset()
        end)

        local function update() -- Line: 798
            -- upvalues: ToolTipKeybindStore (upval), UserInputService (upval), u205 (upval), u63 (val), u195 (upval)
            local v1, v2
            local addBinds = ToolTipKeybindStore.addBinds
            if not UserInputService.GamepadEnabled then
                if not u63 then
                    v2 = table.clone(u195)
                    v2["Quick Placement"] = nil
                    v1 = v2
                else
                    v1 = u195
                end
            elseif (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1 then
                v1 = u205
            elseif not u63 then
                v2 = table.clone(u195)
                v2["Quick Placement"] = nil
                v1 = v2
            else
                v1 = u195
            end
            addBinds(v1)
        end

        local addBinds = ToolTipKeybindStore.addBinds
        if not UserInputService.GamepadEnabled then
            if not u63 then
                v6 = table.clone(u195)
                v6["Quick Placement"] = nil
                v5 = v6
            else
                v5 = u195
            end
        elseif (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1 then
            v5 = u205
        elseif not u63 then
            v6 = table.clone(u195)
            v6["Quick Placement"] = nil
            v5 = v6
        else
            v5 = u195
        end
        addBinds(v5)
        u226:Mark((UserInputService.LastInputTypeChanged:Connect(update)))
        u226:Mark((UserInputService.GamepadConnected:Connect(update)))
        u226:Mark((UserInputService.GamepadDisconnected:Connect(update)))
    end
    u226:Mark((u53.Finished:Connect(function() -- Line: 816 -- upvalues: u53 (upval)
        if not u53.QuickPlacing then
            u53:Stop()
        end
    end)))
    return true
end

Hotbar.Clicked:Connect(function(a1, a2, a3) -- Line: 825 -- upvalues: CrosshairStore (val), Asset (val), u53 (val)
    if CrosshairStore.getState().enabled then
        return
    end
    local v1 = Asset("Troops", a1)
    if v1 then
        local v2 = Asset("TroopsModel", a1, a2)
        if v2 then
            local Golden = a3 and v1.Stats.Golden and v1.Stats.Golden or v1.Stats.Default
            local Defaults = Golden.Defaults
            return u53:Start({
                Name = a1,
                Class = v1.Properties.Class,
                Asset = v1,
                Model = v2,
                Range = Defaults.Range,
                Deadzone = Defaults.Attributes and Defaults.Attributes.Deadzone or 0,
                Buildzone = Defaults.Attributes and Defaults.Attributes.Buildzone or 0,
            })
        end
    end
end)
return u53