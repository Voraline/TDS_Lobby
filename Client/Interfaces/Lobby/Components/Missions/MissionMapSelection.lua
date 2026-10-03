-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Missions.MissionMapSelection
-- Decompile time: 4.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local MissionMap = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Missions.MissionMap)
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
return function(a1) -- Line: 35
    -- upvalues: useScale (val), useTween (val), createElement (val), MissionMap (val), React (val), IconButton (val)
    local tooltips, v1
    local u400 = useScale(1)
    local v2, u416 = useTween(0, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), true, true)
    local v3 = UDim2.fromOffset(200 * u400, 200 * u400)
    local completed = a1.completed or {}
    local disabled = a1.disabled or {}
    local loading = a1.loading or {}
    local Visible = if a1.Visible == nil then true else a1.Visible
    local chosen = a1.chosen
    local v4 = {}
    local v5 = nil
    local v6 = nil
    for i, j in a1.maps, v5, v6 do
        v1 = {
            LayoutOrder = i,
            name = j,
            title = ("Mission %*"):format(i),
            mode = a1.mode,
            filterMapName = a1.filterMapName,
            loading = table.find(loading, j) ~= nil,
            disabled = table.find(disabled, j) ~= nil,
            completed = table.find(completed, j) ~= nil,
        }
        tooltips = a1.tooltips and a1.tooltips[i]
        v1.tooltip = tooltips

        function v1.clicked() -- Line: 60 -- upvalues: chosen (val), j (val), a1 (val), i (val)
            if chosen then
                chosen(
                    j,
                    if not a1.matchmakeModes then if not a1.matchmakeModes then nil else a1.matchmakeModes[1] else if not a1.matchmakeModes[i] then if not a1.matchmakeModes then nil else a1.matchmakeModes[1] else a1.matchmakeModes[i]
                )
            end
        end

        v4[j] = (createElement(MissionMap, v1))
    end
    v6 = {Visible}
    React.useEffect(function() -- Line: 74 -- upvalues: u416 (val), Visible (val)
        u416(if not Visible then 0 else 1)
    end, v6)
    v6 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v6.Size = Size
    v6.Position = a1.Position
    v6.AnchorPoint = a1.AnchorPoint
    v6.Visible = v2:map(function(a1) -- Line: 83 -- upvalues: Visible (val)
        return Visible and a1 > 0
    end)
    return createElement("Frame", v6, {
        background = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v2:map(function(a1) -- Line: 90
                return 1 - a1 * 0.6
            end),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(2, 2),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                    ColorSequenceKeypoint.new(0.632, Color3.fromRGB(2, 0, 6)),
                    ColorSequenceKeypoint.new(0.794, Color3.fromRGB(0, 103, 103)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 67, 67))),
                }),
            }),
        }),
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 1,
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v2:map(function(a1) -- Line: 116 -- upvalues: u400 (val)
                return UDim2.new(0.5, 0, 0.5, 100 * u400 - 100 * u400 * a1)
            end),
        }, {
            uiListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 40 * u400),
            }),
            titlebar = createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Position = UDim2.fromScale(0, 0),
            }, {
                uiListLayout = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0, 0),
                }),
                title = createElement("TextLabel", {
                    Text = "Mission Selection",
                    TextScaled = true,
                    TextSize = 14,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = -1,
                    FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(0, 0.98),
                    Size = UDim2.new(1, -90 * u400, 0, 50 * u400),
                }, {uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = 0.7})}),
                cancel = createElement(IconButton, {
                    Position = UDim2.fromScale(1, 0.5),
                    Size = UDim2.fromOffset(50 * u400, 50 * u400),
                    AnchorPoint = Vector2.new(1, 0.5),
                    Color = Color3.fromRGB(255, 60, 60),
                    Clicked = a1.cancelled,
                }),
            }),
            items = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
            }, {
                uiGridLayout = createElement("UIGridLayout", {
                    CellSize = v3,
                    CellPadding = UDim2.fromOffset(30 * u400, 30 * u400),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }, {
                    uiAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
                }),
                content = React.createElement(React.Fragment, {}, v4),
            }),
        }),
    })
end