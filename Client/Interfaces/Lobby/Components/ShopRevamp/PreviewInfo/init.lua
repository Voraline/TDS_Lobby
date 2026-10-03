-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.PreviewInfo
-- Decompile time: 20.35 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage.Client
local Modules_2 = Client.Modules
local Shared = ReplicatedStorage.Shared
local Modules = Shared.Modules
local Packages = ReplicatedStorage.Packages
local Interfaces = Client.Interfaces
local Components = Interfaces.Components
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local Comma = require(Modules_2.Comma)
local CrateDisplayName = require(Interfaces.CrateDisplayName)
local Enum = require(Modules.Enum)
local EvolutionLock = require(script.Parent.EvolutionLock)
local Icons = require(Interfaces.LegacyInterface.Icons)
local InventoryContext = require(Interfaces.Contexts.InventoryContext)
local RarityColors = require(Modules.RarityColors)
local RarityUtil = require(Modules.RarityUtil)
local ShopCostUtils = require(Modules.ShopCostUtils)
require(Interfaces.Stores.Lobby.ShopFocusStore)
local Troops = require(Modules.Asset.Handlers.Troops)
local useCache = require(Hooks.useCache)
local useCrates = require(Hooks.useCrates)
local useFontScale = require(Hooks.useFontScale)
local useMediaQuery = require(Hooks.useMediaQuery)
local useProductInfoMap = require(Hooks.useProductInfoMap)
local memo = React.memo
local useCallback = React.useCallback
local useEffect = React.useEffect
local createElement = React.createElement
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
local Button = require(Interfaces.Universal.Components.Inventory.Button)
local IconButton = require(Components.IconButton)
require(script.LevelPreviewNavigation)
local LevelPreviewer = require(script.LevelPreviewer)
local PreviewPolicy = require(script.PreviewPolicy)
local Tab = require(script.Tab)
local TextLabel = require(Components.TextLabel)
local u126 = Color3.fromRGB(21, 24, 46)
local u131 = Color3.fromRGB(75, 255, 84)
local u134 = utf8.char(57346)
local u135 = {}
u135[Enum.TowerCategory.Starter] = (Color3.fromRGB(255, 255, 255))
u135[Enum.TowerCategory.Intermediate] = RarityColors[Enum.SkinRarity.Uncommon]
u135[Enum.TowerCategory.Advanced] = RarityColors[Enum.SkinRarity.Rare]
u135[Enum.TowerCategory.Hardcore] = RarityColors[Enum.SkinRarity.Legendary]
u135[Enum.TowerCategory.Evolved] = (Color3.fromRGB(0, 208, 212))
u135[Enum.TowerCategory.Exclusive] = RarityColors[Enum.SkinRarity.Event]
u135[Enum.TowerCategory.Event] = RarityColors[Enum.SkinRarity.Event]

local function titleCase(a1) -- Line: 101
    if type(a1) == "string" and a1 ~= "" then
        return (a1:sub(1, 1):upper()) .. a1:sub(2)
    end
    return ""
end

local function getCostIcon(a1) -- Line: 109 -- upvalues: ShopCostUtils (val), Icons (val) -- types: a1: table
    local v1 = ShopCostUtils.getCurrencyName(a1.currency)
    if v1 == "Robux" then
        return nil
    end
    return Icons[v1] or Icons.Coins
end

local function getDisplayCosts(a1) -- Line: 118 -- upvalues: ShopCostUtils (val)
    local v1 = {}
    for i, j in ShopCostUtils.normalizeCosts(a1) do
        if ShopCostUtils.getCurrencyName(j.currency) ~= nil then
            if type(j.value) == "number" or ShopCostUtils.getRobuxProductId(j) ~= nil then
                table.insert(v1, j)
            end
        end
    end
    return v1
end

local function getPromptPriceData(a1) -- Line: 133 -- upvalues: ShopCostUtils (val) -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        table.insert(v1, {
            Type = j.currency,
            Value = j.value,
            Id = ShopCostUtils.getRobuxProductId(j),
        })
    end
    return v1
end

local function getPurchasePromptType(a1) -- Line: 147 -- types: a1: string
    if a1 == "skin" then
        return "Tower Skin"
    end
    if a1 == "tower" then
        return "Tower"
    end
    if a1 == "emote" then
        return "Emote"
    end
    if a1 == "nametag" then
        return "Tag"
    end
    if type(a1) == "string" and a1 ~= "" then
        return (a1:sub(1, 1):upper()) .. a1:sub(2)
    end
    return ""
