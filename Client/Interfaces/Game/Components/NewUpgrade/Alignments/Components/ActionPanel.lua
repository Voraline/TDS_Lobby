-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.ActionPanel
-- Decompile time: 126.54 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local BaseComponents = script.Parent.Parent.BaseComponents
local Components = Interfaces.Components
local Components_2 = Interfaces.Game.Components
local Hooks = Interfaces.Hooks
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local useGameStateValue = require(Hooks.useGameStateValue)
local useReactBindings = require(Hooks.useReactBindings)
local useSound = require(Hooks.useSound)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useUserSetting = require(Hooks.useUserSetting)
local useViewportSize = require(Hooks.useViewportSize)
local AbilityAmmo = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.AbilityAmmo)
local Button = require(BaseComponents.Button)
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
require(ReplicatedStorage.Shared.Modules.Network.Server)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Tooltip = require(Components.Tooltip)
local Ability = require(Components_2.Ability)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local useMemo = React.useMemo
local useRef = React.useRef
local joinBindings = React.joinBindings
local useSpring = ReactFlow.useSpring
local useAnimation = ReactFlow.useAnimation
local useSequenceAnimation = ReactFlow.useSequenceAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local Spring = ReactFlow.Spring
local Tween = ReactFlow.Tween
local u122 = {Mark1Rocket = "Mark1"}

local function updateBindingIfChanged(a1, a2, a3, a4) -- Line: 73 -- types: a3: number, a4: number?
    if (a4 or 0) < math.abs((a1:getValue()) - a3) then
        a2(a3)
    end
end

local function getString(a1) -- Line: 81
    if a1 == nil then
        return nil
    end
    if typeof(a1) == "string" then
        return a1
    end
    if typeof(a1) ~= "number" and typeof(a1) ~= "boolean" then
        return nil
    end
    return (tostring(a1))
end

local function getTarmacUnitIcon(a1) -- Line: 97 -- upvalues: u122 (val), Icons (val)
    local v1
    local v2 = a1
    if not (if v2 ~= nil then if typeof(v2) ~= "string" then if typeof(v2) == "number" then tostring(v2) else if typeof(v2) ~= "boolean" then nil else tostring(v2) else v2 else nil) then
        return "rbxassetid://6877509129"
    end
    v2 = u122[v1] or v1
    return Icons.Units[v2] or Icons.Units[v2:gsub("_", " ")] or "rbxassetid://6877509129"
end

local function getSelectionContentWidth(a1) -- Line: 109 -- types: a1: table?
    local v1 = a1 and #a1 or 0
    if v1 <= 0 then
        return 0
    end
    return v1 * 56 + math.max(v1 - 1, 0) * 8
end

local u130 = React.memo(function(a1) -- Line: 120
    -- upvalues: u122 (val), Icons (val), useGameStateValue (val), useSpring (val), useBinding (val), useEffect (val)
    -- upvalues: RunService (val), ServerTicks (val), useMemo (val), HttpService (val), createElement (val)
    -- upvalues: Container (val), ImageLabel (val), TextLabel (val), Tooltip (val)
    local u98, v1
    local Interval = a1.Interval
    local StartTick = a1.StartTick
    local UnitName = a1.UnitName or a1.Name
    local v2 = if UnitName ~= nil then if typeof(UnitName) ~= "string" then if typeof(UnitName) == "number" then tostring(UnitName) else if typeof(UnitName) ~= "boolean" then nil else tostring(UnitName) else UnitName else nil
    local DisplayName = a1.DisplayName
    local v3 = (if DisplayName ~= nil then if typeof(DisplayName) ~= "string" then if typeof(DisplayName) == "number" then tostring(DisplayName) else if typeof(DisplayName) ~= "boolean" then nil else tostring(DisplayName) else DisplayName else nil) or v2
    local v4 = v3 and v3:gsub("_", " ")
    local v5 = v2
    local v6 = if v5 ~= nil then if typeof(v5) ~= "string" then if typeof(v5) == "number" then tostring(v5) else if typeof(v5) ~= "boolean" then nil else tostring(v5) else v5 else nil
    if v6 then
        v5 = u122[v6] or v6
        v1 = Icons.Units[v5] or Icons.Units[v5:gsub("_", " ")] or "rbxassetid://6877509129"
    else
        v1 = "rbxassetid://6877509129"
    end
    local TimeScale = useGameStateValue("TimeScale")
    v5, u98 = useSpring({start = 0, speed = 15, damper = 0.8})
    local u101, u102 = useBinding(-1)
    local v7, u106 = useSpring({start = 0, speed = 20, damping = 0.6})
    local v8, u110 = useSpring({start = 0, speed = 25, damping = 0.7})
    local v9 = {StartTick, TimeScale, Interval}
    useEffect(function() -- Line: 139
        -- upvalues: Interval (val), StartTick (val), RunService (upval), ServerTicks (upval), u101 (val), u110 (val)
        -- upvalues: u98 (val), u102 (val), u106 (val)
        if not Interval then
            return
        end
        local u3 = StartTick + Interval
        local u4 = 0
        local u10 = RunService.RenderStepped:Connect(function(a1) -- Line: 147
            -- upvalues: Interval (upval), u3 (val), ServerTicks (upval), u101 (upval), u110 (upval), u98 (upval)
            -- upvalues: u102 (upval), u4 (ref), u106 (upval)
            local v1 = (1 - (Interval - (u3 - ServerTicks.getTime())) / Interval % 1) * Interval
            local v2 = math.floor(v1)
            local v3 = 1 - v2 / Interval
            if u101:getValue() ~= v2 then
                u110({force = 8})
                u98({target = v3})
                u102(v2)
                u4 = v3
            end
            if v1 < 0.6 and u4 ~= 0 then
                u106({force = 8})
                u98({target = 0})
                u4 = 0
            end
        end)
        return function() -- Line: 173 -- upvalues: u10 (val)
            u10:Disconnect()
        end
    end, v9)
    return createElement(Container, {
        BackgroundTransparency = 0.4,
        CornerRadiusScale = 1,
        AspectRatio = 1,
        StrokeThickness = 3,
        StrokeTransparency = 0.2,
        Size = v7:map(function(a1) -- Line: 183
            return (UDim2.fromOffset(56, 56)) + UDim2.fromScale(a1, a1)
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        StrokeColor = Color3.new(),
        Transparency = a1.Transparency,
        Visible = a1.Transparency:map(function(a1) -- Line: 198
            return a1 < 0.99
        end),
    }, {
        iconImage = createElement(ImageLabel, {
            ZIndex = 3,
            CornerRadius = 10,
            Size = UDim2.fromScale(1.3, 1.3),
            Image = v1,
            Transparency = a1.Transparency,
        }),
        durationText = createElement(TextLabel, {
            ZIndex = 4,
            FontWeight = "Black",
            TextScaled = false,
            TextSize = 24,
            StrokeThickness = 2,
            StrokeTransparency = 0.2,
            Size = UDim2.new(0, 0, 0, 32),
            Position = v8:map(function(a1) -- Line: 214
                return UDim2.new(1, -8, 1 + a1, -8)
            end),
            Text = u101,
            Transparency = a1.Transparency,
        }),
        circularProgressFrame = createElement(Container, {Size = UDim2.new(1, 8, 1, 8)}, {
            leftCircularProgressFrame = createElement(Container, {
                ClipsDescendants = true,
                Size = UDim2.new(0.5, 1, 1, 0),
                Position = UDim2.fromScale(0, 0.5),
                AnchorPoint = Vector2.new(0, 0.5),
            }, {
                leftGradient = createElement(ImageLabel, {
                    Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
                    Size = UDim2.fromScale(2, 1),
                    Position = UDim2.fromScale(0, 0),
                    AnchorPoint = Vector2.new(0, 0),
                    ImageColor3 = v7:map(function(a1) -- Line: 247
                        return (Color3.fromRGB(85, 255, 127)):Lerp(Color3.fromRGB(255, 255, 255), a1 * 10)
                    end),
                    GradientTransparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.5, 1),
                        NumberSequenceKeypoint.new(0.501, 0),
                        (NumberSequenceKeypoint.new(1, 0)),
                    }),
                    GradientRotation = v5:map(function(a1) -- Line: 258
                        return 360 * -math.clamp(a1, 0, 0.499)
                    end),
                    Transparency = a1.Transparency,
                }),
            }),
            rightCircularProgressFrame = createElement(Container, {
                ClipsDescendants = true,
                Size = UDim2.new(0.5, 0, 1, 0),
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
            }, {
                rightGradient = createElement(ImageLabel, {
                    Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
                    Size = UDim2.fromScale(2, 1),
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    ImageColor3 = v7:map(function(a1) -- Line: 280
                        return (Color3.fromRGB(85, 255, 127)):Lerp(Color3.fromRGB(255, 255, 255), a1 * 10)
                    end),
                    GradientTransparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.5, 1),
                        NumberSequenceKeypoint.new(0.501, 0),
                        (NumberSequenceKeypoint.new(1, 0)),
                    }),
                    GradientRotation = v5:map(function(a1) -- Line: 291
                        return 360 * -(math.clamp(a1, 0.5, 1) - 0.5) + 180
                    end),
                    Transparency = a1.Transparency,
                }),
            }),
        }),
        tooltip = v4 and createElement(Tooltip, {
            Name = useMemo(function() -- Line: 178 -- upvalues: HttpService (upval)
                return HttpService:GenerateGUID()
            end, {}),
            Header = v4,
        }),
    })
