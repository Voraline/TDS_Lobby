-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.CrateContents
-- Decompile time: 10.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local Modules = Shared.Modules
local Utils = Modules.Utils
local Interfaces = Client.Interfaces
local Inventory = Interfaces.Universal.Components.Inventory
local Hooks = Interfaces.Hooks
local SharedData = Shared.Data.SharedData
local Asset = require(Modules.Asset)
local ConsumableCrateWeights = require(SharedData.ConsumableCrateWeights)
local Content = require(Modules.Content)
local Enum = require(Modules.Enum)
local RarityColors = require(Modules.RarityColors)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local ShopNameUtils = require(Modules.ShopNameUtils)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local TowerCrateWeights = require(SharedData.TowerCrateWeights)
local math = require(Utils.math)
local InventoryItem = require(Inventory.InventoryItem)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useLayoutEffect = React.useLayoutEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local useCache = require(Hooks.useCache)
local useCrates = require(Hooks.useCrates)
local useMediaQuery = require(Hooks.useMediaQuery)
local usePlayerReplicator = require(Hooks.usePlayerReplicator)
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
local u83 = Vector2.new(600, 800)
local Consumables = Content("Consumables")

local function getConsumableItems(a1) -- Line: 72 -- upvalues: Asset (val), Consumables (val)
    local Rarity, v1, v2
    local Consumables_2 = a1.Consumables
    if not Consumables_2 then
        return {}
    end
    local v3 = {}
    local Items = Consumables_2.Items
    if not Items then
        local Rarity_2
        for i, j in Consumables:GetChildren() do
            v2 = Asset("Consumables", j.Name)
            Rarity_2 = v2 and v2.Rarity
            v1 = Rarity_2 and Consumables_2.Rarities[Rarity_2]
            if Rarity_2 and v1 and v1 > 0 then
                table.insert(v3, {itemType = "consumable", name = j.Name, rarity = Rarity_2})
            end
        end
        return v3
    end
    local v4 = nil
    local v5 = nil
    for k, n in Items, v4, v5 do
        v2 = Asset("Consumables", n)
        Rarity = v2 and v2.Rarity
        v1 = Rarity and Consumables_2.Rarities[Rarity]
        if v2 and v1 and v1 > 0 then
            table.insert(v3, {itemType = "consumable", name = n, rarity = Rarity})
        end
    end
    return v3
end

local function getSkinItems(a1) -- Line: 112 -- upvalues: Asset (val)
    local v1, v2, v3, v4
    local v5 = {}
    local Contents = a1.Contents or {}
    local v6 = nil
    local v7 = nil
    for i, j in Contents, v6, v7 do
        v3 = nil
        v4 = nil
        for k, n in j, v3, v4 do
            v1 = Asset("Troops", n)
            v2 = v1 and v1.Properties.SkinData[i]
            if v2 then
                table.insert(v5, {
                    itemType = "skin",
                    name = i,
                    rarity = v2.Rarity,
                    skin = i,
                    tower = n,
                })
            end
        end
    end
    return v5
end

local function getItemWeight(a1, a2) -- Line: 134 -- types: a1: table, a2: table
    local v1, value
    local v2 = nil
    local v3 = nil
    local v4 = a1
    for i, j in a2, v2, v3 do
        value = j.value
        if v4.itemType ~= "consumable" then
            v1 = false
            if value.skin == v4.skin then
                v1 = value.tower == v4.tower
            end
        else
            v1 = value.name == v4.name
        end
        if v1 then
            return j.weight
        end
    end
    return 0
end

local function getDisplayPercentages(a1, a2) -- Line: 149
    -- upvalues: math (val), getItemWeight (val)
    return math.getDisplayPercentages(a1, function(a1) -- Line: 153 -- upvalues: getItemWeight (upval), a2 (val)
        return (getItemWeight(a1, a2))
    end)
end

local function sortItems(a1) -- Line: 158 -- types: a1: table
    table.sort(a1, function(a1, a2) -- Line: 159
        local v1 = a1.rarity or 0
        local v2 = a2.rarity or 0
        if v1 ~= v2 then
            return v2 < v1
        end
        if a1.name ~= a2.name then
            return a1.name < a2.name
        end
        return (a1.tower or "") < (a2.tower or "")
    end)
end

