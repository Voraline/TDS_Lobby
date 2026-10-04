-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Objectives
-- Decompile time: 5.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local Objective = require(script.Objective)
return function(a1) -- Line: 8 -- upvalues: createElement (val), Objective (val), React (val)
    local Objectives = a1.Objectives or {}
    local v1 = {}
    local v2 = nil
    local v3 = nil
    for i, j in Objectives, v2, v3 do
        table.insert(v1, (createElement(Objective, {
            GoalDescription = if not (j.Progress < 1) then "Claim your reward in the lobby!" else j.GoalDescription,
            GoalDescriptionTextSize = j.GoalDescriptionTextSize,
            Title = j.Title,
            Progress = j.Progress,
            LayoutOrder = j.LayoutOrder,
            ObjectiveColor = j.ObjectiveColor,
        })))
    end
    v3 = {}
    local AnchorPoint = a1.AnchorPoint or Vector2.xAxis
    v3.AnchorPoint = AnchorPoint
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BackgroundTransparency = 1
    v3.Size = a1.Size
    local Position = a1.Position or UDim2.new(1, -32, 0, 16)
    v3.Position = Position
    v3.AutomaticSize = Enum.AutomaticSize.Y

    v3[React.Change.AbsoluteSize] = function(a1_2) -- Line: 35 -- upvalues: a1 (val) -- types: a1_2: userdata
        if a1.SetWindowSize then
            a1.SetWindowSize(a1_2.AbsoluteSize)
        end
    end

    return createElement("Frame", v3, {
        title = createElement("Frame", {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(0, 30),
        }, {
            title = createElement("TextLabel", {
                TextSize = 30,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = a1.Title or "Quests",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromOffset(0, 40),
            }, {
                stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
                padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 30), PaddingRight = UDim.new(0, 30)}),
            }),
            banner = createElement("Frame", {
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                ZIndex = 0,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.new(1, 0, 0, 25),
            }, {
                gradient = createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.05, 0.5),
                        NumberSequenceKeypoint.new(0.2, 0.2),
                        NumberSequenceKeypoint.new(0.8, 0.2),
                        NumberSequenceKeypoint.new(0.95, 0.5),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
        }),
        scale = createElement("UIScale", {Scale = a1.Scale or 1}),
        listLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 18),
        }),
        React.createElement(React.Fragment, {}, v1),
    })
end