end, function(a1, a2) -- Line: 306
    local v1 = false
    if a1.Name == a2.Name then
        v1 = false
        if a1.UnitName == a2.UnitName then
            v1 = false
            if a1.DisplayName == a2.DisplayName then
                v1 = false
                if a1.Interval == a2.Interval then
                    v1 = a1.StartTick == a2.StartTick
                end
            end
        end
    end
    return v1
end)
local u134 = React.memo(function(a1) -- Line: 314
    -- upvalues: useRef (val), useSpring (val), useGroupAnimation (val), useSequenceAnimation (val), Tween (val)
    -- upvalues: Spring (val), useAnimation (val), useEffect (val), useReactBindings (val), useMemo (val)
    -- upvalues: HttpService (val), createElement (val), Container (val), Button (val), React (val), ImageLabel (val)
    -- upvalues: TextLabel (val), Tooltip (val)
    local Locked = a1.Locked
    local Selected = a1.Selected
    local u5 = useRef(false)
    local v1, u9 = useSpring({start = 0, speed = 20, damping = 0.7})
    local v2, u18 = useSpring({speed = 30, damping = 0.6, start = if not Locked then 1 else 0})
    local v3, u104 = useGroupAnimation({
        enabled = useSequenceAnimation({
            {
                timestamp = 0,
                selectedTransparency = Tween({target = 0, delay = 0.4, info = TweenInfo.new(0.15)}),
                overlayTransparency = Tween({target = 0, info = TweenInfo.new(0.1)}),
                overlayIconSize = Spring({
                    speed = 18,
                    damper = 0.6,
                    start = UDim2.fromScale(0.3, 0.3),
                    target = UDim2.fromScale(0.7, 0.7),
                }),
                overlayIconPosition = Tween({
                    start = UDim2.fromScale(0.5, 0.8),
                    target = UDim2.fromScale(0.5, 0.5),
                    info = TweenInfo.new(0.15),
                }),
            },
            {
                timestamp = 0.35,
                overlayTransparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
                overlayIconPosition = Tween({target = UDim2.fromScale(0.5, 0.8), info = TweenInfo.new(0.3)}),
            },
        }),
        disabled = useAnimation({
            selectedTransparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
            overlayTransparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
        }),
    }, {
        overlayTransparency = 1,
        selectedTransparency = 1,
        overlayIconPosition = UDim2.fromScale(0.5, 0.5),
        overlayIconSize = UDim2.fromScale(0.65, 0.65),
    })
    local v4 = {Selected}
    useEffect(function() -- Line: 371 -- upvalues: u104 (val), Selected (val)
        u104(if not Selected then "disabled" else "enabled")
    end, v4)
    v4 = {Locked}
    useEffect(function() -- Line: 375 -- upvalues: u18 (val), Locked (val)
        u18({target = if not Locked then 1 else 0})
    end, v4)
    local v5 = useReactBindings
    v4 = {a1.TransitionProgress}
    v5(function(a1_2) -- Line: 379 -- upvalues: a1 (val), u5 (val), u9 (val)
        local TransitionPosition = a1.TransitionPosition
        if TransitionPosition < a1_2 and not u5.current then
            u9({force = 5})
            u5.current = true
            return
        end
        if a1_2 < TransitionPosition and u5.current then
            u5.current = false
        end
    end, v4)
    v5 = useMemo(function() -- Line: 389 -- upvalues: HttpService (upval)
        return HttpService:GenerateGUID()
    end, {})
    local v6 = {Size = UDim2.fromOffset(56, 56), LayoutOrder = a1.LayoutOrder}
    local v7 = {}
    local v8 = {
        Position = v1:map(function(a1) -- Line: 398
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromScale(0, a1)
        end),
        BackgroundColor3 = Color3.fromRGB(29, 29, 29),
        BackgroundTransparency = 0.25,
        CornerRadius = 8,
    }
    local v9 = Selected and Color3.new(1, 1, 1) or Color3.fromRGB(180, 180, 180)
    v8.StrokeColor = v9
    v8.StrokeThickness = if not Selected then 1 else 2
    v8.AutoButtonAnimate = true
    v8.HoverSizeScale = 1.1
    v8.DepressSizeScale = 0.9
    v8.Transparency = a1.Transparency
    v8.Visible = a1.Transparency:map(function(a1) -- Line: 415
        return a1 < 0.99
    end)
    v8.PressSound = "New Click"
    v8.HoverSound = "HoverHotbar"

    v8[React.Event.Activated] = function() -- Line: 422 -- upvalues: Locked (val), Selected (val), a1 (val), React (upval)
        if not Locked and not Selected then
            if a1[React.Event.Activated] then
                a1[React.Event.Activated]()
            end
            return
        end
    end

    v9 = {}
    local v10 = {
        CornerRadius = 8,
        Size = UDim2.fromScale(0.95, 0.95),
        Position = v2:map(function(a1) -- Line: 434
            return UDim2.fromScale(0.5, 0.5 - (1 - a1) * 0.2)
        end),
        Transparency = a1.Transparency,
    }
    local Icon_3 = typeof(a1.Icon) == "number" and ("rbxassetid://%*"):format(a1.Icon) or a1.Icon
    v10.Image = Icon_3
    v10.ImageTransparency = v2:map(function(a1) -- Line: 443
        return 1 - a1
    end)
    v9.iconLabel = createElement(ImageLabel, v10)
    v9.selectedStatusLabel = createElement(ImageLabel, {
        ZIndex = 3,
        Image = "rbxassetid://15303988233",
        Size = UDim2.fromOffset(24, 24),
        Position = v3.selectedTransparency:map(function(a1) -- Line: 450
            return UDim2.new(1, -4, a1 / 5 - 0.02, 0)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageTransparency = v3.selectedTransparency,
        Transparency = a1.Transparency,
        Visible = v3.selectedTransparency:map(function(a1) -- Line: 461
            return a1 < 0.99
        end),
    })
    v9.selectedOverlayFrame = createElement(Container, {
        ZIndex = 2,
        CornerRadius = 8,
        ClipsDescendants = true,
        BackgroundTransparency = v3.overlayTransparency:map(function(a1) -- Line: 468
            return 0.6 * a1 + 0.4
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Transparency = a1.Transparency,
        Visible = v3.overlayTransparency:map(function(a1) -- Line: 479
            return a1 < 0.99
        end),
    }, {
        selectedIcon = createElement(ImageLabel, {
            ZIndex = 3,
            Image = "rbxassetid://15303988233",
            Size = v3.overlayIconSize,
            Position = v3.overlayIconPosition,
            ImageTransparency = v3.overlayTransparency,
        }),
    })
    v9.lockOverlayFrame = createElement(Container, {
        ZIndex = 2,
        CornerRadius = 8,
        BackgroundTransparency = v2:map(function(a1) -- Line: 495
            return 0.4 * a1 + 0.6
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Transparency = a1.Transparency,
        Visible = v2:map(function(a1) -- Line: 504
            return a1 < 0.99
        end),
    }, {
        lockIcon = createElement(ImageLabel, {
            ZIndex = 3,
            Image = "rbxassetid://1197061307",
            Size = v2:map(function(a1) -- Line: 509
                local v1 = a1 / 5
                return UDim2.fromScale(0.65 + v1, 0.65 + v1)
            end),
            ImageTransparency = v2,
            Transparency = a1.Transparency,
        }),
    })
    v9.titleLabel = createElement(TextLabel, {
        ZIndex = 3,
        FontWeight = "Bold",
        StrokeThickness = 3,
        StrokeTransparency = 0.2,
        Size = UDim2.fromScale(1.2, 0.3),
        Position = UDim2.fromScale(0.5, 1),
        Text = a1.Title,
        StrokeColor = Color3.fromRGB(0, 0, 0),
        Transparency = a1.Transparency,
    })
    local Tooltip_2 = a1.Tooltip and createElement(Tooltip, {
        Name = v5,
        Header = a1.Tooltip.Header,
        Subject = a1.Tooltip.Subject,
        Content = a1.Tooltip.Content,
    })
    v9.tooltip = Tooltip_2
    v7.button = createElement(Button, v8, v9)
    return createElement(Container, v6, v7)
end, function(a1, a2) -- Line: 545
    local v1 = false
    if a1.Icon == a2.Icon then
        v1 = false
        if a1.Locked == a2.Locked then
            v1 = false
            if a1.Selected == a2.Selected then
                v1 = false
                if a1.LayoutOrder == a2.LayoutOrder then
                    v1 = false
                    if a1.Tooltip == a2.Tooltip then
                        v1 = false
                        if a1.TransitionProgress == a2.TransitionProgress then
                            v1 = a1.TransitionPosition == a2.TransitionPosition
                        end
                    end
                end
            end
        end
    end
    return v1
end)
local u138 = React.memo(function(a1) -- Line: 555
    -- upvalues: useUserSetting (val), useRef (val), useBinding (val), useViewportSize (val), useEffect (val)
    -- upvalues: TweenService (val), useSpring (val), useSound (val), useReactBindings (val), createElement (val)
    -- upvalues: u134 (val), React (val), Container (val), joinBindings (val), Button (val)
    local v1
    local u245 = useUserSetting("Show Tower Options", false)
    local u292 = useRef()
    local u9, u10 = useBinding(1)
    local u208, u14 = useBinding(0)
    local Options = a1.Options
    local v2 = Options and #Options or 0
    local u218 = (if not (v2 <= 0) then v2 * 56 + math.max(v2 - 1, 0) * 8 else 0) + 6
    local u428 = useRef()
    local u311, u35 = useBinding(false)
    local u38 = useRef(nil)
    local u41 = useRef(0)
    local u43 = useViewportSize()
    local v3 = {u43}
    useEffect(function() -- Line: 575 -- upvalues: u41 (val), u292 (val), u208 (val), u14 (val), u43 (val), u9 (val), u10 (val)
        local v1 = u41
        v1.current = v1.current + 1
        local current = u41.current
        task.defer(function() -- Line: 579
            -- upvalues: u41 (upval), current (val), u292 (upval), u208 (upval), u14 (upval), u43 (upval), u9 (upval)
            -- upvalues: u10 (upval)
            local v1
            if u41.current ~= current then
                return
            end
            if not u292.current then
                v1 = u14
                if 0 < math.abs((u208:getValue()) - 0) then
                    v1(0)
                end
                return
            end
            local v2 = u43.X - u292.current.AbsolutePosition.X
            v1 = u208:getValue()
            local v3 = if not (v1 > 0) then u9:getValue() else u292.current.AbsoluteSize.X / v1
            if v3 <= 0 or v3 ~= v3 then
                v3 = 1
            end
            local v4 = u10
            if 0.001 < math.abs((u9:getValue()) - v3) then
                v4(v3)
            end
            local v5 = math.max(v2, 0) / v3 - 10
            v4 = u208
            local v6 = u14
            local v7 = math.max(v5, 0)
            if 0.5 < math.abs((v4:getValue()) - v7) then
                v6(v7)
            end
        end)
    end, v3)
    local v4 = useEffect
    v3 = {a1.Selected, u218}
    v4(function() -- Line: 617 -- upvalues: u428 (val), a1 (val), u218 (val), u38 (val), TweenService (upval)
        local current = u428.current
        if not current then
            return
        end
        local v1 = a1.Options and #a1.Options or 0
        if v1 <= 0 then
            return
        end
        local v2 = u218
        local X = current.CanvasPosition.X
        local X_2 = current.AbsoluteSize.X
        local v3 = math.max(v2 - X_2, 0)
        if v3 <= 0 then
            return
        end
        local v4 = v2 / v1
        local v5 = math.clamp((a1.Selected - 1.3) * v4, 0, v3)
        local v6 = X + X_2
        local v7 = v5 + v4 * 1.3
        if X <= v5 and v7 <= v6 then
            return
        end
        if (math.abs(X - v5)) <= 1 then
            return
        end
        if u38.current then
            u38.current:Cancel()
            u38.current = nil
        end
        local u67 = TweenService:Create(current, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {CanvasPosition = Vector2.new(v5, 0)})
        local u68 = nil
        u68 = u67.Completed:Connect(function() -- Line: 663 -- upvalues: u68 (ref), u38 (upval), u67 (val)
            if u68 then
                u68:Disconnect()
            end
            if u38.current == u67 then
                u38.current = nil
            end
        end)
        u38.current = u67
        u67:Play()
        return function() -- Line: 676 -- upvalues: u68 (ref), u38 (upval), u67 (val)
            if u68 then
                u68:Disconnect()
            end
            if u38.current == u67 then
                u38.current = nil
            end
            u67:Cancel()
        end
    end, v3)
    local u240 = useRef({time = -1})
    local u250, u255 = useBinding(false)
    local u82, u83 = useSpring({start = 0, speed = 22, damping = 0.6})
    local u260 = useSound("Click", true)
    local v5 = {u245}
    useEffect(function() -- Line: 702 -- upvalues: u245 (val), u250 (val), u255 (val)
        if u245 and not u250:getValue() then
            u255(true)
        end
    end, v5)

    local function setShowOptions(a1) -- Line: 708 -- upvalues: u245 (val), u250 (val), u255 (val) -- types: a1: boolean
        if u245 then
            a1 = true
        end
        if u250:getValue() ~= a1 then
            u255(a1)
        end
    end

    local v6 = {u250}
    local v7 = {u245}
    useReactBindings(function(a1) -- Line: 718 -- upvalues: u83 (val), u245 (val)
        u83({target = if u245 then 1 else if not a1 then 0 else 1})
    end, v6, v7)
    v6 = {u208}
    v7 = {u218}
    useReactBindings(function(a1) -- Line: 724 -- upvalues: u218 (val), u311 (val), u35 (val)
        local v1 = a1 - 30 < u218
        if u311:getValue() ~= v1 then
            u35(v1)
        end
    end, v6, v7)
    local v8 = {}
    if a1.Options then
        local Name
        for k, v in pairs(a1.Options) do
            Name = v.Name
            v1 = {
                LayoutOrder = k,
                Locked = if v.Locked == nil then a1.Level < v.Level else v.Locked,
                Selected = a1.Selected == k,
                Icon = v.Icon,
                Title = not a1.HideOptionNames and v.Name,
                Tooltip = v.Tooltip,
                TransitionProgress = u82,
                TransitionPosition = (k - 0.5) / #a1.Options,
                Transparency = a1.Transparency,
            }

            v1[React.Event.Activated] = function() -- Line: 752 -- upvalues: a1 (val), k (val), v (val)
                if a1.OnSelected then
                    a1.OnSelected(k, v)
                end
            end

            v8[Name] = (createElement(u134, v1))
        end
    end
    v5 = createElement
    v6 = Container
    local v9 = {}
    local v10 = createElement
    local v11 = Container
    local v12 = {
        Size = (joinBindings({u208, u82})):map(function(a1) -- Line: 766 -- upvalues: u218 (val)
            local v1 = math.max(a1[1] - 30, 0)
            local v2 = a1[2]
            local v3 = math.min(v1, u218 + 7) * v2
            local v4 = 13 + (1 - v2) * 6
            local v5 = 8 * v2
            local v6 = v4 + v3 + v5
            v6 = if not (v2 > 0.01) then v6 - 8 else v6 + 18
            return UDim2.new(1, v6, 1.25, 0)
        end),
        Position = UDim2.fromScale(-0.05, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        Active = true,
        Selectable = false,
    }

    v12[React.Event.MouseEnter] = function() -- Line: 789 -- upvalues: u82 (val), u240 (val), u245 (val), u250 (val), u255 (val), u260 (val)
        local v1 = u82:getValue()
        if v1 > 0.01 and v1 < 0.99 then
            return
        end
        if u240.current.type == "manual" then
            return
        end
        u240.current = {type = "auto", time = tick()}
        if not u245 then
            local v2 = true
            if u245 then
                v2 = true
            end
            if u250:getValue() ~= v2 then
                u255(v2)
            end
            u260()
        end
    end

    v12[React.Event.MouseLeave] = function() -- Line: 810 -- upvalues: u240 (val), u245 (val), u250 (val), u255 (val)
        local time = u240.current.time
        task.wait(2)
        if u240.current.type == "auto" and u240.current.time == time then
            local v1 = false
            if u245 then
                v1 = true
            end
            if u250:getValue() ~= v1 then
                u255(v1)
            end
        end
    end

    v9.expandingFrameHitbox = v10(v11, v12)
    v10 = createElement
    v11 = Container
    v12 = {
        Size = u208:map(function(a1) -- Line: 824
            return UDim2.new(0, a1, 1, 0)
        end),
        Position = UDim2.new(1, 0, 0, 0),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        reference = u292,
    }
    local v13 = {
        uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 10)}),
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = u311:map(function(a1) -- Line: 840
                return a1 and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Center
            end),
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = u82:map(function(a1) -- Line: 847
                return UDim.new(0, 8 * a1)
            end),
        }),
    }
    v1 = createElement
    local v14 = Button
    local v15 = {
        Size = u82:map(function(a1) -- Line: 853
            return UDim2.new(0, 13 + (1 - a1) * 6, 1, 0)
        end),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 0.5,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = u82:map(function(a1) -- Line: 862
            if a1 > 0.01 then
                return 2
            end
            return 0
        end),
        Image = "rbxassetid://18961120434",
        ImageSize = UDim2.fromScale(0.5, 0.18),
        ImageScaleType = Enum.ScaleType.Fit,
        ImageRotation = u82:map(function(a1) -- Line: 869
            return 180 * a1
        end),
        CornerRadius = u82:map(function(a1) -- Line: 873
            if a1 > 0.01 then
                return 4
            end
            return 5
        end),
        Transparency = a1.Transparency,
        AutoButtonAnimate = true,
        PressSound = "Click",
        HoverSound = "HoverHotbar",
        Visible = not u245,
    }

    v15[React.Event.Activated] = function() -- Line: 885 -- upvalues: u245 (val), u250 (val), u255 (val), u240 (val)
        local v1
        if not u245 and not u250:getValue() then
            v1 = true
            if u245 then
                v1 = true
            end
            if u250:getValue() ~= v1 then
                u255(v1)
            end
            u240.current = {type = "manual", time = tick()}
            return
        end
        v1 = false
        if u245 then
            v1 = true
        end
        if u250:getValue() ~= v1 then
            u255(v1)
        end
        u240.current = {time = -1}
    end

    v13.expandButton = v1(v14, v15)
    v13.choicesFrame = createElement(Container, {
        LayoutOrder = 1,
        Size = (joinBindings({u208, u82})):map(function(a1) -- Line: 906 -- upvalues: u218 (val)
            return UDim2.new(0, math.min(math.max(a1[1] - 30, 0), u218 + 7) * a1[2], 0.8, 0)
        end),
        Visible = u82:map(function(a1) -- Line: 917
            return a1 > 0.01
        end),
    }, {
        scrollingFrame = createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 6,
            Size = UDim2.fromScale(1, 1.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            CanvasSize = UDim2.new(0, u218, 1, 0),
            ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
            ScrollBarImageTransparency = joinBindings({a1.Transparency, u311}):map(function(a1) -- Line: 937
                local v1 = a1[1]
                return (if not a1[2] then 1 else 0) + (v1 or 0)
            end),
            ref = u428,
        }, {
            uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 3), PaddingRight = UDim.new(0, 3)}),
            uiListLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8),
            }),
            selectionButtons = createElement(React.Fragment, {}, v8),
        }),
    })
    v9.expandingFrame = v10(v11, v12, v13)
    return v5(v6, {}, v9)
