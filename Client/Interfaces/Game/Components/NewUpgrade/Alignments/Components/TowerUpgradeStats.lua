-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerUpgradeStats
-- Decompile time: 54.83 ms

local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local table = require(Shared.Modules.Utils.table)
local useReactBindings = require(Hooks.useReactBindings)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useViewportSize = require(Hooks.useViewportSize)
local Button = require(BaseComponents.Button)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local useBinding = React.useBinding
local joinBindings = React.joinBindings
local useSpring = ReactFlow.useSpring

local function updateBindingIfChanged(a1, a2, a3, a4) -- Line: 56 -- types: a3: number, a4: number?
    if (a4 or 0) < math.abs((a1:getValue()) - a3) then
        a2(a3)
    end
end

local function useStatsUpdateToken(a1) -- Line: 64 -- upvalues: useRef (val), table (val)
    local v1 = a1 or {}
    local current = (useRef({token = 0})).current
    if current.stats == nil or not table.deepCompare(current.stats, v1) then
        current.stats = table.deepClone(v1)
        current.token = current.token + 1
    end
    return current.token
end

local function getWrappedLineCount(a1) -- Line: 81
    local v1 = 0
    for i in string.gmatch((tostring(a1 or ""):gsub("<[^>]+>", "")) .. "\n", "([^\n]*)\n") do
        v1 = v1 + math.max(1, (math.ceil(#i / 32)))
    end
    return (math.max(v1, 1))
end

local function getExpandEntryHeight(a1) -- Line: 92 -- upvalues: getWrappedLineCount (val)
    return getWrappedLineCount(a1) * 20
end

local function getStatRowHeight(a1, a2, a3) -- Line: 96
    -- upvalues: getWrappedLineCount (val)
    if not a1.Expand then
        if a2 then
            return 18
        end
        return 24
    end
    if not a3 then
        return 28
    end
    local v1 = 46
    for i, v in ipairs(a1.Expand) do
        v1 = v1 + getWrappedLineCount(v) * 20
        if i > 1 then
            v1 = v1 + 8
        end
    end
    return (math.max(28, v1))
end

local function getStatsCanvasHeight(a1, a2, a3, a4) -- Line: 120
    -- upvalues: getStatRowHeight (val)
    local v1
    local v2 = a1 or {}
    if #v2 == 0 then
        return 0
    end
    local v3 = 20
    local v4, v5 = a3, a4
    for i, v in ipairs(v2) do
        v1 = true
        if v4 ~= true then
            v1 = v5 and v5[i] == true
        end
        v3 = v3 + getStatRowHeight(v, v6, v1)
        if i > 1 then
            v3 = v3 + 10
        end
    end
    return v3
end

local u77 = React.memo(function(a1) -- Line: 148
    -- upvalues: useSpring (val), useRef (val), useEffect (val), createElement (val), Container (val), ImageLabel (val)
    -- upvalues: TextLabel (val)
    local v1 = if not a1.IsVertical then 0 else 3
    local v2, u7 = useSpring({start = 0, speed = 18, damper = 0.8})
    local u10 = useRef(0)
    local v3 = useEffect
    local v4 = {a1.StateUpdate}
    v3(function() -- Line: 157 -- upvalues: u10 (val), u7 (val), a1 (val)
        local v1 = u10
        v1.current = v1.current + 1
        local current = u10.current
        u7({start = 1.5, target = 1.5})
        local u14 = task.delay(0.15 * a1.TransitionPosition, function() -- Line: 162 -- upvalues: u10 (upval), current (val), u7 (upval)
            if u10.current ~= current then
                return
            end
            u7({target = 0})
        end)
        return function() -- Line: 172 -- upvalues: u10 (upval), u14 (val)
            local v1 = u10
            v1.current = v1.current + 1
            if coroutine.status(u14) ~= "dead" then
                task.cancel(u14)
            end
        end
    end, v4)
    v4 = {Size = UDim2.new(1, 0, 0, 24 - v1 * 2), LayoutOrder = a1.LayoutOrder}
    local v5 = {}
    local v6 = {
        Size = UDim2.fromOffset(24, 24),
        Position = v2:map(function(a1) -- Line: 187
            return UDim2.fromScale(-a1, 0.5)
        end),
        AnchorPoint = Vector2.new(0, 0.5),
    }
    local Icon_3 = typeof(a1.Icon) == "number" and ("rbxassetid://%*"):format(a1.Icon) or a1.Icon
    v6.Image = Icon_3
    v6.ScaleType = Enum.ScaleType.Fit
    v6.Transparency = a1.Transparency
    v5.upgradeIcon = createElement(ImageLabel, v6)
    v6 = {FontWeight = "SemiBold", StrokeThickness = 2}
    local v7 = a1.Icon and UDim2.new(1, -36, 0, 20 - v1) or UDim2.new(0.99, 0, 0, 20 - v1)
    v6.Size = v7
    v6.Position = v2:map(function(a1_2) -- Line: 201 -- upvalues: a1 (val)
        return UDim2.new((if not a1.Icon then 0.01 else 0) - a1_2, if not a1.Icon then 0 else 36, 0.5, 0)
    end)
    v6.AnchorPoint = Vector2.new(0, 0.5)
    v6.Text = a1.Text
    v6.TextXAlignment = Enum.TextXAlignment.Left
    v6.Transparency = a1.Transparency
    v5.upgradeText = createElement(TextLabel, v6)
    return createElement(Container, v4, v5)
end, function(a1, a2) -- Line: 218
    local v1 = false
    if a1.StateUpdate == a2.StateUpdate then
        v1 = false
        if a1.Icon == a2.Icon then
            v1 = false
            if a1.Text == a2.Text then
                v1 = false
                if a1.TransitionPosition == a2.TransitionPosition then
                    v1 = false
                    if a1.IsVertical == a2.IsVertical then
                        v1 = a1.Transparency == a2.Transparency
                    end
                end
            end
        end
    end
    return v1
end)
local u81 = React.memo(function(a1) -- Line: 227 -- upvalues: useSpring (val), useReactBindings (val), createElement (val), TextLabel (val)
    if not a1.IsVertical then end
    local v1, u7 = useSpring({start = 0, speed = 22, damper = 0.8})
    local v2 = useReactBindings
    local v3 = {a1.TransitionProgress}
    v2(function(a1_2) -- Line: 232 -- upvalues: a1 (val), u7 (val)
        u7({target = if not (a1.TransitionPosition < a1_2) then 0 else 1})
    end, v3)
    return createElement(TextLabel, {
        TextScaled = false,
        TextWrapped = true,
        TextSize = 16,
        RichText = true,
        FontWeight = "SemiBold",
        Size = UDim2.fromScale(0.94, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = v1:map(function(a1) -- Line: 277
            return a1 > 0.7
        end),
        LayoutOrder = a1.LayoutOrder,
        Text = ("• %*"):format(a1.Text),
        TextTransparency = v1:map(function(a1) -- Line: 288
            return 1 - a1
        end),
        TextColor3 = Color3.fromRGB(247, 250, 252),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Transparency = a1.Transparency,
    })
end, function(a1, a2) -- Line: 299
    local v1 = false
    if a1.Text == a2.Text then
        v1 = false
        if a1.LayoutOrder == a2.LayoutOrder then
            v1 = false
            if a1.TransitionPosition == a2.TransitionPosition then
                v1 = a1.TransitionProgress == a2.TransitionProgress
            end
        end
    end
    return v1
end)
local u85 = React.memo(function(a1) -- Line: 306
    -- upvalues: useSpring (val), useEffect (val), createElement (val), u81 (val), useRef (val), Container (val)
    -- upvalues: Button (val), joinBindings (val), React (val), TextLabel (val), ImageLabel (val)
    local KeepStatsExpanded = a1.KeepStatsExpanded
    if not KeepStatsExpanded then
        KeepStatsExpanded = a1.EntryExpanded == true
    end
    local v1, u14 = useSpring({speed = 25, damper = 0.7, start = if not KeepStatsExpanded then 0 else 1})
    local v2, u18 = useSpring({start = 0, speed = 25, damper = 0.7})
    local v3 = {KeepStatsExpanded}
    useEffect(function() -- Line: 315 -- upvalues: u14 (val), KeepStatsExpanded (val)
        u14({target = if not KeepStatsExpanded then 0 else 1})
    end, v3)
    local v4 = {}
    for k, v in pairs(a1.Expand) do
        table.insert(v4, (createElement(u81, {
            Text = v,
            LayoutOrder = k,
            TransitionPosition = k / (#a1.Expand + 1),
            TransitionProgress = v1,
            IsVertical = a1.IsVertical,
            Transparency = a1.Transparency,
        })))
    end
    local v5, u43 = useSpring({start = 0, speed = 18, damper = 0.8})
    local u46 = useRef(0)
    local v6 = useEffect
    local v7 = {a1.StateUpdate}
    v6(function() -- Line: 345 -- upvalues: u46 (val), u43 (val), a1 (val), KeepStatsExpanded (val), u14 (val)
        local v1 = u46
        v1.current = v1.current + 1
        local current = u46.current
        u43({start = 1.5, target = 1.5})
        local u14_2 = task.delay(0.15 * a1.TransitionPosition, function() -- Line: 350 -- upvalues: u46 (upval), current (val), u43 (upval)
            if u46.current ~= current then
                return
            end
            u43({target = 0})
        end)
        if not a1.KeepStatsExpanded and not KeepStatsExpanded then
            u14({start = 0, target = 0})
        end
        return function() -- Line: 364 -- upvalues: u46 (upval), u14_2 (val)
            local v1 = u46
            v1.current = v1.current + 1
            if coroutine.status(u14_2) ~= "dead" then
                task.cancel(u14_2)
            end
        end
    end, v7)
    v7 = {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.LayoutOrder,
    }
    local v8 = {}
    local v9 = {Size = UDim2.new(1, 0, 0, 28)}
    v9.Position = joinBindings({v2, v5}):map(function(a1) -- Line: 381
        return UDim2.fromScale(0.5 - a1[2], 0 + a1[1])
    end)
    v9.AnchorPoint = Vector2.new(0.5, 0)
    v9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v9.BackgroundTransparency = 0
    v9.ZIndex = 0
    v9.GradientRotation = 90
    v9.GradientColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 170, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(186, 124, 0))),
    })
    v9.Transparency = a1.Transparency
    v9.CornerRadius = if not a1.KeepStatsExpanded then 5 else 4
    v9.Active = not a1.KeepStatsExpanded
    v9.Selectable = not a1.KeepStatsExpanded

    v9[React.Event.Activated] = function() -- Line: 404 -- upvalues: a1 (val), KeepStatsExpanded (val), u18 (val)
        if a1.KeepStatsExpanded then
            return
        end
        if a1.OnExpandedChanged then
            a1.OnExpandedChanged(a1.LayoutOrder, not KeepStatsExpanded)
        end
        u18({force = if not KeepStatsExpanded then 8 else 6})
    end

    local v10 = {}
    local v11 = {
        FontWeight = "SemiBold",
        StrokeThickness = 2,
        Size = UDim2.fromScale(0.94, if a1.IsVertical then 0.65 else 0.75),
    }
    local v12 = a1.KeepStatsExpanded and UDim2.fromScale(0.51, 0.5) or UDim2.fromScale(0.5, 0.5)
    v11.Position = v12
    v11.Text = a1.Text
    v11.TextXAlignment = Enum.TextXAlignment.Left
    v11.Transparency = a1.Transparency
    v10.titleLabel = createElement(TextLabel, v11)
    v10.expandIcon = not a1.KeepStatsExpanded and createElement(ImageLabel, {
        Size = UDim2.fromOffset(15, 8),
        Position = UDim2.fromScale(0.96, 0.52),
        AnchorPoint = Vector2.new(1, 0.5),
        Image = v1:map(function(a1) -- Line: 436
            if a1 < 0.99 then
                return "rbxassetid://136808285389414"
            end
            return "rbxassetid://89267092672390"
        end),
        Rotation = v1:map(function(a1) -- Line: 442
            if a1 > 0.01 and a1 < 0.99 then
                return a1 * -180
            end
            return 0
        end),
        Transparency = a1.Transparency,
    })
    v8.expandButton = createElement(Button, v9, v10)
    v8.expandContainer = createElement(Container, {
        BackgroundTransparency = 0,
        ZIndex = -1,
        ClipsDescendants = true,
        CornerRadius = 5,
        Size = UDim2.new(1, 0, 0, 0),
        Position = v5:map(function(a1) -- Line: 456
            return UDim2.new(0.5 - a1, 0, 0, 10)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(52, 52, 52),
        Transparency = a1.Transparency,
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        uiPadding = createElement("UIPadding", {
            PaddingTop = v1:map(function(a1) -- Line: 472
                return UDim.new(0, 28 * a1)
            end),
            PaddingBottom = v1:map(function(a1) -- Line: 475
                return UDim.new(0, 8 * a1)
            end),
        }),
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        }),
        expandList = createElement(React.Fragment, {}, v4),
    })
    return createElement(Container, v7, v8)
end, function(a1, a2) -- Line: 493
    local v1 = false
    if a1.StateUpdate == a2.StateUpdate then
        v1 = false
        if a1.Text == a2.Text then
            v1 = false
            if a1.TransitionPosition == a2.TransitionPosition then
                v1 = false
                if a1.IsVertical == a2.IsVertical then
                    v1 = false
                    if a1.EntryExpanded == a2.EntryExpanded then
                        v1 = false
                        if a1.KeepStatsExpanded == a2.KeepStatsExpanded then
                            v1 = a1.Transparency == a2.Transparency
                        end
                    end
                end
            end
        end
    end
    return v1
end)
local u89 = React.memo(function(a1) -- Line: 504 -- upvalues: createElement (val), u85 (val), u77 (val), React (val)
    local ExpandedStats, v1
    local v2 = {}
    local v3 = pairs
    local UpgradeStats = a1.UpgradeStats or {}
    local v4 = a1
    for k, v in v3(UpgradeStats) do
        if not v.Expand then
            table.insert(v2, (createElement(u77, {
                LayoutOrder = k,
                Icon = v.Icon,
                Text = v.Text,
                TransitionPosition = (k - 1) / #v4.UpgradeStats,
                StateUpdate = v4.StateUpdate,
                IsVertical = v4.IsVertical,
                Transparency = v4.Transparency,
            })))
        else
            v1 = {
                LayoutOrder = k,
                Icon = v.Icon,
                Text = v.Text,
                Expand = v.Expand,
                TransitionPosition = (k - 1) / #v4.UpgradeStats,
                StateUpdate = v4.StateUpdate,
                Transparency = v4.Transparency,
                IsVertical = v4.IsVertical,
            }
            ExpandedStats = v4.ExpandedStats and v4.ExpandedStats[k] == true
            v1.EntryExpanded = ExpandedStats
            v1.KeepStatsExpanded = v4.KeepStatsExpanded
            v1.OnExpandedChanged = v4.OnExpandedStatChanged
            table.insert(v2, (createElement(u85, v1)))
        end
    end
    return createElement(React.Fragment, {}, {
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        statEntries = createElement(React.Fragment, {}, v2),
    })
end, function(a1, a2) -- Line: 559 -- upvalues: table (val)
    local v1 = table.deepCompare(a1.UpgradeStats, a2.UpgradeStats)
    if v1 then
        v1 = false
        if a1.IsVertical == a2.IsVertical then
            v1 = false
            if a1.KeepStatsExpanded == a2.KeepStatsExpanded then
                v1 = false
                if a1.Transparency == a2.Transparency then
                    v1 = false
                    if a1.ExpandedStats == a2.ExpandedStats then
                        v1 = a1.OnExpandedStatChanged == a2.OnExpandedStatChanged
                    end
                end
            end
        end
    end
    return v1
end)
local u93 = React.memo(function(a1) -- Line: 569
    -- upvalues: useStatsUpdateToken (val), useState (val), useRef (val), getStatsCanvasHeight (val), useCallback (val)
    -- upvalues: useSpring (val), useEffect (val), useBinding (val), UserInputService (val), ContextActionService (val)
    -- upvalues: useReactBindings (val), useTransparencyModifier (val), createElement (val), Container (val)
    -- upvalues: React (val), u89 (val), ImageLabel (val), TextLabel (val)
    local u79
    local v1 = useStatsUpdateToken(a1.UpgradeStats)
    local v2, u7 = useState({})
    local u10 = useRef(v2)
    u10.current = v2
    local v3 = getStatsCanvasHeight(a1.UpgradeStats, a1.IsVertical, a1.KeepStatsExpanded, v2)
    local v4 = useCallback(function(a1, a2) -- Line: 582 -- upvalues: u10 (val), u7 (val) -- types: a1: number, a2: boolean
        local current = u10.current
        if current[a1] == true == a2 then
            return
        end
        local v1 = table.clone(current)
        if not a2 then
            v1[a1] = nil
        else
            v1[a1] = true
        end
        u7(v1)
    end, {})
    local v5, u24 = useSpring({start = 0, speed = 20, damper = 1})
    local v6 = {v1}
    useEffect(function() -- Line: 600 -- upvalues: u24 (val)
        u24({force = 15})
    end, v6)
    local u32 = useRef(nil)
    local v7, u36 = useSpring({start = 0, speed = 20, damper = 0.8})
    local u39, u40 = useBinding(false)
    useEffect(function() -- Line: 611
        -- upvalues: UserInputService (upval), u32 (val), u39 (val), u36 (val), ContextActionService (upval)
        local u5 = UserInputService.InputChanged:Connect(function(a1) -- Line: 612 -- upvalues: u32 (upval), u39 (upval), u36 (upval)
            if u32.current and u39:getValue() and a1.UserInputType == Enum.UserInputType.MouseWheel then
                local v1 = a1.Position.Z * 150
                u36({force = -v1})
            end
        end)
        ContextActionService:UnbindAction("CustomMouseScrolling")
        return function() -- Line: 625 -- upvalues: u5 (val), ContextActionService (upval)
            u5:Disconnect()
            ContextActionService:UnbindAction("CustomMouseScrolling")
        end
    end, {})
    local v8 = {v7}
    useReactBindings(function(a1) -- Line: 631 -- upvalues: u32 (val)
        if u32.current and 0.01 < (math.abs(a1)) then
            local current = u32.current
            current.CanvasPosition = current.CanvasPosition + Vector2.new(0, a1)
        end
    end, v8)
    v8 = {v1}
    useEffect(function() -- Line: 637 -- upvalues: u32 (val), a1 (val), u10 (val), u7 (val)
        local current = u32.current
        if current then
            local CanvasPosition = current.CanvasPosition
            if 1 < (math.abs(CanvasPosition.X)) or 1 < (math.abs(CanvasPosition.Y)) then
                current.CanvasPosition = Vector2.zero
            end
        end
        if not a1.KeepStatsExpanded and next(u10.current) then
            u7({})
        end
    end, v8)
    local v9, u58 = useSpring({start = 0, speed = 20, damper = 0.7})
    v8 = useEffect
    local v10 = {a1.IsLocked}
    v8(function() -- Line: 654 -- upvalues: u58 (val), a1 (val)
        u58({target = if not a1.IsLocked then 0 else 1})
    end, v10)
    v8, u79 = useSpring({
        speed = 20,
        damper = 0.7,
        start = if not a1.Visible then 1 else if not a1.Visible:getValue() then 1 else 0,
    })
    local u87 = useTransparencyModifier(a1.Transparency)(v8)
    local v11, u91 = useSpring({start = 1, speed = 12, damper = 0.9})
    local v12 = useReactBindings
    local v13 = {a1.Visible}
    v12(function(a1) -- Line: 670 -- upvalues: u79 (val)
        u79({target = if not a1 then 1 else 0})
    end, v13)
    v13 = {v1}
    useEffect(function() -- Line: 675 -- upvalues: u87 (val), u91 (val)
        if (u87:getValue()) < 0.99 then
            u91({start = 0, target = 1})
        end
    end, v13)
    v13 = {
        BackgroundTransparency = 0.5,
        Active = true,
        Selectable = false,
        GradientRotation = 90,
        StrokeThickness = 1,
        StrokeGradientRotation = 90,
        Size = a1.Size,
        Position = v5:map(function(a1_2) -- Line: 683 -- upvalues: a1 (val)
            local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
            return Position + UDim2.fromScale(0, a1_2 / 10)
        end),
        AnchorPoint = a1.AnchorPoint,
        ZIndex = a1.ZIndex,
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        CornerRadius = a1.CornerRadius,
    }
    v13.GradientColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(62, 62, 62)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))),
    })
    v13.StrokeColor = Color3.fromRGB(158, 158, 158)
    v13.StrokeGradientTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.15, 0.5),
        NumberSequenceKeypoint.new(0.4, 0.8),
        (NumberSequenceKeypoint.new(1, 0.8)),
    })
    v13.Transparency = u87
    v13.Visible = u87:map(function(a1) -- Line: 714
        return a1 < 0.99
    end)
    local v14 = {}
    local v15 = createElement
    local v16 = {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(1, 0, 0, v3),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarThickness = 6,
        ScrollBarImageColor3 = Color3.fromRGB(201, 201, 201),
        ScrollBarImageTransparency = u87,
        ClipsDescendants = true,
        TopImage = "",
        BottomImage = "",
    }

    v16[React.Event.MouseEnter] = function() -- Line: 738 -- upvalues: UserInputService (upval), u40 (val), ContextActionService (upval), u32 (val)
        if UserInputService.MouseEnabled then
            u40(true)
            local v1 = ContextActionService
            local MouseWheel = Enum.UserInputType.MouseWheel
            v1:BindAction("CustomMouseScrolling", function(a1, a2, a3) -- Line: 743
                return Enum.ContextActionResult.Sink
            end, false, MouseWheel)
            if u32.current then
                u32.current.ScrollingEnabled = false
            end
        end
    end

    v16[React.Event.MouseLeave] = function() -- Line: 756 -- upvalues: u40 (val), ContextActionService (upval), u32 (val)
        u40(false)
        ContextActionService:UnbindAction("CustomMouseScrolling")
        if u32.current then
            u32.current.ScrollingEnabled = true
        end
    end

    v16.ref = u32
    v14.scrollingFrame = v15("ScrollingFrame", v16, {
        uiPadding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 15),
        }),
        statsPanel = createElement(u89, {
            UpgradeStats = a1.UpgradeStats,
            IsVertical = a1.IsVertical,
            Transparency = u87,
            StateUpdate = v1,
            KeepStatsExpanded = a1.KeepStatsExpanded,
            ExpandedStats = v2,
            OnExpandedStatChanged = v4,
        }),
    })
    v14.overlayFrame = createElement(Container, {
        ZIndex = 2,
        BackgroundTransparency = v11,
        BackgroundColor3 = Color3.fromRGB(175, 175, 175),
        CornerRadius = a1.CornerRadius,
        GradientTransparency = v11:map(function(a1) -- Line: 794
            return NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(math.clamp(a1 * 1.1, 0.01, 0.99), 0, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            })
        end),
    })
    v16 = {
        ZIndex = 3,
        BackgroundTransparency = v9:map(function(a1) -- Line: 804
            return 1 - a1 * 0.9
        end),
        BackgroundColor3 = Color3.fromRGB(92, 22, 22),
        Transparency = u87,
        CornerRadius = a1.CornerRadius + 1,
        Visible = v9:map(function(a1) -- Line: 813
            return a1 > 0.01
        end),
    }
    local v17 = {
        stripeBackground = createElement(ImageLabel, {
            ZIndex = -1,
            Image = "rbxassetid://109365308136576",
            CornerRadius = a1.CornerRadius,
            ScaleType = Enum.ScaleType.Slice,
            Transparency = u87,
            ImageTransparency = v9:map(function(a1) -- Line: 825
                return 1 - a1 * 0.3
            end),
        }),
    }
    v17.lockIcon = createElement(ImageLabel, {
        Image = "rbxassetid://1197061307",
        Rotation = 10,
        Size = UDim2.fromScale(0.45, 0.45),
        Position = UDim2.fromScale(0.23, 0.48),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Transparency = u87,
        ImageTransparency = v9:map(function(a1) -- Line: 841
            return 1 - a1
        end),
    }, {
        uiScale = createElement("UIScale", {
            Scale = v9:map(function(a1) -- Line: 846
                return a1
            end),
        }),
    })
    local v18 = {Text = "Upgrade Locked", FontWeight = "Bold", StrokeThickness = 4}
    local v19 = not a1.IsVertical and UDim2.fromScale(0.8, 0.5) or UDim2.fromScale(0.7, 0.6)
    v18.Size = v19
    v19 = not a1.IsVertical and UDim2.fromScale(0.64, 0.5) or UDim2.fromScale(0.62, 0.5)
    v18.Position = v19
    v18.TextColor3 = Color3.fromRGB(255, 255, 255)
    v18.Transparency = u87
    v18.TextTransparency = v9:map(function(a1) -- Line: 865
        return 1 - a1
    end)
    v18.StrokeTransparency = v9:map(function(a1) -- Line: 868
        return 1 - a1
    end)
    v17.lockText = createElement(TextLabel, v18, {
        uiScale = createElement("UIScale", {
            Scale = v9:map(function(a1) -- Line: 873
                return a1
            end),
        }),
    })
    v14.lockedFrame = createElement(Container, v16, v17)
    return createElement(Container, v13, v14)
