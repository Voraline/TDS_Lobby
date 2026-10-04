-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestRewardsPanel
-- Decompile time: 2.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardList = require(script.Parent.RewardList)
local createElement = React.createElement

local function textSizeConstraint(a1, a2) -- Line: 15 -- upvalues: createElement (val) -- types: a1: number, a2: number?
    return createElement("UITextSizeConstraint", {MaxTextSize = a1, MinTextSize = a2 or 8})
end

return function(a1) -- Line: 22 -- upvalues: createElement (val), React (val), RewardList (val) -- types: a1: table
    return createElement(React.Fragment, {}, {
        Divider = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.75, 0, 0.43, 0),
            Size = UDim2.new(0.36, 0, 0.005, 0),
        }, {
            Gradient = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
                }),
            }),
        }),
        RewardsTitle = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextSize = 20,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0.75, 0, 0.385, 0),
            Size = UDim2.new(0.34, 0, 0.045, 0),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Center,
        }, {
            TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 8}),
        }),
        Rewards = createElement(RewardList, {
            FillDirectionMaxCells = 4,
            ShowQuantity = true,
            CellPadding = UDim2.fromOffset(8, 0),
            CellSize = UDim2.new(0.225, 0, 0.92, 0),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            IsMobile = a1.IsMobile,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.75, 0, 0.525, 0),
            Rewards = a1.Rewards,
            Size = UDim2.new(0.36, 0, 0.24, 0),
            TooltipKeyPrefix = a1.TooltipKeyPrefix,
        }),
    })
end