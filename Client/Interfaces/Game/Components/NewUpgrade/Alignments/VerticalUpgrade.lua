-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.VerticalUpgrade
-- Decompile time: 32.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Components = script.Parent.Components
local BaseComponents = script.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local InformationButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.InformationButton)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local TowerSelectionAmount = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerSelectionAmount)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local table = require(Shared.Modules.Utils.table)
local useReactBindings = require(Hooks.useReactBindings)
local useScale = require(Hooks.useScale)
local useSound = require(Hooks.useSound)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
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
local u112 = React.memo(function(a1) -- Line: 63
    -- upvalues: useGameRule (val), useSpring (val), useTransparencyModifier (val), useBinding (val), useEffect (val)
    -- upvalues: useMemo (val), createElement (val), Container (val), TowerUpgradeButton (val), TowerUpgradeStats (val)
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
    v10(function() -- Line: 90 -- upvalues: a1 (val), u33 (val), u44 (val), u48 (val)
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
    v10 = v10(function() -- Line: 102 -- upvalues: a1 (val), InfiniteCash (val), u15 (val)
        return a1.Cash:map(function(a1) -- Line: 103 -- upvalues: InfiniteCash (upval), u15 (upval) -- types: a1: number
            return InfiniteCash or u15 <= a1
        end)
    end, v11)
    return createElement(Container, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = v8,
        Visible = v7:map(function(a1) -- Line: 114
            return a1 < 0.99
        end),
    }, {
        upgradeButton = createElement(TowerUpgradeButton, {
            IsVertical = true,
            SpotlightRefName = "upgrade",
            Size = UDim2.new(1, -2, 0, 96),
            Position = v6:map(function(a1) -- Line: 120
                return UDim2.new(0.5, 0, 0.065, 60 * a1)
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
            OnUpgrade = function(a1_2) -- Line: 142 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1.OnUpgrade then
                    a1.OnUpgrade(a1_2, false)
                end
            end,
        }),
        upgradeStatFrame = createElement(TowerUpgradeStats, {
            CornerRadius = 6,
            IsVertical = true,
            Size = UDim2.new(1, 0, 0, 112),
            Position = UDim2.new(0.5, 0, 0, 125),
            AnchorPoint = Vector2.new(0.5, 0),
            Visible = v9,
            Transparency = v7,
            IsLocked = v3 or v1 == v2,
            UpgradeStats = Stats,
        }),
    })
end, function(a1, a2) -- Line: 165 -- upvalues: table (val)
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
local u116 = React.memo(function(a1) -- Line: 172
    -- upvalues: useBinding (val), useSpring (val), useTransparencyModifier (val), useEffect (val), useRef (val)
    -- upvalues: useReactBindings (val), useGameRule (val), useMemo (val), createElement (val), Container (val)
    -- upvalues: TowerUpgradeButton (val), TowerUpgradeStats (val)
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
    v16(function() -- Line: 217 -- upvalues: a1 (val), u56 (val), u43 (val), u67 (val), u71 (val)
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
    useReactBindings(function(a1_2, a2, a3) -- Line: 233 -- upvalues: a1 (val), u111 (val)
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
    v17 = v17(function() -- Line: 248 -- upvalues: a1 (val), InfiniteCash (val), u26 (val)
        return a1.Cash:map(function(a1) -- Line: 249 -- upvalues: InfiniteCash (upval), u26 (upval) -- types: a1: number
            return InfiniteCash or u26 <= a1
        end)
    end, v19)
    v18 = useMemo
    local v20 = {a1.Cash, u33, InfiniteCash}
    v18 = v18(function() -- Line: 253 -- upvalues: a1 (val), InfiniteCash (val), u33 (val)
        return a1.Cash:map(function(a1) -- Line: 254 -- upvalues: InfiniteCash (upval), u33 (upval) -- types: a1: number
            return InfiniteCash or u33 <= a1
        end)
    end, v20)
    return createElement(Container, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ZIndex = v11,
        Visible = v13:map(function(a1) -- Line: 265
            return a1 < 0.99
        end),
    }, {
        topUpgradeButton = createElement(TowerUpgradeButton, {
            IsVertical = true,
            IsBottomPath = false,
            ZIndex = 1,
            Size = UDim2.new(1, 0, 0, 96),
            Position = v12:map(function(a1) -- Line: 272
                return UDim2.new(0.5, 0, 0.065, 60 * a1)
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
            OnUpgrade = function(a1_2) -- Line: 295 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1.OnUpgrade then
                    a1.OnUpgrade(a1_2, false)
                end
            end,
            OnHover = function(a1) -- Line: 301 -- upvalues: Stats (val), u67 (val) -- types: a1: boolean
                if a1 and #Stats > 0 then
                    u67(true)
                    return
                end
                u67(false)
            end,
        }),
        bottomUpgradeButton = createElement(TowerUpgradeButton, {
            IsVertical = true,
            IsBottomPath = true,
            ZIndex = 1,
            Size = UDim2.new(1, 0, 0, 96),
            Position = v12:map(function(a1) -- Line: 312
                return UDim2.new(0.5, 0, 0.6, -60 * a1)
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
            OnUpgrade = function(a1_2) -- Line: 335 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1.OnUpgrade then
                    a1.OnUpgrade(a1_2, true)
                end
            end,
            OnHover = function(a1) -- Line: 341 -- upvalues: Stats_2 (val), u71 (val) -- types: a1: boolean
                if a1 and #Stats_2 > 0 then
                    u71(true)
                    return
                end
                u71(false)
            end,
        }),
        topUpgradeStatsPanel = createElement(TowerUpgradeStats, {
            ZIndex = 2,
            CornerRadius = 6,
            FloatingPanel = true,
            IsVertical = true,
            Size = UDim2.fromOffset(274, 0),
            Position = UDim2.new(1, 36, 0, 63),
            AnchorPoint = Vector2.new(0, 0.5),
            Visible = v14,
            Transparency = v13,
            IsLocked = v3,
            UpgradeStats = Stats,
        }),
        bottomUpgradeStatsPanel = createElement(TowerUpgradeStats, {
            ZIndex = 2,
            CornerRadius = 6,
            FloatingPanel = true,
            IsVertical = true,
            Size = UDim2.fromOffset(274, 0),
            Position = UDim2.new(1, 36, 0, 183),
            AnchorPoint = Vector2.new(0, 0.5),
            Visible = v15,
            Transparency = v13,
            IsLocked = v6,
            UpgradeStats = Stats_2,
        }),
    })
end, function(a1, a2) -- Line: 386 -- upvalues: table (val)
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
return React.memo(function(a1) -- Line: 395
    -- upvalues: useScale (val), useBinding (val), useGroupAnimation (val), useSequenceAnimation (val), Spring (val)
    -- upvalues: useAnimation (val), useEffect (val), useRef (val), useSound (val), React (val), createElement (val)
    -- upvalues: Container (val), InformationButton (val), ImageLabel (val), TowerSelectionAmount (val), AmmoPanel (val)
    -- upvalues: TowerDisplay (val), TowerActiveStats (val), TowerSellButton (val), u112 (val), u116 (val)
    -- upvalues: StatsPanel (val), DPSPanel (val), ConnectedActionPanel (val)
    local v1 = math.max(0.5, (useScale(1.2)))
    local v2 = a1.BottomUpgradePath ~= nil
    local v3 = false
    if a1.TowerDPSStats ~= nil then
        v3 = #a1.TowerDPSStats > 0
    end
    local v4, u21 = useBinding(false)
    local v5, u85 = useGroupAnimation({
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
                activeStatsProgress = Spring({start = 1, target = 0, speed = 13, damper = 0.6}),
                sellButtonProgress = Spring({start = 1, target = 0, speed = 12, damper = 0.6}),
                rightPanelProgress = Spring({start = 1, target = 0, speed = 15, damper = 0.6}),
                ammoPanelProgress = Spring({start = 1, target = 0, speed = 20, damper = 0.6}),
            },
        }),
        disabled = useAnimation({
            progress = Spring({target = 1, speed = 20, damper = 1}),
            secondProgress = Spring({target = 1, speed = 35, damper = 1}),
            thirdProgress = Spring({target = 1, speed = 50, damper = 1}),
            containerSize = Spring({target = 0, speed = 20, damper = 0.8}),
            containerPosition = Spring({target = 1, speed = 25, damper = 0.8}),
            rightPanelProgress = Spring({target = 1, speed = 17, damper = 0.6}),
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
        rightPanelProgress = 1,
        ammoPanelProgress = 1,
    })
    local v6 = useEffect
    local v7 = {a1.Visible}
    v6(function() -- Line: 460 -- upvalues: u85 (val), a1 (val)
        u85(if not a1.Visible then "disabled" else "enabled")
    end, v7)
    local u94 = useRef(false)
    local u97 = useRef(a1.TowerModel)
    local u101 = useSound("New Upgrade Open", true)
    local u105 = useSound("New Upgrade Close", true)
    local v8 = useEffect
    local v9 = {a1.Visible, a1.TowerModel}
    v8(function() -- Line: 471 -- upvalues: a1 (val), u94 (val), u97 (val), u101 (val), u105 (val)
        if not a1.Visible then
            if not a1.Visible and u94.current then
                u105()
            end
        elseif not u94.current then
            u101()
        elseif not a1.TowerModel then
            if not a1.Visible and u94.current then
                u105()
            end
        elseif u97.current ~= a1.TowerModel then
            u101()
        elseif not a1.Visible and u94.current then
            u105()
        end
        u94.current = a1.Visible
        u97.current = a1.TowerModel
    end, v9)
    v8 = v5.progress:map(function(a1) -- Line: 488
        return a1 < 0.99
    end)
    if a1.TowerInformationEnabled then
        v8 = React.joinBindings({v5.progress, a1.TowerInformationEnabled}):map(function(a1) -- Line: 496
            local v1 = false
            if a1[1] < 0.99 then
                v1 = not a1[2]
            end
            return v1
        end)
    end
    local v10 = {
        Size = UDim2.fromOffset(290, 580),
        Position = v5.containerPosition:map(function(a1) -- Line: 503
            return (UDim2.new(0, 16, 0.5, 0)) - UDim2.fromScale(a1 / 5, 0)
        end),
        AnchorPoint = Vector2.new(0, 0.5),
        LayoutOrder = a1.LayoutOrder,
        Visible = v8,
        Scale = v1,
    }
    local v11 = {
        InformationButton = createElement(InformationButton, {
            Position = UDim2.fromScale(1, 0),
            Transparency = v5.thirdProgress,
            OnToggle = function() -- Line: 516 -- upvalues: a1 (val)
                a1.ToggleInformation()
            end,
            Visible = a1.Visible,
        }),
        backgroundFrame = createElement(Container, {
            BackgroundTransparency = 0.25,
            CornerRadius = 8,
            StrokeThickness = 2,
            Size = v5.containerSize:map(function(a1) -- Line: 523
                return UDim2.fromScale(a1, 1)
            end),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            StrokeColor = Color3.fromRGB(90, 90, 90),
            Transparency = v5.progress,
        }, {
            dropShadow = createElement(ImageLabel, {
                ZIndex = -1,
                Image = "rbxassetid://9239716855",
                ImageTransparency = 0.2,
                Size = UDim2.new(1, 14, 1, 14),
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(14, 14, 64, 24),
                Transparency = v5.progress,
            }),
        }),
    }
    local v12 = {Size = UDim2.new(1, -24, 1, 0)}
    local v13 = {}
    local TowersSelection = a1.TowersSelection and createElement(TowerSelectionAmount, {
        amount = a1.TowersSelectionAmount or 0,
        selected = a1.TowersSelected or 0,
        Position = UDim2.new(0.5, 0, 0, -10),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.new(1, -32, 0, 16),
        Transparency = v5.secondProgress,
    })
    v13.selectionAmount = TowersSelection
    local v14 = {
        Size = v5.ammoPanelProgress:map(function(a1) -- Line: 564
            return (UDim2.new(1, -32, 0, 16)) - UDim2.fromScale(a1 / 2, 0)
        end),
        Position = UDim2.new(0.5, 0, 0, -10),
        AnchorPoint = Vector2.new(0.5, 1),
    }
    local Visible = a1.Visible and a1.ShowTowerAmmo
    v14.Visible = Visible
    v14.Transparency = v5.thirdProgress
    local TowerAmmo = a1.TowerAmmo or useBinding(0)
    v14.Ammo = TowerAmmo
    local TowerMaxAmmo = a1.TowerMaxAmmo or useBinding(0)
    v14.MaxAmmo = TowerMaxAmmo
    v13.ammoFrame = createElement(AmmoPanel, v14)
    v13.displayFrame = createElement(TowerDisplay, {
        CornerRadius = 6,
        Size = UDim2.new(1, 0, 0, 188),
        Position = v5.displayProgress:map(function(a1) -- Line: 579
            return (UDim2.new(0.5, 0, 0, 16)) + UDim2.fromScale(0, -a1 / 8)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Transparency = v5.secondProgress,
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
    v13.statsFrame = createElement(TowerActiveStats, {
        CornerRadius = 6,
        Size = UDim2.new(1, 0, 0, 52),
        Position = v5.activeStatsProgress:map(function(a1) -- Line: 605
            return (UDim2.new(0.5, 0, 0, 215)) + UDim2.fromScale(0, -a1 / 5)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Transparency = v5.secondProgress,
        Stats = a1.TowerActiveStats,
    })
    v14 = {
        Size = UDim2.new(1, 0, 0, 32),
        Position = v5.sellButtonProgress:map(function(a1) -- Line: 618
            return (UDim2.new(0.5, 0, 1, -32)) + UDim2.fromScale(-a1 / 2, 0)
        end),
        Transparency = v5.thirdProgress,
        SellValue = a1.TowerSellValue,
    }
    local Hologram = a1.Hologram or not a1.CanEditTower or not a1.CanSellTower
    v14.IsLocked = Hologram
    v14.OnSell = a1.OnSell
    local Visible_2 = a1.Visible and a1.CanEditTower and a1.CanSellTower
    v14.CanSell = Visible_2
    v13.sellPanel = createElement(TowerSellButton, v14)
    v11.controlPanel = createElement(Container, v12, v13)
    v12 = {
        Size = UDim2.new(1, -24, 0, 235),
        Position = v5.upgradesProgress:map(function(a1) -- Line: 633
            return (UDim2.new(0.5, 0, 0, 280)) + UDim2.fromScale(-a1 / 2, 0)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
    }
    local Visible_3 = a1.Visible and not v2
    v12.Visible = Visible_3
    v12.Transparency = v5.thirdProgress
    v12.CanEdit = if a1.Hologram ~= true then a1.CanEditTower else false
    v12.Cash = a1.PlayerCash
    v12.Hologram = a1.Hologram
    v12.UpgradePath = a1.TopUpgradePath
    v12.OnUpgrade = a1.OnUpgrade
    v11.singleUpgradePanel = createElement(u112, v12)
    v11.multiUpgradePanel = createElement(u116, {
        Size = UDim2.new(1, -24, 0, 235),
        Position = v5.upgradesProgress:map(function(a1) -- Line: 651
            return (UDim2.new(0.5, 0, 0, 278)) + UDim2.fromScale(-a1 / 2, 0)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Visible = a1.Visible and v2,
        Transparency = v5.thirdProgress,
        CanEdit = if a1.Hologram ~= true then a1.CanEditTower else false,
        Cash = a1.PlayerCash,
        Hologram = a1.Hologram,
        TopUpgradePath = a1.TopUpgradePath,
        BottomUpgradePath = a1.BottomUpgradePath,
        OnUpgrade = a1.OnUpgrade,
        OnStatsHover = function(a1) -- Line: 667 -- upvalues: u21 (val) -- types: a1: boolean
            u21(a1)
        end,
    })
    v12 = {
        Size = UDim2.new(0, 64, 1, 0),
        Position = v5.rightPanelProgress:map(function(a1) -- Line: 674
            return (UDim2.new(1, 16, 0.5, 0)) + UDim2.fromScale(0, a1 / 5)
        end),
        AnchorPoint = Vector2.new(0, 0.5),
    }
    v13 = {
        uiListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 20),
        }),
        statsPanelContainer = createElement(Container, {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {
            statsPanel = createElement(StatsPanel, {
                LayoutOrder = 1,
                IsVertical = true,
                Size = UDim2.fromOffset(95, 0),
                Position = UDim2.new(0, 0, 0, 0),
                AnchorPoint = Vector2.new(0, 0),
                Stats = a1.TowerStats,
                Transparency = v5.rightPanelProgress,
            }),
        }),
    }
    v14 = {
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = v3,
    }
    local v15 = {}
    local v16 = {
        LayoutOrder = 1,
        Size = UDim2.fromOffset(95, 0),
        Position = UDim2.new(0, 0, 0, 0),
        AnchorPoint = Vector2.new(0, 0),
    }
    local TowerDPSStats = a1.TowerDPSStats or {}
    v16.Stats = TowerDPSStats
    v16.Visible = v3
    v16.TooltipsEnabled = a1.Visible and v3
    v16.TooltipName = ("UpgradeDPS_%*"):format(a1.TowerName or "Tower")
    v16.Transparency = v5.rightPanelProgress
    v15.dpsPanel = createElement(DPSPanel, v16)
    v13.dpsPanelContainer = createElement(Container, v14, v15)
    v13.actionPanel = createElement(ConnectedActionPanel, {
        LayoutOrder = 3,
        Size = UDim2.new(0, 64, 1, -32),
        Position = UDim2.new(0, 0, 0, 0),
        AnchorPoint = Vector2.new(0, 0),
        Faded = v4,
        Transparency = v5.rightPanelProgress,
        TowerName = a1.TowerName,
        TowerDisplayName = a1.TowerDisplayName,
        TowerActions = a1.TowerActions,
        BuildTowerActions = a1.BuildTowerActions,
        UID = a1.UID,
    })
    v13.children = createElement(React.Fragment, {}, a1.children)
    v11.rightPanel = createElement(Container, v12, v13)
    return createElement(Container, v10, v11)
end, function(a1, a2) -- Line: 747 -- upvalues: table (val)
    if a2.Valid == false then
        if a1.Visible == a2.Visible then
            return true
        end
        for k, v in pairs(a1) do
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