end

local function itemOwned(a1, a2) -- Line: 161
    if a2.type == "tower" then
        local towers = a1.towers or {}
        return towers[a2.name] ~= nil
    end
    if a2.type == "skin" then
        local find = table.find
        local skins = a1.skins or {}
        local v1 = skins[a2.name] or {}
        return find(v1, a2.skin) ~= nil
    end
    if a2.type == "emote" then
        local find_2 = table.find
        local emotes = a1.emotes or {}
        return find_2(emotes, a2.name) ~= nil
    end
    if a2.type ~= "nametag" then
        return false
    end
    local find_3 = table.find
    local nametags = a1.nametags or {}
    return find_3(nametags, a2.name) ~= nil
end

local function getItemLabel(a1) -- Line: 175 -- upvalues: Troops (val)
    if a1.type ~= "tower" and a1.type ~= "skin" then
        return a1.displayName or a1.skin or a1.name
    end
    local v1 = Troops(a1.name)
    if v1 then
        if a1.type == "skin" and a1.skin then
            local SkinData = v1.Properties.SkinData and v1.Properties.SkinData[a1.skin]
            if SkinData and SkinData.DisplayName and SkinData.DisplayName ~= "" then
                return SkinData.DisplayName
            end
            return a1.displayName or a1.skin or a1.name
        end
        if v1.Properties.DisplayName and v1.Properties.DisplayName ~= "" then
            return v1.Properties.DisplayName
        end
    end
    return a1.displayName or a1.skin or a1.name
end

local function getUniversalRarityTab(a1) -- Line: 196 -- upvalues: Enum (val), RarityUtil (val)
    if a1 == nil then
        return nil
    end
    local v1 = {}
    local v2 = Enum.Rarity.ToString(a1) or tostring(a1)
    v1.text = v2
    v1.color = RarityUtil.getRarityColor(a1)
    return v1
end

local function getSkinRarityTab(a1) -- Line: 207 -- upvalues: Enum (val), RarityColors (val), u126 (val)
    if a1 == nil then
        return nil
    end
    local v1 = {}
    local v2 = Enum.SkinRarity.ToString(a1) or tostring(a1)
    v1.text = v2
    v2 = RarityColors[a1] or u126
    v1.color = v2
    return v1
end

local function getDiscoverableCrateNames(a1, a2, a3) -- Line: 218 -- types: a2: string?, a3: string?
    local v1 = {}
    if a2 and a3 then
        local v2
        for i, j in a1 or {} do
            if type(i) == "string" and type(j) == "table" and j.Price and type(j.Contents) == "table" then
                v2 = j.Contents[a3]
                if type(v2) == "table" and table.find(v2, a2) then
                    table.insert(v1, i)
                end
            end
        end
        table.sort(v1)
        return v1
    end
    return v1
end

local function getMetadataTabs(a1, a2) -- Line: 250
    -- upvalues: Troops (val), Enum (val), RarityColors (val), u126 (val), getUniversalRarityTab (val)
    -- upvalues: getDiscoverableCrateNames (val), CrateDisplayName (val), u135 (val)
    local v1, v2
    local v3 = {}
    local type_2 = a1.type
    local v4 = if type_2 == "tower" then Troops(a1.name) else if type_2 ~= "skin" then nil else Troops(a1.name)
    local Category = v4 and v4.Properties.Category or (if type_2 ~= "tower" then nil else a1.rarity)
    if type_2 == "skin" then
        local v5, v6, v7
        local skin = v4 and a1.skin and v4.Properties.SkinData and v4.Properties.SkinData[a1.skin]
        local Rarity = skin and skin.Rarity
        if Rarity == nil then
            v1 = getUniversalRarityTab(a1.rarity)
        elseif Rarity ~= nil then
            v1 = {}
            v2 = Enum.SkinRarity.ToString(Rarity) or tostring(Rarity)
            v1.text = v2
            v2 = RarityColors[Rarity] or u126
            v1.color = v2
        else
            v1 = nil
        end
        if v1 then
            table.insert(v3, v1)
        end
        table.insert(v3, {text = "Skin", color = u126})
        for i, j in getDiscoverableCrateNames(a2, a1.name, a1.skin) do
            v5 = a2[j]
            v6 = {text = CrateDisplayName.withSuffix(j, v5)}
            v7 = RarityColors[v5.Rarity] or u126
            v6.color = v7
            table.insert(v3, v6)
        end
    elseif type_2 ~= "tower" then
        local v8 = getUniversalRarityTab(a1.rarity)
        if v8 then
            table.insert(v3, v8)
        end
        table.insert(v3, {
            text = if type(type_2) ~= "string" then "" else if type_2 ~= "" then (type_2:sub(1, 1):upper()) .. type_2:sub(2) else "",
            color = u126,
        })
    else
        table.insert(v3, {text = "Tower", color = u126})
    end
    if type_2 == "tower" and Category then
        v1 = {}
        v2 = Enum.TowerCategory.ToString(Category) or tostring(Category)
        v1.text = v2
        v1.color = u135[Category]
        table.insert(v3, v1)
    end
    return v3
