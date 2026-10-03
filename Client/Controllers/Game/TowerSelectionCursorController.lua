-- Script path: ReplicatedStorage.Client.Controllers.Game.TowerSelectionCursorController
-- Decompile time: 8.89 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local HighlightUtil = require(ReplicatedStorage.Shared.Modules.HighlightUtil)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u63 = nil
local Mouse = Players.LocalPlayer:GetMouse()
local UserId = Players.LocalPlayer.UserId
local u70 = nil
HighlightUtil.registerGroups({
    {
        name = "towerSelection",
        fillTransparency = 1,
        strokeTransparency = 0,
        fillColor = Color3.fromRGB(153, 153, 153),
        strokeColor = Color3.fromRGB(255, 255, 255),
    },
    {
        name = "towerSelected",
        fillTransparency = 0.5,
        strokeTransparency = 0,
        fillColor = Color3.fromRGB(255, 255, 255),
        strokeColor = Color3.fromRGB(255, 255, 255),
    },
})

local function getNewPlacement() -- Line: 47 -- upvalues: ReplicatedStorage (val)
    return require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
end

local function toggleMouseIcon(a1) -- Line: 51 -- upvalues: Mouse (val) -- types: a1: boolean
    if a1 then
        Mouse.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
        return
    end
    Mouse.Icon = ""
end

local function getSelectBinds(a1) -- Line: 59 -- upvalues: UserInputService (val) -- types: a1: string
    if (UserInputService:GetLastInputType()) == Enum.UserInputType.Gamepad1 then
        return {
            ["Select Tower"] = {
                Layout = 1,
                ScaleMultiplier = 0.4,
                Key = Enum.KeyCode.ButtonR2,
                ActionText = a1,
            },
            ["Cancel Selection"] = {
                ActionText = "Cancel",
                Layout = 2,
                ScaleMultiplier = 0.4,
                Key = Enum.KeyCode.ButtonB,
            },
        }
    end
    local v1 = {}
    if UserInputService.MouseEnabled then
        v1["Select Tower"] = {
            Layout = 1,
            ScaleMultiplier = 0.4,
            Icon = "LMB",
            IconSize = 1.35,
            Key = Enum.UserInputType.MouseButton1,
            ActionText = a1,
        }
    end
    if UserInputService.KeyboardEnabled then
        v1["Cancel Selection"] = {ActionText = "Cancel", Layout = 2, ScaleMultiplier = 0.4, Key = Enum.KeyCode.Q}
    end
    return v1
end

local function clearSelections() -- Line: 102 -- upvalues: ReplicatedStorage (val), PathPlacementCursorController (val)
    local v1
    require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController):Stop()
    PathPlacementCursorController:Stop()
    for i, j in {"Hover", "Selection", "Target"} do
        v1 = workspace.Camera:FindFirstChild(j)
        if v1 then
            v1.Adornee = nil
        end
    end
end

local function getTowerOwnerId(a1) -- Line: 114 -- types: a1: userdata
    local Owner = a1:FindFirstChild("Owner")
    if Owner and Owner:IsA("NumberValue") then
        return Owner.Value
    end
    return nil
end

local function getTowerModelFromReference(a1) -- Line: 123 -- types: a1: userdata
    if a1:IsA("Model") then
        return a1
    end
    if a1:IsA("Folder") and a1.Parent and a1.Parent:IsA("Model") then
        return a1.Parent
    end
    return a1:FindFirstAncestorOfClass("Model")
end

