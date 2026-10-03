-- Script path: ReplicatedStorage.Client.Interfaces.Components.NumberedButton
-- Decompile time: 2.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
local useState = React.useState
local Event = React.Event
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)

local function isVisible(a1) -- Line: 13 -- types: a1: userdata
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

return function(a1) -- Line: 34
    -- upvalues: useSound (val), useRef (val), useSpring (val), React (val), useScale (val), createElement (val)
    -- upvalues: Event (val), isVisible (val)
    local Clicked = a1.Clicked
    local u4 = a1.Disabled == true
    local Click = useSound("Click")
    local Color = a1.Color or Color3.fromRGB(150, 150, 150)
    if u4 then
        Color = Color3.fromRGB(150, 150, 150)
    end
    local u24 = useRef()
    local v1, u31 = useSpring(1, 0.6, 40, true)
    local u35, u36 = React.useBinding(false)
    local u40, u41 = React.useBinding(false)
    local u44 = useScale(1)
    local v2 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(1, 0.5)
    v2.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(1, -8, 0.5, 0)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromOffset(64, 80)
    v2.Size = Size
    local v3 = {}
    local v4 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color,
        AutoButtonColor = false,
        Text = "",
    }

    v4[Event.MouseButton1Down] = function() -- Line: 65 -- upvalues: u31 (val), u44 (val), u24 (val), isVisible (upval), u41 (val)
        u31(1 - 0.1 * u44)
        local current = u24.current
        if current and isVisible(current) then
            u41(true)
        end
    end

    v4[Event.MouseButton1Up] = function() -- Line: 74
        -- upvalues: u40 (val), u31 (val), u35 (val), u44 (val), u41 (val), Click (val), u4 (val), Clicked (val)
        local v1 = u40:getValue()
        u31(u35:getValue() and 1 + 0.1 * u44 or 1)
        u41(false)
        Click()
        if not u4 and v1 and Clicked then
            Clicked()
        end
    end

    v4[Event.MouseEnter] = function() -- Line: 86 -- upvalues: u31 (val), u44 (val), u36 (val)
        u31(1 + 0.1 * u44)
        u36(true)
    end

    v4[Event.MouseLeave] = function() -- Line: 91 -- upvalues: u31 (val), u36 (val)
        u31(1)
        u36(false)
    end

    v4[Event.Activated] = function() -- Line: 96 -- upvalues: Click (val), Clicked (val)
        Click()
        if Clicked then
            Clicked()
        end
    end

    v3.content = createElement("TextButton", v4, {
        scale = createElement("UIScale", {Scale = v1}),
        uiStroke = createElement("UIStroke", {
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = if not a1.Selected then 0 else 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        textLabel = createElement("TextLabel", {
            TextSize = 24,
            BackgroundTransparency = 0.65,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 0, 32),
        }, {
            uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            uIStroke = createElement("UIStroke", {Thickness = 2}),
        }),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://" .. a1.Icon,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0, 24),
            Size = UDim2.fromOffset(32, 32),
        }),
    })
    return createElement("Frame", v2, v3)
end