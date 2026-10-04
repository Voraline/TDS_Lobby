-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud
-- Decompile time: 15.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Views = ReplicatedStorage.Client.Interfaces.Universal.Views
local Components = ReplicatedStorage.Client.Interfaces.Lobby.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local usePropertyValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePropertyValue)
local useMediaQuery = require(Hooks.useMediaQuery)
local HudButton = require(script.HudButton)
local HudCurrency = require(script.HudCurrency)
local Hotbar = require(Views.Hotbar)
local Level = require(Components.Level)
local PartyBar = require(script.PartyBar)
local HudPlayButton = require(script.HudPlayButton)
local Fragment = React.Fragment
local createElement = React.createElement
local useMemo = React.useMemo
local memo = React.memo
local u78 = {}
u78.store = {
    name = "Store",
    view = "Shop",
    layoutOrder = -3,
    large = true,
    icon = Icons.Shop,
    iconPosition = UDim2.fromScale(0.36, 0.7),
    iconSize = UDim2.fromScale(0.5, 0.5),
    phoneIconPosition = UDim2.fromScale(0.5, 0.5),
    phoneIconSize = UDim2.fromScale(0.9, 0.9),
    color = Color3.fromRGB(255, 0, 0),
    strokeColor = Color3.fromRGB(255, 135, 135),
}
u78.party = {
    name = "Party",
    layoutOrder = 2,
    icon = Icons.Party,
    iconPosition = UDim2.fromScale(0.5, 0.45),
    iconSize = UDim2.fromScale(1, 1),
    color = Color3.fromRGB(0, 255, 0),
    strokeColor = Color3.fromRGB(85, 255, 127),
}
u78.items = {
    name = "Items",
    view = "Inventory",
    spotLight = "Inventory",
    icon = 89647050840867,
    layoutOrder = -2,
    large = true,
    iconPosition = UDim2.fromScale(0.35, 0.8),
    iconSize = UDim2.fromScale(0.7, 0.7),
    phoneIconPosition = UDim2.fromScale(0.5, 0.5),
    phoneIconSize = UDim2.fromScale(0.9, 0.9),
    color = Color3.fromRGB(0, 170, 255),
    strokeColor = Color3.fromRGB(146, 230, 255),
}
u78.quests = {
    name = "Quests",
    layoutOrder = 5,
    icon = Icons.Quests,
    iconPosition = UDim2.fromScale(0.5, 0.35),
    iconSize = UDim2.fromScale(0.85, 0.85),
    color = Color3.fromRGB(255, 170, 0),
    strokeColor = Color3.fromRGB(255, 191, 102),
}
u78.book = {
    name = "Index",
    view = "LogBook",
    layoutOrder = 6,
    icon = Icons.LogBook,
    iconPosition = UDim2.fromScale(0.5, 0.35),
    color = Color3.fromRGB(160, 71, 43),
    strokeColor = Color3.fromRGB(158, 104, 88),
}
u78.ranked = {
    name = "Ranked",
    view = "PVPRanked",
    gradientRotation = -40,
    layoutOrder = 7,
    icon = Icons.Ranked,
    iconPosition = UDim2.fromScale(0.5, 0.35),
    gradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(236, 36, 83)),
        ColorSequenceKeypoint.new(0.499, Color3.fromRGB(230, 39, 87)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(3, 148, 246)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 149, 248))),
    }),
}
u78.skills = {
    name = "Skills",
    view = "Skills",
    showIfAvailable = true,
    large = true,
    layoutOrder = -1,
    icon = Icons.Skills,
    iconSize = UDim2.fromScale(0.8, 0.8),
    iconPosition = UDim2.fromScale(0.35, 0.75),
    phoneIconPosition = UDim2.fromScale(0.5, 0.45),
    phoneIconSize = UDim2.fromScale(1.1, 1.1),
    color = Color3.fromRGB(131, 43, 160),
    strokeColor = Color3.fromRGB(158, 88, 158),
    levelLock = Skills.level,
}
local u260 = {}
u260.coins = {
    name = "Coins",
    icon = Icons.Coins,
    textColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(254, 243, 23)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(216, 101, 0))),
    }),
    textStrokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 21, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 69, 18))),
    }),
}
u260.gems = {
    name = "Gems",
    icon = Icons.Gems,
    textColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 201, 246)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 100, 234))),
    }),
    textStrokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 36, 94)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 38, 99))),
    }),
}
u260.skillCredits = {
    name = "Skill Credits",
    view = "Skills",
    showIfAvailable = true,
    icon = Icons.SkillPoints,
    textColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(201, 246, 209)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 235, 107))),
    }),
    textStrokeColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(36, 107, 68)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 102, 70))),
    }),
}
local u383 = memo(function(a1) -- Line: 189
    -- upvalues: useMemo (val), table (val), u78 (val), createElement (val), HudButton (val), Fragment (val)
    local achievements = a1.achievements
    if not achievements then
        achievements = {}
    end
    local clicked = a1.clicked
    local Visible = a1.Visible
    local level = a1.level
    local phone = a1.phone
    local v1 = {achievements}
    local u13 = useMemo(function() -- Line: 196 -- upvalues: achievements (val)
        local v1 = 0
        for i, j in achievements do
            if j ~= true and j.completed then
                v1 = v1 + 1
            end
        end
        return v1
    end, v1)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.fromScale(if not phone then 0.12 else 0.09, 0),
    }, {
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, if not phone then 16 else 9)}),
        minSize = createElement("UISizeConstraint", {
            MinSize = Vector2.new(if not phone then 150 else 80, 0),
            MaxSize = Vector2.new(200, (1 / 0)),
        }),
        listLayout = createElement("UIListLayout", {
            Wraps = true,
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, if not phone then 8 else 4),
        }),
        components = createElement(Fragment, {}, (table.reduce(u78, function(a1_2, a2, a3) -- Line: 210
            -- upvalues: a1 (val), createElement (upval), HudButton (upval), Visible (val), level (val), u13 (val)
            -- upvalues: clicked (val)
            if a3 == "ranked" and not a1.pvpEnabled then
                return a1_2
            end
            local v1 = createElement
            local v2 = {
                Visible = Visible,
                LayoutOrder = a2.layoutOrder,
                large = a2.large,
                name = a2.spotLight,
                icon = a2.icon,
                iconSize = a2.iconSize,
                iconPosition = a2.iconPosition,
                levelLock = a2.levelLock,
                level = level,
                displayName = a2.name,
            }
            local name = a2.name and a2.name:upper()
            v2.text = name
            v2.color = a2.color
            v2.strokeColor = a2.strokeColor
            v2.gradient = a2.gradient
            v2.gradientRotation = a2.gradientRotation
            v2.notifications = if a3 ~= "book" then nil else if not (u13 > 0) then nil else u13

            function v2.clicked() -- Line: 236 -- upvalues: clicked (upval), a2 (val)
                if clicked then
                    clicked(a2.view or a2.name)
                end
            end

            a1_2[a3] = (v1(HudButton, v2))
            return a1_2
        end, {}))),
    })
