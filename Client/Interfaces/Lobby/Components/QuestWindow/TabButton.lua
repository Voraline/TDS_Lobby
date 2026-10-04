-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.TabButton
-- Decompile time: 3.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local Event = React.Event
local scaledStroke = StudioElements.scaledStroke
return function(a1) -- Line: 18 -- upvalues: createElement (val), Event (val), scaledStroke (val) -- types: a1: table
    local v1 = a1.Selected == true
    local v2 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 1,
        LayoutOrder = a1.LayoutOrder or 0,
        Size = UDim2.new(0.6944, 0, 0.3396, 0),
        Text = "",
        TextColor3 = Color3.fromRGB(27, 42, 53),
        TextSize = 8,
    }
    v2[Event.Activated] = a1.OnActivated
    local v3 = {}
    local v4 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(38, 38, 38),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v5 = {Corner = createElement("UICorner", {CornerRadius = UDim.new(0.0938, 0)})}
    local v6 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://94123922287925",
        Rotation = 10,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v7 = if not v1 then Color3.fromRGB(148, 148, 148) else Color3.fromRGB(0, 170, 255)
    v6.ImageColor3 = v7
    v6.ImageTransparency = if not v1 then 0.45 else 0
    v6.Position = UDim2.fromScale(0.5, 0.5)
    v6.Size = UDim2.fromScale(1, 1)
    v5.Highlight = createElement("ImageLabel", v6)
    v5.Icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = a1.Icon,
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(1, 1),
    })
    v5.Title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 20,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.4968, 0, 0.9145, 0),
        Size = UDim2.new(3.9803, 0, 0.2, 0),
        Text = a1.Label,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        Stroke = scaledStroke({Thickness = 0.03, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
    })
    v3.Content = createElement("Frame", v4, v5)
    return createElement("TextButton", v2, v3)
end