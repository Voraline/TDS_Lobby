-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.SandboxPanel
-- Decompile time: 7.09 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Game.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local AdminsContent = require(Components.Sandbox.Admins.AdminsContent)
local ChallengesContent = require(Components.Sandbox.Challenges.ChallengesContent)
local ConsumablesContent = require(Components.Sandbox.Consumables.ConsumablesContent)
local Container = require(Components.NewUpgrade.Alignments.BaseComponents.Container)
local DraggerResizer = require(ReplicatedStorage.Client.Interfaces.Components.DraggerResizer)
local GamemodesContent = require(Components.Sandbox.Gamemodes.GamemodesContent)
local ImageLabel = require(Components.NewUpgrade.Alignments.BaseComponents.ImageLabel)
local MapsContent = require(Components.Sandbox.Maps.MapsContent)
local ModifiersContent = require(Components.Sandbox.Modifiers.ModifiersContent)
local MusicContent = require(Components.Sandbox.Music.MusicContent)
local OptionsPanel = require(Components.Sandbox.Options.OptionsPanel)
local QuickCmdsContent = require(Components.Sandbox.QuickCmds.QuickCmdsContent)
local StatsContent = require(Components.Sandbox.StatsPanel.StatsContent)
local Tab = require(Components.Sandbox.Tab)
local TowersContent = require(Components.Sandbox.Towers.TowersContent)
local UnitsContent = require(Components.Sandbox.Units.UnitsContent)
local ZombiesContent = require(Components.Sandbox.Zombies.ZombiesContent)
local useGameStateValue = require(Hooks.useGameStateValue)
local useMediaQuery = require(Hooks.useMediaQuery)
local useScale = require(Hooks.useScale)
local useSpring = require(Hooks.useSpring)
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local createElement = React.createElement
local useEffect = React.useEffect
local Spring = ReactFlow.Spring
local LocalPlayer = Players.LocalPlayer
local u143 = {
    "Admins",
    "Towers",
    "Enemies",
    "Units",
    "Consumables",
    "Maps",
    "Gamemodes",
    "Modifiers",
    "Challenges",
    "Music",
    "Stats",
}
local u155 = {
    Enemies = ZombiesContent,
    Modifiers = ModifiersContent,
    Maps = MapsContent,
    Gamemodes = GamemodesContent,
    Towers = TowersContent,
    Consumables = ConsumablesContent,
    Admins = AdminsContent,
    Units = UnitsContent,
    Challenges = ChallengesContent,
    Music = MusicContent,
    Stats = StatsContent,
}

