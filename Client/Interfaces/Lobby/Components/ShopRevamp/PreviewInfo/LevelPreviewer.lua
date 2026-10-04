-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.PreviewInfo.LevelPreviewer
-- Decompile time: 15.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Packages = ReplicatedStorage.Packages
local Components = Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local Sift = require(Packages.Sift)
local LevelPreviewNavigation = require(script.Parent.LevelPreviewNavigation)
local TextLabel = require(Components.TextLabel)
local createBinding = React.createBinding
local createElement = React.createElement
local memo = React.memo
local useBindings = ReactFlow.useBindings
local useSpring = ReactFlow.useSpring
local useRef = React.useRef
local useEffect = React.useEffect

local function ArrowButton(a1) -- Line: 42
    -- upvalues: createBinding (val), useSpring (val), useBindings (val), createElement (val), React (val)
    local u3 = a1.disabled == true
    local v1, u7 = createBinding(false)
    local v2, u11 = createBinding(false)
    local v3, u15 = useSpring({start = 1, target = 1, speed = 45, damper = 0.5})
    local v4 = {v1, v2}
    local v5 = {u3}
    useBindings(function(a1, a2) -- Line: 58 -- upvalues: u3 (val), u15 (val)
        if a2 and not u3 then
            u15({target = 0.85})
            return
        end
        if a1 and not u3 then
            u15({target = 1.15})
            return
        end
        u15({target = 1})
    end, v4, v5)
    v4 = {
        Active = not u3,
        AnchorPoint = Vector2.new(if a1.direction ~= "Left" then 0 else 1, 0.5),
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(244, 244, 244),
        BackgroundTransparency = if not u3 then 0 else 0.45,
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectOffset = Vector2.new(0, if a1.direction ~= "Left" then 500 else 550),
        ImageRectSize = Vector2.new(50, 50),
        ImageTransparency = if not u3 then 0 else 0.45,
        Position = UDim2.fromScale(if a1.direction ~= "Left" then 1.05 else -0.05, 0.5),
        ScaleType = Enum.ScaleType.Stretch,
        Selectable = not u3,
        Size = UDim2.fromScale(0.15, 0.5),
    }
    local Activated = React.Event.Activated
    v4[Activated] = if not u3 then a1.onActivated else nil
    local MouseEnter = React.Event.MouseEnter
    v4[MouseEnter] = if not u3 then function() -- Line: 87 -- upvalues: u7 (val)
        u7(true)
    end else nil

    v4[React.Event.MouseLeave] = function() -- Line: 90 -- upvalues: u7 (val), u11 (val)
        u7(false)
        u11(false)
    end

    local MouseButton1Down = React.Event.MouseButton1Down
    v4[MouseButton1Down] = if not u3 then function() -- Line: 96 -- upvalues: u11 (val)
        u11(true)
    end else nil

    v4[React.Event.MouseButton1Up] = function() -- Line: 99 -- upvalues: u11 (val)
        u11(false)
    end

    return createElement("ImageButton", v4, {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.2}),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.25, 0)}),
        UIScale = createElement("UIScale", {Scale = v3}),
        UIStroke = createElement("UIStroke", {
            Thickness = 0.07,
            Color = Color3.fromRGB(159, 159, 159),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            Transparency = if not u3 then 0 else 0.6,
        }),
    })
end

local function LevelIndicator(a1) -- Line: 121
    -- upvalues: useRef (val), useSpring (val), useEffect (val), createElement (val)
    local u5 = Color3.fromRGB(221, 221, 221)
    local u10 = Color3.fromRGB(44, 44, 44)
    local u13 = useRef(a1.active)
    local v1, u23 = useSpring({speed = 25, damper = 0.8, start = if not a1.active then 0 else 1})
    local v2, u27 = useSpring({start = 0, speed = 15, damper = 1})
    local v3, u31 = useSpring({start = 0, speed = 14, damper = 0.5})
    local v4 = useEffect
    local v5 = {a1.active}
    v4(function() -- Line: 148 -- upvalues: a1 (val), u13 (val), u23 (val), u27 (val), u31 (val)
        local active = a1.active and not u13.current
        u13.current = a1.active
        u23({target = if not a1.active then 0 else 1})
        if active then
            u27({start = 1, target = 0})
            u31({force = 5})
        end
    end, v5)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.fromScale(0.25, 1),
    }, {
        Indicator = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = v1:map(function(a1) -- Line: 178 -- upvalues: u10 (val), u5 (val)
                return u10:Lerp(u5, a1)
            end),
            Position = v3:map(function(a1) -- Line: 182
                return UDim2.fromScale(0.5, 0.5 - a1)
            end),
            Size = UDim2.fromScale(1, 1),
        }, {
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            UIStroke = createElement("UIStroke", {
                Thickness = 0.1,
                Transparency = 0.5,
                Color = Color3.fromRGB(0, 0, 0),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
            UIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(122, 122, 122))),
                }),
            }),
            UIScale = createElement("UIScale", {
                Scale = v3:map(function(a1) -- Line: 204
                    return 1 + a1
                end),
            }),
            Pulse = createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(212, 255, 156),
                BackgroundTransparency = v2:map(function(a1) -- Line: 211
                    return 1 - math.clamp(a1, 0, 1) * 0.75
                end),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1.1, 1.2),
            }, {
                UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                UIScale = createElement("UIScale", {
                    Scale = v2:map(function(a1) -- Line: 224
                        return 1 + (1 - math.clamp(a1, 0, 1)) * 0.4
                    end),
                }),
            }),
        }),
    })
