-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.RestrictedCrateView.ItemBar
-- Decompile time: 4.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local Interfaces = Client.Interfaces
local Inventory = Interfaces.Universal.Components.Inventory
local Hooks = Interfaces.Hooks
local Components_2 = Client.Interfaces.Components
local Shared = ReplicatedStorage.Shared
local Modules = Shared.Modules
local Enum = require(Modules.Enum)
local RarityColors = require(Modules.RarityColors)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local ShopNameUtils = require(Modules.ShopNameUtils)
local Tooltip = require(Interfaces.Components.Tooltip)
local InventoryItem = require(Inventory.InventoryItem)
local TextLabel = require(Components_2.TextLabel)
local useEffect = React.useEffect
local useRef = React.useRef
local useMediaQuery = require(Hooks.useMediaQuery)
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
local memo = React.memo
local createElement = React.createElement

local function createItem(a1, a2, a3) -- Line: 51
    -- upvalues: ShopNameUtils (val), Enum (val), RarityColors (val), createElement (val), InventoryItem (val)
    local type = a1.type
    local tower = if type ~= "skin" then nil else a1.tower
    local name = a1.name or a1.skin or tower or ""
    local u16 = ShopNameUtils.getTowerDisplayName(a1.tower)
    local u21 = ShopNameUtils.getTowerSkinDisplayName(a1.tower, a1.skin)
    local rarity = a1.rarity or Enum.SkinRarity.Common
    local u32 = Enum.SkinRarity.ToString(rarity) or "Common"
    local u39 = RarityColors[rarity]
    if not u39 then
        u39 = Color3.new(1, 1, 1)
    end
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.85, 0.85), LayoutOrder = a2}, {
        AspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        InventoryItemBase = createElement(InventoryItem, {
            owned = true,
            equiped = false,
            disableSpotlight = true,
            cantAnimate = false,
            layOutOrder = a2,
            native = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.6, 0.5),
                Size = UDim2.fromScale(1, 1),
            },
            type = if type ~= "consumable" then "tower" else "consumable",
            towerName = tower,
            skin = a1.skin,
            previewName = name,
            forcedText = name,
            forcedRarity = a1.rarity,
            selected = a2 == 1,
            darkened = a2 > 1,
            scale = if a2 ~= 1 then 0.85 else 1,
            onClick = function() end,
            onEnter = function() -- Line: 95 -- upvalues: a3 (val), a1 (val), u21 (val), u16 (val), u39 (val), u32 (val)
                a3({
                    Name = ("CrateSkin:%*:%*"):format(a1.tower, a1.skin),
                    Header = u21,
                    Subject = u16,
                    Content = {
                        {
                            Text = ("Rarity - <font color=\"#%*\"><b>%*</b></font>"):format(u39:ToHex(), u32),
                        },
                    },
                })
            end,
            onLeave = function() -- Line: 108 -- upvalues: a3 (val)
                a3(nil)
            end,
        }),
    })
end

return memo(function(a1) -- Line: 115
    -- upvalues: React (val), createItem (val), useMediaQuery (val), useRef (val), useGroupAnimation (val)
    -- upvalues: useSequenceAnimation (val), Spring (val), useAnimation (val), useEffect (val), createElement (val)
    -- upvalues: Tooltip (val), TextLabel (val)
    local u53, v1
    local v2, v3 = React.useState(nil)
    local v4 = {}
    local v5 = 0
    local v6 = nil
    local v7 = nil
    for i, j in a1.items, v6, v7 do
        v1 = ("%*:%*:%*:%*"):format(j.type, j.tower or "", j.skin or j.name, i)
        v4[v1] = (createItem(j, i, v3))
        v5 = v5 + 1
    end
    local v8 = not useMediaQuery("large")
    local u24 = useRef(nil)
    v7, u53 = useGroupAnimation({
        enabled = useSequenceAnimation({
            {
                timestamp = 0,
                panelPosition = Spring({speed = 12, damper = 0.5, target = UDim2.fromScale(0.5, 0)}),
                panelScale = Spring({target = 1, speed = 15, damper = 0.5}),
                panelRotation = Spring({target = 0, speed = 15, damper = 0.5}),
            },
        }),
        disabled = useAnimation({}),
    }, {panelRotation = 0, panelScale = 0.5, panelPosition = UDim2.fromScale(0.5, -0.4)})
    useEffect(function() -- Line: 157 -- upvalues: u53 (val)
        u53("enabled")
    end, {})
    local v9 = useEffect
    local v10 = {a1.items}
    v9(function() -- Line: 161 -- upvalues: u24 (val)
        local current = u24.current
        if current then
            current.CanvasPosition = Vector2.zero
        end
    end, v10)
    v10 = {BackgroundTransparency = 0.5}
    local v11 = v8 and UDim2.fromScale(0.4, 0.4) or UDim2.new(0.3, 100, 0.3, 100)
    v10.Size = v11
    v10.AnchorPoint = Vector2.new(0.5, 0)
    v10.Position = v7.panelPosition
    v10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v11 = {
        Tooltip = v2 and createElement(Tooltip, {
            Bullets = false,
            Name = v2.Name,
            Header = v2.Header,
            Subject = v2.Subject,
            Content = v2.Content,
        }),
        UIGradient = createElement("UIGradient", {
            Rotation = 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.25, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.75, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        UIScale = createElement("UIScale", {Scale = v7.panelScale}),
        AspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.25}),
        PointerImage = createElement("ImageLabel", {
            Image = "rbxassetid://76216774416862",
            BackgroundTransparency = 1,
            Rotation = 0,
            ZIndex = 10,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1.25),
            Size = UDim2.fromScale(0.25, 0.25),
        }, {
            AspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.169921875}),
        }),
        NextUnlocksLabel = createElement(TextLabel, {
            Text = "Next Unlocks",
            TextScaled = true,
            BackgroundTransparency = 1,
            StrokeThickness = 2,
            StrokeTransparency = 0.75,
            Size = UDim2.fromScale(1, 0.15),
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.05),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        }),
    }
    local v12 = {
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ScrollBarImageTransparency = 1,
        ScrollBarThickness = 3,
        Selectable = true,
        AnchorPoint = Vector2.new(0.5, 1),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
        CanvasSize = UDim2.fromScale(0, 0),
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        HorizontalScrollBarInset = Enum.ScrollBarInset.None,
        Position = UDim2.fromScale(0.5, 0.95),
        ScrollingDirection = Enum.ScrollingDirection.X,
        Size = UDim2.fromScale(1, 0.75),
        ref = u24,
    }
    local v13 = {}
    local v14 = {FillDirection = Enum.FillDirection.Horizontal}
    v14.HorizontalAlignment = v5 > 4 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
    v14.VerticalAlignment = Enum.VerticalAlignment.Center
    v14.SortOrder = Enum.SortOrder.LayoutOrder
    v14.HorizontalFlex = if not (v5 > 4) then "None" else "SpaceBetween"
    v14.Padding = UDim.new(0, 0)
    v13.UIListLayout = createElement("UIListLayout", v14)
    v13.Items = createElement(React.Fragment, nil, v4)
    v11.ItemContainer = createElement("ScrollingFrame", v12, v13)
    return createElement("Frame", v10, v11)
end)