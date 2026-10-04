-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Event.EventRewards
-- Decompile time: 1.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardItem = require(ReplicatedStorage.Client.Interfaces.Universal.Components.RewardItem)
local createElement = React.createElement
return function(a1) -- Line: 19 -- upvalues: createElement (val), RewardItem (val), React (val) -- types: a1: table
    local v1 = {}
    for i, j in a1.Rewards do
        table.insert(v1, (createElement(RewardItem, {Size = UDim2.fromOffset(128, 172), Icon = j.Icon, RewardText = j.Text})))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = a1.AnchorPoint,
        Size = a1.Size,
        Position = a1.Position,
    }, {
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            FillDirection = Enum.FillDirection.Horizontal,
        }),
        createElement(React.Fragment, {}, v1),
    })
end