end

local function PathButton(a1) -- Line: 234
    -- upvalues: createBinding (val), useSpring (val), useBindings (val), createElement (val), React (val)
    -- upvalues: TextLabel (val)
    local v1, u4 = createBinding(false)
    local v2, u8 = createBinding(false)
    local v3, u12 = useSpring({start = 1, target = 1, speed = 40, damper = 0.75})
    local v4 = {v1, v2}
    useBindings(function(a1, a2) -- Line: 249 -- upvalues: u12 (val)
        if a2 then
            u12({target = 0.85})
            return
        end
        if a1 then
            u12({target = 1.15})
            return
        end
        u12({target = 1})
    end, v4, {})
    local v5 = createElement
    v4 = {
        Active = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(221, 221, 221),
        BorderSizePixel = 0,
        LayoutOrder = a1.layoutOrder,
        Selectable = true,
        Size = UDim2.fromScale(0.5, 1),
    }
    v4[React.Event.Activated] = a1.onActivated

    v4[React.Event.MouseEnter] = function() -- Line: 270 -- upvalues: u4 (val)
        u4(true)
    end

    v4[React.Event.MouseLeave] = function() -- Line: 273 -- upvalues: u4 (val), u8 (val)
        u4(false)
        u8(false)
    end

    v4[React.Event.MouseButton1Down] = function() -- Line: 277 -- upvalues: u8 (val)
        u8(true)
    end

    v4[React.Event.MouseButton1Up] = function() -- Line: 280 -- upvalues: u8 (val)
        u8(false)
    end

    return v5("ImageButton", v4, {
        PathLabel = createElement(TextLabel, {
            StrokeThickness = 0.1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.55),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            Text = a1.title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.25, 0)}),
        UIScale = createElement("UIScale", {Scale = v3}),
        UIStroke = createElement("UIStroke", {
            Thickness = 0.07,
            Color = Color3.fromRGB(159, 159, 159),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
end

local function DualPathContainer(a1) -- Line: 312 -- upvalues: createElement (val), PathButton (val) -- types: a1: table
    local v1
    local v2 = {}
    for i, j in a1.pathOptions do
        v1 = ("Path_%*"):format(j.path)
        v2[v1] = (createElement(PathButton, {
            layoutOrder = j.path,
            onActivated = function() -- Line: 320 -- upvalues: a1 (val), j (val)
                a1.onPathSelected(j.path)
            end,
            title = j.title,
        }))
    end
    v2.UIListLayout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.1, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 0.5),
    }, v2)
end

return memo(function(a1) -- Line: 343
    -- upvalues: Sift (val), LevelPreviewNavigation (val), createElement (val), LevelIndicator (val)
    -- upvalues: DualPathContainer (val), ArrowButton (val), TextLabel (val)
    local v1, v2
    local v3 = Sift.Dictionary.join({
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.35),
    }, a1.native or {})
    local v4 = LevelPreviewNavigation.getIndicatorCount(a1.config)
    local v5 = LevelPreviewNavigation.getIndicatorIndex(a1.state, a1.config)
    local v6 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0.025, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    for i = 1, v4 do
        v2 = ("Level_%*"):format(i)
        v6[v2] = (createElement(LevelIndicator, {active = i <= v5, layoutOrder = i}))
    end
    v2 = {}
    v2.DualPathContainer = if not v1.state.choosingPath or not (#v1.pathOptions > 1) then nil else createElement(DualPathContainer, {onPathSelected = v1.onPathSelected, pathOptions = v1.pathOptions})
    v2.IndicatorContainer = if v1.state.choosingPath then nil else createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.2),
    }, v6)
    v2.LeftArrowButton = createElement(ArrowButton, {direction = "Left", onActivated = v1.onPrevious})
    v2.LevelLabel = createElement(TextLabel, {
        StrokeThickness = 0.1,
        AnchorPoint = Vector2.new(0.5, 0),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(1, 0.35),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        Text = v1.levelName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Visible = not v1.state.choosingPath,
    })
    v2.RightArrowButton = createElement(ArrowButton, {direction = "Right", disabled = v1.state.choosingPath, onActivated = v1.onNext})
    return createElement("Frame", v3, v2)
end)