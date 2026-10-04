-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardTowersBanner
-- Decompile time: 1.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Components.Player)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 14 -- upvalues: createElement (val), TowerPreview (val), React (val) -- types: a1: table
    local v1, v2, v3
    local v4 = {}
    for i, j in a1.towers do
        table.insert(v4, {tower = i, skin = j})
    end
    local v5 = {}
    local v6 = #v4
    for k = 1, v6 do
        v1 = createElement
        v2 = {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.new(),
            Size = UDim2.fromScale(3, 3),
        }
        v3 = {
            towerModel = createElement(TowerPreview, {
                level = 0,
                flat = false,
                preview = false,
                animate = true,
                icon = false,
                pause = false,
                shadow = false,
                tower = v4[k].tower,
                skin = v4[k].skin,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(2, 2),
            }),
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        }
        v5[k] = (v1("Frame", v2, v3))
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
        towers = createElement(React.Fragment, nil, v5),
    })
end)