-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHotbar
-- Decompile time: 5.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Consumables = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Consumables)
local HotbarButton = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarButton)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Towers = Icons.Towers
local useSpring = ReactFlow.useSpring
local useSpring_2 = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local joinBindings = React.joinBindings
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local Event = React.Event
local u68 = memo(function(a1) -- Line: 47
    -- upvalues: useRef (val), useSpring (val), useSpring_2 (val), useEffect (val), Enum (val), Consumables (val)
    -- upvalues: Troops (val), Towers (val), createElement (val), joinBindings (val), Event (val), HotbarButton (val)
    local name = a1.name
    local skin = a1.skin
    local clicked = a1.clicked
    local showConsumables = a1.showConsumables
    local towerInventory = a1.towerInventory
    local LayoutOrder = a1.LayoutOrder
    local v1 = nil
    local v2 = nil
    local u13 = name
    if u13 then
        u13 = name ~= ""
    end
    local u17 = useRef(u13)
    local v3, u21, u22 = useSpring({start = 0, target = 0, damper = 0.1, speed = 20})
    local v4, u26 = useSpring({start = 0, target = 0, damper = 0.6, speed = 10})
    local v5, u30 = useSpring({start = 0, target = 0, damper = 0.6, speed = 10})
    local v6, u37 = useSpring_2(0, 1, 40, true)
    local v7, u44 = useSpring_2(0, 1, 40, true)
    local v8 = {u13}
    useEffect(function() -- Line: 82 -- upvalues: u17 (val), u13 (val), u22 (val), u26 (val), u30 (val), u21 (val)
        if u17.current ~= u13 then
            if not u13 then
                u21({force = 200})
            else
                u22()
                u26({force = 3})
                u30({force = 3})
            end
        end
        u17.current = u13
    end, v8)
    local Rarity = a1.Rarity or Enum.SkinRarity.Common
    local DisplayName = name
    if u13 then
        if not showConsumables then
            local v9 = Troops(name)
            local v10 = skin or towerInventory[name] and towerInventory[name].Skin or "Default"
            v1 = Towers[name] and Towers[name][v10]
            v2 = v9 and v9.Stats.Default.Defaults
            v8 = v9 and v9.Properties.SkinData[v10]
            if v8 then
                Rarity = tonumber(v8.Rarity)
                if v8.DisplayName then
                    DisplayName = v8.DisplayName
                end
            end
            if DisplayName == name and v9 and v9.Properties.DisplayName then
                DisplayName = v9.Properties.DisplayName
            end
        else
            v1 = ("rbxassetid://%*"):format((Consumables(name)).Icon)
            v2 = nil
        end
    end
    local v11 = {
        Size = joinBindings({v5, v6, v7}):map(function(a1) -- Line: 135
            local v1 = a1[1]
            local v2 = a1[2]
            local v3 = a1[3]
            local v4 = (1 + v1 + v2 * 0.1) * (1 - v3 * 0.12)
            return UDim2.fromScale(v4, v4)
        end),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundTransparency = 1,
        LayoutOrder = LayoutOrder,
        Active = not a1.dontAnimate,
    }

    v11[Event.MouseEnter] = function() -- Line: 148 -- upvalues: a1 (val), u37 (val)
        if a1.dontAnimate then
            return
        end
        u37(1)
    end

    v11[Event.MouseLeave] = function() -- Line: 155 -- upvalues: a1 (val), u37 (val), u44 (val)
        if a1.dontAnimate then
            return
        end
        u37(0)
        u44(0)
    end

    local v12 = {}
    local v13 = {
        Enabled = true,
        dontAnimate = true,
        Size = UDim2.fromScale(1, 1),
        Position = joinBindings({v3, v4}):map(function(a1) -- Line: 166
            return UDim2.new(0.5, a1[1], 0.5 - a1[2], 0)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Name = DisplayName,
        Icon = v1 or "",
    }
    local Price = false
    if a1.showPrice ~= false then
        Price = v2 and v2.Price
    end
    v13.Price = Price
    v13.IsTower = a1.isTower == true
    v13.Rarity = Rarity
    v13.picked = a1.picked
    v13.LevelLock = a1.levelLock
    v13.Level = a1.level
    v13.dontSpotlight = a1.dontSpotlight

    function v13.OnActivate() -- Line: 184 -- upvalues: name (val), clicked (val)
        if name and name ~= "" and clicked then
            clicked(name)
        end
    end

    function v13.OnPressChanged(a1_2) -- Line: 189 -- upvalues: a1 (val), u13 (val), u44 (val)
        if not a1.dontAnimate and u13 then
            u44(if not a1_2 then 0 else 1)
            return
        end
    end

    v13.isGolden = a1.isGolden
    v12.button = createElement(HotbarButton, v13)
    return createElement("Frame", v11, v12)
end)
return memo(function(a1) -- Line: 202
    -- upvalues: createElement (val), u68 (val), table (val), Enum (val), React (val)
    local items = a1.items or {}
    local showConsumables = a1.showConsumables
    local towerInventory = a1.towerInventory
    if not towerInventory then
        towerInventory = {}
    end
    local clicked = a1.clicked
    if a1.Container == false then
        return createElement(u68, a1)
    end
    local v1 = table.reduce(items, function(a1_2, a2, a3) -- Line: 214
        -- upvalues: createElement (upval), u68 (upval), showConsumables (val), towerInventory (val), clicked (val)
        -- upvalues: a1 (val)
        local v1 = tostring(a3)
        a1_2[v1] = (createElement(u68, {
            name = a2,
            showConsumables = showConsumables,
            towerInventory = towerInventory,
            clicked = clicked,
            LayoutOrder = a3,
            isGolden = a1.isGolden,
            dontAnimate = a1.dontAnimate,
            dontSpotlight = a1.dontSpotlight,
        }))
        return a1_2
    end, {})
    local v2 = createElement
    local v3 = {BackgroundTransparency = 0.6, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.335, 0.844)
    v3.Size = Size
    v3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    return v2("Frame", v3, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.2}),
        uICorner = createElement("UICorner"),
        uIStroke = createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255)}),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Your Loadout",
            TextScaled = true,
            TextWrapped = true,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0, 0.037),
            Size = UDim2.fromScale(1, 0.222),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }),
        frame = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.648),
            Size = UDim2.fromScale(0.95, 0.593),
        }, {
            items = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }, {
                list = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0, 16),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                }),
                items = createElement(React.Fragment, {}, v1),
            }),
        }),
    })
end)