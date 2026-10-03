-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.TeamPlayersReward
-- Decompile time: 0.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardPlayerTeam = require(script.Parent.RewardPlayerTeam)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 14 -- upvalues: createElement (val), RewardPlayerTeam (val), React (val) -- types: a1: table
    local v1, v2, v3
    local v4 = {}
    for i, j in a1.players do
        v1 = createElement
        v2 = RewardPlayerTeam
        v3 = {
            Visible = true,
            team = a1.team,
            player = j,
            LayoutOrder = i,
            ZIndex = i,
        }
        v4[i] = (v1(v2, v3))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, -0.35, 0),
        Size = UDim2.fromScale(1, 0.175276),
    }, {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, -70),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        towers = createElement(React.Fragment, nil, v4),
    })
end)