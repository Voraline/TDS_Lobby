-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassTrackIcon
-- Decompile time: 3.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local BattlepassStars = require(script.Parent.BattlepassStars)
local Event = React.Event
local Spring = ReactFlow.Spring
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
local memo = React.memo
local u32 = {Golden = 13671358230, Blue = 128884225767916}
local u33 = {Golden = 110337213971845, Blue = 104803345073731}
local u34 = {}
u34.Golden = Color3.fromRGB(135, 23, 25)
u34.Blue = Color3.fromRGB(14, 55, 68)
return (memo(function(a1) -- Line: 33
    -- upvalues: u34 (val), u33 (val), u32 (val), useState (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Spring (val), createElement (val), Event (val), BattlepassStars (val), ImageLabel (val)
    local v1 = a1.icon or "Golden"
    local v2 = a1.text or ""
    local clicked = a1.clicked
    local v3 = a1.stars == true
    local Golden = u34[v1] or u34.Golden
    local v4 = u33[v1] or 110337213971845
    local v5 = if typeof(v1) ~= "number" then u32[v1] or 13671358230 else v1
    local u27, u28 = useState(false)
    local v6, u51 = useGroupAnimation({
        pressing = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.6})}),
        hovering = useAnimation({scale = Spring({target = 1.05, speed = 30, damper = 0.6})}),
        idle = useAnimation({scale = Spring({target = 1, speed = 30, damper = 0.6})}),
    }, {scale = 1})
    local v7 = {BackgroundTransparency = 1}
    local Position = a1.Position or UDim2.fromScale(0, 0)
    v7.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 0.483)
    v7.Size = Size
    v7.AnchorPoint = a1.AnchorPoint
    local v8 = {}
    local v9 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }

    v9[Event.MouseButton1Down] = function() -- Line: 89 -- upvalues: u27 (val), u51 (val)
        if u27 then
            u51("pressing")
        end
    end

    v9[Event.MouseButton1Up] = function() -- Line: 95 -- upvalues: u27 (val), u51 (val), clicked (val)
        if not u27 then
            u51("idle")
        else
            u51("hovering")
        end
        if u27 and clicked then
            clicked()
        end
    end

    v9[Event.MouseEnter] = function() -- Line: 107 -- upvalues: u28 (val), u51 (val)
        u28(true)
        u51("hovering")
    end

    v9[Event.MouseLeave] = function() -- Line: 112 -- upvalues: u28 (val), u51 (val)
        u28(false)
        u51("idle")
    end

    local v10 = {
        stars = v3 and createElement(BattlepassStars, {
            rate = 6,
            speed = 90,
            scale = 1,
            Transparency = a1.Transparency,
            duration = NumberRange.new(0.8, 1),
        }),
    }
    local v11 = clicked and createElement("UIScale", {Scale = v6.scale})
    v10.scale = v11
    v10.bG = createElement("ImageLabel", {
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(v4),
        ImageTransparency = a1.Transparency,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    })
    v10.icon = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(v5),
        ImageTransparency = a1.Transparency,
        Position = UDim2.fromScale(0.5, 0.45),
        Size = UDim2.fromScale(0.526, 0.656),
    })
    v10.textLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.475, 0.79),
        Size = UDim2.fromScale(0.828, 0.217),
        Text = v2,
        TextTransparency = a1.Transparency,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Golden, Transparency = a1.Transparency}),
    })
    v8.button = createElement("ImageButton", v9, v10)
    return createElement("Frame", v7, v8)
end))