end, function(a1, a2) -- Line: 880 -- upvalues: table (val)
    local v1 = table.deepCompare(a1.UpgradeStats, a2.UpgradeStats)
    if v1 then
        v1 = false
        if a1.IsLocked == a2.IsLocked then
            v1 = a1.KeepStatsExpanded == a2.KeepStatsExpanded
        end
    end
    return v1
end)
local u97 = React.memo(function(a1) -- Line: 886
    -- upvalues: useStatsUpdateToken (val), useRef (val), useBinding (val), useViewportSize (val), useEffect (val)
    -- upvalues: useReactBindings (val), useSpring (val), useTransparencyModifier (val), createElement (val)
    -- upvalues: Container (val), ImageLabel (val), TextLabel (val), u89 (val)
    local u60, u77, u81
    local v1 = useStatsUpdateToken(a1.UpgradeStats)
    local u5 = useRef()
    local u10, u11 = useBinding(a1.Size.X.Offset)
    local u14 = useRef(0)
    local u16 = useViewportSize()
    local u21 = #a1.UpgradeStats > 0

    local function queueWidthMeasure(a1) -- Line: 899
        -- upvalues: u14 (val), u21 (val), u5 (val), u10 (val), u11 (val), u16 (val)
        local v1 = u14
        v1.current = v1.current + 1
        local current = u14.current
        if a1 and u21 then
            task.defer(function() -- Line: 907 -- upvalues: u14 (upval), current (val), u5 (upval), u10 (upval), u11 (upval), u16 (upval)
                local v1
                if u14.current ~= current then
                    return
                end
                if not u5.current then
                    v1 = u11
                    if 0 < math.abs((u10:getValue()) - 0) then
                        v1(0)
                    end
                    return
                end
                local v2 = u16.X - u5.current.AbsolutePosition.X
                v1 = u10:getValue()
                local v3 = if not (v1 > 0) then 1 else u5.current.AbsoluteSize.X / v1
                if v3 <= 0 or v3 ~= v3 then
                    v3 = 1
                end
                local v4 = math.max(v2, 0) / v3 - 10
                local v5 = u10
                local v6 = u11
                local v7 = math.max(v4, 0)
                if 0.5 < math.abs((v5:getValue()) - v7) then
                    v6(v7)
                end
            end)
            return
        end
    end

    local v2 = useEffect
    local v3 = {u16, u21, a1.Visible}
    v2(function() -- Line: 937 -- upvalues: a1 (val), u14 (val), u21 (val), u5 (val), u10 (val), u11 (val), u16 (val)
        local Visible = a1.Visible and a1.Visible:getValue()
        local v1 = u14
        v1.current = v1.current + 1
        local current = u14.current
        if Visible then
            if not u21 then
                return
            end
            task.defer(function() -- Line: 907 -- upvalues: u14 (upval), current (val), u5 (upval), u10 (upval), u11 (upval), u16 (upval)
                local v1
                if u14.current ~= current then
                    return
                end
                if not u5.current then
                    v1 = u11
                    if 0 < math.abs((u10:getValue()) - 0) then
                        v1(0)
                    end
                    return
                end
                local v2 = u16.X - u5.current.AbsolutePosition.X
                v1 = u10:getValue()
                local v3 = if not (v1 > 0) then 1 else u5.current.AbsoluteSize.X / v1
                if v3 <= 0 or v3 ~= v3 then
                    v3 = 1
                end
                local v4 = math.max(v2, 0) / v3 - 10
                local v5 = u10
                local v6 = u11
                local v7 = math.max(v4, 0)
                if 0.5 < math.abs((v5:getValue()) - v7) then
                    v6(v7)
                end
            end)
        end
    end, v3)
    v2 = useReactBindings
    v3 = {a1.Visible}
    local v4 = {u21, u16}
    v2(function(a1) -- Line: 941
        -- upvalues: u14 (val), u21 (val), u5 (val), u10 (val), u11 (val), u16 (val)
        local v1 = u14
        v1.current = v1.current + 1
        local current = u14.current
        if a1 then
            if not u21 then
                return
            end
            task.defer(function() -- Line: 907 -- upvalues: u14 (upval), current (val), u5 (upval), u10 (upval), u11 (upval), u16 (upval)
                local v1
                if u14.current ~= current then
                    return
                end
                if not u5.current then
                    v1 = u11
                    if 0 < math.abs((u10:getValue()) - 0) then
                        v1(0)
                    end
                    return
                end
                local v2 = u16.X - u5.current.AbsolutePosition.X
                v1 = u10:getValue()
                local v3 = if not (v1 > 0) then 1 else u5.current.AbsoluteSize.X / v1
                if v3 <= 0 or v3 ~= v3 then
                    v3 = 1
                end
                local v4 = math.max(v2, 0) / v3 - 10
                local v5 = u10
                local v6 = u11
                local v7 = math.max(v4, 0)
                if 0.5 < math.abs((v5:getValue()) - v7) then
                    v6(v7)
                end
            end)
        end
    end, v3, v4)
    v2, u60 = useSpring({
        speed = 20,
        damper = 0.7,
        start = if not a1.Visible then 1 else if not a1.Visible:getValue() then 1 else 0,
    })
    local u68 = useTransparencyModifier(a1.Transparency)(v2)
    local v5 = useReactBindings
    local v6 = {a1.Visible}
    v5(function(a1) -- Line: 955 -- upvalues: u60 (val)
        u60({target = if not a1 then 1 else 0})
    end, v6)
    v5, u77 = useSpring({start = 1, speed = 10, damper = 0.9})
    v6, u81 = useSpring({start = 0, speed = 20, damper = 0.7})
    local v7 = useEffect
    local v8 = {a1.IsLocked}
    v7(function() -- Line: 963 -- upvalues: u81 (val), a1 (val)
        u81({target = if not a1.IsLocked then 0 else 1})
    end, v8)
    v8 = {v1}
    useEffect(function() -- Line: 968 -- upvalues: u68 (val), u77 (val), u60 (val)
        if (u68:getValue()) < 0.99 then
            u77({start = 0, target = 1})
            u60({start = 2})
        end
    end, v8)
    v8 = {
        Size = u10:map(function(a1) -- Line: 976
            return UDim2.new(0, a1, 1, 0)
        end),
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.new(1, 1, 1),
        ZIndex = a1.ZIndex,
        reference = u5,
    }
    local v9 = {}
    local v10 = {
        BackgroundTransparency = 0.2,
        GradientRotation = 90,
        StrokeThickness = 2,
        Size = UDim2.fromScale(1, 0),
        Position = u68:map(function(a1_2) -- Line: 989 -- upvalues: a1 (val)
            return a1.Flipped and UDim2.fromScale(a1_2 / 10, 0.5) or UDim2.fromScale(-a1_2 / 10, 0.5)
        end),
    }
    local v11 = a1.Flipped and Vector2.new(1, 0.5) or Vector2.new(0, 0.5)
    v10.AnchorPoint = v11
    v10.AutomaticSize = Enum.AutomaticSize.Y
    v10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v10.CornerRadius = a1.CornerRadius
    v10.GradientColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(62, 62, 62)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(33, 33, 33))),
    })
    v10.StrokeColor = Color3.fromRGB(90, 90, 90)
    v10.Transparency = u68
    v10.Visible = u68:map(function(a1) -- Line: 1011 -- upvalues: u21 (val)
        if not u21 then
            return false
        end
        return a1 < 0.99
    end)
    v10.Scale = u68:map(function(a1) -- Line: 1019
        return 1 - a1 / 3
    end)
    v10.reference = u5
    v11 = {
        uiSizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(a1.Size.X.Offset, (1 / 0))}),
    }
    local v12 = {ZIndex = -1, Image = "rbxassetid://18821643786", Size = UDim2.fromOffset(26, 28)}
    local v13 = a1.Flipped and UDim2.new(1, 0, 0.5, 0) or UDim2.new(0, -1, 0.5, 0)
    v12.Position = v13
    v13 = a1.Flipped and Vector2.new(0, 0.5) or Vector2.new(1, 0.5)
    v12.AnchorPoint = v13
    v12.ImageColor3 = Color3.fromRGB(90, 90, 90)
    v12.Rotation = if not a1.Flipped then 0 else 180
    v12.Visible = u21
    v12.Transparency = u68
    v11.tipImage = createElement(ImageLabel, v12)
    v11.overlayFrame = createElement(Container, {
        ZIndex = 2,
        BackgroundTransparency = v5,
        BackgroundColor3 = Color3.fromRGB(175, 175, 175),
        CornerRadius = a1.CornerRadius,
        Visible = u68:map(function(a1) -- Line: 1051 -- upvalues: u21 (val)
            local v1 = false
            if a1 < 0.99 then
                v1 = u21
            end
            return v1
        end),
        GradientTransparency = v5:map(function(a1) -- Line: 1055
            return NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(math.clamp(a1 * 1.1, 0.01, 0.99), 0, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            })
        end),
    })
    v11.lockedFrame = createElement(Container, {
        ZIndex = 3,
        BackgroundTransparency = v6:map(function(a1) -- Line: 1065
            return 1 - a1 * 0.9
        end),
        BackgroundColor3 = Color3.fromRGB(92, 22, 22),
        Transparency = u68,
        CornerRadius = a1.CornerRadius + 1,
        Visible = v6:map(function(a1) -- Line: 1074
            return a1 > 0.01
        end),
    }, {
        stripeBackground = createElement(ImageLabel, {
            ZIndex = -1,
            Image = "rbxassetid://109365308136576",
            CornerRadius = a1.CornerRadius,
            ScaleType = Enum.ScaleType.Slice,
            Transparency = u68,
            ImageTransparency = v6:map(function(a1) -- Line: 1086
                return 1 - a1 * 0.3
            end),
        }),
        lockIcon = createElement(ImageLabel, {
            Image = "rbxassetid://1197061307",
            Rotation = 10,
            Size = UDim2.fromScale(0.22, 0.3),
            Position = UDim2.fromScale(0.16, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Transparency = u68,
            ImageTransparency = v6:map(function(a1) -- Line: 1102
                return 1 - a1
            end),
        }, {
            uiScale = createElement("UIScale", {
                Scale = v6:map(function(a1) -- Line: 1107
                    return a1
                end),
            }),
        }),
        lockText = createElement(TextLabel, {
            Text = "Upgrade Locked",
            FontWeight = "Bold",
            StrokeThickness = 4,
            Size = UDim2.fromScale(0.58, 0.42),
            Position = UDim2.fromScale(0.34, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            Transparency = u68,
            TextTransparency = v6:map(function(a1) -- Line: 1126
                return 1 - a1
            end),
            StrokeTransparency = v6:map(function(a1) -- Line: 1129
                return 1 - a1
            end),
        }, {
            uiScale = createElement("UIScale", {
                Scale = v6:map(function(a1) -- Line: 1134
                    return a1
                end),
            }),
        }),
    })
    v12 = {
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 0),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }
    v13 = {}
    local v14 = u21 and createElement("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
    })
    v13.uiPadding = v14
    v13.statsPanel = createElement(u89, {
        KeepStatsExpanded = true,
        UpgradeStats = a1.UpgradeStats,
        IsVertical = a1.IsVertical,
        Transparency = u68,
        StateUpdate = v1,
    })
    v11.statsContainer = createElement(Container, v12, v13)
    v9.contentContainer = createElement(Container, v10, v11)
    return createElement(Container, v8, v9)
end, function(a1, a2) -- Line: 1168 -- upvalues: table (val)
    local v1 = false
    if a1.Visible == a2.Visible then
        v1 = false
        if a1.IsLocked == a2.IsLocked then
            v1 = table.deepCompare(a1.UpgradeStats, a2.UpgradeStats)
        end
    end
    return v1
end)
return function(a1) -- Line: 1175 -- upvalues: u97 (val), u93 (val), createElement (val)
    return createElement(a1.FloatingPanel and u97 or u93, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        CornerRadius = a1.CornerRadius,
        ZIndex = a1.ZIndex,
        Visible = a1.Visible,
        Transparency = a1.Transparency,
        IsLocked = a1.IsLocked,
        IsVertical = a1.IsVertical,
        UpgradeStats = a1.UpgradeStats,
        KeepStatsExpanded = a1.KeepStatsExpanded,
        Flipped = a1.Flipped,
    })
end