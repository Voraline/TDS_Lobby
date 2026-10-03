-- Script path: ReplicatedStorage.Client.Interfaces.Components.ToggleButton
-- Decompile time: 3.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useBinding = React.useBinding
local u42 = Color3.fromRGB(109, 243, 72)
local u47 = Color3.fromRGB(239, 35, 35)
local u52 = Color3.fromRGB(150, 150, 150)

local function darken(a1, a2) -- Line: 20
    return a1:Lerp(Color3.new(0, 0, 0), a2)
end

return function(a1) -- Line: 24
    -- upvalues: useSound (val), useScale (val), useState (val), u42 (val), useBinding (val), useSpring (val)
    -- upvalues: useTween (val), useEffect (val), u52 (val), u47 (val), createElement (val), React (val), darken (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked() end
    end
    local AnchorPoint = a1.AnchorPoint or Vector2.new(1, 0)
    local Position = a1.Position or UDim2.fromScale(1, 0)
    local Size = a1.Size or UDim2.new(0, 80, 1, 0)
    local SwitchProps = a1.SwitchProps or {}
    local IconPosition = SwitchProps.IconPosition or UDim2.fromScale(0.5, 0.35)
    local v1 = SwitchProps.HideText or false
    local Click = useSound("Click")
    local u40 = useScale(1)
    local u43, u44 = useState(u42)
    local v2, u48 = useBinding("12289763206")
    local Enabled_2, Enabled = useBinding("Enabled")
    local u55, u56 = useBinding(false)
    local u59, u60 = useBinding(false)
    local v3, u67 = useSpring(1, 0.6, 40, true)
    local v4, u77 = useTween(u43, TweenInfo.new(0.1, Enum.EasingStyle.Sine), nil, true)
    local v5 = useEffect
    local v6 = {a1.Enabled}
    v5(function() -- Line: 49 -- upvalues: a1 (val), Enabled (val), u48 (val)
        if a1.Enabled then
            Enabled("Enabled")
            u48("12289762618")
            return
        end
        Enabled("Disabled")
        u48("12289763206")
    end, v6)
    v5 = useEffect
    v6 = {a1.Disabled, a1.Enabled}
    v5(function() -- Line: 59 -- upvalues: a1 (val), u44 (val), u52 (upval), u42 (upval), u47 (upval)
        if a1.Disabled then
            u44(u52)
            return
        end
        if a1.Enabled then
            u44(u42)
            return
        end
        u44(u47)
    end, v6)
    v6 = {u43}
    useEffect(function() -- Line: 72 -- upvalues: u77 (val), u43 (val)
        u77(u43)
    end, v6)
    v6 = {
        Text = "",
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = AnchorPoint,
        Position = Position,
        Size = Size,
    }
    local v7 = {}
    local v8 = {
        Image = "rbxassetid://12338367942",
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(0, 6, 58, 58),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = v4,
    }

    v8[React.Event.MouseButton1Down] = function() -- Line: 95 -- upvalues: u67 (val), u40 (val), u60 (val)
        u67(1 - 0.1 * u40)
        u60(true)
    end

    v8[React.Event.MouseButton1Up] = function() -- Line: 100
        -- upvalues: u59 (val), u55 (val), u67 (val), u40 (val), u60 (val), Click (val), a1 (val), Clicked (val)
        local v1 = u59:getValue()
        if not u55 then
            u67(1)
        else
            u67(1 + 0.1 * u40)
        end
        u60(false)
        Click()
        if not a1.Disabled and v1 then
            Clicked()
        end
    end

    v8[React.Event.MouseEnter] = function() -- Line: 116 -- upvalues: u67 (val), u40 (val), u56 (val)
        u67(1 + 0.1 * u40)
        u56(true)
    end

    v8[React.Event.MouseLeave] = function() -- Line: 121 -- upvalues: u67 (val), u56 (val)
        u67(1)
        u56(false)
    end

    local v9 = {}
    local v10 = {
        BackgroundTransparency = 1,
        Image = v2:map(function(a1) -- Line: 127
            return (("rbxassetid://%*"):format(a1))
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v11 = if not a1.Disabled then Color3.fromRGB(255, 255, 255) else Color3.new(0.8, 0.8, 0.8)
    v10.ImageColor3 = v11
    v10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v10.Position = IconPosition
    v10.Size = v3:map(function(a1) -- Line: 137
        return UDim2.fromOffset(40 * a1, 40 * a1)
    end)
    v9.contentImage = createElement("ImageLabel", v10)
    v9.contentText = createElement("TextLabel", {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = Enabled_2,
        TextColor3 = v4:map(function(a1) -- Line: 149 -- upvalues: darken (upval)
            return darken(a1, 0.5)
        end),
        TextSize = v3:map(function(a1) -- Line: 152
            return 16 * a1
        end),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.975),
        Size = UDim2.fromScale(0.9, 0.4),
        Visible = not v1,
    })
    v7.imageButton = createElement("ImageButton", v8, v9)
    return createElement("TextButton", v6, v7)
end