-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Button
-- Decompile time: 7.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = ReplicatedStorage.Shared.UI
local Packages = ReplicatedStorage.Packages
local Interfaces = ReplicatedStorage.Client.Interfaces
local Parent = script.Parent
local Hooks = Interfaces.Hooks
local React = require(UI.React)
local ReactFlow = require(Packages.ReactFlow)
local TutorialStore = require(Interfaces.Stores.Game.TutorialStore)
local useSound = require(Hooks.useSound)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local ImageLabel = require(Parent.ImageLabel)
local TextLabel = require(Parent.TextLabel)
local createElement = React.createElement
local useCallback = React.useCallback
local useRef = React.useRef
local useEffect = React.useEffect
local __subscribeToBinding = React.__subscribeToBinding
local useSpring = ReactFlow.useSpring

local function isBinding(a1) -- Line: 33
    local v1 = false
    if typeof(a1) == "table" then
        v1 = a1["$$typeof"] == 60132
    end
    return v1
end

local function useDebounce(a1) -- Line: 38 -- upvalues: useRef (val), useCallback (val) -- types: a1: number
    local u3 = useRef(0)
    return useCallback(function() -- Line: 40 -- upvalues: u3 (val), a1 (val)
        local v1 = tick()
        if not (a1 < v1 - u3.current) then
            return false
        end
        u3.current = v1
        return true
    end, {a1})
end

