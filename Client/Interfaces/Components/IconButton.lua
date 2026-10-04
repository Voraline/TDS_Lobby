-- Script path: ReplicatedStorage.Client.Interfaces.Components.IconButton
-- Decompile time: 7.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
local useState = React.useState
local Event = React.Event
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)

local function darken(a1, a2) -- Line: 13
    return a1:Lerp(Color3.new(0, 0, 0), a2)
end

local function isVisible(a1) -- Line: 17 -- types: a1: userdata
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

return function(a1) -- Line: 38
    -- upvalues: useSound (val), useRef (val), useSpring (val), React (val), useScale (val), createElement (val)
    -- upvalues: Event (val), isVisible (val)
    local Clicked = a1.Clicked
    local u4 = a1.Disabled == true
    local v1 = a1.Transparency or 0
    local Click = useSound("Click")
    local Color = a1.Color or Color3.fromRGB(109, 243, 72)
    if u4 then
        Color = Color3.fromRGB(150, 150, 150)
    end
    local u26 = useRef()
    local v2, u33 = useSpring(1, 0.6, 40, true)
    local u37, u38 = React.useBinding(false)
    local u42, u43 = React.useBinding(false)
    local u46 = useScale(1)
    local v3 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0.5)
    v3.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0, 10, 0.5, 0)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromOffset(44, 44)
    v3.Size = Size
    v3.SizeConstraint = a1.SizeConstraint
    v3.LayoutOrder = a1.LayoutOrder
    v3.ZIndex = a1.ZIndex
    v3.Rotation = a1.Rotation
    v3.ref = u26
    local v4 = {}
    local v5 = a1.AspectRatio and createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio}) or createElement(React.Fragment)
    v4.UIAspectRatioConstraint = v5
    local v6 = {
        Text = "",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
    }

    v6[Event.MouseButton1Down] = function() -- Line: 77 -- upvalues: u33 (val), u46 (val), u26 (val), isVisible (upval), u43 (val)
        u33(1 - 0.1 * u46)
        local current = u26.current
        if current and isVisible(current) then
            u43(true)
        end
    end

    v6[Event.MouseButton1Up] = function() -- Line: 86
        -- upvalues: u42 (val), u33 (val), u37 (val), u46 (val), u43 (val), Click (val), u4 (val), Clicked (val)
        local v1 = u42:getValue()
        u33(u37:getValue() and 1 + 0.1 * u46 or 1)
        u43(false)
        Click()
        if not u4 and v1 and Clicked then
            Clicked()
        end
    end

    v6[Event.MouseEnter] = function() -- Line: 98 -- upvalues: u33 (val), u46 (val), u38 (val)
        u33(1 + 0.1 * u46)
        u38(true)
    end

    v6[Event.MouseLeave] = function() -- Line: 103 -- upvalues: u33 (val), u38 (val)
        u33(1)
        u38(false)
    end

    local v7 = {scale = createElement("UIScale", {Scale = v2})}
    local v8 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color,
        BackgroundTransparency = v1,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v9 = {}
    local v10 = {}
    local CornerRadius = a1.CornerRadius or UDim.new(0, 6)
    v10.CornerRadius = CornerRadius
    v9.uICorner1 = createElement("UICorner", v10)
    v9.uIStroke3 = createElement("UIStroke", {
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color:Lerp(Color3.new(0, 0, 0), 0.2),
        Transparency = v1,
    })
    v9.UIShadow = createElement("UIShadow", {
        Color = Color3.fromRGB(0, 0, 0),
        BlurRadius = UDim.new(0.2, 0),
        Transparency = v1,
        Spread = UDim2.fromOffset(0, 0),
        Offset = UDim2.fromOffset(0, 2),
    })
    v9.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = a1.Icon or "rbxassetid://9674219565",
        ImageColor3 = Color3.fromRGB(235, 235, 235),
        ImageTransparency = v1,
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.6),
    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    v7.content = createElement("Frame", v8, v9)
    v4.content = createElement("TextButton", v6, v7)
    v4.children = createElement(React.Fragment, {}, a1.children or {})
    return createElement("Frame", v3, v4)
end