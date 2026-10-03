-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestObjectiveRow
-- Decompile time: 2.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local createElement = React.createElement
local scaledStroke = StudioElements.scaledStroke
local textStroke = StudioElements.textStroke
return function(a1) -- Line: 22
    -- upvalues: Comma (val), createElement (val), scaledStroke (val), textStroke (val)
    local Objective = a1.Objective
    local LayoutOrder = a1.LayoutOrder
    local v1 = Objective.current or 0
    local v2 = Objective.amount or 0
    local v3 = v2 <= v1
    local v4 = false
    if a1.ObjectiveMode == "SEQUENTIAL" then
        v4 = false
        if a1.ActiveObjectiveIndex < LayoutOrder then
            v4 = not v3
        end
    end
    local description = Objective.description or Objective.id
    local v5 = ("%*/%*"):format(Comma((math.min(v1, v2))), (Comma(v2)))
    local v6 = if not v3 then if not v4 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(160, 160, 160) else Color3.fromRGB(57, 181, 74)
    return createElement("Frame", {
        BackgroundTransparency = 0.45,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        LayoutOrder = LayoutOrder,
        Size = UDim2.new(1, 0, 0, a1.RowHeight or 58),
        ZIndex = a1.ZIndex,
    }, {
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        Stroke = scaledStroke({Thickness = 0.006, Transparency = 0.78, Color = Color3.fromRGB(255, 255, 255)}),
        StatusIcon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Image = if not v3 then "rbxassetid://81755509462428" else "rbxassetid://15303988233",
            ImageTransparency = if not v4 then 0 else 0.45,
            Position = UDim2.new(0, 10, 0.5, 0),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(28, 28),
            ZIndex = a1.ZIndex,
        }),
        Description = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 48, 0.5, 0),
            Size = UDim2.new(0.68, -48, 0.78, 0),
            Text = description,
            TextColor3 = v6,
            TextTransparency = if not v4 then 0 else 0.3,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            ZIndex = a1.ZIndex,
        }, {
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18, MinTextSize = 10}),
            Stroke = textStroke({Thickness = 0.03, Transparency = 0.45, Color = Color3.fromRGB(0, 0, 0)}),
        }),
        Value = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(1, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(1, -12, 0.5, 0),
            Size = UDim2.new(0.3, 0, 0.7, 0),
            Text = v5,
            TextColor3 = v6,
            TextTransparency = if not v4 then 0 else 0.3,
            TextXAlignment = Enum.TextXAlignment.Right,
            ZIndex = a1.ZIndex,
        }, {
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18, MinTextSize = 10}),
            Stroke = textStroke({Thickness = 0.03, Transparency = 0.45, Color = Color3.fromRGB(0, 0, 0)}),
        }),
    })
end