return function(a1) -- Line: 53
    -- upvalues: useSpring (val), useDebounce (val), useSound (val), React (val), useTransparencyModifier (val)
    -- upvalues: useRef (val), useEffect (val), TutorialStore (val), __subscribeToBinding (val), createElement (val)
    -- upvalues: TextLabel (val), ImageLabel (val)
    local StrokeGradientTransparency, StrokeTransparency, v1, v2
    local u2 = a1.HoverSizeScale or 1.15
    local DepressSizeScale = a1.DepressSizeScale
    if not DepressSizeScale then
        DepressSizeScale = 2 - u2
    end
    local v3, u8 = useSpring({start = 1, speed = 30, damper = 0.7})
    local ActivationDebounce = a1.ActivationDebounce
    if ActivationDebounce then
        ActivationDebounce = useDebounce(a1.ActivationDebounce)
    end
    local HoverSound = a1.HoverSound
    if HoverSound then
        HoverSound = useSound(a1.HoverSound, true)
    end
    local PressSound = a1.PressSound
    if PressSound then
        PressSound = useSound(a1.PressSound, true)
    end

    local function onMouseEnter() -- Line: 89 -- upvalues: u8 (val), u2 (val), HoverSound (val), a1 (val), React (upval)
        u8({target = u2})
        if HoverSound then
            HoverSound(a1.HoverSoundPitch)
        end
        if a1[React.Event.MouseEnter] then
            a1[React.Event.MouseEnter]()
        end
    end

    local function onMouseLeave() -- Line: 101 -- upvalues: u8 (val), a1 (val), React (upval)
        u8({target = 1})
        if a1[React.Event.MouseLeave] then
            a1[React.Event.MouseLeave]()
        end
    end

    local v4 = useTransparencyModifier(a1.Transparency)
    local u49 = useRef()
    local v5 = useEffect
    local v6 = {a1.Visible, a1.SpotlightRefName}
    v5(function() -- Line: 115 -- upvalues: a1 (val), TutorialStore (upval), u49 (val), __subscribeToBinding (upval)
        local SpotlightRefName = a1.SpotlightRefName
        if not SpotlightRefName then
            return
        end
        local Visible = if a1.Visible ~= nil then a1.Visible else true
        local v1 = false
        if typeof(Visible) == "table" then
            v1 = Visible["$$typeof"] == 60132
        end
        if not v1 then
            if not Visible then
                TutorialStore.removeValidInstanceOrRef(SpotlightRefName)
            else
                TutorialStore.addValidInstanceOrRef(SpotlightRefName, u49)
            end
            return function() -- Line: 142 -- upvalues: TutorialStore (upval), SpotlightRefName (val)
                TutorialStore.removeValidInstanceOrRef(SpotlightRefName)
            end
        end
        if not Visible:getValue() then
            TutorialStore.removeValidInstanceOrRef(SpotlightRefName)
        else
            TutorialStore.addValidInstanceOrRef(SpotlightRefName, u49)
        end
        local u38 = __subscribeToBinding(Visible, function(a1) -- Line: 122 -- upvalues: TutorialStore (upval), SpotlightRefName (val), u49 (upval) -- types: a1: boolean
            if a1 then
                TutorialStore.addValidInstanceOrRef(SpotlightRefName, u49)
                return
            end
            TutorialStore.removeValidInstanceOrRef(SpotlightRefName)
        end)
        return function() -- Line: 134 -- upvalues: u38 (val), TutorialStore (upval), SpotlightRefName (val)
            u38()
            TutorialStore.removeValidInstanceOrRef(SpotlightRefName)
        end
    end, v6)
    v6 = {}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v6.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v6.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v6.AnchorPoint = AnchorPoint
    v6.BackgroundTransparency = 1
    v6.Active = a1.Active
    v6.Visible = a1.Visible
    v6.Rotation = a1.Rotation
    v6.ZIndex = a1.ZIndex
    v6.LayoutOrder = a1.LayoutOrder
    v6.Selectable = a1.Selectable
    v6.Modal = a1.Modal
    v6.Text = ""
    v6.AutoButtonColor = false
    v6.ref = u49

    v6[React.Event.Activated] = function() -- Line: 173 -- upvalues: a1 (val), React (upval), ActivationDebounce (val)
        if a1[React.Event.Activated] then
            if not ActivationDebounce or ActivationDebounce() then
                a1[React.Event.Activated]()
            end
        end
    end

    v6[React.Event.MouseButton1Down] = function() -- Line: 69 -- upvalues: u8 (val), DepressSizeScale (val), a1 (val), React (upval)
        u8({target = DepressSizeScale})
        if a1[React.Event.MouseButton1Down] then
            a1[React.Event.MouseButton1Down]()
        end
    end

    v6[React.Event.MouseButton1Up] = function() -- Line: 77 -- upvalues: u8 (val), u2 (val), PressSound (val), a1 (val), React (upval)
        u8({target = u2})
        if PressSound then
            PressSound(a1.PressSoundPitch)
        end
        if a1[React.Event.MouseButton1Up] then
            a1[React.Event.MouseButton1Up]()
        end
    end

    v6[React.Event.MouseEnter] = onMouseEnter
    v6[React.Event.MouseLeave] = onMouseLeave
    v6[React.Event.SelectionGained] = onMouseEnter
    v6[React.Event.SelectionLost] = onMouseLeave
    local v7 = {
        aspectRatio = if not a1.AspectRatio then nil else createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio}),
    }
    local v8 = {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = v4(a1.BackgroundTransparency),
        BackgroundColor3 = a1.BackgroundColor3,
        ClipsDescendants = a1.ClipsDescendants,
    }
    local v9 = {}
    local Text = a1.Text and createElement(TextLabel, {
        Size = a1.TextSize,
        Position = a1.TextPosition,
        AnchorPoint = a1.TextAnchorPoint,
        ZIndex = a1.TextZIndex or 2,
        Text = a1.Text,
        TextColor3 = a1.TextColor3,
        TextTransparency = a1.TextTransparency,
        TextXAlignment = a1.TextXAlignment,
        TextYAlignment = a1.TextYAlignment,
        FontWeight = a1.TextFontWeight,
        StrokeColor = a1.TextStrokeColor,
        StrokeThickness = a1.TextStrokeThickness,
        StrokeTransparency = a1.TextStrokeTransparency,
        StrokeMode = a1.TextStrokeMode,
        StrokeLineJoinMode = a1.TextStrokeLineJoinMode,
        Transparency = a1.Transparency,
    })
    v9.textLabel = Text
    local Image = a1.Image
    if Image then
        v1 = {BackgroundTransparency = 1}
        local ImageSize = a1.ImageSize or UDim2.fromScale(1, 1)
        v1.Size = ImageSize
        local ImagePosition = a1.ImagePosition or UDim2.fromScale(0.5, 0.5)
        v1.Position = ImagePosition
        local ImageAnchorPoint = a1.ImageAnchorPoint or Vector2.new(0.5, 0.5)
        v1.AnchorPoint = ImageAnchorPoint
        v1.Rotation = a1.ImageRotation
        v1.ZIndex = a1.ImageZIndex
        v1.Image = a1.Image
        v1.ImageColor3 = a1.ImageColor3
        v1.ImageTransparency = a1.ImageTransparency
        v1.ScaleType = a1.ImageScaleType
        v1.SliceCenter = a1.ImageSliceCenter
        v1.ImageRectOffset = a1.ImageRectOffset
        v1.ImageRectSize = a1.ImageRectSize
        v1.Transparency = a1.Transparency
        Image = createElement(ImageLabel, v1)
    end
    v9.imageLabel = Image
    local AutoButtonAnimate = a1.AutoButtonAnimate and createElement("UIScale", {Scale = v3})
    v9.uiScale = AutoButtonAnimate
    local CornerRadiusScale = if a1.CornerRadius then createElement("UICorner", {CornerRadius = UDim.new(a1.CornerRadiusScale, a1.CornerRadius)}) else a1.CornerRadiusScale and createElement("UICorner", {CornerRadius = UDim.new(a1.CornerRadiusScale, a1.CornerRadius)})
    v9.uiCorner = CornerRadiusScale
    if a1.StrokeColor or a1.StrokeThickness then
        v1 = {
            Color = a1.StrokeColor,
            Thickness = a1.StrokeThickness,
            Transparency = v4(a1.StrokeTransparency),
        }
        v2 = {}
        StrokeGradientTransparency = if a1.StrokeGradientColor or a1.StrokeGradientRotation then createElement("UIGradient", {
            Color = a1.StrokeGradientColor,
            Rotation = a1.StrokeGradientRotation,
            Transparency = v4(a1.StrokeGradientTransparency or NumberSequence.new(0)),
        }) else a1.StrokeGradientTransparency and createElement("UIGradient", {
            Color = a1.StrokeGradientColor,
            Rotation = a1.StrokeGradientRotation,
            Transparency = v4(a1.StrokeGradientTransparency or NumberSequence.new(0)),
        })
        v2.uiGradient = StrokeGradientTransparency
        StrokeTransparency = createElement("UIStroke", v1, v2)
    else
        StrokeTransparency = a1.StrokeTransparency
        if StrokeTransparency then
            v1 = {
                Color = a1.StrokeColor,
                Thickness = a1.StrokeThickness,
                Transparency = v4(a1.StrokeTransparency),
            }
            v2 = {}
            StrokeGradientTransparency = if a1.StrokeGradientColor or a1.StrokeGradientRotation then createElement("UIGradient", {
                Color = a1.StrokeGradientColor,
                Rotation = a1.StrokeGradientRotation,
                Transparency = v4(a1.StrokeGradientTransparency or NumberSequence.new(0)),
            }) else a1.StrokeGradientTransparency and createElement("UIGradient", {
                Color = a1.StrokeGradientColor,
                Rotation = a1.StrokeGradientRotation,
                Transparency = v4(a1.StrokeGradientTransparency or NumberSequence.new(0)),
            })
            v2.uiGradient = StrokeGradientTransparency
            StrokeTransparency = createElement("UIStroke", v1, v2)
        end
    end
    v9.uiStroke = StrokeTransparency
    local GradientTransparency = if a1.GradientColor then createElement("UIGradient", {
        Color = a1.GradientColor,
        Rotation = a1.GradientRotation,
        Offset = a1.GradientOffset,
        Transparency = v4(a1.GradientTransparency or NumberSequence.new(0)),
    }) else a1.GradientTransparency and createElement("UIGradient", {
        Color = a1.GradientColor,
        Rotation = a1.GradientRotation,
        Offset = a1.GradientOffset,
        Transparency = v4(a1.GradientTransparency or NumberSequence.new(0)),
    })
    v9.uiGradient = GradientTransparency
    v9.children = createElement(React.Fragment, {}, a1.children)
    v7.buttonContainer = createElement("Frame", v8, v9)
    local AspectRatio = a1.AspectRatio and createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio})
    v7.uiAspectRatio = AspectRatio
    return createElement("TextButton", v6, v7)
end