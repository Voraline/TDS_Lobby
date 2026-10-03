-- Script path: ReplicatedStorage.Client.Interfaces.Components.Button
-- Decompile time: 11.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TutorialStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TutorialStore)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = ReactFlow.useSpring
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useBinding = React.useBinding
local Event = React.Event

local function darken(a1, a2) -- Line: 60 -- types: a1: userdata, a2: number
    return a1:Lerp(Color3.new(0, 0, 0), a2)
end

local function isVisible(a1) -- Line: 64 -- types: a1: userdata
    if not a1.Visible then
        return false
    end
    local Parent = a1.Parent
    while Parent do
        if Parent:IsA("ScreenGui") then
            return Parent.Enabled
        end
        if Parent:IsA("GuiObject") and not Parent.Visible then
            return false
        end
        Parent = Parent.Parent
    end
    return true
end

return function(a1) -- Line: 85
    -- upvalues: useSound (val), useSpring (val), useBinding (val), useScale (val), useRef (val), useEffect (val)
    -- upvalues: TutorialStore (val), createElement (val), React (val), Event (val), isVisible (val)
    local v1
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked() end
    end
    local OnHold = a1.OnHold
    if not OnHold then
        function OnHold() end
    end
    local u9 = a1.Disabled == true
    local v2 = a1.BackgroundTransparency or 0
    local Color = a1.Color
    if not Color then
        Color = Color3.fromRGB(109, 243, 72)
    end
    if u9 then
        Color = Color3.fromRGB(150, 150, 150)
    end
    local Click = useSound("Click")
    local v3, u33 = useSpring({start = 1, damper = 0.6, speed = 40})
    local v4, u37 = useBinding(false)
    local u40, u41 = useBinding(false)
    local u44 = useScale(1)
    local v5 = a1.TextPosition == nil
    local TextAutomaticSize = if a1.TextAutomaticSize == nil then if a1.TextSize ~= nil then nil else Enum.AutomaticSize.X else a1.TextAutomaticSize
    local TextScaled = if a1.TextScaled == nil then a1.TextFontSize == nil else a1.TextScaled
    local TextSize = a1.TextSize or UDim2.new(0, 0, 0.5, 0)
    local REF = a1.REF
    if not REF then
        REF = useRef()
    end
    local v6 = useEffect
    local v7 = {a1.Visible, a1.SpotlightRefName}
    v6(function() -- Line: 114 -- upvalues: a1 (val), TutorialStore (upval), REF (val)
        local SpotlightRefName = a1.SpotlightRefName
        if not SpotlightRefName then
            return
        end
        if a1.Visible then
            TutorialStore.addValidInstanceOrRef(SpotlightRefName, REF)
            return
        end
        TutorialStore.removeValidInstanceOrRef(SpotlightRefName)
    end, v7)
    v7 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v7.AnchorPoint = AnchorPoint
    v7.LayoutOrder = a1.LayoutOrder or 1
    local Position = a1.Position or UDim2.new(0.5, 0, 1, -32)
    v7.Position = Position
    local Size = a1.Size or UDim2.fromOffset(220, 44)
    v7.Size = Size
    v7.Visible = a1.Visible
    v7.ZIndex = (React.joinBindings({u40, v4})):map(function(a1_2) -- Line: 138 -- upvalues: a1 (val)
        local v1, v2 = unpack(a1_2)
        return (a1.ZIndex or 0) + (if v1 then 1 else if not v2 then 0 else 1)
    end)
    v7.ref = REF
    local v8 = {}
    local v9 = a1.children and createElement(React.Fragment, {}, a1.children) or nil
    v8.children = v9
    local v10 = {Image = a1.BackgroundIcon or "rbxassetid://8429088937"}
    v10.ScaleType = if a1.BackgroundIcon then nil else Enum.ScaleType.Slice
    v10.SliceCenter = if a1.BackgroundIcon then nil else Rect.new(8, 8, 152, 32)
    v10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v10.BackgroundTransparency = 1
    v10.ImageColor3 = v4:map(function(a1) -- Line: 153 -- upvalues: Color (ref)
        if a1 then
            return (Color:Lerp(Color3.new(0, 0, 0), 0.4))
        end
        return Color
    end)
    v10.ImageTransparency = v2
    v10.Position = UDim2.fromScale(0.5, 0.5)
    v10.AnchorPoint = Vector2.new(0.5, 0.5)
    v10.Size = UDim2.fromScale(1, 1)

    v10[Event.MouseButton1Down] = function() -- Line: 161 -- upvalues: u33 (val), u44 (val), REF (val), isVisible (upval), u41 (val), OnHold (val)
        u33({start = 1, target = 1 - 0.1 * u44})
        local current = REF.current
        if current and isVisible(current) then
            u41(true)
            OnHold()
        end
    end

    v10[Event.MouseButton1Up] = function() -- Line: 171 -- upvalues: u40 (val), u33 (val), u41 (val), Click (val), u9 (val), Clicked (val)
        local v1 = u40:getValue()
        u33({target = 1.1})
        u41(false)
        Click()
        if not u9 and v1 then
            Clicked()
        end
    end

    v10[Event.MouseEnter] = function() -- Line: 182 -- upvalues: u33 (val), u44 (val), u37 (val), a1 (val)
        u33({start = 1, target = 1 + 0.1 * u44})
        u37(true)
        if a1.OnHover then
            a1.OnHover()
        end
    end

    v10[Event.MouseLeave] = function() -- Line: 191 -- upvalues: u33 (val), u44 (val), u37 (val), a1 (val)
        u33({target = 1, start = 1 + 0.1 * u44})
        u37(false)
        if a1.OnUnhover then
            a1.OnUnhover()
        end
    end

    local v11 = {}
    local v12 = {Scale = v3}
    v11.scale = createElement("UIScale", v12)
    v11.listLayout = if not v5 then nil else createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    v11.icon = if not a1.Icon then nil else createElement("ImageLabel", {
        LayoutOrder = 1,
        BackgroundTransparency = 1,
        Image = a1.Icon,
        Size = UDim2.fromScale(1, 1),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    }, {createElement("UIScale", {Scale = a1.IconScale or 1})})
    if a1.Text == "" or not a1.Text then
        v1 = nil
    else
        v12 = {BackgroundTransparency = 1, LayoutOrder = 2}
        local Font_2 = a1.Font or Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        v12.FontFace = Font_2
        v12.Text = a1.Text or ""
        local TextColor = a1.TextColor or Color3.fromRGB(255, 255, 255)
        v12.TextColor3 = TextColor
        v12.TextSize = a1.TextFontSize or 24
        v12.TextScaled = TextScaled
        v12.TextTransparency = a1.TextTransparency
        v12.TextXAlignment = if not a1.Icon then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left
        v12.TextYAlignment = Enum.TextYAlignment.Center
        v12.AutomaticSize = TextAutomaticSize
        v12.AnchorPoint = Vector2.new(0.5, 0.5)
        v12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        local TextPosition = a1.TextPosition or UDim2.fromScale(0.5, 0.5)
        v12.Position = TextPosition
        v12.Size = TextSize
        v1 = createElement("TextLabel", v12, {
            uIStroke = createElement("UIStroke", {
                LineJoinMode = Enum.LineJoinMode.Miter,
                Thickness = a1.TextStrokeThickness or 2,
                Transparency = a1.TextStrokeTransparency or 0.5,
                Color = a1.TextStrokeColor,
            }),
            padding = if not a1.TextPadding then nil else createElement("UIPadding", {
                PaddingTop = a1.TextPadding.Top,
                PaddingRight = a1.TextPadding.Right,
                PaddingBottom = a1.TextPadding.Bottom,
                PaddingLeft = a1.TextPadding.Left,
            }),
        })
    end
    v11.value = v1
    v8.content = createElement("ImageButton", v10, v11)
    return (createElement("Frame", v7, v8))
end