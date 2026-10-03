-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingResults
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement

local function getScale(a1) -- Line: 13 -- types: a1: userdata?
    if a1 and 1200 < a1.X then
        return 0.5
    end
    return 1
end

return function(a1) -- Line: 21 -- upvalues: createElement (val), React (val) -- types: a1: table
    local screenSize = a1.screenSize
    local v1 = if not screenSize then 1 else if not (1200 < screenSize.X) then 1 else 0.5
    return createElement("Frame", {
        Name = "Match",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(v1, v1),
        Visible = a1.visible ~= false,
    }, {
        UIGridLayout = createElement("UIGridLayout", {
            Name = "UIGridLayout",
            CellPadding = UDim2.fromScale(0.05, 0.05),
            CellSize = UDim2.fromScale(0.4, 0.4),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {Name = "UIAspectRatioConstraint", AspectRatio = 1.5}),
        Children = createElement(React.Fragment, {}, a1.children),
    })
end