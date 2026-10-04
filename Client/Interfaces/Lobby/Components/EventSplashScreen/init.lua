-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen
-- Decompile time: 7.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local Header = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Header)
local React = require(ReplicatedStorage.Shared.UI.React)
local SplashObjectives = require(script.SplashObjectives)
local TopBanner = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TopBanner)
local createElement = React.createElement

local function resolveThumbnail(a1) -- Line: 46
    if type(a1) == "string" then
        return a1
    end
    return (("rbxassetid://%*"):format(a1 or 76218218409838))
end

return function(a1) -- Line: 54
    -- upvalues: createElement (val), Button (val), TopBanner (val), Header (val), SplashObjectives (val)
    local v1
    local Buttons = a1.Buttons or {}
    local EventThumbnailPosition = a1.EventThumbnailPosition or UDim2.fromScale(0.5, 0.5)
    local v2 = {}
    for i, j in Buttons do
        v1 = tostring(i)
        v2[v1] = (createElement(Button, {
            AnchorPoint = j.AnchorPoint,
            Text = j.Text,
            Size = j.Size,
            Position = j.Position,
            Color = j.Color,
            TextFontSize = j.TextFontSize,
            TextScaled = j.TextScaled,
            TextStrokeTransparency = j.TextStrokeTransparency,
            Clicked = j.Clicked,
        }))
    end
    local v3 = {
        BackgroundTransparency = 0.1,
        Visible = a1.Visible,
        AnchorPoint = a1.AnchorPoint,
        Size = a1.Size,
        Position = a1.Position,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v4 = {
        uicorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        uiscale = createElement("UIScale", {Scale = a1.Scale or 1}),
    }
    local v5 = {
        SmallTitle = "New Objective",
        RemoveGradient = true,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 100),
        Title = a1.Title,
    }
    local v6 = {}
    local v7 = {BackgroundTransparency = 1, ClipsDescendants = true, Size = UDim2.fromScale(1, 1)}
    local v8 = {}
    local v9 = {
        BackgroundTransparency = 1,
        ZIndex = 0,
        Size = UDim2.fromScale(1, 1),
        SizeConstraint = Enum.SizeConstraint.RelativeXX,
        Position = EventThumbnailPosition,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local EventThumbnail = a1.EventThumbnail
    v9.Image = if type(EventThumbnail) ~= "string" then ("rbxassetid://%*"):format(EventThumbnail or 76218218409838) else EventThumbnail
    v9.ScaleType = Enum.ScaleType.Fit
    v8.icon = createElement("ImageLabel", v9, {
        uigradient = createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.5),
                NumberSequenceKeypoint.new(0.6, 0.5),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v6.container = createElement("Frame", v7, v8)
    v4.topbanner = createElement(TopBanner, v5, v6)
    v4[1] = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.new(1, 0, 1, -100),
        Position = UDim2.new(0.5, 0, 0, 100),
    }, {
        objectiveHeader = createElement(Header, {
            Title = "Objectives",
            TitleIcon = "rbxassetid://16380994239",
            TextSize = 22,
            Position = UDim2.fromOffset(56, 20),
            Size = UDim2.new(0.5, 0, 0, 32),
        }),
        objectives = createElement(SplashObjectives, {
            Size = UDim2.new(1, -46, 1, -150),
            Position = UDim2.new(0.5, 0, 0, 50),
            AnchorPoint = Vector2.new(0.5, 0),
            Objectives = a1.Objectives,
        }),
        startButton = if a1.Buttons then nil else createElement(Button, {
            Text = "Affirmative!",
            TextFontSize = 36,
            TextScaled = true,
            TextStrokeTransparency = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(400, 75),
            Position = UDim2.new(0.5, 0, 1, -60),
            Color = Color3.fromRGB(10, 220, 80),
            Clicked = a1.OnStartClicked,
        }),
        buttons = if not a1.Buttons then nil else createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(1, 0, 0, 75),
            Position = UDim2.new(0.5, 0, 1, -60),
        }, {
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 16),
            }),
        }, v2),
    })
    return createElement("Frame", v3, v4)
end