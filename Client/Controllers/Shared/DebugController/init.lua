-- Script path: ReplicatedStorage.Client.Controllers.Shared.DebugController
-- Decompile time: 8.28 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Gizmo = require(ReplicatedStorage.Packages.Gizmo)
local Iris = require(ReplicatedStorage.Packages.Iris)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
require(ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.Types)
local Version = require(ReplicatedStorage.Version)
local u65 = {"Developer", "Owner"}
local u70 = RunService:IsStudio()
local u71 = {Gizmo = Gizmo, Iris = Iris}
u71._windows = {}
u71._gizmos = {}
u71._oneShotGizmos = {}
u71._gizmosEnabled = {}
u71._windowsEnabled = {}
u71._enabled = false
u71._globallyEnabled = false
u71._anyGizmoEnabled = false

local function updateGizmosEnabled() -- Line: 60 -- upvalues: u71 (val)
    local v1 = false
    for i, j in u71._gizmosEnabled do
        if j:get() then
            v1 = true
            break
        end
    end
    u71._anyGizmoEnabled = v1
end

function u71.canEnable() -- Line: 73 -- upvalues: RunService (val), SharedGameConstants (val), Players (val), u65 (val)
    if RunService:IsStudio() then
        return true
    end
    if not SharedGameConstants.IS_PROD and game.GameId ~= 4888175249 then
        return true
    end
    return table.find(u65, (Players.LocalPlayer:WaitForChild("Flair")).Value) ~= nil
end

function u71.createWindow(a1, a2) -- Line: 86 -- upvalues: u71 (val), Iris (val) -- types: a1: string, a2: function
    u71._windows[a1] = a2
    u71._windowsEnabled[a1] = (Iris.State(false))
    return function() -- Line: 90 -- upvalues: u71 (upval), a1 (val)
        u71._windows[a1] = nil
        u71._windowsEnabled[a1] = nil
    end
end

function u71.createOneShotGizmo(a1, a2, a3) -- Line: 96
    -- upvalues: u71 (val), Iris (val)
    if not u71._oneShotGizmos[a1] then
        local v1 = Iris.State(false)
        u71._oneShotGizmos[a1] = {}
        u71._gizmosEnabled[a1] = v1
        v1:onChange(function() -- Line: 103 -- upvalues: u71 (upval)
            local v1 = false
            for i, j in u71._gizmosEnabled do
                if j:get() then
                    v1 = true
                    break
                end
            end
            u71._anyGizmoEnabled = v1
        end)
    end
    if not u71._gizmosEnabled[a1]:get() then
        return function() end
    end
    u71._oneShotGizmos[a1][a3] = a2
    return function() -- Line: 114 -- upvalues: u71 (upval), a1 (val), a3 (val)
        local v1 = u71._oneShotGizmos[a1]
        v1[a3] = nil
    end
end

function u71.createGizmo(a1, a2) -- Line: 119 -- upvalues: Iris (val), u71 (val) -- types: a1: string, a2: function
    local v1 = Iris.State(false)
    u71._gizmosEnabled[a1] = v1
    u71._gizmos[a1] = a2
    v1:onChange(function() -- Line: 125 -- upvalues: u71 (upval)
        local v1 = false
        for i, j in u71._gizmosEnabled do
            if j:get() then
                v1 = true
                break
            end
        end
        u71._anyGizmoEnabled = v1
    end)
    return function() -- Line: 129 -- upvalues: u71 (upval), a1 (val), a2 (val)
        if u71._gizmos[a1] == a2 then
            u71._gizmos[a1] = nil
            u71._gizmosEnabled[a1] = nil
        end
    end
end

