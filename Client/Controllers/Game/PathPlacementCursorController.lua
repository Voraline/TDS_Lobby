-- Script path: ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController
-- Decompile time: 7.00 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local HotKey = require(ReplicatedStorage.Client.Modules.HotKey)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MapManager = require(ReplicatedStorage.Shared.Modules.MapManager)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PathCursorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PathCursorStore)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local u96 = {active = false}
u96.Place = Signal.new()
u96.Canceled = Signal.new()
u96.OnClicked = Signal.new()
u96.CantPlace = false
u96.CurrentPosition = Vector3.new(0, 0, 0)
u96.CurrentPathToEnd = 0
u96.CurrentPath = nil
u96.SIZE = 4
local u110 = Maid.new()
local u111 = Vector3.new(0, 0, 0)
local u112 = 0
local u113 = nil
local u114 = nil
local u115 = {}
u115["Place Tower"] = {
    ActionText = "Place",
    Layout = 1,
    ScaleMultiplier = 0.4,
    Icon = "LMB",
    IconSize = 1.35,
    Key = Enum.UserInputType.MouseButton1,
}
u115["Cancel Placement"] = {ActionText = "Cancel", Layout = 2, ScaleMultiplier = 0.4, Key = Enum.KeyCode.Q}
local u122 = {}
u122["Place Tower"] = {ActionText = "Place", Layout = 1, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonR2}
u122["Cancel Placement"] = {ActionText = "Cancel", Layout = 5, ScaleMultiplier = 0.4, Key = Enum.KeyCode.ButtonB}

local function listenForCharacterAdded(a1, a2) -- Line: 82 -- upvalues: u110 (val) -- types: a1: userdata, a2: userdata
    if a1.Character then
        a2:AddToFilter(a1.Character)
    end
    u110:Mark((a1.CharacterAdded:Connect(function(a1) -- Line: 87 -- upvalues: a2 (val)
        a2:AddToFilter(a1)
    end)))
end

local function getPointOnPath(a1, a2) -- Line: 92
    -- upvalues: PlayerReplicator (val), GameState (val)
    local ClosestPoint, ClosestPoint_2, Magnitude
    local v1 = GameState.Paths[a2 or PlayerReplicator.GetLocalPlayerRaw().Team]
    local v2 = nil
    local v3 = (1 / 0)
    local v4 = nil
    local v5 = nil
    local v6 = nil
    for i, j in v1 do
        if tonumber(i) then
            ClosestPoint, ClosestPoint_2 = j:GetClosestPoint(a1)
            Magnitude = (ClosestPoint - a1).Magnitude
            if Magnitude < v3 then
                v6 = i
                v2 = j
                v3 = Magnitude
                v4 = ClosestPoint
                v5 = ClosestPoint_2
            end
        end
    end
    if not v2 then
        return nil
    end
    return {
        closetPath = v2,
        closestDistance = v3,
        closestPosition = v4,
        closestPathToEnd = v5,
        closestPathName = v6,
    }
end

function u96.Stop(a1) -- Line: 132 -- upvalues: ReplicatedStorage (val), u110 (val)
    require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController):Stop()
    u110:Sweep()
end

