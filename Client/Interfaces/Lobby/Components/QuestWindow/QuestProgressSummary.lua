-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestProgressSummary
-- Decompile time: 1.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local QuestProgressBar = require(script.Parent.QuestProgressBar)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local textStroke = StudioElements.textStroke

local function textSizeConstraint(a1, a2) -- Line: 18 -- upvalues: createElement (val) -- types: a1: number, a2: number?
    return createElement("UITextSizeConstraint", {MaxTextSize = a1, MinTextSize = a2 or 8})
end

return function(a1) -- Line: 25
    -- upvalues: createElement (val), React (val), textStroke (val), QuestProgressBar (val)
    return createElement(React.Fragment, {}, {
        CurrentObjectiveLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextSize = 26,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0.75, 0, 0.11, 0),
            Size = UDim2.new(0.38, 0, 0.06, 0),
            Text = a1.Label,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            Stroke = textStroke({Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)}),
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 26, MinTextSize = (if not a1.IsMobile then 10 else 9) or 8}),
        }),
        Progression = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.75, 0, 0.26, 0),
            Size = UDim2.new(0.42, 0, 0.15, 0),
        }, {
            Description = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                Position = UDim2.new(0.39, 0, 0.32, 0),
                Size = UDim2.new(0.68, 0, 0.36, 0),
                Text = a1.Description,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {
                TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 9}),
            }),
            Value = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                Position = UDim2.new(0.87, 0, 0.32, 0),
                Size = UDim2.new(0.24, 0, 0.36, 0),
                Text = a1.Value,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Right,
            }, {
                TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 9}),
            }),
            Bar = createElement(QuestProgressBar, {
                Position = UDim2.new(0.5, 0, 0.76, 0),
                Progress = a1.Progress,
                Size = UDim2.new(0.96, 0, 0.18, 0),
            }),
        }),
    })
end