return memo(function(a1) -- Line: 174
    -- upvalues: useCrates (val), useCache (val), usePlayerReplicator (val), useState (val), useRef (val), React (val)
    -- upvalues: useEffect (val), useLayoutEffect (val), u83 (val), math (val), useMemo (val), getConsumableItems (val)
    -- upvalues: getSkinItems (val), ConsumableCrateWeights (val), TowerCrateWeights (val), getDisplayPercentages (val)
    -- upvalues: ShopNameUtils (val), Enum (val), RarityColors (val), createElement (val), InventoryItem (val)
    -- upvalues: useMediaQuery (val), useGroupAnimation (val), useSequenceAnimation (val), Spring (val)
    -- upvalues: useAnimation (val), Tooltip (val)
    local rarity, u112, v1
    local u4 = useCrates()[a1.crateName]
    local v2 = false
    if u4 ~= nil then
        v2 = u4.Consumables == nil
    end
    local u14 = useCache("Inventory.Troops", {}, v2)
    local u19 = useCache("Inventory.Skins", {}, v2)
    local u21 = usePlayerReplicator()
    local u24, u25 = useState(0)
    local u494 = useRef(nil)
    local v3, u32 = useState(1)
    local v4, u37 = React.useState(nil)
    local v5 = {u21}
    useEffect(function() -- Line: 187 -- upvalues: u21 (val), u25 (val)
        if not u21 then
            u25(0)
            return
        end
        u25(u21:Get("Luck") or 0)
        local u20 = (u21:GetStateChangedSignal("Luck")):Connect(function(a1) -- Line: 195 -- upvalues: u25 (upval)
            u25(a1 or 0)
        end)
        return function() -- Line: 199 -- upvalues: u20 (val)
            u20:Disconnect()
        end
    end, v5)
    useLayoutEffect(function() -- Line: 204 -- upvalues: u494 (val), u83 (upval), u32 (val), math (upval)
        local current = u494.current
        if not current then
            return
        end
        local AbsoluteSize = current.AbsoluteSize
        local v1 = AbsoluteSize.X / u83.X
        local v2 = AbsoluteSize.Y / u83.Y
        u32(math.min(v1, v2))
        local u26 = (current:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 210 -- upvalues: current (val), u83 (upval), u32 (upval), math (upval)
            local AbsoluteSize = current.AbsoluteSize
            local v1 = AbsoluteSize.X / u83.X
            local v2 = AbsoluteSize.Y / u83.Y
            u32(math.min(v1, v2))
        end)
        return function() -- Line: 223 -- upvalues: u26 (val)
            u26:Disconnect()
        end
    end, {})
    v5 = {u4}
    local u52 = useMemo(function() -- Line: 228 -- upvalues: u4 (val), getConsumableItems (upval), getSkinItems (upval)
        local v1
        if not u4 then
            return {}
        end
        table.sort(if not u4.Consumables then getSkinItems(u4) else getConsumableItems(u4), function(a1, a2) -- Line: 159
            local v1 = a1.rarity or 0
            local v2 = a2.rarity or 0
            if v1 ~= v2 then
                return v2 < v1
            end
            if a1.name ~= a2.name then
                return a1.name < a2.name
            end
            return (a1.tower or "") < (a2.tower or "")
        end)
        return v1
    end, v5)
    local v6 = useMemo
    local v7 = {u4, u24, a1.crateName, u14, u19}
    local u62 = v6(function() -- Line: 241
        -- upvalues: u4 (val), ConsumableCrateWeights (upval), a1 (val), u24 (val), TowerCrateWeights (upval), u14 (val)
        -- upvalues: u19 (val)
        local v1, v2
        if not u4 then
            return nil
        end
        if not u4.Consumables then
            local success_2, result_2 = pcall(TowerCrateWeights, a1.crateName, u14, u19, u24)
            v1 = success_2
            v2 = result_2
            if not v1 then
                local success_3, result_3 = pcall(TowerCrateWeights, a1.crateName, {}, {}, u24)
                v1 = success_3
                v2 = result_3
            end
        else
            local success, result = pcall(ConsumableCrateWeights, a1.crateName, u24)
            v1 = success
            v2 = result
        end
        if v1 then
            return v2
        end
        return nil
    end, v7)
    local v8 = {u52, u62}
    v5 = useMemo(function() -- Line: 278 -- upvalues: u62 (val), getDisplayPercentages (upval), u52 (val)
        if not u62 then
            return nil
        end
        return getDisplayPercentages(u52, u62.entries)
    end, v8)
    v7 = {}
    local v9 = nil
    local v10 = nil
    for i, j in u52, v9, v10 do
        local u393 = ShopNameUtils.getTowerDisplayName(j.tower)
        local u398 = ShopNameUtils.getTowerSkinDisplayName(j.tower, j.skin)
        rarity = j.rarity or Enum.SkinRarity.Common
        local u409 = Enum.SkinRarity.ToString(rarity) or "Common"
        local u416 = RarityColors[rarity]
        if not u416 then
            u416 = Color3.new(1, 1, 1)
        end
        v1 = ("%*:%*:%*"):format(j.itemType, j.name, j.tower or "")
        v7[v1] = (createElement(InventoryItem, {
            owned = true,
            equiped = false,
            selected = false,
            disableSpotlight = true,
            cantAnimate = true,
            noAspect = true,
            native = {Size = UDim2.fromScale(1, 1)},
            layOutOrder = i,
            type = if j.itemType ~= "consumable" then "tower" else "consumable",
            towerName = j.tower,
            skin = j.skin,
            previewName = j.name,
            forcedText = j.name,
            forcedRarity = j.rarity,
            weightAmount = if not v5 then nil else v5[i],
            onClick = function() end,
            onEnter = function() -- Line: 320 -- upvalues: u37 (val), j (val), u398 (val), u393 (val), u416 (val), u409 (val)
                u37({
                    Name = ("CrateSkin:%*:%*"):format(j.tower, j.skin),
                    Header = u398,
                    Subject = u393,
                    Content = {
                        {
                            Text = ("Rarity - <font color=\"#%*\"><b>%*</b></font>"):format(u416:ToHex(), u409),
                        },
                    },
                })
            end,
            onLeave = function() -- Line: 333 -- upvalues: u37 (val)
                u37(nil)
            end,
        }))
    end
    v8 = not useMediaQuery("large")
    v9, u112 = useGroupAnimation({
        enabled = useSequenceAnimation({
            {
                timestamp = 0.025,
                panelPosition = Spring({speed = 13, damper = 0.6, target = UDim2.fromScale(0.025, 0.45)}),
                panelScale = Spring({target = 1, speed = 15, damper = 0.5}),
                panelRotation = Spring({target = 0, speed = 15, damper = 0.5}),
            },
        }),
        disabled = useAnimation({}),
    }, {panelRotation = 0, panelScale = 0.5, panelPosition = UDim2.fromScale(-0.25, 0.45)})
    useEffect(function() -- Line: 368 -- upvalues: u112 (val)
        u112("enabled")
    end, {})
    local v11 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = v9.panelPosition,
    }
    local v12 = v8 and UDim2.fromScale(0.4, 0.55) or UDim2.new(0.375, 100, 0.375, 100)
    v11.Size = v12
    v11.ref = u494
    return createElement("Frame", v11, {
        Tooltip = v4 and createElement(Tooltip, {
            Bullets = false,
            Name = v4.Name,
            Header = v4.Header,
            Subject = v4.Subject,
            Content = v4.Content,
        }),
        AspectRatio = createElement("UIAspectRatioConstraint", {
            AspectRatio = u83.X / u83.Y,
            AspectType = Enum.AspectType.FitWithinMaxSize,
        }),
        UIScale = createElement("UIScale", {Scale = v9.panelScale}),
        Panel = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(u83.X, u83.Y),
        }, {
            Scale = createElement("UIScale", {Scale = v3}),
            Background = createElement("Frame", {
                BackgroundTransparency = 0.2,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(0, 0, 0),
                Size = UDim2.fromScale(1, 1),
            }, {
                Corner = createElement("UICorner", {CornerRadius = UDim.new(0.02, 0)}),
                DropShadow = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://9239716855",
                    ZIndex = -1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    ImageColor3 = Color3.new(0, 0, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Slice,
                    Size = UDim2.fromScale(1.04, 1.03),
                    SliceCenter = Rect.new(14, 14, 64, 24),
                }),
            }),
            Content = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.9, 0.94),
            }, {
                Title = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Text = "Crate Contents",
                    TextScaled = true,
                    FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0, 0),
                    Size = UDim2.fromScale(1, 0.065),
                    TextColor3 = Color3.new(1, 1, 1),
                    TextXAlignment = Enum.TextXAlignment.Center,
                }, {Stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
                Divider = createElement("Frame", {
                    BackgroundTransparency = 0.5,
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.new(1, 1, 1),
                    Position = UDim2.fromScale(0, 0.085),
                    Size = UDim2.fromScale(1, 0.003),
                }),
                ScrollingFrame = createElement("ScrollingFrame", {
                    Active = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    BottomImage = "",
                    MidImage = "rbxassetid://95591733073455",
                    ScrollBarThickness = 4,
                    TopImage = "",
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    CanvasSize = UDim2.new(),
                    Position = UDim2.fromScale(0, 0.11),
                    ScrollBarImageColor3 = Color3.fromRGB(172, 172, 172),
                    ScrollingDirection = Enum.ScrollingDirection.Y,
                    Size = UDim2.fromScale(1, 0.89),
                }, {
                    ItemContainer = createElement("Frame", {
                        BackgroundTransparency = 1,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        Size = UDim2.fromScale(1, 0),
                    }, {
                        Grid = createElement("UIGridLayout", {
                            CellPadding = UDim2.fromOffset(10, 10),
                            CellSize = UDim2.fromOffset(155, 175),
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                        }),
                        Items = createElement(React.Fragment, nil, v7),
                        Padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 8), PaddingTop = UDim.new(0, 4)}),
                    }),
                }),
            }),
        }),
    })
end)