return {
    isActive = function() -- Line: 379 -- upvalues: u63 (ref)
        return u63 ~= nil
    end,
    getCurrentSelection = function() -- Line: 382 -- upvalues: u70 (ref)
        return u70
    end,
    start = function(a1) -- Line: 144
        -- upvalues: u63 (ref), u70 (ref), clearSelections (val), HighlightUtil (val), UserId (val), Mouse (val)
        -- upvalues: ClientAtoms (val), TypedPromise (val), Maid (val), ToolTipKeybindStore (val), getSelectBinds (val)
        -- upvalues: TagObserver (val), UserInputService (val), Scheduler (val), RunService (val)
        -- upvalues: PathPlacementCursorController (val), ReplicatedStorage (val)
        if not a1 then
            error("TowerSelectionCursor.start requires data")
        end
        if u63 then
            u63:cancel()
        end
        u70 = nil
        u63 = nil
        clearSelections()
        local u17 = a1.ownedTowersOnly == true
        local filter = a1.filter
        local u21 = a1.selectActionText or "Select Tower"
        local u22 = {}
        local towerSelected = HighlightUtil.getGroupModel("towerSelected")
        local towerSelection = HighlightUtil.getGroupModel("towerSelection")
        local u44 = HighlightUtil.createHighlight({
            fillTransparency = 0.5,
            strokeTransparency = 0,
            fillColor = Color3.fromRGB(255, 0, 0),
            strokeColor = Color3.fromRGB(255, 0, 0),
        })
        u44.Adornee = workspace.Towers
        u44.Parent = workspace
        towerSelection.Parent = workspace
        towerSelected.Parent = workspace
        local u51 = RaycastParams.new()
        u51.FilterType = Enum.RaycastFilterType.Include
        u51.FilterDescendantsInstances = {towerSelected, towerSelection}

        local function isSelectableTower(a1) -- Line: 176
            -- upvalues: u17 (val), UserId (upval), filter (val)
            local Owner = a1:FindFirstChild("Owner")
            local v1 = (if not Owner then nil else if not Owner:IsA("NumberValue") then nil else Owner.Value) ~= nil
            if v1 and u17 then
                local Value
                v1 = Value == UserId
            end
            if v1 and filter then
                v1 = filter(a1)
            end
            return v1
        end

        local function addSelectableTower(a1) -- Line: 191
            -- upvalues: u22 (val), towerSelected (val), towerSelection (val), u17 (val), UserId (upval), filter (val)
            if a1 and a1.Parent then
                if not u22[a1] and a1.Parent ~= towerSelected and a1.Parent ~= towerSelection then
                    local Owner = a1:FindFirstChild("Owner")
                    local v1 = (if not Owner then nil else if not Owner:IsA("NumberValue") then nil else Owner.Value) ~= nil
                    if v1 and u17 then
                        local Value
                        v1 = Value == UserId
                    end
                    if v1 and filter then
                        v1 = filter(a1)
                    end
                    if v1 then
                        u22[a1] = true
                        a1.Parent = towerSelection
                    end
                    return
                end
                return
            end
        end

        local function getRaycastSelectedTower(a1) -- Line: 210
            -- upvalues: Mouse (upval), u51 (val), u22 (val)
            local v1 = a1 or Mouse.UnitRay
            local v2 = workspace:Raycast(v1.Origin, v1.Direction * 1000, u51)
            if not v2 then
                return nil
            end
            local v3 = v2.Instance:FindFirstAncestorOfClass("Model")
            if not v3 then
                return nil
            end
            if u22[v3] then
                return v3
            end
            return nil
        end

        local function getTapRay(a1) -- Line: 227 -- types: a1: userdata
            local CurrentCamera = workspace.CurrentCamera
            if not CurrentCamera then
                return nil
            end
            return CurrentCamera:ViewportPointToRay(a1.X, a1.Y)
        end

        ClientAtoms.hideTowerRings(true)
        local v1 = TypedPromise.new(function(a1, a2, a3) -- Line: 238
            -- upvalues: Maid (upval), Mouse (upval), ToolTipKeybindStore (upval), ClientAtoms (upval), u44 (val)
            -- upvalues: towerSelected (val), towerSelection (val), u63 (upval), getSelectBinds (upval), u21 (val)
            -- upvalues: TagObserver (upval), u22 (val), u17 (val), UserId (upval), filter (val)
            -- upvalues: UserInputService (upval), u70 (upval), u51 (val), Scheduler (upval), RunService (upval)
            -- upvalues: PathPlacementCursorController (upval), ReplicatedStorage (upval)
            local u5 = Maid.new()
            local u6 = false

            local function finish(a1) -- Line: 242 -- upvalues: u6 (ref), u5 (val) -- types: a1: function
                if u6 then
                    return
                end
                u6 = true
                task.defer(function() -- Line: 249 -- upvalues: u5 (upval), a1 (val)
                    u5:Sweep()
                    a1()
                end)
            end

            u5:Mark(function() -- Line: 255
                -- upvalues: Mouse (upval), ToolTipKeybindStore (upval), ClientAtoms (upval), u44 (upval)
                -- upvalues: towerSelected (upval), towerSelection (upval), u63 (upval)
                Mouse.Icon = ""
                ToolTipKeybindStore.reset()
                ClientAtoms.hideTowerRings(false)
                if u44.Parent then
                    u44:Destroy()
                end
                for i, j in towerSelected:GetChildren() do
                    j.Parent = workspace.Towers
                end
                for k, n in towerSelection:GetChildren() do
                    n.Parent = workspace.Towers
                end
                towerSelection.Parent = nil
                towerSelected.Parent = nil
                u63 = nil
            end)
            ToolTipKeybindStore.addBinds((getSelectBinds(u21)))
            a3(function() -- Line: 279 -- upvalues: u5 (val)
                u5:Sweep()
            end)
            local v1 = TagObserver
            local v2 = {workspace}
            v1 = v1("Tower", function(a1) -- Line: 283
                -- upvalues: u22 (upval), towerSelected (upval), towerSelection (upval), u17 (upval), UserId (upval)
                -- upvalues: filter (upval)
                local Parent = if not a1:IsA("Model") then if not a1:IsA("Folder") then a1:FindFirstAncestorOfClass("Model") else if not a1.Parent then a1:FindFirstAncestorOfClass("Model") else if not a1.Parent:IsA("Model") then a1:FindFirstAncestorOfClass("Model") else a1.Parent else a1
                if Parent
                    and Parent.Parent
                    and not u22[Parent]
                    and Parent.Parent ~= towerSelected
                    and Parent.Parent ~= towerSelection then
                    local Owner = Parent:FindFirstChild("Owner")
                    local v1 = (if not Owner then nil else if not Owner:IsA("NumberValue") then nil else Owner.Value) ~= nil
                    if v1 and u17 then
                        local Value
                        v1 = Value == UserId
                    end
                    if v1 and filter then
                        v1 = filter(Parent)
                    end
                    if v1 then
                        u22[Parent] = true
                        Parent.Parent = towerSelection
                    end
                end
                return function() end
            end, v2)
            u5:Mark(v1)
            u5:Mark((UserInputService.InputBegan:Connect(function(a1_2, a2_2) -- Line: 289
                -- upvalues: u6 (ref), u70 (upval), Mouse (upval), u51 (upval), u22 (upval), a1 (val), a2 (val)
                -- upvalues: u5 (val)
                if u6 or a2_2 then
                    return
                end
                if a1_2.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    if a1_2.KeyCode ~= Enum.KeyCode.Q and a1_2.KeyCode ~= Enum.KeyCode.Escape then
                        return
                    end

                    local function u42() -- Line: 308 -- upvalues: a2 (upval)
                        a2("Selection cancelled")
                    end

                    if u6 then
                        return
                    end
                    u6 = true
                    task.defer(function() -- Line: 249 -- upvalues: u5 (upval), u42 (val)
                        u5:Sweep()
                        u42()
                    end)
                    return
                end
                local u30 = u70
                if not u30 then
                    local v1 = Mouse.UnitRay
                    local v2 = workspace:Raycast(v1.Origin, v1.Direction * 1000, u51)
                    if v2 then
                        local v3 = v2.Instance:FindFirstAncestorOfClass("Model")
                        u30 = if v3 then if not u22[v3] then nil else v3 else nil
                    else
                        u30 = nil
                    end
                end

                local function u31() -- Line: 300 -- upvalues: u30 (val), a1 (upval), a2 (upval)
                    if u30 then
                        a1(u30)
                        return
                    end
                    a2("Selection cancelled")
                end

                if u6 then
                    return
                end
                u6 = true
                task.defer(function() -- Line: 249 -- upvalues: u5 (upval), u31 (val)
                    u5:Sweep()
                    u31()
                end)
            end)))
            u5:Mark((UserInputService.TouchTapInWorld:Connect(function(a1_2, a2_2) -- Line: 316
                -- upvalues: u6 (ref), u70 (upval), Mouse (upval), u51 (upval), u22 (upval), a1 (val), a2 (val)
                -- upvalues: u5 (val)
                if u6 or a2_2 then
                    return
                end
                local u37 = u70
                if not u37 then
                    local CurrentCamera = workspace.CurrentCamera
                    local v1 = (if CurrentCamera then CurrentCamera:ViewportPointToRay(a1_2.X, a1_2.Y) else nil) or Mouse.UnitRay
                    local v2 = workspace:Raycast(v1.Origin, v1.Direction * 1000, u51)
                    if v2 then
                        local v3 = v2.Instance:FindFirstAncestorOfClass("Model")
                        u37 = if v3 then if not u22[v3] then nil else v3 else nil
                    else
                        u37 = nil
                    end
                end

                local function u38() -- Line: 327 -- upvalues: u37 (val), a1 (upval), a2 (upval)
                    if u37 then
                        a1(u37)
                        return
                    end
                    a2("Selection cancelled")
                end

                if u6 then
                    return
                end
                u6 = true
                task.defer(function() -- Line: 249 -- upvalues: u5 (upval), u38 (val)
                    u5:Sweep()
                    u38()
                end)
            end)))
            u5:Mark((Scheduler.add("TowerSelectionCursor", RunService.Heartbeat, function(a1) -- Line: 338
                -- upvalues: u6 (ref), PathPlacementCursorController (upval), ReplicatedStorage (upval), u63 (upval)
                -- upvalues: u70 (upval), Mouse (upval), u51 (upval), u22 (upval), towerSelection (upval)
                -- upvalues: towerSelected (upval)
                if u6 then
                    return
                end
                if not PathPlacementCursorController.active
                    and not require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController).Active then
                    local v1
                    local v2 = Mouse.UnitRay
                    local v3 = workspace:Raycast(v2.Origin, v2.Direction * 1000, u51)
                    if v3 then
                        local v4 = v3.Instance:FindFirstAncestorOfClass("Model")
                        v1 = if v4 then if not u22[v4] then nil else v4 else nil
                    else
                        v1 = nil
                    end
                    if not v1 then
                        if u70 then
                            u70.Parent = towerSelection
                            u70 = nil
                            Mouse.Icon = ""
                        end
                        return
                    end
                    if v1 == u70 then
                        return
                    end
                    if u70 then
                        u70.Parent = towerSelection
                        u70 = nil
                    end
                    u70 = v1
                    v1.Parent = towerSelected
                    Mouse.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
                    return
                end
                if u63 then
                    u63:cancel()
                end
                u70 = nil
                u63 = nil
            end)))
        end)
        u63 = v1
        return v1
    end,
    stop = function() -- Line: 135 -- upvalues: u63 (ref), u70 (ref)
        if u63 then
            u63:cancel()
        end
        u70 = nil
        u63 = nil
    end,
}