local function render() -- Line: 74
    -- upvalues: useGameStateValue (val), ReactCharm (val), SandboxStore (val), useGroupAnimation (val)
    -- upvalues: useSequenceAnimation (val), Spring (val), useAnimation (val), useSpring (val), useScale (val)
    -- upvalues: useEffect (val), LocalPlayer (val), React (val), u155 (val), createElement (val), Tab (val), u143 (val)
    -- upvalues: useMediaQuery (val), QuickCmdsContent (val), DraggerResizer (val), Container (val), ImageLabel (val)
    -- upvalues: OptionsPanel (val)
    local GameMode = useGameStateValue("GameMode")
    local u7 = ReactCharm.useSignalState(SandboxStore.getState)
    local v1, u50 = useGroupAnimation({
        enabled = useSequenceAnimation({
            {
                timestamp = 0,
                progress = Spring({target = 0, speed = 25, damper = 1}),
                containerSize = Spring({target = 1, speed = 20, damper = 0.65}),
                containerPosition = Spring({target = 0, speed = 25, damper = 0.7}),
            },
            {
                timestamp = 0.1,
                secondProgress = Spring({target = 0, speed = 25, damper = 1}),
                thirdProgress = Spring({target = 0, speed = 20, damper = 1}),
            },
        }),
        disabled = useAnimation({
            progress = Spring({target = 1, speed = 20, damper = 1}),
            secondProgress = Spring({target = 1, speed = 35, damper = 1}),
            thirdProgress = Spring({target = 1, speed = 50, damper = 1}),
            containerSize = Spring({target = 0, speed = 20, damper = 0.8}),
            containerPosition = Spring({target = 1, speed = 25, damper = 0.8}),
        }),
    }, {
        progress = 1,
        secondProgress = 1,
        thirdProgress = 1,
        containerSize = 0,
        containerPosition = 1,
    })
    local v2, u57 = useSpring(0, 1, 30, true)
    local v3 = useScale()
    local v4 = useEffect
    local v5 = {u7.PanelEnabled, u7.PanelDisabledModifier}
    v4(function() -- Line: 114 -- upvalues: u7 (val), u57 (val), u50 (val)
        local PanelEnabled = u7.PanelEnabled
        if next(u7.PanelDisabledModifier) then
            PanelEnabled = false
        end
        u57(if not PanelEnabled then 0 else 1)
        u50(if not PanelEnabled then "disabled" else "enabled")
    end, v5)
    local u74 = (useGameStateValue("SandboxAdminGamepassOwners", {}))[tostring(LocalPlayer.UserId)]
    local v6 = useEffect
    local v7 = {u7.SelectedTab, u74}
    v6(function() -- Line: 129 -- upvalues: u7 (val), u74 (val), SandboxStore (upval)
        if u7.SelectedTab == "Admins" and not u74 then
            SandboxStore.setSelected("Enemies")
        end
    end, v7)
    v7 = {u74}
    v6 = React.useMemo(function() -- Line: 135
        -- upvalues: u155 (upval), u74 (val), createElement (upval), Tab (upval), u143 (upval), SandboxStore (upval)
        local v1, v2, v3
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in u155, v5, v6 do
            if i ~= "Admins" or u74 then
                v1 = createElement
                v2 = Tab
                v3 = {
                    id = i,
                    layoutOrder = table.find(u143, i),
                    onClick = function(a1) -- Line: 146 -- upvalues: SandboxStore (upval)
                        SandboxStore.setSelected(a1)
                    end,
                }
                v4[i] = (v1(v2, v3))
            end
        end
        return v4
    end, v7)
    local useMemo_2 = React.useMemo
    local v8 = {u74, u7.SelectedTab}
    v5 = useMemo_2(function() -- Line: 155 -- upvalues: u155 (upval), u74 (val), u7 (val), createElement (upval)
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in u155, v2, v3 do
            if i ~= "Admins" then
                if i == u7.SelectedTab then
                    v1[i] = (createElement(j))
                end
            elseif u74 and i == u7.SelectedTab then
                v1[i] = (createElement(j))
            end
        end
        return v1
    end, v8)
    local xlarge = useMediaQuery("xlarge")
    v8 = false
    if GameMode == "Sandbox" then
        v8 = u74 and xlarge
    end
    local v9 = createElement
    local v10 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v11 = {quickCmds = v8 and createElement(QuickCmdsContent, {})}
    local v12 = createElement
    local v13 = {
        allowResizing = false,
        title = "Admin GUI",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.4, 0, 0.5, 0),
        Size = UDim2.fromOffset(988, 658),
    }
    local PanelEnabled = u7.PanelEnabled and not next(u7.PanelDisabledModifier)
    v13.visible = PanelEnabled
    v13.ResizePosition = UDim2.fromScale(1, 1)
    v13.children = {
        uiScale = createElement("UIScale", {Scale = v3}),
        container = createElement(Container, {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Transparency = v1.progress,
        }, {
            scale = createElement("UIScale", {Scale = v1.containerSize}),
            dropShadow = createElement(ImageLabel, {
                ZIndex = -1,
                Image = "rbxassetid://9239716855",
                ImageTransparency = 0.2,
                Size = UDim2.new(1, 12, 1, 12),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(14, 14, 64, 24),
                Transparency = v1.progress,
            }),
            background = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = "rbxassetid://76824295248156",
                Rotation = 180,
                ZIndex = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                ImageColor3 = Color3.fromRGB(24, 24, 24),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.fromScale(1, 1),
                SliceCenter = Rect.new(50, 50, 50, 50),
            }, {}),
            aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.5}),
            content = createElement("Frame", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0),
                Size = v2:map(function(a1) -- Line: 251
                    return UDim2.fromScale(1, a1)
                end),
            }, {
                tabs = createElement("ScrollingFrame", {
                    BackgroundTransparency = 1,
                    ClipsDescendants = true,
                    ScrollBarThickness = 2,
                    BorderSizePixel = 0,
                    ScrollBarImageTransparency = 0.5,
                    Size = UDim2.fromScale(0.95, 0.1),
                    Position = UDim2.fromScale(0.5, 0.01),
                    AnchorPoint = Vector2.new(0.5, 0),
                    CanvasSize = UDim2.fromScale(0, 0),
                    AutomaticCanvasSize = Enum.AutomaticSize.X,
                    HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
                }, {
                    padding = createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 3),
                        PaddingLeft = UDim.new(0, 2),
                        PaddingBottom = UDim.new(0, 5),
                        PaddingRight = UDim.new(0, 2),
                    }),
                    list = createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Bottom,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 10),
                    }),
                    content = React.createElement(React.Fragment, {}, v6),
                }),
                options = createElement(OptionsPanel, {}),
                tabContent = createElement(Container, {
                    BackgroundTransparency = 0.75,
                    CornerRadius = 8,
                    StrokeThickness = 2,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.55),
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.new(0.95, 0, 0.85, -10),
                    StrokeColor = Color3.fromRGB(90, 90, 90),
                    Transparency = v1.containerSize:map(function(a1) -- Line: 308
                        return 1 - a1
                    end),
                }, {content = createElement(React.Fragment, {}, v5)}),
            }),
        }),
    }
    v11.window = v12(DraggerResizer, v13)
    return v9("Frame", v10, v11)
end

return function() -- Line: 321 -- upvalues: useGameStateValue (val), createElement (val), render (val)
    if useGameStateValue("GameMode") ~= "Sandbox" then
        return
    end
    return createElement(render)
end