end, function(a1, a2) -- Line: 964 -- upvalues: table (val)
    local v1 = false
    if a1.Level == a2.Level then
        v1 = false
        if a1.Selected == a2.Selected then
            v1 = false
            if a1.HideOptionNames == a2.HideOptionNames then
                v1 = false
                if a1.Transparency == a2.Transparency then
                    v1 = table.deepCompare(a1.Options or {}, a2.Options or {})
                end
            end
        end
    end
    return v1
end)
local u142 = React.memo(function(a1) -- Line: 972
    -- upvalues: useSpring (val), useEffect (val), useGameStateValue (val), useBinding (val), RunService (val)
    -- upvalues: ServerTicks (val), createElement (val), Container (val), joinBindings (val), ImageLabel (val)
    -- upvalues: TextLabel (val), u138 (val)
    local Options = a1.Options
    if Options then
        Options = a1.Options[a1.Selected]
    end
    local v1, u8 = useSpring({start = 0, speed = 25, damping = 0.7})
    local v2 = {a1.Selected, Options and Options.Name}
    useEffect(function() -- Line: 979 -- upvalues: Options (val), u8 (val)
        if Options then
            u8({force = 15})
        end
    end, v2)
    local Interval = a1.Interval
    local u26 = a1.StartTick or 0
    local TimeScale = useGameStateValue("TimeScale")
    local v3, u33 = useSpring({start = 0, speed = 15, damper = 0.7})
    local u36, u37 = useBinding(-1)
    local v4, u41 = useSpring({start = 0, speed = 20, damping = 0.6})
    local v5, u45 = useSpring({start = 0, speed = 25, damping = 0.7})
    local v6 = {u26, TimeScale, Interval}
    useEffect(function() -- Line: 1000
        -- upvalues: Interval (val), u26 (val), RunService (upval), ServerTicks (upval), u36 (val), u45 (val), u33 (val)
        -- upvalues: u37 (val), u41 (val)
        if not Interval then
            return
        end
        local u3 = u26 + Interval
        local u4 = 0
        local u10 = RunService.RenderStepped:Connect(function(a1) -- Line: 1008
            -- upvalues: Interval (upval), u3 (val), ServerTicks (upval), u36 (upval), u45 (upval), u33 (upval)
            -- upvalues: u37 (upval), u4 (ref), u41 (upval)
            local v1 = (1 - (Interval - (u3 - ServerTicks.getTime())) / Interval % 1) * Interval
            local v2 = math.floor(v1)
            local v3 = 1 - v2 / Interval
            if u36:getValue() ~= v2 then
                u45({force = 8})
                u33({target = v3})
                u37(v2)
                u4 = v3
            end
            if v1 < 0.6 and u4 ~= 0 then
                u41({force = 8})
                u33({target = 0})
                u4 = 0
            end
        end)
        return function() -- Line: 1034 -- upvalues: u37 (upval), u33 (upval), u10 (val)
            u37(-1)
            u33({target = 0})
            u10:Disconnect()
        end
    end, v6)
    local v7, u56 = useSpring({start = 0, speed = 30, damping = 0.7})
    useEffect(function() -- Line: 1044 -- upvalues: u56 (val)
        u56({target = 1})
    end, {})
    local v8 = {
        BackgroundTransparency = 0.5,
        CornerRadius = 8,
        AspectRatio = 1,
        Size = joinBindings({v4, v7}):map(function(a1) -- Line: 1049
            local v1 = a1[1]
            local v2 = a1[2]
            return (UDim2.fromOffset(64 * v2, 64 * v2)) + UDim2.fromScale(v1, v1)
        end),
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        LayoutOrder = a1.LayoutOrder,
        Transparency = a1.Transparency,
        Visible = a1.Transparency:map(function(a1) -- Line: 1063
            return a1 < 0.99
        end),
    }
    local v9 = {
        progressGradientFrame = createElement(Container, {
            CornerRadius = 8,
            StrokeThickness = 4,
            StrokeTransparency = 0,
            StrokeGradientRotation = 90,
            Size = UDim2.new(1, -2, 1, -2),
            StrokeColor = v4:map(function(a1) -- Line: 1071
                return (Color3.fromRGB(85, 255, 127)):Lerp(Color3.fromRGB(255, 255, 255), a1 * 10)
            end),
            StrokeGradientOffset = v3:map(function(a1) -- Line: 1077
                return Vector2.new(0, a1 - 0.5)
            end),
            StrokeGradientColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.505, Color3.fromRGB(0, 0, 0)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            }),
            StrokeGradientTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.505, 0.4),
                (NumberSequenceKeypoint.new(1, 0.4)),
            }),
            Transparency = a1.Transparency,
        }),
    }
    local v10 = {
        CornerRadius = 8,
        Size = joinBindings({v1, v4}):map(function(a1) -- Line: 1098
            local v1 = (-a1[1] + a1[2]) * 1.2
            return (UDim2.fromScale(0.95, 0.95)) + UDim2.fromScale(v1, v1)
        end),
    }
    local v11 = Options and ("rbxassetid://%*"):format(Options.Icon) or ""
    v10.Image = v11
    v10.ImageTransparency = v1:map(function(a1) -- Line: 1104
        return a1 * 3
    end)
    v10.Transparency = a1.Transparency
    v9.iconLabel = createElement(ImageLabel, v10)
    local v12 = not a1.HideSelectedName
    if v12 then
        v10 = {
            ZIndex = 3,
            FontWeight = "Black",
            StrokeThickness = 3,
            StrokeTransparency = 0.2,
            Size = UDim2.fromScale(1.2, 0.3),
            Position = v1:map(function(a1) -- Line: 1114
                return UDim2.fromScale(0.5, 1 + a1 / 1.3)
            end),
        }
        local Name_2 = Options and Options.Name or a1.Title
        v10.Text = Name_2
        v10.Transparency = a1.Transparency
        v12 = createElement(TextLabel, v10)
    end
    v9.titleText = v12
    local HideSelectedName = a1.HideSelectedName and createElement(TextLabel, {
        ZIndex = 3,
        FontWeight = "Black",
        TextScaled = false,
        TextSize = 24,
        StrokeThickness = 2,
        StrokeTransparency = 0.2,
        Size = UDim2.fromScale(1, 0.3),
        Position = joinBindings({v1, v5}):map(function(a1) -- Line: 1131
            return UDim2.fromScale(0.5, 0.98 + (a1[1] + a1[2]) / 1.3)
        end),
        Text = u36,
        Transparency = a1.Transparency,
    })
    v9.durationText = HideSelectedName
    local Options_2 = a1.Options and createElement(u138, {
        Level = a1.Level,
        Selected = a1.Selected,
        Options = a1.Options,
        HideOptionNames = a1.HideOptionNames,
        Transparency = a1.Transparency,
        OnSelected = a1.OnSelected,
    })
    v9.selectionGroup = Options_2
    return createElement(Container, v8, v9)
