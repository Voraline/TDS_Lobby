-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Nametag
-- Decompile time: 8.99 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Client = ReplicatedStorage:WaitForChild("Client")
local UI = Shared.UI
local Charm = require(ReplicatedStorage.Packages.Charm)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Flairs = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Flairs)
local Icons = require(Client.Interfaces.Icons)
local Flair = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Nametag.Flair)
local NametagStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.NametagStore)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PlayerRegions = require(ReplicatedStorage.Shared.Modules.PlayerRegions)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local RichText = require(UI.Components.RichText)
local SettingsController = require(Client.Controllers.Shared.SettingsController)
local createElement = React.createElement
local Flair_2 = Content("Flair")
local Game = SettingsController.Game
local u93 = {Players = {}}
local Folder = Instance.new("Folder")
Folder.Name = "Nametags"
Folder.Parent = workspace
u93.Container = Folder
local u100 = {}
NametagStore.setSettingEnabled(Game:Get("Show Nametags") == true)

local function disconnect(a1) -- Line: 40
    if a1 == nil then
        return
    end
    if typeof(a1) == "RBXScriptConnection" then
        a1:Disconnect()
        return
    end
    if type(a1) == "function" then
        a1()
        return
    end
    if typeof(a1) == "Instance" then
        a1:Destroy()
    end
end

local function addCleanup(a1, a2) -- Line: 54
    table.insert(a1.cleanups, a2)
    return a2
end

local function flairExists(a1) -- Line: 59 -- upvalues: Flair_2 (val) -- types: a1: string
    return Flair_2:FindFirstChild(a1, true) ~= nil
end

local function computeStudSize(a1, a2) -- Line: 63 -- types: a1: userdata, a2: number
    local X = a1.X
    local Y = a1.Y
    if X == 0 and Y == 0 then
        return (Vector3.new(10, 0.699999988079071, 0.4000000059604645))
    end
    return (Vector3.new(X / a2, Y / a2, 0.4))
end

local function createUIContainer(a1, a2, a3) -- Line: 76 -- types: a1: string, a2: userdata?, a3: vector?
    local Part = Instance.new("Part")
    Part.Name = a1
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.CastShadow = false
    Part.Transparency = 1
    Part.Anchored = true
    Part.Size = a3 or Vector3.new(10, 0.699999988079071, 0.4000000059604645)
    local SurfaceGui = Instance.new("SurfaceGui")
    SurfaceGui.Name = "Display"
    SurfaceGui.CanvasSize = Vector2.new(300, 60)
    SurfaceGui.Brightness = 2
    SurfaceGui.LightInfluence = 0
    SurfaceGui.PixelsPerStud = 100
    SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SurfaceGui.ZOffset = 0.1
    SurfaceGui.Face = Enum.NormalId.Back
    SurfaceGui.AutoLocalize = false
    SurfaceGui.Parent = Part
    Part.Parent = a2
    return Part, SurfaceGui
end

local function createNametagContainer(a1) -- Line: 105 -- types: a1: userdata
    local Frame = Instance.new("Frame")
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 1
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    Frame.Size = UDim2.fromOffset(1200, 60)
    Frame.Parent = a1
    return Frame
end

local function getCustomFlairData(a1) -- Line: 117 -- upvalues: Flair_2 (val), Flairs (val) -- types: a1: string
    if a1 ~= "" and Flair_2:FindFirstChild(a1, true) ~= nil then
        return Flairs(a1)
    end
    return nil
end

local function getPVPData(a1) -- Line: 125 -- upvalues: PVPConstants (val) -- types: a1: string
    for i, j in PVPConstants.RANK_DATA do
        if j.Name == a1 then
            return j
        end
    end
    return nil
end

local function getFlairIcon(a1, a2) -- Line: 135 -- upvalues: PVPConstants (val), Icons (val) -- types: a1: string
    local v1
    for i, j in PVPConstants.RANK_DATA do
        if j.Name == a1 then
            v1 = j
            if v1 then
                if typeof(v1.Icon) == "number" then
                    return (("rbxassetid://%*"):format(v1.Icon))
                end
                return v1.Icon
            end
            if a2 and a2.icon then
                if typeof(a2.icon) == "number" then
                    return (("rbxassetid://%*"):format(a2.icon))
                end
                return a2.icon
            end
            return Icons.Flair[a1] or ""
        end
    end
    v1 = nil
    if v1 then
        if typeof(v1.Icon) == "number" then
            return (("rbxassetid://%*"):format(v1.Icon))
        end
        return v1.Icon
    end
    if a2 and a2.icon then
        if typeof(a2.icon) == "number" then
            return (("rbxassetid://%*"):format(a2.icon))
        end
        return a2.icon
    end
    return Icons.Flair[a1] or ""
end