end)
local u386 = memo(function(a1) -- Line: 278 -- upvalues: table (val), u260 (val), createElement (val), HudCurrency (val), Fragment (val)
    local Visible = a1.Visible
    local u4 = a1.phone == true
    local u7 = 1
    if u4 then
        u7 = 1.2
    end
    return (createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Size = UDim2.fromScale(if not u4 then 0.15066 else 0.1, 0.21222000000000002),
    }, {
        uIListLayout = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        minSize = createElement("UISizeConstraint", {
            MinSize = Vector2.new(if not u4 then 100 else 50, 0),
            MaxSize = Vector2.new(240, (1 / 0)),
        }),
        components = createElement(Fragment, {}, (table.reduce({coins = a1.coins, gems = a1.gems, skillCredits = a1.skillCredits}, function(a1, a2, a3) -- Line: 300
            -- upvalues: u260 (upval), createElement (upval), HudCurrency (upval), u7 (ref), Visible (val), u4 (val)
            local v1 = u260[a3]
            if not v1.showIfAvailable then
                a1[a3] = (createElement(HudCurrency, {
                    Size = UDim2.fromScale(0, u7 * 0.435),
                    Visible = Visible,
                    name = v1.name,
                    icon = v1.icon,
                    view = v1.view,
                    currency = a2,
                    textColor = v1.textColor,
                    textStrokeColor = v1.textStrokeColor,
                    phone = u4,
                }))
                return a1
            end
            if a2 and not (a2 <= 0) then
                a1[a3] = (createElement(HudCurrency, {
                    Size = UDim2.fromScale(0, u7 * 0.435),
                    Visible = Visible,
                    name = v1.name,
                    icon = v1.icon,
                    view = v1.view,
                    currency = a2,
                    textColor = v1.textColor,
                    textStrokeColor = v1.textStrokeColor,
                    phone = u4,
                }))
                return a1
            end
            return a1
        end, {}))),
    }))