end, function(a1, a2) -- Line: 1161 -- upvalues: table (val)
    local v1 = false
    if a1.Level == a2.Level then
        v1 = false
        if a1.Name == a2.Name then
            v1 = false
            if a1.LayoutOrder == a2.LayoutOrder then
                v1 = false
                if a1.Selected == a2.Selected then
                    v1 = false
                    if a1.Interval == a2.Interval then
                        v1 = false
                        if a1.StartTick == a2.StartTick then
                            if a1.Options == a2.Options then
                                v1 = false
                                if a1.HideSelectedName == a2.HideSelectedName then
                                    v1 = a1.HideOptionNames == a2.HideOptionNames
                                end
                            else
                                v1 = table.deepCompare(a1.Options or {}, a2.Options or {})
                                if v1 then
                                    v1 = false
                                    if a1.HideSelectedName == a2.HideSelectedName then
                                        v1 = a1.HideOptionNames == a2.HideOptionNames
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
local u146 = React.memo(function(a1) -- Line: 1176
    -- upvalues: useSpring (val), useEffect (val), useGameStateValue (val), useBinding (val), RunService (val)
    -- upvalues: ServerTicks (val), createElement (val), Container (val), joinBindings (val), ImageLabel (val)
    -- upvalues: TextLabel (val), u138 (val)
    local Options = a1.Options
    if Options then
        Options = a1.Options[a1.Selected]
    end
    local v1, u8 = useSpring({start = 0, speed = 25, damping = 0.7})
    local v2 = {a1.Selected, Options and Options.Name}
    useEffect(function() -- Line: 1183 -- upvalues: Options (val), u8 (val)
        if Options then
            u8({force = 15})
        end
    end, v2)
    local Interval = a1.Interval
    local u26 = a1.StartTick or 0
    local TimeScale = useGameStateValue("TimeScale")
    local v3, u33 = useSpring({start = 0, speed = 15, damper = 0.7})
    local u36, u37 = useBinding(-1)
    local v4, u41 = useSpring({start = 0, speed = 20, damping = 0.6})
    local v5, u45 = useSpring({start = 0, speed = 25, damping = 0.7})
    local v6 = {u26, TimeScale, Interval}
    useEffect(function() -- Line: 1204
        -- upvalues: Interval (val), u26 (val), RunService (upval), ServerTicks (upval), u36 (val), u45 (val), u33 (val)
        -- upvalues: u37 (val), u41 (val)
        if not Interval then
            return
        end
        local u3 = u26 + Interval
        local u4 = 0
        local u10 = RunService.RenderStepped:Connect(function(a1) -- Line: 1212
            -- upvalues: Interval (upval), u3 (val), ServerTicks (upval), u36 (upval), u45 (upval), u33 (upval)
            -- upvalues: u37 (upval), u4 (ref), u41 (upval)
            local v1 = (1 - (Interval - (u3 - ServerTicks.getTime())) / Interval % 1) * Interval
            local v2 = math.floor(v1)
            local v3 = 1 - v2 / Interval
            if u36:getValue() ~= v2 then
                u45({force = 8})
                u33({target = v3})
                u37(v2)
                u4 = v3
            end
            if v1 < 0.6 and u4 ~= 0 then
                u41({force = 8})
                u33({target = 0})
                u4 = 0
            end
        end)
        return function() -- Line: 1238 -- upvalues: u37 (upval), u33 (upval), u10 (val)
            u37(-1)
            u33({target = 0})
            u10:Disconnect()
        end
    end, v6)
    local v7, u56 = useSpring({start = 0, speed = 30, damping = 0.7})
    useEffect(function() -- Line: 1248 -- upvalues: u56 (val)
        u56({target = 1})
    end, {})
    local v8 = {
        BackgroundTransparency = 0.5,
        CornerRadius = 8,
        AspectRatio = 1,
        Size = joinBindings({v4, v7}):map(function(a1) -- Line: 1253
            local v1 = a1[1]
            local v2 = a1[2]
            return (UDim2.fromOffset(64 * v2, 64 * v2)) + UDim2.fromScale(v1, v1)
        end),
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        LayoutOrder = a1.LayoutOrder,
        Transparency = a1.Transparency,
        Visible = a1.Transparency:map(function(a1) -- Line: 1267
            return a1 < 0.99
        end),
    }
    local v9 = {
        progressGradientFrame = createElement(Container, {
            CornerRadius = 8,
            StrokeThickness = 4,
            StrokeTransparency = 0,
            StrokeGradientRotation = 90,
            Size = UDim2.new(1, -2, 1, -2),
            StrokeColor = v4:map(function(a1) -- Line: 1275
                return (Color3.fromRGB(85, 255, 127)):Lerp(Color3.fromRGB(255, 255, 255), a1 * 10)
            end),
            StrokeGradientOffset = v3:map(function(a1) -- Line: 1281
                return Vector2.new(0, a1 - 0.5)
            end),
            StrokeGradientColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.505, Color3.fromRGB(0, 0, 0)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            }),
            StrokeGradientTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.505, 0.4),
                (NumberSequenceKeypoint.new(1, 0.4)),
            }),
            Transparency = a1.Transparency,
        }),
    }
    local v10 = {
        CornerRadius = 8,
        Size = v1:map(function(a1) -- Line: 1302
            return (UDim2.fromScale(0.95, 0.95)) + UDim2.fromScale(a1, a1)
        end),
    }
    local v11 = Options and ("rbxassetid://%*"):format(Options.Icon) or ""
    v10.Image = v11
    v10.ImageTransparency = v1:map(function(a1) -- Line: 1307
        return a1 * 3
    end)
    v10.Transparency = a1.Transparency
    v9.iconLabel = createElement(ImageLabel, v10)
    v10 = {
        ZIndex = 3,
        FontWeight = "Black",
        StrokeThickness = 3,
        StrokeTransparency = 0.2,
        Size = UDim2.fromScale(1.2, 0.3),
        Position = v1:map(function(a1) -- Line: 1317
            return UDim2.fromScale(0.5, 1 + a1 / 1.3)
        end),
    }
    local Name_2 = Options and Options.Name or a1.Title
    v10.Text = Name_2
    v10.Transparency = a1.Transparency
    v10.Visible = u36:map(function(a1_2) -- Line: 1331 -- upvalues: a1 (val)
        return not a1.HideSelectedName and a1_2 <= -1
    end)
    v9.titleText = createElement(TextLabel, v10)
    v9.durationText = createElement(TextLabel, {
        ZIndex = 3,
        FontWeight = "Black",
        TextScaled = false,
        TextSize = 24,
        StrokeThickness = 2,
        StrokeTransparency = 0.2,
        Size = UDim2.fromScale(1, 0.3),
        Position = joinBindings({v1, v5}):map(function(a1) -- Line: 1339
            return UDim2.fromScale(0.5, 0.98 + (a1[1] / 2 + a1[2]) / 1.3)
        end),
        Text = u36,
        Transparency = a1.Transparency,
        Visible = u36:map(function(a1_2) -- Line: 1356 -- upvalues: a1 (val)
            return a1.HideSelectedName or a1_2 > -1
        end),
    })
    local Options_2 = a1.Options and createElement(u138, {
        Level = a1.Level,
        Selected = a1.Selected,
        Options = a1.Options,
        HideOptionNames = a1.HideOptionNames,
        Transparency = a1.Transparency,
        OnSelected = a1.OnSelected,
    })
    v9.selectionGroup = Options_2
    return createElement(Container, v8, v9)