function u96.Start(a1, a2) -- Line: 139
    -- upvalues: u96 (val), Players (val), SpringClass (val), Enum (val), MapManager (val), u110 (val)
    -- upvalues: ToolTipKeybindStore (val), UserInputService (val), u122 (val), u115 (val), PathCursorStore (val)
    -- upvalues: Scheduler (val), RunService (val), getPointOnPath (val), u114 (ref), u111 (ref), u113 (ref), u112 (ref)
    -- upvalues: HotKey (val), Sound (val), Notification (val)
    local u197 = a2 or {}
    if not u197.reposition then
        u96.CantPlace = false
    end
    u96:Stop()
    local Mouse = Players.LocalPlayer:GetMouse()
    local u243 = u197.constrainToPath ~= false
    local u254 = SpringClass.new(Vector3.new(0, 0, 0), 0.8, 200)
    local v1 = if not u197.constrainToGround then {
        workspace:WaitForChild("ClientUnits"),
        workspace:WaitForChild("Towers"),
        workspace:WaitForChild("NPCs"),
        workspace.CurrentCamera,
    } else {workspace:WaitForChild("Ground"), (workspace:WaitForChild("Cliff"))}
    local u149 = RaycastParams.new()
    u149.FilterDescendantsInstances = v1
    local Include = if not u197.constrainToGround then Enum.RaycastFilterType.Exclude else Enum.RaycastFilterType.Include
    u149.FilterType = Include
    local v2 = workspace:Raycast(Mouse.UnitRay.Origin, Mouse.UnitRay.Direction * 1000, u149)
    if u197.reposition then
        local v3 = MapManager.GetLoadedMapRaw()
        local team = u197.team and v3.Parent:FindFirstChild((Enum.Team.ToString(u197.team)))
        if not team then end
    end
    if v2 then
        u254.init(v2.Position, (Vector3.new(0, 0, 0)))
    end
    if not u197.constrainToGround then
        for i, j in Players:GetPlayers() do
            if j.Character then
                u149:AddToFilter(j.Character)
            end
            u110:Mark((j.CharacterAdded:Connect(function(a1) -- Line: 87 -- upvalues: u149 (val)
                u149:AddToFilter(a1)
            end)))
        end
        u110:Mark((Players.PlayerAdded:Connect(function(a1) -- Line: 203 -- upvalues: u149 (val), u110 (upval)
            local u1 = u149
            if a1.Character then
                u1:AddToFilter(a1.Character)
            end
            u110:Mark((a1.CharacterAdded:Connect(function(a1) -- Line: 87 -- upvalues: u1 (val)
                u1:AddToFilter(a1)
            end)))
        end)))
    end
    local u162 = true
    local u163 = false
    local u164 = false
    ToolTipKeybindStore.addBinds(if not UserInputService.GamepadEnabled then u115 else if (UserInputService:GetLastInputType()) ~= Enum.UserInputType.Gamepad1 then u115 else u122)
    u110:Mark(function() -- Line: 219 -- upvalues: ToolTipKeybindStore (upval)
        ToolTipKeybindStore.reset()
    end)
    PathCursorStore.setSize(u96.SIZE)
    PathCursorStore.setVisible(if u197.uiEnabled ~= nil then u197.uiEnabled else true)
    u110:Mark(function() -- Line: 227 -- upvalues: PathCursorStore (upval)
        PathCursorStore.setVisible(false)
    end)
    u110:Mark((Scheduler.add("PlacementCursor", RunService.Heartbeat, function() -- Line: 231
        -- upvalues: Mouse (val), u149 (val), u164 (ref), u96 (upval), u243 (val), getPointOnPath (upval), u197 (ref)
        -- upvalues: Players (upval), u114 (upval), u111 (upval), u113 (upval), u112 (upval), u162 (ref), u254 (val)
        -- upvalues: PathCursorStore (upval)
        local v1 = workspace:Raycast(Mouse.UnitRay.Origin, Mouse.UnitRay.Direction * 1000, u149)
        if not v1 then
            u164 = false
            u96.CantPlace = true
            return
        end
        if not u243 then
            u164 = true
            u96.CantPlace = false
            u111 = v1.Position
            if not u162 then
                u254.t = u111
            else
                u162 = false
                u254.init(u111, (Vector3.new(0, 0, 0)))
            end
            u96.CurrentPosition = u111
            u96.CurrentPathToEnd = u112
            u96.CurrentPath = u113
            PathCursorStore.setPosition(u111)
            return
        end
        local v2 = getPointOnPath(v1.Position, u197.team)
        if not v2 then
            u164 = false
            u96.CantPlace = true
            return
        end
        u164 = true
        if not u197.placementRadius or not v2.closestPosition then
            u96.CantPlace = false
        else
            local Magnitude = (v2.closestPosition - Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
            if not (u197.placementRadius < Magnitude) then
                u96.CantPlace = false
            else
                u96.CantPlace = true
            end
        end
        u114 = v2.closestPathName
        u111 = v2.closestPosition
        u113 = v2.closetPath
        u112 = v2.closestPathToEnd
        if not u162 then
            u254.t = u111
        else
            u162 = false
            u254.init(u111, (Vector3.new(0, 0, 0)))
        end
        u96.CurrentPosition = u111
        u96.CurrentPathToEnd = u112
        u96.CurrentPath = u113
        PathCursorStore.setPosition(u111)
    end)))
    if not UserInputService.TouchEnabled then
        local v4 = HotKey.new("Cancel Placement", Enum.KeyCode.ButtonB)
        v4.Pressed:Connect(function(a1) -- Line: 297 -- upvalues: u96 (upval), Sound (upval)
            if a1 and u96.active then
                Sound("Trash"):Play()
                u96:Stop()
                u96.Canceled:Fire()
            end
        end)
        u110:Mark(v4)
    end
    u110:Mark(function() -- Line: 308 -- upvalues: u111 (upval), u113 (upval), u112 (upval), u114 (upval), u96 (upval), u163 (ref)
        u111 = Vector3.new(0, 0, 0)
        u113 = nil
        u112 = 0
        u114 = nil
        u96.CurrentPosition = Vector3.new(0, 0, 0)
        u96.CurrentPathToEnd = 0
        u96.CurrentPath = nil
        u96.active = false
        if not u163 then
            u96.Canceled:Fire()
        end
    end)
    u110:Mark((u96.Place:Connect(function() -- Line: 327
        -- upvalues: u96 (upval), u164 (ref), Sound (upval), Notification (upval), u111 (upval), u163 (ref), u243 (val)
        -- upvalues: u114 (upval), u112 (upval)
        if not u96.CantPlace and u164 then
            local v1 = u111
            u163 = v1 ~= nil
            task.defer(function() -- Line: 343 -- upvalues: u96 (upval)
                u96:Stop()
            end)
            if not v1 then
                return
            end
            if not u243 then
                u96.OnClicked:Fire(nil, nil, v1)
                return
            end
            local v2 = u112
            u96.OnClicked:Fire(u114, v2, v1)
            return
        end
        Sound("Error"):Play(true)
        Notification.Create({Text = "You cannot place here!", Color = Color3.fromRGB(236, 0, 0)})
    end)))
    u96.active = true
end

return u96