end

return memo(function(a1) -- Line: 313
    -- upvalues: getItemLabel (val), useCrates (val), getMetadataTabs (val), InventoryContext (val), useCache (val)
    -- upvalues: itemOwned (val), EvolutionLock (val), PreviewPolicy (val), getDisplayCosts (val), ShopCostUtils (val)
    -- upvalues: useProductInfoMap (val), useEffect (val), useCallback (val), getPromptPriceData (val), u131 (val)
    -- upvalues: MarketplaceService (val), Players (val), useGroupAnimation (val), useSequenceAnimation (val)
    -- upvalues: Spring (val), useAnimation (val), createElement (val), Tab (val), Comma (val), u134 (val), Icons (val)
    -- upvalues: useMediaQuery (val), useFontScale (val), TextLabel (val), Button (val), LevelPreviewer (val)
    -- upvalues: IconButton (val)
    local u226, u89, v1, v2, v3, v4
    local itemData = a1.itemData
    local u709 = getItemLabel(itemData)
    local v5 = getMetadataTabs(itemData, (useCrates()))
    local v6 = InventoryContext.useInventory()
    local v7 = useCache("TowerExp", {})
    local v8 = true
    if itemData.owned ~= true then
        v8 = itemOwned(v6, itemData)
    end
    local v9 = EvolutionLock.isLocked(itemData, v6, v7) and not v8
    local v10 = PreviewPolicy.hasLevelPreview(itemData, v9)
    local v11 = (if not v9 then itemData.description or "" else EvolutionLock.getLockedMessage(itemData, u709)) ~= ""
    local v12 = v10 or v11
    local u426 = getDisplayCosts(itemData)
    local u70 = nil
    for i, j in u426 do
        u70 = ShopCostUtils.getRobuxProductId(j)
        if u70 then
            break
        end
    end
    _, v2, u89 = useProductInfoMap()
    local u98 = nil
    if u70 then
        local v13
        _, v13 = v2(u70, Enum.InfoType.Product)
        u98 = v13
    end
    local gamepassId = itemData.gamepassId
    local u433 = nil
    if gamepassId then
        _, v3 = v2(gamepassId, Enum.InfoType.GamePass)
        u433 = v3
    end
    local v14 = {u89, gamepassId, u433, u70, u98}
    useEffect(function() -- Line: 360 -- upvalues: u70 (ref), u98 (ref), u89 (val), gamepassId (val), u433 (ref)
        if u70 and not u98 then
            u89(u70, Enum.InfoType.Product)
        end
        if gamepassId and not u433 then
            u89(gamepassId, Enum.InfoType.GamePass)
        end
    end, v14)
    local v15 = useCallback
    v14 = {u426, itemData, u709, a1.purchasePrompt, u70}
    v15 = v15(function() -- Line: 376
        -- upvalues: u70 (ref), itemData (val), a1 (val), u709 (val), getPromptPriceData (upval), u426 (val)
        -- upvalues: u131 (upval)
        if u70 and itemData.purchase then
            itemData.purchase()
            return
        end
        if not a1.purchasePrompt then
            if itemData.purchase then
                itemData.purchase()
            end
            return
        end
        local purchasePrompt = a1.purchasePrompt
        local v1 = {
            robuxPurchaseType = "Product",
            canPreview = false,
            selectedItem = itemData.name,
            displayName = u709,
        }
        local type_2 = itemData.type
        v1.type = if type_2 == "skin" then "Tower Skin" else if type_2 == "tower" then "Tower" else if type_2 == "emote" then "Emote" else if type_2 == "nametag" then "Tag" else if type(type_2) ~= "string" then "" else if type_2 ~= "" then (type_2:sub(1, 1):upper()) .. type_2:sub(2) else ""
        v1.priceData = getPromptPriceData(u426)
        v1.color = u131
        v1.onPurchase = itemData.purchase
        purchasePrompt(v1)
    end, v14)
    local v16 = {gamepassId}
    v3 = useCallback(function() -- Line: 401 -- upvalues: gamepassId (val), MarketplaceService (upval), Players (upval)
        if not gamepassId then
            return
        end
        MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, gamepassId)
    end, v16)
    v14 = useGroupAnimation
    v16 = {}
    local v17 = useSequenceAnimation
    local v18 = {}
    local v19 = {
        timestamp = 0,
        containerPosition = Spring({target = 1, speed = 15, damper = 0.5}),
        transparencyProgressBG = Spring({target = 0.25, speed = 15, damper = 1}),
        scaleProgress = Spring({target = 1, speed = 12, damper = 0.6}),
        closePosition = Spring({target = -0.1, speed = 12, damper = 0.5}),
    }
    local v20 = {
        timestamp = 0.05,
        transparencyProgressHeader = Spring({target = 0.75, speed = 15, damper = 1}),
        headerPosition = Spring({target = 0, speed = 15, damper = 0.5}),
        headerScale = Spring({target = 1, speed = 12, damper = 0.5}),
    }
    local v21 = {
        timestamp = 0.1,
        headerTextPosition = Spring({target = 0, speed = 12, damper = 0.5}),
        transparencyProgressText = Spring({target = 0, speed = 15, damper = 1}),
        descriptionPosition = Spring({target = 0.175, speed = 15, damper = 0.5}),
        previewPosition = Spring({target = 0.575, speed = 15, damper = 0.5}),
    }
    local v22 = {speed = 14, damper = 0.4, target = if not v12 then 0.735 else 0.925}
    v21.buttonsPosition = Spring(v22)
    local v23 = {
        timestamp = 0.3,
        tabsPosition = Spring({target = 0, speed = 14, damper = 0.4}),
        tabsTransparencyProgress = Spring({target = 0, speed = 15, damper = 1}),
    }
    v18[1] = v19
    v18[2] = v20
    v18[3] = v21
    v18[4] = v23
    v16.enabled = v17(v18)
    v16.disabled = useAnimation({})
    v14, u226 = v14(v16, {
        containerPosition = 3,
        transparencyProgressText = 1,
        transparencyProgressBG = 1,
        transparencyProgressHeader = 1,
        tabsTransparencyProgress = 1,
        closePosition = -0.5,
        headerPosition = 0.5,
        buttonsPosition = 1.5,
        headerTextPosition = -0.1,
        descriptionPosition = 1,
        tabsPosition = -0.1,
        previewPosition = 1,
        scaleProgress = 1.1,
        headerScale = 1.2,
    })
    useEffect(function() -- Line: 516 -- upvalues: u226 (val)
        u226("enabled")
    end, {})
    v17 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            Padding = UDim.new(0.0125, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v20 = nil
    for k, n in v5, nil, v20 do
        v22 = ("Tab_%*"):format(k)
        v17[v22] = (createElement(Tab, {
            color = n.color,
            layoutOrder = k,
            text = n.text,
            transparency = v14.tabsTransparencyProgress,
        }))
    end

    local function getCostText(a1) -- Line: 539
        -- upvalues: ShopCostUtils (upval), u98 (ref), Comma (upval), u134 (upval)
        local v1 = ShopCostUtils.getCurrencyName(a1.currency)
        if v1 == "Free" then
            return "Free"
        end
        if v1 ~= "Robux" then
            if type(a1.value) == "number" then
                return (Comma(a1.value))
            end
            return ""
        end
        local v2 = if not ShopCostUtils.getRobuxProductId(a1) then if type(a1.value) ~= "number" then "" else Comma(a1.value) else if not u98 then "..." else if not u98.PriceInRobux then "..." else Comma(u98.PriceInRobux)
        return (("%* %*"):format(u134, v2))
    end

    v19 = {}
    if not v8 and not v9 then
        local Coins, v24
        v20 = #u426
        for m = 2, v20 do
            v22 = u426[m]
            v24 = m * 3
            v4 = ShopCostUtils.getCurrencyName(v22.currency)
            Coins = if v4 ~= "Robux" then Icons[v4] or Icons.Coins else nil
            v4 = ("Separator_%*"):format(m)
            v19[v4] = (createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "+",
                TextScaled = true,
                AutomaticSize = Enum.AutomaticSize.X,
                FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                LayoutOrder = v24 - 2,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0, 0.55),
            }, {
                UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 0.6}),
                UIStroke = createElement("UIStroke", {Thickness = 1.5, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
            }))
            if Coins then
                v4 = ("Icon_%*"):format(m)
                v19[v4] = (createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = if type(Coins) ~= "number" then Coins else ("rbxassetid://%*"):format(Coins),
                    LayoutOrder = v24 - 1,
                    Size = UDim2.fromScale(0.7, 0.7),
                }, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}))
            end
            v4 = ("Value_%*"):format(m)
            v19[v4] = (createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AutomaticSize = Enum.AutomaticSize.X,
                FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                LayoutOrder = v24,
                Size = UDim2.fromScale(0, 0.55),
                Text = getCostText(v22),
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                UIStroke = createElement("UIStroke", {Thickness = 1.5, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
            }))
        end
    end
    v20 = u426[1]
    v21 = if not u433 or not u433.PriceInRobux then ("%* ..."):format(u134) else ("%* %*"):format(u134, (Comma(u433.PriceInRobux)))
    v23 = not useMediaQuery("large")
    v22 = useFontScale({size = 25, scale = 1})
    v4 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    v4.AnchorPoint = Vector2.new(0.5, 1)
    local v25 = v23 and UDim2.fromScale(0.5, 1) or UDim2.fromScale(0.5, 0.975)
    v4.Position = v25
    v4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v25 = v23 and UDim2.fromScale(0.45, 0.45) or UDim2.new(0.3, 100, 0.3, 100)
    v4.Size = v25
    v25 = {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3})}
    v25.UIScale = createElement("UIScale", {Scale = v14.scaleProgress})
    v25.GradientBackground = createElement("Frame", {
        ZIndex = -100,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v14.containerPosition:map(function(a1) -- Line: 644 -- types: a1: number
            return UDim2.fromScale(0.5, a1 / 2)
        end),
        Size = UDim2.fromScale(0.975, 1),
        BackgroundTransparency = v14.transparencyProgressBG:map(function(a1) -- Line: 649 -- types: a1: number
            return a1
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        UIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, 0.2),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.8, 0.2),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        UIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.85, Color = Color3.fromRGB(255, 255, 255)}, {
            UIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    })
    local v26 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.9, 0.975),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v14.containerPosition:map(function(a1) -- Line: 683 -- types: a1: number
            return (UDim2.fromScale(0.5, 0)) + UDim2.fromScale(0, a1 / 2)
        end),
    }
    local v27 = {UIScale = createElement("UIScale", {Scale = v14.scaleProgress})}
    v27.HeaderFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = v14.headerPosition:map(function(a1) -- Line: 694 -- types: a1: number
            return UDim2.fromScale(0.5, a1)
        end),
        Size = UDim2.fromScale(1, 1),
    }, {
        TopBackingFrame = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1.1, 0.325),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v14.transparencyProgressHeader:map(function(a1) -- Line: 706 -- types: a1: number
                return a1
            end),
        }, {
            UIGradient = createElement("UIGradient", {
                Rotation = 0,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.025, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        ItemLabel = createElement(TextLabel, {
            BackgroundTransparency = 1,
            StrokeThickness = 0.075,
            TextScaled = true,
            AnchorPoint = Vector2.new(0, 0),
            Position = v14.headerTextPosition:map(function(a1) -- Line: 725 -- types: a1: number
                return UDim2.fromScale(a1, 0.03)
            end),
            Size = UDim2.fromScale(0.4, 0.125),
            TextXAlignment = Enum.TextXAlignment.Left,
            Text = u709,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v14.transparencyProgressText:map(function(a1) -- Line: 734 -- types: a1: number
                return a1
            end),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            StrokeTransparency = v14.transparencyProgressText:map(function(a1) -- Line: 744 -- types: a1: number
                return a1
            end),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        TabCollection = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.9, 0.1),
            Position = v14.tabsPosition:map(function(a1) -- Line: 755 -- types: a1: number
                return UDim2.fromScale(a1, 0.18)
            end),
            AnchorPoint = Vector2.new(0, 0),
        }, v17),
    })
    local v28 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = v14.buttonsPosition:map(function(a1) -- Line: 765 -- types: a1: number
            return UDim2.fromScale(0.5, a1)
        end),
        Size = UDim2.fromScale(1, if not v12 then 0.25 else 0.15),
    }
    local v29 = {}
    local v30 = createElement
    local v31 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Padding = UDim.new(0.025, 0),
    }
    v29.UIListLayout = v30("UIListLayout", v31)
    if not v20 then
        v30 = nil
    else
        local Locked
        v31 = {
            dontScale = true,
            layoutOrder = 1,
            textSize = 20,
            automaticSize = Enum.AutomaticSize.X,
        }
        v31.color = if v8 then Color3.fromRGB(108, 108, 108) else if not v9 then u131 else Color3.fromRGB(108, 108, 108)
        v31.disabled = v8 or v9
        if v8 then
            Locked = nil
        elseif not v9 then
            local v32 = ShopCostUtils.getCurrencyName(v20.currency)
            Locked = if v32 ~= "Robux" then Icons[v32] or Icons.Coins else nil
        else
            Locked = Icons.Locked
        end
        v31.icon = Locked
        v31.onClick = v15
        v31.size = UDim2.fromScale(0, 1)
        v31.text = if not v8 then if not v9 then getCostText(v20) else "LOCKED" else "OWNED"
        v30 = createElement(Button, v31, v19) or nil
    end
    v29.CurrencyButton = v30
    v30 = gamepassId and createElement(Button, {
        dontScale = true,
        layoutOrder = 2,
        textSize = 20,
        automaticSize = Enum.AutomaticSize.X,
        color = if not v8 then u131 else Color3.fromRGB(108, 108, 108),
        disabled = v8,
        onClick = v3,
        size = UDim2.fromScale(0, 1),
        text = if not v8 then v21 else "OWNED",
    }) or nil
    v29.GamepassButton = v30
    v27.PurchaseButtons = createElement("Frame", v28, v29)
    v27.DescriptionLabel = createElement(TextLabel, {
        BackgroundTransparency = 1,
        StrokeThickness = 1.5,
        TextScaled = false,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = v14.descriptionPosition:map(function(a1) -- Line: 815 -- types: a1: number
            return UDim2.fromScale(0.5, a1)
        end),
        Size = UDim2.fromScale(0.9, 0.75),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        Text = v1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        TextTransparency = v14.tabsTransparencyProgress:map(function(a1) -- Line: 826 -- types: a1: number
            return a1
        end),
        StrokeTransparency = v14.tabsTransparencyProgress:map(function(a1) -- Line: 831 -- types: a1: number
            return a1
        end),
        TextSize = v22,
        Visible = not v10 and v11,
    })
    v27.LevelPreviewer = if not v10 then nil else createElement(LevelPreviewer, {
        config = a1.previewConfig,
        levelName = a1.levelName,
        native = {
            Position = v14.previewPosition:map(function(a1) -- Line: 847 -- types: a1: number
                return UDim2.fromScale(0.5, a1)
            end),
        },
        onNext = a1.onNextLevel,
        onPathSelected = a1.onPathSelected,
        onPrevious = a1.onPreviousLevel,
        pathOptions = a1.pathOptions,
        state = a1.previewState,
    })
    v28 = {
        AspectRatio = 1,
        Transparency = 0,
        ZIndex = 10,
        Position = v14.closePosition:map(function(a1) -- Line: 860 -- types: a1: number
            return UDim2.fromScale(1, a1)
        end),
        Size = UDim2.fromScale(0.2, 0.2),
        AnchorPoint = Vector2.new(1, 0),
        Color = Color3.fromRGB(255, 60, 60),
    }
    local onClose = a1.onClose or function() -- Line: 867
        return
    end
    v28.Clicked = onClose
    v27.CloseButton = createElement(IconButton, v28)
    v25.ContentFrame = createElement("Frame", v26, v27)
    return (createElement("Frame", v4, v25))
end)