end, function(a1, a2) -- Line: 1372 -- upvalues: table (val)
    local v1 = false
    if a1.Level == a2.Level then
        v1 = false
        if a1.Name == a2.Name then
            v1 = false
            if a1.LayoutOrder == a2.LayoutOrder then
                v1 = false
                if a1.Selected == a2.Selected then
                    v1 = false
                    if a2.Interval == a1.Interval then
                        v1 = false
                        if a2.StartTick == a1.StartTick then
                            if a1.Options == a2.Options then
                                v1 = false
                                if a1.HideSelectedName == a2.HideSelectedName then
                                    v1 = a1.HideOptionNames == a2.HideOptionNames
                                end
                            else
                                v1 = table.deepCompare(a1.Options or {}, a2.Options or {})
                                if v1 then
                                    v1 = false
                                    if a1.HideSelectedName == a2.HideSelectedName then
                                        v1 = a1.HideOptionNames == a2.HideOptionNames
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
local u150 = React.memo(function(a1) -- Line: 1387
    -- upvalues: useSpring (val), useEffect (val), createElement (val), Container (val), Ability (val), u138 (val)
    local Options = a1.Options
    if Options then
        Options = a1.Options[a1.Selected]
    end
    local v1, u8 = useSpring({start = 0, speed = 25, damping = 0.7})
    local v2 = {a1.Selected, Options and Options.Name}
    useEffect(function() -- Line: 1394 -- upvalues: Options (val), u8 (val)
        if Options then
            u8({force = 15})
        end
    end, v2)
    local v3, u26 = useSpring({start = 0, speed = 30, damping = 0.7})
    useEffect(function() -- Line: 1403 -- upvalues: u26 (val)
        u26({target = 1})
    end, {})
    local v4 = {
        BackgroundTransparency = 1,
        CornerRadius = 8,
        Size = v3:map(function(a1) -- Line: 1408
            return UDim2.fromOffset(64 * a1, 92 * a1)
        end),
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        LayoutOrder = a1.LayoutOrder,
        Scale = v3,
        Visible = a1.Transparency:map(function(a1) -- Line: 1422
            return a1 < 0.99
        end),
    }
    local v5 = {}
    local v6 = {
        DisableOnGameState = true,
        Size = UDim2.fromOffset(66, 66),
        Position = v1:map(function(a1) -- Line: 1428
            return (UDim2.new(0.5, 0, 0, 32)) + UDim2.fromScale(0, a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Name = a1.Name,
        DisplayName = a1.DisplayName,
        Description = a1.Description,
        TowerName = a1.TowerName,
        TowerDisplayName = a1.TowerDisplayName,
        Model = a1.Model,
    }
    local Icon = Options and Options.Icon or a1.Icon
    v6.Icon = Icon
    v6.Price = a1.Price
    v6.ForcedLocked = a1.ForcedLocked
    v6.CoolDown = a1.CoolDown
    v6.Callback = a1.OnActivated
    v6.TransparencyModifier = a1.Transparency
    v5.abilityButton = createElement(Ability, v6)
    local Options_2 = a1.Options and createElement(u138, {
        Level = a1.Level,
        Selected = a1.Selected,
        Options = a1.Options,
        HideOptionNames = a1.HideOptionNames,
        Transparency = a1.Transparency,
        OnSelected = a1.OnSelected,
    })
    v5.selectionGroup = Options_2
    return createElement(Container, v4, v5)
end, function(a1, a2) -- Line: 1462 -- upvalues: table (val)
    local v1 = false
    if a1.Level == a2.Level then
        v1 = false
        if a1.Selected == a2.Selected then
            v1 = false
            if a1.LayoutOrder == a2.LayoutOrder then
                v1 = false
                if a1.Icon == a2.Icon then
                    v1 = false
                    if a1.CoolDown == a2.CoolDown then
                        v1 = false
                        if a1.Price == a2.Price then
                            v1 = false
                            if a1.Model == a2.Model then
                                v1 = false
                                if a1.Name == a2.Name then
                                    v1 = false
                                    if a1.DisplayName == a2.DisplayName then
                                        v1 = false
                                        if a1.Description == a2.Description then
                                            v1 = false
                                            if a1.TowerName == a2.TowerName then
                                                v1 = false
                                                if a1.TowerDisplayName == a2.TowerDisplayName then
                                                    v1 = false
                                                    if a1.ForcedLocked == a2.ForcedLocked then
                                                        if a1.Options == a2.Options then
                                                            v1 = a1.HideOptionNames == a2.HideOptionNames
                                                        else
                                                            local deepCompare = table.deepCompare
                                                            local Options = a1.Options or {}
                                                            local Options_2 = a2.Options or {}
                                                            v1 = deepCompare(Options, Options_2) and a1.HideOptionNames == a2.HideOptionNames
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
local u153 = React.memo(function(a1) -- Line: 1484 -- upvalues: createElement (val), u130 (val), React (val)
    local v1 = {}
    for k, v in pairs(a1.Units) do
        v1[v.Name or k] = (createElement(u130, {
            Name = v.Name,
            UnitName = v.UnitName,
            DisplayName = v.DisplayName,
            Interval = v.Interval,
            StartTick = v.StartTick,
            Transparency = a1.Transparency,
        }))
    end
    return createElement(React.Fragment, {}, v1)
end)
local u157 = React.memo(function(a1) -- Line: 1503
    -- upvalues: useGameStateValue (val), useSpring (val), useBinding (val), useEffect (val), RunService (val)
    -- upvalues: ServerTicks (val), createElement (val), AbilityAmmo (val)
    local TimeScale = useGameStateValue("TimeScale")
    local v1, u7 = useSpring({start = 0, speed = 15, damper = 0.7})
    local u10, u11 = useBinding(-1)
    local v2, u15 = useSpring({start = 0, speed = 20, damping = 0.6})
    local v3, u19 = useSpring({start = 0, speed = 25, damping = 0.7})
    local Interval = a1.Interval
    local u22 = a1.StartTick or 0
    local u24 = a1.Ammo or 0
    local u26 = a1.MaxAmmo or 0
    local v4 = {u24, u26, u22, TimeScale, Interval}
    useEffect(function() -- Line: 1520
        -- upvalues: Interval (val), u24 (val), u26 (val), u11 (val), u7 (val), u22 (val), RunService (upval)
        -- upvalues: ServerTicks (upval), u10 (val), u19 (val), u15 (val)
        if Interval and not (u26 <= u24) then
            local u5 = u22 + Interval
            local u6 = 0
            local u7_2 = nil
            u7_2 = RunService.RenderStepped:Connect(function(a1) -- Line: 1531
                -- upvalues: u24 (upval), u26 (upval), u7_2 (ref), Interval (upval), u5 (val), ServerTicks (upval)
                -- upvalues: u10 (upval), u19 (upval), u7 (upval), u11 (upval), u6 (ref), u15 (upval)
                if u26 <= u24 then
                    u7_2:Disconnect()
                    return
                end
                local v1 = (1 - (Interval - (u5 - ServerTicks.getTime())) / Interval % 1) * Interval
                local v2 = math.floor(v1)
                local v3 = 1 - v2 / Interval
                if u10:getValue() ~= v2 then
                    u19({force = 8})
                    u7({target = v3})
                    u11(v2)
                    u6 = v3
                end
                if v1 < 0.6 and u6 ~= 0 then
                    u15({force = 15})
                    u7({target = 0})
                    u6 = 0
                end
            end)
            return function() -- Line: 1561 -- upvalues: u15 (upval), u7 (upval), u11 (upval), u7_2 (ref)
                u15({force = 15})
                u7({target = 0})
                u11(-1)
                u7({target = 0})
                u7_2:Disconnect()
            end
        end
        u11(-1)
        u7({target = 0})
    end, v4)
    return createElement(AbilityAmmo, {
        Ammo = u24,
        MaxAmmo = u26,
        ProgressPercent = v1,
        TimeLeft = u10,
        Icon = a1.Icon,
        Name = a1.Name,
        DisplayName = a1.DisplayName,
        Description = a1.Description,
        TowerName = a1.TowerName,
        TowerDisplayName = a1.TowerDisplayName,
        Model = a1.Model,
        Transparency = a1.Transparency,
        OnSelected = a1.OnSelected,
        ForcedLocked = a1.ForcedLocked,
        OnActivated = function(...) -- Line: 1586 -- upvalues: u24 (val), u15 (val), a1 (val)
            if not (u24 <= 0) then
                return a1.OnActivated(...)
            end
            u15({force = 15})
            return false
        end,
        bounceSpring = v2,
        durationBounceSpring = v3,
    })
end, function(a1, a2) -- Line: 1597
    local v1 = false
    if a1.Ammo == a2.Ammo then
        v1 = false
        if a1.MaxAmmo == a2.MaxAmmo then
            v1 = false
            if a1.LayoutOrder == a2.LayoutOrder then
                v1 = false
                if a1.Interval == a2.Interval then
                    v1 = false
                    if a1.StartTick == a2.StartTick then
                        v1 = false
                        if a1.DisplayName == a2.DisplayName then
                            v1 = false
                            if a1.Description == a2.Description then
                                v1 = false
                                if a1.TowerName == a2.TowerName then
                                    v1 = false
                                    if a1.TowerDisplayName == a2.TowerDisplayName then
                                        v1 = a1.ForcedLocked == a2.ForcedLocked
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

local function u158(a1) -- Line: 1610 -- upvalues: createElement (val), u157 (val), u150 (val), React (val)
    local v1 = {}
    local v2 = pairs
    local Abilities = a1.Abilities or {}
    for k, v in v2(Abilities) do
        if not v.Ammo then
            v1[v.Name or k] = (createElement(u150, {
                Level = v.Level,
                Selected = v.Selected,
                LayoutOrder = v.LayoutOrder,
                Icon = v.Icon,
                Name = v.Name,
                DisplayName = v.DisplayName,
                Description = v.Description,
                TowerName = a1.TowerName,
                TowerDisplayName = a1.TowerDisplayName,
                Model = v.Model,
                Price = v.Price,
                CoolDown = v.CoolDown,
                ForcedLocked = v.ForcedLocked,
                Options = v.Options,
                HideOptionNames = v.HideOptionNames,
                OnSelected = v.OnSelected,
                OnActivated = v.OnActivated,
                Transparency = a1.Transparency,
            }))
        else
            v1[v.Name or k] = (createElement(u157, {
                Level = v.Level,
                Selected = v.Selected,
                LayoutOrder = v.LayoutOrder,
                Ammo = v.Ammo,
                MaxAmmo = v.MaxAmmo,
                Interval = v.Interval,
                StartTick = v.StartTick,
                Icon = v.Icon,
                Name = v.Name,
                DisplayName = v.DisplayName,
                Description = v.Description,
                TowerName = a1.TowerName,
                TowerDisplayName = a1.TowerDisplayName,
                Model = v.Model,
                Price = v.Price,
                CoolDown = v.CoolDown,
                ForcedLocked = v.ForcedLocked,
                Options = v.Options,
                HideOptionNames = v.HideOptionNames,
                OnSelected = v.OnSelected,
                OnActivated = v.OnActivated,
                Transparency = a1.Transparency,
            }))
        end
    end
    return createElement(React.Fragment, {}, v1)
end

local function u159(a1) -- Line: 1676 -- upvalues: createElement (val), u146 (val), React (val)
    local v1 = {}
    local v2 = pairs
    local Powers = a1.Powers or {}
    for k, v in v2(Powers) do
        v1[v.Name or k] = (createElement(u146, {
            Level = v.Level,
            Name = v.Name,
            LayoutOrder = v.LayoutOrder,
            Interval = v.Interval,
            StartTick = v.StartTick,
            Selected = v.Selected,
            HideSelectedName = v.HideSelectedName,
            Options = v.Options,
            HideOptionNames = v.HideOptionNames,
            Title = v.Title,
            Tooltip = v.Tooltip,
            OnSelected = v.OnSelected,
            Transparency = a1.Transparency,
        }))
    end
    return createElement(React.Fragment, {}, v1)
end

local function u160(a1) -- Line: 1705 -- upvalues: createElement (val), u142 (val), React (val)
    local v1 = {}
    local v2 = pairs
    local UnitSelectors = a1.UnitSelectors or {}
    for k, v in v2(UnitSelectors) do
        v1[v.Name or k] = (createElement(u142, {
            Level = v.Level,
            Name = v.Name,
            LayoutOrder = v.LayoutOrder,
            Interval = v.Interval,
            StartTick = v.StartTick,
            Selected = v.Selected,
            HideSelectedName = v.HideSelectedName,
            Options = v.Options,
            HideOptionNames = v.HideOptionNames,
            Title = v.Title,
            Tooltip = v.Tooltip,
            OnSelected = v.OnSelected,
            Transparency = a1.Transparency,
        }))
    end
    return createElement(React.Fragment, {}, v1)
end

return React.memo(function(a1) -- Line: 1735
    -- upvalues: useSpring (val), useTransparencyModifier (val), useReactBindings (val), createElement (val)
    -- upvalues: Container (val), u153 (val), u158 (val), u159 (val), u160 (val)
    local TowerActions = a1.TowerActions or {}
    local v1, u13 = useSpring({speed = 25, damping = 0.7, start = if not a1.Visible then 1 else 0})
    local v2 = useTransparencyModifier(a1.Transparency)(v1)
    local v3 = useReactBindings
    local v4 = {a1.Faded}
    v3(function(a1) -- Line: 1748 -- upvalues: u13 (val) -- types: a1: boolean
        u13({target = if not a1 then 0 else 0.8})
    end, v4)
    v4 = {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
    }
    local v5 = {
        uiListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 16),
        }),
    }
    local v6 = {}
    local UnitIndicators = TowerActions.UnitIndicators or {}
    v6.Units = UnitIndicators
    v6.Transparency = v2
    v5.basicUnitIndicators = createElement(u153, v6)
    v6 = {}
    local Abilities = TowerActions.Abilities or {}
    v6.Abilities = Abilities
    v6.TowerName = a1.TowerName
    v6.TowerDisplayName = a1.TowerDisplayName
    v6.Transparency = v2
    v5.abilityButtons = createElement(u158, v6)
    v6 = {}
    local Powers = TowerActions.Powers or {}
    v6.Powers = Powers
    v6.Transparency = v2
    v5.powerSelectors = createElement(u159, v6)
    v6 = {}
    local UnitSelectors = TowerActions.UnitSelectors or {}
    v6.UnitSelectors = UnitSelectors
    v6.Transparency = v2
    v5.unitSelectors = createElement(u160, v6)
    return createElement(Container, v4, v5)
end, function(a1, a2) -- Line: 1791
    local v1 = false
    if a1.Size == a2.Size then
        v1 = false
        if a1.Position == a2.Position then
            v1 = false
            if a1.AnchorPoint == a2.AnchorPoint then
                v1 = false
                if a1.LayoutOrder == a2.LayoutOrder then
                    v1 = false
                    if a1.Visible == a2.Visible then
                        v1 = false
                        if a1.Faded == a2.Faded then
                            v1 = false
                            if a1.Transparency == a2.Transparency then
                                v1 = false
                                if a1.TowerName == a2.TowerName then
                                    v1 = false
                                    if a1.TowerDisplayName == a2.TowerDisplayName then
                                        v1 = a1.TowerActions == a2.TowerActions
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