end)
return memo(function(a1) -- Line: 349
    -- upvalues: useMediaQuery (val), usePropertyValue (val), TextChatService (val), createElement (val), u383 (val)
    -- upvalues: u386 (val), Level (val), Hotbar (val), HudPlayButton (val), PartyBar (val)
    local v1 = a1.Visible ~= false
    local v2 = not useMediaQuery("large")
    local v3 = a1.onlyShowCurrencies == true
    local v4 = usePropertyValue(TextChatService.ChatWindowConfiguration, "AbsoluteSize")
    local v5 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v6 = {}
    local v7 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    v7.Position = UDim2.fromOffset(0, if v2 then 0 else if v3 then 0 else v4.Y + 96)
    local v8 = {}
    local v9 = {SortOrder = Enum.SortOrder.LayoutOrder}
    v9.VerticalAlignment = if v2 then Enum.VerticalAlignment.Center else if v3 then Enum.VerticalAlignment.Center else if not (0 < v4.Y) then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top
    v9.Padding = UDim.new(0, if not v2 then 15 else 15)
    v8.uIListLayout = createElement("UIListLayout", v9)
    v8.buttons = if v3 then nil else createElement(u383, {
        Visible = v1,
        clicked = a1.buttonClicked,
        achievements = a1.achievements,
        level = a1.level,
        phone = v2,
        pvpEnabled = a1.pvpEnabled,
    })
    v8.currencies = createElement(u386, {
        Visible = v1,
        phone = v2,
        skillCredits = a1.skillCredits,
        coins = a1.coins,
        gems = a1.gems,
    })
    v6.leftElements = createElement("Frame", v7, v8)
    v6.centerElements = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, -8), Visible = not v3}, {
        uIListLayout = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
        }),
        level = createElement(Level, {
            layoutOrder = 3,
            visible = v1,
            exp = a1.exp,
            maxExp = a1.maxExp,
            level = a1.level,
        }),
        hotbar = createElement(Hotbar, {LayoutOrder = 2, Visible = v1}),
    })
    v7 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(200, 10),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -140 * (if v2 then 0.65 else 1)),
    }
    v8 = false
    if a1.showPlayButton ~= false then
        v8 = not v3
    end
    v7.Visible = v8
    v6.matchmaking = createElement("Frame", v7, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 4, AspectType = Enum.AspectType.ScaleWithParentSize}),
        playButton = createElement(HudPlayButton, {
            disableAspectRatio = true,
            LayoutOrder = 1,
            Visible = v1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            phone = v2,
        }),
        partyMembers = createElement(PartyBar, {
            LayoutOrder = 2,
            Visible = v1,
            phone = v2,
            leader = a1.partyLeader,
            members = a1.partyMembers,
            clicked = a1.partyClicked,
        }),
    })
    return createElement("Frame", v5, v6)
end)