function u71._createVersionInfo(a1) -- Line: 137
    -- upvalues: RunService (val), Players (val), Create (val), Version (val)
    if not RunService:IsRunning() then
        return
    end
    if Players.LocalPlayer.PlayerGui:FindFirstChild("VersionInfo") then
        return Players.LocalPlayer.PlayerGui.VersionInfo
    end
    local v1 = {
        Name = "VersionInfo",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }
    local v2 = {FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json")}
    local tag = if not a1 then Version.tag else ("%* %*"):format(Version.branch, (Version.hash:upper()))
    v2.Text = tag
    v2.TextColor3 = Color3.fromRGB(255, 255, 255)
    v2.TextSize = 18
    v2.TextTransparency = 0.1
    v2.TextWrapped = true
    v2.TextXAlignment = Enum.TextXAlignment.Right
    v2.AnchorPoint = Vector2.new(1, 1)
    v2.AutomaticSize = Enum.AutomaticSize.X
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v2.BackgroundTransparency = 1
    v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v2.BorderSizePixel = 0
    v2.LayoutOrder = 2
    v2.Position = UDim2.fromScale(1, 1)
    v2.Size = UDim2.fromOffset(0, 25)
    v2[1] = (Create("UIStroke", {Transparency = 0.5}))
    v2[2] = (Create("UIPadding", {PaddingBottom = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}))
    v1[1] = (Create("TextLabel", v2))
    local v3 = Create("ScreenGui", v1)
    v3.Parent = Players.LocalPlayer.PlayerGui
    return v3
end

function u71._createRatingInfo() -- Line: 184 -- upvalues: RunService (val), Players (val), Create (val), Cache (val)
    if not RunService:IsRunning() then
        return
    end
    if Players.LocalPlayer.PlayerGui:FindFirstChild("RatingInfo") then
        return Players.LocalPlayer.PlayerGui.RatingInfo
    end
    local u85 = Create("ScreenGui", {
        Name = "RatingInfo",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Enabled = true,
        (Create("TextLabel", {
            FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json"),
            Text = "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 18,
            TextTransparency = 0.1,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromOffset(0, 25),
            Create("UIStroke", {Transparency = 0.5}),
            (Create("UIPadding", {
                PaddingBottom = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
            })),
        })),
    })

    local function updateRating(a1) -- Line: 229 -- upvalues: u85 (val)
        if not a1 then
            return
        end
        local Rating = a1.Rating.Rating
        local TextLabel = u85.TextLabel
        local v1 = Rating and ("Rating: %*"):format((math.round(Rating))) or "Rating: Unranked"
        TextLabel.Text = v1
    end

    local RankedPVPRating = Cache("RankedPVPRating")
    RankedPVPRating.Updated:Connect(updateRating)
    RankedPVPRating:Get():andThen(updateRating)
    u85.Parent = Players.LocalPlayer.PlayerGui
    return u85
end

function u71.init() -- Line: 247
    -- upvalues: u70 (val), u71 (val), Iris (val), Gizmo (val), UserInputService (val), Scheduler (val)
    -- upvalues: RunService (val), GameState (val), Players (val)
    local Name, v1
    if not u70 then
        u71._createVersionInfo(game.GameId ~= 1176784616)
    end
    Iris.Init()
    Gizmo.Init()
    UserInputService.InputEnded:Connect(function(a1, a2) -- Line: 257 -- upvalues: u71 (upval)
        if a1.KeyCode ~= Enum.KeyCode.F3 then
            return
        end
        u71._globallyEnabled = u71.canEnable()
        if not u71._globallyEnabled then
            return
        end
        u71._enabled = not u71._enabled
    end)
    local u95 = {}
    local u82 = {}
    for i, j in script.Tools:GetChildren() do
        if j.Name ~= "Types" then
            v1 = require(j)
            if not v1.canRun or v1.canRun() == true then
                v1.Iris = Iris
                v1.Gizmo = Gizmo
                Name = v1.Name or j.Name
                local createGizmos = v1.createGizmos
                if createGizmos then
                    u71.createGizmo(Name, function() -- Line: 294 -- upvalues: createGizmos (val), Gizmo (upval)
                        createGizmos(Gizmo)
                    end)
                end
                u82[Name] = v1.createWindows
                u71._windowsEnabled[Name] = (Iris.State(false))
                if v1.init then
                    v1.init()
                end
            end
        end
    end
    Scheduler.add("DebugController", RunService.RenderStepped, function(a1) -- Line: 308
        -- upvalues: GameState (upval), u71 (upval), Gizmo (upval), u95 (val), Iris (upval)
        local v1 = a1 * GameState.TimeScale
        u71.Gizmo.Enabled = u71._anyGizmoEnabled
        if not u71._anyGizmoEnabled then
            return
        end
        for i, j in u71._gizmos do
            if u71._gizmosEnabled[i]:get() then
                Gizmo.SetStyle(nil, nil, false)
                j()
            end
        end
        local v2 = nil
        local v3 = nil
        for k, n in u71._oneShotGizmos, v2, v3 do
            if u71._gizmosEnabled[k]:get() then
                for m, i5 in n do
                    if not (i5 - v1 <= 0) then
                        Gizmo.SetStyle(nil, nil, false)
                        m()
                    else
                        n[m] = nil
                    end
                end
            end
        end
        for i6, i7 in u95 do
            Gizmo.SetStyle(nil, nil, false)
            i7(Iris)
        end
    end)
    Iris:Connect(function() -- Line: 347 -- upvalues: u71 (upval), Iris (upval), u82 (val)
        if not u71._globallyEnabled then
            return
        end
        if u71._enabled then
            local MenuToggle, MenuToggle_2, MenuToggle_3, MenuToggle_4, v1, v2
            Iris.MenuBar()
            Iris.Menu({"Gizmos"})
            for k in pairs(u71._gizmos) do
                MenuToggle_4 = Iris.MenuToggle
                v1 = {isChecked = u71._gizmosEnabled[k]}
                MenuToggle_4({k}, v1)
            end
            local v3 = false
            for k2 in pairs(u71._oneShotGizmos) do
                if not v3 and next(u71._gizmos) then
                    Iris.Separator()
                    v3 = true
                end
                MenuToggle_3 = Iris.MenuToggle
                v2 = {isChecked = u71._gizmosEnabled[k2]}
                MenuToggle_3({k2}, v2)
            end
            Iris.End()
            Iris.Menu({"Windows"})
            for i, j in u82 do
                MenuToggle_2 = Iris.MenuToggle
                v1 = {isChecked = u71._windowsEnabled[i]}
                MenuToggle_2({i}, v1)
            end
            v3 = false
            local v4 = nil
            local v5 = nil
            for k3 in u71._windows, v4, v5 do
                if not v3 and next(u82) then
                    Iris.Separator()
                end
                MenuToggle = Iris.MenuToggle
                v2 = {isChecked = u71._windowsEnabled[k3]}
                MenuToggle({k3}, v2)
            end
            Iris.End()
            Iris.End()
        end
        for n, m in u71._windows do
            if u71._windowsEnabled[n]:get() then
                m()
            end
        end
        for i5, i6 in u82 do
            if u71._windowsEnabled[i5]:get() then
                i6(Iris)
            end
        end
    end)
    u71.createGizmo("Player Hitbox", function() -- Line: 424 -- upvalues: Players (upval), Gizmo (upval)
        local BoundingBox, BoundingBox_2, Character, Position, v1
        for i, j in Players:GetPlayers() do
            if j.Character then
                Character = j.Character
                BoundingBox, BoundingBox_2 = Character:GetBoundingBox()
                Gizmo.PushProperty("Color3", Color3.fromRGB(255, 141, 225))
                Gizmo.Box:Draw(BoundingBox, BoundingBox_2, false)
                if Character ~= Players.LocalPlayer.Character and Character:FindFirstChild("Camera") then
                    Position = Character.PrimaryPart.CFrame.Position
                    v1 = Character.Camera.CFrame.LookVector * 2
                    Gizmo.PushProperty("Color3", Color3.fromRGB(247, 49, 194))
                    Gizmo.Ray:Draw(Position, Position + v1)
                end
            end
        end
    end)
end

if not RunService:IsStudio() then
    local v1 = DateTime.fromUnixTimestamp(Version.time):FormatLocalTime("HH:mm MM/DD", "en-us")
    print((("Git Info: %* (%*) (%*)"):format(Version.branch, Version.hash, Version.tag)))
    print((("Git Time: %*"):format(v1)))
end
task.spawn(u71.init)
return u71