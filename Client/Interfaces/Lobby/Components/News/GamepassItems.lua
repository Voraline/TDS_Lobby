-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.GamepassItems
-- Decompile time: 2.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GamepassButton = require(script.Parent.GamepassButton)
local Items = require(script.Parent.Items)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local memo = React.memo
local useBinding = React.useBinding
return memo(function(a1) -- Line: 40
    -- upvalues: useBinding (val), createElement (val), Items (val), GamepassButton (val), React (val)
    local name, v1, v2
    local v3 = {}
    local v4 = useBinding(0)
    local v5 = a1.Transparency or v4
    local v6 = math.max(1, (math.floor(a1.maxItemsPerRow or 2)))
    local v7 = math.max(1, (math.min(#a1.Offers, v6)))
    for i, j in a1.Offers do
        name = j.name
        v1 = createElement
        v2 = {
            layout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 12),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            preview = createElement(Items, {
                LayoutOrder = 1,
                Transparency = v5,
                Items = {
                    {
                        Type = "tower",
                        Skin = "Default",
                        Name = j.name,
                        Details = j.details,
                        Size = UDim2.fromOffset(160, 160),
                    },
                },
            }),
            buttonHolder = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 63)}, {
                button = createElement(GamepassButton, {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.8, 1),
                    gamepassId = j.gamepassId,
                }),
            }),
        }
        v3[name] = (v1("Frame", {BackgroundTransparency = 1, LayoutOrder = i}, v2))
    end
    local v8 = math.ceil(#a1.Offers / v7)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.None,
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.new(1, 0, 0, v8 * 255 + math.max(0, v8 - 1) * 12),
    }, {
        grid = createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(12, 12),
            CellSize = UDim2.new(1 / v7, -((v7 - 1) * 12) / v7, 0, 255),
            FillDirection = Enum.FillDirection.Horizontal,
            FillDirectionMaxCells = v7,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        offers = createElement(React.Fragment, nil, v3),
    })
end)