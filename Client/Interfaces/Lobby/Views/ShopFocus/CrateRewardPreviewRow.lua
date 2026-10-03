-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.CrateRewardPreviewRow
-- Decompile time: 1.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Packages = ReplicatedStorage.Packages
local InventoryItem = require(Interfaces.Universal.Components.Inventory.InventoryItem)
local React = require(Packages.React)
local createElement = React.createElement

local function createPreviewTile(a1, a2, a3, a4) -- Line: 29
    -- upvalues: createElement (val), InventoryItem (val)
    local type = a1.type
    local tower = a1.tower or a1.name or ""
    local name = a1.name or a1.skin or tower
    return createElement(InventoryItem, {
        owned = true,
        equiped = false,
        disableSpotlight = true,
        noAspect = true,
        cantAnimate = true,
        layOutOrder = a2,
        type = if type ~= "skin" then type else "tower",
        towerName = tower,
        skin = a1.skin,
        previewName = name,
        forcedText = name,
        forcedRarity = a1.rarity,
        selected = a2 == a3,
        onClick = function() -- Line: 53 -- upvalues: a4 (val), a2 (val)
            a4(a2)
        end,
    })
end

return React.memo(function(a1) -- Line: 59 -- upvalues: createPreviewTile (val), createElement (val), React (val) -- types: a1: table
    local v1
    local v2 = {}
    for i, j in a1.items do
        v1 = ("Item_%*"):format(i)
        v2[v1] = (createPreviewTile(j, i, a1.selectedIndex, a1.onSelect))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 20,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.965),
        Size = UDim2.fromScale(0.52, 0.22),
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.025, 0),
        }),
        UISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(780, 170)}),
        Children = createElement(React.Fragment, nil, v2),
    })
end)