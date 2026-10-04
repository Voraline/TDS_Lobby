-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestObjectivesCard
-- Decompile time: 3.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local QuestObjectiveList = require(script.Parent.QuestObjectiveList)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local scaledStroke = StudioElements.scaledStroke
local textStroke = StudioElements.textStroke
return function(a1) -- Line: 27
    -- upvalues: scaledStroke (val), createElement (val), textStroke (val), QuestObjectiveList (val)
    local v1 = {
        Stroke = scaledStroke({Thickness = 0.012, Transparency = 0.4, Color = Color3.fromRGB(255, 255, 255)}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0.0417, 0)}),
        Gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
        Padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 20),
            PaddingLeft = UDim.new(0, 18),
            PaddingRight = UDim.new(0, 18),
            PaddingTop = UDim.new(0, 14),
        }),
        Title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextWrapped = true,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.new(1, 0, 0.16, 0),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            ZIndex = a1.ZIndex,
        }, {
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 28, MinTextSize = 13}),
            Stroke = textStroke({Transparency = 0.3, Color = Color3.fromRGB(0, 0, 0)}),
        }),
        ObjectivesHeader = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 0, 0.17, 0),
            Size = UDim2.new(1, 0, 0.07, 0),
            Text = a1.ObjectivesLabel,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = a1.ZIndex,
        }, {
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 19, MinTextSize = 10}),
        }),
        Objectives = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0.255, 0),
            Size = UDim2.new(1, 0, 0.59, 0),
            ZIndex = a1.ZIndex,
        }, {
            List = createElement(QuestObjectiveList, {
                ActiveObjectiveIndex = a1.ActiveObjectiveIndex,
                Record = a1.Record,
                ZIndex = a1.ZIndex,
            }),
        }),
    }
    for i, j in a1.ActionChildren or {} do
        v1[i] = j
    end
    local v2 = {BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    v2.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
    v2.LayoutOrder = a1.LayoutOrder
    local Position = a1.Position or UDim2.new(0.29, 0, 0.5, 0)
    v2.Position = Position
    local Size = a1.Size or UDim2.new(0.42, 0, 0.86, 0)
    v2.Size = Size
    v2.ZIndex = a1.ZIndex
    return createElement("Frame", v2, v1)
end