-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.HorizontalUpgrade
-- Decompile time: 33.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Components = script.Parent.Components
local BaseComponents = script.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local table = require(Shared.Modules.Utils.table)
local useReactBindings = require(Hooks.useReactBindings)
local useScale = require(Hooks.useScale)
local useSound = require(Hooks.useSound)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
local InformationButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.InformationButton)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TowerSelectionAmount = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerSelectionAmount)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local TowerActiveStats = require(Components.TowerActiveStats)
local TowerDisplay = require(Components.TowerDisplay)
local TowerSellButton = require(Components.TowerSellButton)
local TowerUpgradeButton = require(Components.TowerUpgradeButton)
local TowerUpgradeStats = require(Components.TowerUpgradeStats)
local ConnectedActionPanel = require(Components.ConnectedActionPanel)
local AmmoPanel = require(Components.AmmoPanel)
local DPSPanel = require(Components.DPSPanel)
local StatsPanel = require(Components.StatsPanel)
local createElement = React.createElement
local useRef = React.useRef
local useEffect = React.useEffect
local useBinding = React.useBinding
local useMemo = React.useMemo
local useSpring = ReactFlow.useSpring
local useGroupAnimation = ReactFlow.useGroupAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useAnimation = ReactFlow.useAnimation
local Spring = ReactFlow.Spring
local u118 = React.memo(function(a1) -- Line: 64
    -- upvalues: useGameRule (val), useSpring (val), useTransparencyModifier (val), useBinding (val), useEffect (val)
    -- upvalues: useMemo (val), createElement (val), Container (val), InformationButton (val), TowerUpgradeButton (val)
    -- upvalues: TowerUpgradeStats (val)
    local UpgradePath = a1.UpgradePath or {}
    local v1 = UpgradePath.Level or 0
    local v2 = UpgradePath.MaxLevel or 1
    local v3 = UpgradePath.Locked or false
    local v4 = UpgradePath.Name or ""
    local v5 = UpgradePath.Icon or 0
    local u15 = UpgradePath.Cost or 0
    local CostModifierText = UpgradePath.CostModifierText
    local InfiniteCash = useGameRule("InfiniteCash")
    local Stats = UpgradePath.Stats or {}
    local v6, u33 = useSpring({speed = 20, damper = 0.7, start = if not a1.Visible then 1 else 0})
    local v7 = useTransparencyModifier(a1.Transparency)(v6)
    local v8, u44 = useBinding(1)
    local v9, u48 = useBinding(false)
    local v10 = useEffect
    local v11 = {a1.Visible}
    v10(function() -- Line: 91 -- upvalues: a1 (val), u33 (val), u44 (val), u48 (val)
        if not a1.Visible then
            u33({start = 1, target = 1})
        else
            u33({target = 0})
        end
        u44(if not a1.Visible then 1 else 2)
        u48(a1.Visible)
    end, v11)
    v10 = useMemo
    v11 = {a1.Cash, u15, InfiniteCash}
    v10 = v10(function() -- Line: 103 -- upvalues: a1 (val), InfiniteCash (val), u15 (val)
        return a1.Cash:map(function(a1) -- Line: 104 -- upvalues: InfiniteCash (upval), u15 (upval) -- types: a1: number
            return InfiniteCash or u15 <= a1
        end)
    end, v11)
    return createElement(Container, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = v8,
        Visible = v7:map(function(a1) -- Line: 115
            return a1 < 0.99
        end),
    }, {
        InformationButton = createElement(InformationButton, {
            Position = UDim2.fromScale(1, 0),
            Transparency = v7,
            OnToggle = function() -- Line: 122 -- upvalues: a1 (val)
                a1.ToggleInformation()
            end,
            Visible = a1.Visible,
        }),
        upgradeButton = createElement(TowerUpgradeButton, {
            IsVertical = false,
            SpotlightRefName = "upgrade",
            Size = UDim2.new(1, 0, 0, 96),
            Position = v6:map(function(a1) -- Line: 130
                return UDim2.new(0.5, 0, 0, 32 + 60 * a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0),
            Transparency = v7,
            CanAfford = v10,
            IsActive = a1.Visible,
            IsLocked = not a1.CanEdit or v3,
            Level = v1,
            MaxLevel = v2,
            Name = v4,
            Icon = v5,
            Cost = u15,
            CostModifierText = CostModifierText,
            OnUpgrade = function(a1_2) -- Line: 152 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1.OnUpgrade then
                    a1.OnUpgrade(a1_2, false)
                end
            end,
        }),
        upgradeStatFrame = createElement(TowerUpgradeStats, {
            CornerRadius = 8,
            IsVertical = false,
            Size = UDim2.new(1, 0, 1, -156),
            Position = UDim2.new(0.5, 0, 1, -12),
            AnchorPoint = Vector2.new(0.5, 1),
            Visible = v9,
            Transparency = v7,
            IsLocked = v3 or v1 == v2,
            UpgradeStats = Stats,
        }),
    })
end, function(a1, a2) -- Line: 174 -- upvalues: table (val)
    local v1 = table.deepCompare(a1.UpgradePath, a2.UpgradePath)
    if v1 then
        v1 = false
        if a1.Visible == a2.Visible then
            v1 = false
            if a1.CanEdit == a2.CanEdit then
                v1 = a1.OnUpgrade == a2.OnUpgrade
            end
        end
    end
    return v1
end)
local u122 = React.memo(function(a1) -- Line: 181
    -- upvalues: useBinding (val), useSpring (val), useTransparencyModifier (val), useEffect (val), useRef (val)
    -- upvalues: useReactBindings (val), useGameRule (val), useMemo (val), createElement (val), Container (val)
    -- upvalues: InformationButton (val), TextLabel (val), TowerUpgradeButton (val), TowerUpgradeStats (val)
    local TopUpgradePath = a1.TopUpgradePath or {}
    local BottomUpgradePath = a1.BottomUpgradePath or {}
    local v1 = TopUpgradePath.Level or 0
    local v2 = TopUpgradePath.MaxLevel or 1
    local v3 = TopUpgradePath.Locked or false
    local v4 = BottomUpgradePath.Level or 1
    local v5 = BottomUpgradePath.MaxLevel or 1
    local v6 = BottomUpgradePath.Locked or false
    local v7 = TopUpgradePath.Name or ""
    local v8 = TopUpgradePath.Icon or 0
    local u26 = TopUpgradePath.Cost or 0
    local CostModifierText = TopUpgradePath.CostModifierText
    local v9 = BottomUpgradePath.Name or ""
    local v10 = BottomUpgradePath.Icon or 0
    local u33 = BottomUpgradePath.Cost or 0
    local CostModifierText_2 = BottomUpgradePath.CostModifierText
    local Stats = TopUpgradePath.Stats
    if not Stats then
        Stats = {}
    end
    local Stats_2 = BottomUpgradePath.Stats
    if not Stats_2 then
        Stats_2 = {}
    end
    local v11, u43 = useBinding(1)
    local v12, u56 = useSpring({speed = 20, damper = 0.7, start = if not a1.Visible then 1 else 0})
    local v13 = useTransparencyModifier(a1.Transparency)(v12)
    local v14, u67 = useBinding(false)
    local v15, u71 = useBinding(false)
    if v14:getValue() and #Stats == 0 then
        u67(false)
    end
    if v15:getValue() and #Stats_2 == 0 then
        u71(false)
    end
    local v16 = useEffect
    local v17 = {a1.Visible}
    v16(function() -- Line: 226 -- upvalues: a1 (val), u56 (val), u43 (val), u67 (val), u71 (val)
        if not a1.Visible then
            u56({start = 1, target = 1})
        else
            u56({target = 0})
        end
        u43(if not a1.Visible then 1 else 2)
        u67(false)
        u71(false)
    end, v17)
    local u111 = useRef(false)
    local v18 = {v13, v14, v15}
    useReactBindings(function(a1_2, a2, a3) -- Line: 242 -- upvalues: a1 (val), u111 (val)
        if a1.OnStatsHover then
            local v1 = if a2 then a1_2 < 0.99 else a3 and a1_2 < 0.99
            if v1 == u111.current then
                return
            end
            u111.current = v1
            a1.OnStatsHover(v1)
        end
    end, v18)
    local InfiniteCash = useGameRule("InfiniteCash")
    v17 = useMemo
    local v19 = {a1.Cash, u26, InfiniteCash}
    v17 = v17(function() -- Line: 257 -- upvalues: a1 (val), InfiniteCash (val), u26 (val)
        return a1.Cash:map(function(a1) -- Line: 258 -- upvalues: InfiniteCash (upval), u26 (upval) -- types: a1: number
            return InfiniteCash or u26 <= a1
        end)
    end, v19)
    v18 = useMemo
    local v20 = {a1.Cash, u33, InfiniteCash}
    v18 = v18(function() -- Line: 262 -- upvalues: a1 (val), InfiniteCash (val), u33 (val)
        return a1.Cash:map(function(a1) -- Line: 263 -- upvalues: InfiniteCash (upval), u33 (upval) -- types: a1: number
            return InfiniteCash or u33 <= a1
        end)
    end, v20)
    return createElement(Container, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = v11,
        Visible = v13:map(function(a1) -- Line: 274
            return a1 < 0.99
        end),
    }, {
        InformationButton = createElement(InformationButton, {
            Position = UDim2.fromScale(1, 0),
            Transparency = v13,
            OnToggle = function() -- Line: 281 -- upvalues: a1 (val)
                a1.ToggleInformation()
            end,
            Visible = a1.Visible,
        }),
        titleText = createElement(TextLabel, {
            Text = "UPGRADES",
            FontWeight = "ExtraBold",
            StrokeThickness = 4,
            Size = UDim2.new(0.7, 0, 0, 28),
            Position = UDim2.new(0.5, 0, 0, 10),
            AnchorPoint = Vector2.new(0.5, 0),
            StrokeColor = Color3.fromRGB(0, 0, 0),
            Transparency = v13,
        }, {
            underscoreFrame = createElement(Container, {
                BackgroundTransparency = 0,
                Size = v13:map(function(a1) -- Line: 301
                    return UDim2.new(1.2 * (1 - a1), 0, 0, 2)
                end),
                Position = UDim2.new(0.5, 0, 1, 2),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(227, 227, 227),
                Transparency = v13,
            }),
        }),
        titleDescription = createElement(TextLabel, {
            Text = "Hover over upgrades to view stats",
            FontWeight = "SemiBold",
            StrokeThickness = 2,
            Size = UDim2.new(0.9, 0, 0, 18),
            Position = v12:map(function(a1) -- Line: 316
                return UDim2.new(0.5, 0, 0, 44 - 50 * a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            StrokeColor = Color3.fromRGB(0, 0, 0),
            Transparency = v13,
        }),
        topUpgradeButton = createElement(TowerUpgradeButton, {
            IsVertical = false,
            IsBottomPath = false,
            ZIndex = 1,
            Size = UDim2.new(1, 0, 0, 96),
            Position = v12:map(function(a1) -- Line: 333
                return UDim2.new(0.5, 0, 0, 91 + 60 * a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0),
            Transparency = v13,
            CanAfford = v17,
            IsActive = a1.Visible,
            IsLocked = not a1.CanEdit or v3,
            Level = v1,
            MaxLevel = v2,
            Name = v7,
            Icon = v8,
            Cost = u26,
            CostModifierText = CostModifierText,
            OnUpgrade = function(a1_2) -- Line: 356 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1.OnUpgrade then
                    a1.OnUpgrade(a1_2, false)
                end
            end,
            OnHover = function(a1) -- Line: 362 -- upvalues: Stats (val), u67 (val) -- types: a1: boolean
                if a1 and #Stats > 0 then
                    u67(true)
                    return
                end
                u67(false)
            end,
        }),
        bottomUpgradeButton = createElement(TowerUpgradeButton, {
            IsVertical = false,
            IsBottomPath = true,
            ZIndex = 2,
            Size = UDim2.new(1, 0, 0, 96),
            Position = v12:map(function(a1) -- Line: 373
                return UDim2.new(0.5, 0, 0, 216 - 60 * a1)
            end),
            AnchorPoint = Vector2.new(0.5, 0),
            Transparency = v13,
            CanAfford = v18,
            IsActive = a1.Visible,
            IsLocked = not a1.CanEdit or v6,
            Level = v4,
            MaxLevel = v5,
            Name = v9,
            Icon = v10,
            Cost = u33,
            CostModifierText = CostModifierText_2,
            OnUpgrade = function(a1_2) -- Line: 396 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1.OnUpgrade then
                    a1.OnUpgrade(a1_2, true)
                end
            end,
            OnHover = function(a1) -- Line: 402 -- upvalues: Stats_2 (val), u71 (val) -- types: a1: boolean
                if a1 and #Stats_2 > 0 then
                    u71(true)
                    return
                end
                u71(false)
            end,
        }),
        topUpgradeStatsPanel = createElement(TowerUpgradeStats, {
            ZIndex = 2,
            CornerRadius = 8,
            FloatingPanel = true,
            IsVertical = false,
            Size = UDim2.fromOffset(274, 0),
            Position = UDim2.new(1, 36, 0, 139),
            AnchorPoint = Vector2.new(0, 0.5),
            Visible = v14,
            Transparency = v13,
            IsLocked = v3,
            UpgradeStats = Stats,
        }),
        bottomUpgradeStatsPanel = createElement(TowerUpgradeStats, {
            ZIndex = 2,
            CornerRadius = 8,
            FloatingPanel = true,
            IsVertical = false,
            Size = UDim2.fromOffset(274, 0),
            Position = UDim2.new(1, 36, 0, 264),
            AnchorPoint = Vector2.new(0, 0.5),
            Visible = v15,
            Transparency = v13,
            IsLocked = v6,
            UpgradeStats = Stats_2,
        }),
    })
end, function(a1, a2) -- Line: 447 -- upvalues: table (val)
    local v1 = table.deepCompare(a1.TopUpgradePath, a2.TopUpgradePath)
    if v1 then
        v1 = table.deepCompare(a1.BottomUpgradePath, a2.BottomUpgradePath)
        if v1 then
            v1 = false
            if a1.Visible == a2.Visible then
                v1 = false
                if a1.CanEdit == a2.CanEdit then
                    v1 = a1.OnUpgrade == a2.OnUpgrade
                end
            end
        end
    end
    return v1
end)
return React.memo(function(a1) -- Line: 456
    -- upvalues: useScale (val), useBinding (val), useGroupAnimation (val), useSequenceAnimation (val), Spring (val)
    -- upvalues: useAnimation (val), useEffect (val), useRef (val), useSound (val), React (val), createElement (val)
    -- upvalues: Container (val), ImageLabel (val), TowerSelectionAmount (val), AmmoPanel (val), TowerDisplay (val)
    -- upvalues: TowerActiveStats (val), TowerSellButton (val), u118 (val), u122 (val), StatsPanel (val), DPSPanel (val)
    -- upvalues: ConnectedActionPanel (val)
    local u6 = math.max(0.5, (useScale(1.2)))
    local v1 = a1.BottomUpgradePath ~= nil
    local v2 = false
    if a1.TowerDPSStats ~= nil then
        v2 = #a1.TowerDPSStats > 0
    end
    local v3, u21 = useBinding(false)
    local v4, u94 = useGroupAnimation({
        enabled = useSequenceAnimation({
            {
                timestamp = 0,
                progress = Spring({target = 0, speed = 25, damper = 1}),
                containerSize = Spring({target = 1, speed = 20, damper = 0.65}),
                containerPosition = Spring({target = 0, speed = 25, damper = 0.7}),
            },
            {
                timestamp = 0.1,
                secondProgress = Spring({target = 0, speed = 25, damper = 1}),
                thirdProgress = Spring({target = 0, speed = 20, damper = 1}),
                displayProgress = Spring({start = 1, target = 0, speed = 20, damper = 0.7}),
                upgradesProgress = Spring({start = 1, target = 0, speed = 18, damper = 0.7}),
                activeStatsProgress = Spring({target = 0, speed = 13, damper = 0.6}),
                sellButtonProgress = Spring({target = 0, speed = 15, damper = 0.6}),
                statsPanelProgress = Spring({start = 1, target = 0, speed = 15, damper = 0.6}),
                actionPanelProgress = Spring({start = 1, target = 0, speed = 15, damper = 0.5}),
                ammoPanelProgress = Spring({start = 1, target = 0, speed = 20, damper = 0.6}),
            },
        }),
        disabled = useAnimation({
            progress = Spring({target = 1, speed = 20, damper = 1}),
            secondProgress = Spring({target = 1, speed = 35, damper = 1}),
            thirdProgress = Spring({target = 1, speed = 50, damper = 1}),
            containerSize = Spring({target = 0, speed = 20, damper = 0.8}),
            containerPosition = Spring({target = 1, speed = 25, damper = 0.8}),
            activeStatsProgress = Spring({target = 1, speed = 30, damper = 1}),
            sellButtonProgress = Spring({target = 1, speed = 30, damper = 1}),
            statsPanelProgress = Spring({target = 0.5, speed = 17, damper = 0.6}),
        }),
    }, {
        progress = 1,
        secondProgress = 1,
        thirdProgress = 1,
        containerSize = 0,
        containerPosition = 1,
        displayProgress = 1,
        activeStatsProgress = 1,
        sellButtonProgress = 1,
        upgradesProgress = 1,
        statsPanelProgress = 1,
        actionPanelProgress = 1,
        ammoPanelProgress = 1,
    })
    local v5 = useEffect
    local v6 = {a1.Visible}
    v5(function() -- Line: 526 -- upvalues: u94 (val), a1 (val)
        u94(if not a1.Visible then "disabled" else "enabled")
    end, v6)
    local u103 = useRef(false)
    local u106 = useRef(a1.TowerModel)
    local u110 = useSound("New Upgrade Open", true)
    local u114 = useSound("New Upgrade Close", true)
    local v7 = useEffect
    local v8 = {a1.Visible, a1.TowerModel}
    v7(function() -- Line: 537 -- upvalues: a1 (val), u103 (val), u106 (val), u110 (val), u114 (val)
        if not a1.Visible then
            if not a1.Visible and u103.current then
                u114()
            end
        elseif not u103.current then
            u110()
        elseif not a1.TowerModel then
            if not a1.Visible and u103.current then
                u114()
            end
        elseif u106.current ~= a1.TowerModel then
            u110()
        elseif not a1.Visible and u103.current then
            u114()
        end
        u103.current = a1.Visible
        u106.current = a1.TowerModel
    end, v8)
    v7 = v4.progress:map(function(a1) -- Line: 554
        return a1 < 0.99
    end)
    if a1.TowerInformationEnabled then
        v7 = React.joinBindings({v4.progress, a1.TowerInformationEnabled}):map(function(a1) -- Line: 562
            local v1 = false
            if a1[1] < 0.99 then
                v1 = not a1[2]
            end
            return v1
        end)
    end
    local v9 = {
        Size = UDim2.fromOffset(636, 328),
        Position = v4.containerPosition:map(function(a1) -- Line: 569 -- upvalues: u6 (val)
            return (UDim2.new(0.5, 0, 1, u6 * -120)) + UDim2.fromScale(0, a1 / 5)
        end),
        AnchorPoint = Vector2.new(0.5, 1),
        LayoutOrder = a1.LayoutOrder,
        Visible = v7,
        Scale = u6,
    }
    local v10 = {
        backgroundFrame = createElement(Container, {
            BackgroundTransparency = 0.25,
            CornerRadius = 8,
            StrokeThickness = 2,
            Size = v4.containerSize:map(function(a1) -- Line: 580
                return UDim2.fromScale(1, a1)
            end),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            StrokeColor = Color3.fromRGB(90, 90, 90),
            Transparency = v4.progress,
        }, {
            dropShadow = createElement(ImageLabel, {
                ZIndex = -1,
                Image = "rbxassetid://9239716855",
                ImageTransparency = 0.2,
                Size = UDim2.new(1, 14, 1, 14),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(14, 14, 64, 24),
                Transparency = v4.progress,
            }),
        }),
    }
    local v11 = {
        Size = UDim2.new(0, 290, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        AnchorPoint = Vector2.new(0, 0),
    }
    local v12 = {}
    local TowersSelection = a1.TowersSelection and createElement(TowerSelectionAmount, {
        amount = a1.TowersSelectionAmount or 0,
        selected = a1.TowersSelected or 0,
        Position = UDim2.new(0.5, 0, 0, -10),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.new(1, -32, 0, 16),
        Transparency = v4.secondProgress,
    })
    v12.selectionAmount = TowersSelection
    local v13 = {
        Size = v4.ammoPanelProgress:map(function(a1) -- Line: 623
            return (UDim2.new(1, -32, 0, 16)) - UDim2.fromScale(a1 / 2, 0)
        end),
        Position = UDim2.new(0.5, 0, 0, -10),
        AnchorPoint = Vector2.new(0.5, 1),
    }
    local Visible = a1.Visible and a1.ShowTowerAmmo
    v13.Visible = Visible
    v13.Transparency = v4.thirdProgress
    local TowerAmmo = a1.TowerAmmo or useBinding(0)
    v13.Ammo = TowerAmmo
    local TowerMaxAmmo = a1.TowerMaxAmmo or useBinding(0)
    v13.MaxAmmo = TowerMaxAmmo
    v12.ammoFrame = createElement(AmmoPanel, v13)
    v12.displayFrame = createElement(TowerDisplay, {
        CornerRadius = 8,
        Size = UDim2.new(1, -32, 0, 188),
        Position = v4.displayProgress:map(function(a1) -- Line: 638
            return (UDim2.new(0.5, 0, 0, 16)) + UDim2.fromScale(-a1 / 5, 0)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Transparency = v4.secondProgress,
        TowerName = a1.TowerName,
        TowerDisplayName = a1.TowerDisplayName,
        TowerModel = a1.TowerModel,
        TowerLevel = a1.TowerLevel,
        TowerPath = a1.TowerPath,
        TowerDetections = a1.TowerDetections,
        TowerTarget = a1.TowerTarget,
        hideTargetingMode = a1.hideTargetingMode,
        CanEditTower = a1.CanEditTower,
        OnTarget = a1.OnTarget,
    })
    v12.statsFrame = createElement(TowerActiveStats, {
        CornerRadius = 8,
        Size = UDim2.fromOffset(258, 52),
        Position = v4.activeStatsProgress:map(function(a1) -- Line: 664
            return (UDim2.new(0.5, 0, 0, 214)) + UDim2.fromScale(0, -a1 / 5)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Transparency = v4.activeStatsProgress,
        Stats = a1.TowerActiveStats,
    })
    v13 = {
        Size = UDim2.fromOffset(258, 32),
        Position = v4.sellButtonProgress:map(function(a1) -- Line: 677
            return (UDim2.new(0.5, 0, 1, -32)) - UDim2.fromScale(0, a1 / 5)
        end),
        Transparency = v4.sellButtonProgress,
        SellValue = a1.TowerSellValue,
    }
    local Hologram = a1.Hologram or not a1.CanEditTower or not a1.CanSellTower
    v13.IsLocked = Hologram
    v13.OnSell = a1.OnSell
    local Visible_2 = a1.Visible and a1.CanEditTower and a1.CanSellTower
    v13.CanSell = Visible_2
    v12.sellPanel = createElement(TowerSellButton, v13)
    v10.controlPanel = createElement(Container, v11, v12)
    v11 = {
        ToggleInformation = a1.ToggleInformation,
        Size = UDim2.new(0, 320, 1, 0),
        Position = v4.upgradesProgress:map(function(a1) -- Line: 695
            return (UDim2.fromOffset(298, 0)) + UDim2.fromScale(a1 / 5, 0)
        end),
        AnchorPoint = Vector2.new(0, 0),
    }
    local Visible_3 = a1.Visible and not v1
    v11.Visible = Visible_3
    v11.Transparency = v4.secondProgress
    v11.CanEdit = if a1.Hologram ~= true then a1.CanEditTower else false
    v11.Cash = a1.PlayerCash
    v11.UpgradePath = a1.TopUpgradePath
    v11.OnUpgrade = a1.OnUpgrade
    v10.singleUpgradePanel = createElement(u118, v11)
    v10.multiUpgradePanel = createElement(u122, {
        ToggleInformation = a1.ToggleInformation,
        Size = UDim2.new(0, 320, 1, 0),
        Position = v4.upgradesProgress:map(function(a1) -- Line: 713
            return (UDim2.fromOffset(298, 0)) + UDim2.fromScale(a1 / 5, 0)
        end),
        AnchorPoint = Vector2.new(0, 0),
        Visible = a1.Visible and v1,
        Transparency = v4.secondProgress,
        CanEdit = if a1.Hologram ~= true then a1.CanEditTower else false,
        Cash = a1.PlayerCash,
        TopUpgradePath = a1.TopUpgradePath,
        BottomUpgradePath = a1.BottomUpgradePath,
        OnUpgrade = a1.OnUpgrade,
        OnStatsHover = function(a1) -- Line: 728 -- upvalues: u21 (val) -- types: a1: boolean
            u21(a1)
        end,
    })
    v11 = {
        Size = UDim2.fromOffset(95, 0),
        Position = v4.statsPanelProgress:map(function(a1) -- Line: 735
            return (UDim2.fromOffset(-18, 16)) + UDim2.fromScale(0, a1 / 2)
        end),
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }
    v12 = {
        uiListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        }),
        statsPanelContainer = createElement(Container, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {
            statsPanel = createElement(StatsPanel, {
                IsVertical = false,
                Size = UDim2.fromScale(1, 0),
                Position = UDim2.new(0, 0, 0, 0),
                AnchorPoint = Vector2.new(0, 0),
                Stats = a1.TowerStats,
                Transparency = v4.thirdProgress,
            }),
        }),
    }
    v13 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = v2,
    }
    local v14 = {}
    local v15 = {
        Size = UDim2.fromScale(1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        AnchorPoint = Vector2.new(0, 0),
    }
    local TowerDPSStats = a1.TowerDPSStats or {}
    v15.Stats = TowerDPSStats
    v15.Visible = v2
    v15.TooltipsEnabled = a1.Visible and v2
    v15.TooltipName = ("UpgradeDPS_%*"):format(a1.TowerName or "Tower")
    v15.Transparency = v4.thirdProgress
    v14.dpsPanel = createElement(DPSPanel, v15)
    v12.dpsPanelContainer = createElement(Container, v13, v14)
    v10.leftPanel = createElement(Container, v11, v12)
    v10.actionPanel = createElement(ConnectedActionPanel, {
        Size = UDim2.new(0, 64, 1, -32),
        Position = v4.actionPanelProgress:map(function(a1) -- Line: 789
            return (UDim2.new(1, 16, 0.5, 0)) + UDim2.fromScale(0, a1 / 5)
        end),
        AnchorPoint = Vector2.new(0, 0.5),
        Faded = v3,
        Transparency = v4.thirdProgress,
        TowerName = a1.TowerName,
        TowerDisplayName = a1.TowerDisplayName,
        TowerActions = a1.TowerActions,
        BuildTowerActions = a1.BuildTowerActions,
        UID = a1.UID,
    })
    v10.children = createElement(React.Fragment, {}, a1.children)
    return createElement(Container, v9, v10)
end, function(a1, a2) -- Line: 806 -- upvalues: table (val)
    if a2.Valid == false then
        if a1.Visible == a2.Visible then
            return true
        end
        for k, v in pairs(a2) do
            if k ~= "Visible" then
                a2[k] = a1[k]
            end
        end
        return false
    end
    local v1 = false
    if a1.Visible == a2.Visible then
        v1 = false
        if a1.TowerName == a2.TowerName then
            v1 = false
            if a1.TowerDisplayName == a2.TowerDisplayName then
                v1 = false
                if a1.TowerModel == a2.TowerModel then
                    v1 = false
                    if a1.TowerLevel == a2.TowerLevel then
                        v1 = false
                        if a1.TowerPath == a2.TowerPath then
                            v1 = false
                            if a1.CanEditTower == a2.CanEditTower then
                                v1 = false
                                if a1.CanSellTower == a2.CanSellTower then
                                    v1 = false
                                    if a1.TowerShowAmmo == a2.TowerShowAmmo then
                                        v1 = false
                                        if a1.TowerTarget == a2.TowerTarget then
                                            v1 = false
                                            if a1.hideTargetingMode == a2.hideTargetingMode then
                                                v1 = false
                                                if a1.TowerActions == a2.TowerActions then
                                                    v1 = false
                                                    if a1.BuildTowerActions == a2.BuildTowerActions then
                                                        v1 = false
                                                        if a1.UID == a2.UID then
                                                            if a1.TowerStats ~= a2.TowerStats then
                                                                v1 = table.deepCompare(a1.TowerStats, a2.TowerStats)
                                                                if v1 then
                                                                    if a1.TowerDPSStats == a2.TowerDPSStats then
                                                                        v1 = table.shallowCompare(a1.TowerDetections, a2.TowerDetections)
                                                                        if v1 then
                                                                            v1 = false
                                                                            if (type(a1.TopUpgradePath)) == type(a2.TopUpgradePath) then
                                                                                v1 = false
                                                                                if (type(a1.BottomUpgradePath)) == type(a2.BottomUpgradePath) then
                                                                                    if a1.TopUpgradePath then
                                                                                        v1 = false
                                                                                        if a1.TopUpgradePath.Level == a2.TopUpgradePath.Level then
                                                                                            if not a1.BottomUpgradePath then
                                                                                                v1 = false
                                                                                                if a1.Hologram == a2.Hologram then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelection == a2.TowersSelection then
                                                                                                        v1 = false
                                                                                                        if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                            v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            else
                                                                                                v1 = false
                                                                                                if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                                    v1 = false
                                                                                                    if a1.Hologram == a2.Hologram then
                                                                                                        v1 = false
                                                                                                        if a1.TowersSelection == a2.TowersSelection then
                                                                                                            v1 = false
                                                                                                            if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                                v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    elseif not a1.BottomUpgradePath then
                                                                                        v1 = false
                                                                                        if a1.Hologram == a2.Hologram then
                                                                                            v1 = false
                                                                                            if a1.TowersSelection == a2.TowersSelection then
                                                                                                v1 = false
                                                                                                if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                    v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    else
                                                                                        v1 = false
                                                                                        if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                            v1 = false
                                                                                            if a1.Hologram == a2.Hologram then
                                                                                                v1 = false
                                                                                                if a1.TowersSelection == a2.TowersSelection then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                        v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        v1 = table.deepCompare(a1.TowerDPSStats, a2.TowerDPSStats)
                                                                        if v1 then
                                                                            v1 = table.shallowCompare(a1.TowerDetections, a2.TowerDetections)
                                                                            if v1 then
                                                                                v1 = false
                                                                                if (type(a1.TopUpgradePath)) == type(a2.TopUpgradePath) then
                                                                                    v1 = false
                                                                                    if (type(a1.BottomUpgradePath)) == type(a2.BottomUpgradePath) then
                                                                                        if a1.TopUpgradePath then
                                                                                            v1 = false
                                                                                            if a1.TopUpgradePath.Level == a2.TopUpgradePath.Level then
                                                                                                if not a1.BottomUpgradePath then
                                                                                                    v1 = false
                                                                                                    if a1.Hologram == a2.Hologram then
                                                                                                        v1 = false
                                                                                                        if a1.TowersSelection == a2.TowersSelection then
                                                                                                            v1 = false
                                                                                                            if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                                v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                else
                                                                                                    v1 = false
                                                                                                    if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                                        v1 = false
                                                                                                        if a1.Hologram == a2.Hologram then
                                                                                                            v1 = false
                                                                                                            if a1.TowersSelection == a2.TowersSelection then
                                                                                                                v1 = false
                                                                                                                if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                                    v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        elseif not a1.BottomUpgradePath then
                                                                                            v1 = false
                                                                                            if a1.Hologram == a2.Hologram then
                                                                                                v1 = false
                                                                                                if a1.TowersSelection == a2.TowersSelection then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                        v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        else
                                                                                            v1 = false
                                                                                            if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                                v1 = false
                                                                                                if a1.Hologram == a2.Hologram then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelection == a2.TowersSelection then
                                                                                                        v1 = false
                                                                                                        if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                            v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            elseif a1.TowerDPSStats == a2.TowerDPSStats then
                                                                v1 = table.shallowCompare(a1.TowerDetections, a2.TowerDetections)
                                                                if v1 then
                                                                    v1 = false
                                                                    if (type(a1.TopUpgradePath)) == type(a2.TopUpgradePath) then
                                                                        v1 = false
                                                                        if (type(a1.BottomUpgradePath)) == type(a2.BottomUpgradePath) then
                                                                            if a1.TopUpgradePath then
                                                                                v1 = false
                                                                                if a1.TopUpgradePath.Level == a2.TopUpgradePath.Level then
                                                                                    if not a1.BottomUpgradePath then
                                                                                        v1 = false
                                                                                        if a1.Hologram == a2.Hologram then
                                                                                            v1 = false
                                                                                            if a1.TowersSelection == a2.TowersSelection then
                                                                                                v1 = false
                                                                                                if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                    v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    else
                                                                                        v1 = false
                                                                                        if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                            v1 = false
                                                                                            if a1.Hologram == a2.Hologram then
                                                                                                v1 = false
                                                                                                if a1.TowersSelection == a2.TowersSelection then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                        v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            elseif not a1.BottomUpgradePath then
                                                                                v1 = false
                                                                                if a1.Hologram == a2.Hologram then
                                                                                    v1 = false
                                                                                    if a1.TowersSelection == a2.TowersSelection then
                                                                                        v1 = false
                                                                                        if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                            v1 = a1.TowersSelected == a2.TowersSelected
                                                                                        end
                                                                                    end
                                                                                end
                                                                            else
                                                                                v1 = false
                                                                                if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                    v1 = false
                                                                                    if a1.Hologram == a2.Hologram then
                                                                                        v1 = false
                                                                                        if a1.TowersSelection == a2.TowersSelection then
                                                                                            v1 = false
                                                                                            if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                v1 = a1.TowersSelected == a2.TowersSelected
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                v1 = table.deepCompare(a1.TowerDPSStats, a2.TowerDPSStats)
                                                                if v1 then
                                                                    v1 = table.shallowCompare(a1.TowerDetections, a2.TowerDetections)
                                                                    if v1 then
                                                                        v1 = false
                                                                        if (type(a1.TopUpgradePath)) == type(a2.TopUpgradePath) then
                                                                            v1 = false
                                                                            if (type(a1.BottomUpgradePath)) == type(a2.BottomUpgradePath) then
                                                                                if a1.TopUpgradePath then
                                                                                    v1 = false
                                                                                    if a1.TopUpgradePath.Level == a2.TopUpgradePath.Level then
                                                                                        if not a1.BottomUpgradePath then
                                                                                            v1 = false
                                                                                            if a1.Hologram == a2.Hologram then
                                                                                                v1 = false
                                                                                                if a1.TowersSelection == a2.TowersSelection then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                        v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        else
                                                                                            v1 = false
                                                                                            if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                                v1 = false
                                                                                                if a1.Hologram == a2.Hologram then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelection == a2.TowersSelection then
                                                                                                        v1 = false
                                                                                                        if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                            v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                elseif not a1.BottomUpgradePath then
                                                                                    v1 = false
                                                                                    if a1.Hologram == a2.Hologram then
                                                                                        v1 = false
                                                                                        if a1.TowersSelection == a2.TowersSelection then
                                                                                            v1 = false
                                                                                            if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                v1 = a1.TowersSelected == a2.TowersSelected
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                else
                                                                                    v1 = false
                                                                                    if a1.BottomUpgradePath.Level == a2.BottomUpgradePath.Level then
                                                                                        v1 = false
                                                                                        if a1.Hologram == a2.Hologram then
                                                                                            v1 = false
                                                                                            if a1.TowersSelection == a2.TowersSelection then
                                                                                                v1 = false
                                                                                                if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                    v1 = a1.TowersSelected == a2.TowersSelected
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)