local function updateFlairParent(a1) -- Line: 152
    if a1.flair and a1.tag then
        a1.flair.Parent = if a1.flairEnabled ~= true then nil else a1.tag
        return
    end
end

local function renderFlair(a1) -- Line: 160
    -- upvalues: Flair_2 (val), Flairs (val), createElement (val), Flair (val), getFlairIcon (val), NametagStore (val)
    if not a1.flairRoot then
        return
    end
    local v1 = a1.flairValue or ""
    local v2 = if v1 == "" then nil else if Flair_2:FindFirstChild(v1, true) ~= nil then Flairs(v1) else nil
    local flairRoot = a1.flairRoot
    local v3 = {
        icon = getFlairIcon(v1, v2),
        name = v1,
        onAbsoluteSizeChanged = function(a1_2) -- Line: 171 -- upvalues: a1 (val)
            a1.flairSize = a1_2
        end,
        style = v2,
    }
    local v4 = NametagStore.getEnabled() and a1.flairEnabled == true
    v3.visible = v4
    flairRoot:render((createElement(Flair, v3)))
end

function u93.setEnabled(a1) -- Line: 179 -- upvalues: NametagStore (val) -- types: a1: boolean
    NametagStore.setEnabled(a1)
end

function u93:Create(a2) -- Line: 183
    -- upvalues: u100 (val), RichText (val), createUIContainer (val), createNametagContainer (val), ReactRoblox (val)
    -- upvalues: renderFlair (val), Charm (val), NametagStore (val)
    if not a2.Character then
        a2.CharacterAdded:Wait()
    end
    local Tag = a2:WaitForChild("Tag", 60)
    if not Tag then
        return
    end
    local Flair = a2:WaitForChild("Flair")
    local u17 = {cleanups = {}}
    u17.flairEnabled = Flair:GetAttribute("Enabled") == true
    u17.flairSize = Vector2.new(0, 0)
    u17.flairValue = Flair.Value

    local function computeSize(a1, a2) -- Line: 202 -- upvalues: u17 (val) -- types: a1: number, a2: number
        if u17.tag then
            local tag = u17.tag
            local v1 = Vector2.new(a1, a2)
            local X = v1.X
            local Y = v1.Y
            tag.Size = if X ~= 0 or Y ~= 0 then Vector3.new(X / 100, Y / 100, 0.4) else Vector3.new(10, 0.699999988079071, 0.4000000059604645)
        end
    end

    local function loadNametag(a1) -- Line: 208
        -- upvalues: u17 (val), u100 (upval), RichText (upval), a2 (val), computeSize (val)
        local currentTag = u17.currentTag
        local tag = u17.tag
        if currentTag then
            currentTag:Destroy()
            u17.currentTag = nil
        end
        local v1 = a1 and a1:lower() or ""
        local v2 = v1
        if v2 ~= "" and tag then
            v1 = u100[v2]
            if v1 then
                v2 = v1:lower()
            end
            u17.currentTag = (RichText({
                textScale = 1,
                textSettings = {Font = "GothamBold"},
                text = string.format("<%s>%s</%s>", v2, a2.DisplayName, v2),
                onSize = computeSize,
                adornee = tag,
                Parent = u17.container,
            }))
            return
        end
    end

    local v1, v2 = createUIContainer(a2.Name, nil, nil)
    u17.tag = v1
    u17.tagDisplay = v2
    u17.container = createNametagContainer(u17.tagDisplay)
    v1, v2 = createUIContainer("Flair", nil, (Vector3.new(5, 0.699999988079071, 0.4000000059604645)))
    u17.flair = v1
    u17.flairDisplay = v2
    u17.flairRoot = ReactRoblox.createRoot(u17.flairDisplay)
    if u17.flair and u17.tag then
        u17.flair.Parent = if u17.flairEnabled ~= true then nil else u17.tag
    end
    renderFlair(u17)
    loadNametag(Tag.Value)
    table.insert(u17.cleanups, ((Tag:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 255 -- upvalues: loadNametag (val), Tag (val)
        loadNametag(Tag.Value)
    end)))
    table.insert(u17.cleanups, ((Flair:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 262 -- upvalues: u17 (val), Flair (val), renderFlair (upval)
        u17.flairValue = Flair.Value
        renderFlair(u17)
    end)))
    table.insert(u17.cleanups, ((Flair:GetAttributeChangedSignal("Enabled")):Connect(function() -- Line: 270 -- upvalues: u17 (val), Flair (val), renderFlair (upval)
        u17.flairEnabled = Flair:GetAttribute("Enabled") == true
        local v1 = u17
        if v1.flair and v1.tag then
            v1.flair.Parent = if v1.flairEnabled ~= true then nil else v1.tag
        end
        renderFlair(u17)
    end)))
    table.insert(u17.cleanups, (Charm.subscribe(NametagStore.getEnabled, function() -- Line: 279 -- upvalues: renderFlair (upval), u17 (val)
        renderFlair(u17)
    end)))

    function u17:Destroy() -- Line: 284
        for i, j in self.cleanups do
            if j ~= nil then
                if typeof(j) == "RBXScriptConnection" then
                    j:Disconnect()
                elseif type(j) == "function" then
                    j()
                elseif typeof(j) == "Instance" then
                    j:Destroy()
                end
            end
        end
        table.clear(self.cleanups)
        if self.flairRoot then
            self.flairRoot:unmount()
            self.flairRoot = nil
        end
        if self.currentTag then
            self.currentTag:Destroy()
            self.currentTag = nil
        end
        if self.tag then
            self.tag:Destroy()
            self.tag = nil
        end
        if self.flair then
            self.flair:Destroy()
            self.flair = nil
        end
        if self.container then
            self.container:Destroy()
            self.container = nil
        end
    end

    self.Players[a2] = u17
end

function u93.enabled(a1) -- Line: 319 -- upvalues: NametagStore (val)
    return NametagStore.getVisible()
end

function u93.init(a1) -- Line: 323
    -- upvalues: Game (val), NametagStore (val), Players (val), u93 (val), PlayerRegions (val), RunService (val)
    Game:On("Show Nametags", function(a1) -- Line: 324 -- upvalues: NametagStore (upval)
        NametagStore.setSettingEnabled(a1 == true)
    end)
    task.spawn(function() -- Line: 328 -- upvalues: Players (upval), u93 (upval)
        for k, v in pairs(Players:GetPlayers()) do
            u93:Create(v)
        end
    end)
    Players.PlayerAdded:Connect(function(a1) -- Line: 334 -- upvalues: u93 (upval)
        u93:Create(a1)
    end)
    Players.PlayerRemoving:Connect(function(a1_2) -- Line: 338 -- upvalues: a1 (val)
        local v1 = a1.Players[a1_2]
        a1.Players[a1_2] = nil
        if v1 then
            v1:Destroy()
        end
    end)
    local LocalPlayer = Players.LocalPlayer
    local u24 = {}
    task.spawn(function() -- Line: 350 -- upvalues: LocalPlayer (val), NametagStore (upval), PlayerRegions (upval), a1 (val), u24 (ref)
        local Character, tag, v1, v2, v3
        while task.wait(0.1) do
            Character = LocalPlayer.Character
            if Character and Character.PrimaryPart then
                v2 = {}
                if NametagStore.getSettingEnabled() then
                    table.insert(PlayerRegions.findPlayersNearPlayer(LocalPlayer, 40, 15), LocalPlayer)
                else
                    v1 = {}
                end
                for i, v in ipairs(v1) do
                    v3 = a1.Players[v]
                    tag = v3 and v3.tag
                    if v and tag then
                        v2[v] = true
                        if not tag.Parent then
                            tag.Parent = a1.Container
                        end
                    end
                end
                for k in pairs(u24) do
                    if not v2[k] then
                        v3 = a1.Players[k]
                        if v3 and v3.tag then
                            v3.tag.Parent = nil
                        end
                    end
                end
                u24 = v2
            end
        end
    end)
    RunService:UnbindFromRenderStep("UPDATE_NAMETAGS")
    RunService:BindToRenderStep("UPDATE_NAMETAGS", Enum.RenderPriority.Camera.Value, function(a1_2) -- Line: 399 -- upvalues: a1 (val), u24 (ref) -- types: a1_2: number
        local Character, PrimaryPart, currentTag, flair, tag, v1, v2
        if not a1:enabled() then
            return
        end
        local CurrentCamera = workspace.CurrentCamera
        local v3 = {}
        local v4 = {}
        debug.profilebegin("updateNametags")
        local v5 = nil
        local v6 = nil
        for i in u24, v5, v6 do
            v2 = a1.Players[i]
            if v2 then
                tag = v2.tag
                currentTag = v2.currentTag
                flair = v2.flair
                if tag and tag.Parent then
                    Character = i.Character
                    PrimaryPart = Character and Character.PrimaryPart
                    if PrimaryPart then
                        v1 = (CFrame.new(PrimaryPart.Position + Vector3.new(0, 3.5, 0))) * CurrentCamera.CFrame.Rotation
                        if flair and flair.Parent == tag then
                            table.insert(v4, v1)
                            table.insert(v3, flair)
                        end
                        table.insert(v4, v1)
                        table.insert(v3, tag)
                        if currentTag then
                            debug.profilebegin("stepNametag")
                            currentTag:Step(a1_2)
                            debug.profileend()
                        end
                    end
                end
            end
        end
        debug.profileend()
        debug.profilebegin("moveNametags")
        workspace:BulkMoveTo(v3, v4, Enum.BulkMoveMode.FireCFrameChanged)
        debug.profileend()
    end)
end

u93:init()
return u93