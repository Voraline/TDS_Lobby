-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.CurrencyItem
-- Decompile time: 6.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local Event = React.Event
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState

local function map(a1, a2, a3, a4, a5) -- Line: 28 -- types: a1: number, a2: number, a3: number, a4: number, a5: number
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4
end

return function(a1) -- Line: 38
    -- upvalues: useState (val), useRef (val), useSpring (val), useEffect (val), createElement (val), Event (val)
    local u3 = a1.visible ~= false
    local u7 = a1.onlyShowOnChange == true
    local u11, u12 = useState(not u7)
    local u15 = useRef(true)
    local u18 = useRef(0)
    local v1, u28 = useSpring(if not u11 then 0 else 1, 1, 14, true)
    local v2 = {u11}
    useEffect(function() -- Line: 46 -- upvalues: u28 (val), u11 (val)
        u28(if not u11 then 0 else 1)
    end, v2)
    local v3 = useEffect
    v2 = {a1.baseValue, u7}
    v3(function() -- Line: 50 -- upvalues: u7 (val), u15 (val), u18 (val), u12 (val)
        if not u7 then
            return
        end
        if u15.current then
            u15.current = false
            return
        end
        local v1 = u18
        v1.current = v1.current + 1
        local current = u18.current
        u12(true)
        local u16 = task.delay(5, function() -- Line: 64 -- upvalues: u18 (upval), current (val), u12 (upval)
            if u18.current == current then
                u12(false)
            end
        end)
        return function() -- Line: 70 -- upvalues: u16 (val)
            task.cancel(u16)
        end
    end, v2)
    v3 = v1:map(function(a1) -- Line: 75
        return 1 - a1
    end)
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 1,
        Name = "Currency",
        Text = "",
        TextSize = 8,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        LayoutOrder = a1.layoutOrder or 0,
    }
    local position = a1.position or UDim2.new(0, 0, 0.5, 0)
    v4.Position = position
    local size = a1.size or UDim2.fromOffset(0, 40)
    v4.Size = size
    v4.TextColor3 = Color3.fromRGB(27, 42, 53)
    v4.Visible = v1:map(function(a1) -- Line: 98 -- upvalues: u3 (val)
        return u3 and a1 > 0.01
    end)
    local v5 = {
        DropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 1,
            Image = "rbxassetid://9073106548",
            SliceScale = 1.25,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = v1:map(function(a1) -- Line: 111
                return (a1 - 0) * -0.8 / 1 + 1
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 8, 1, 8),
            SliceCenter = Rect.new(39, 39, 39, 39),
        }),
        Background = createElement("Frame", {
            BorderSizePixel = 1,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v1:map(function(a1) -- Line: 124
                return (a1 - 0) * -0.6 / 1 + 1
            end),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
        }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
        Icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 1,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Image = a1.icon,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = v3,
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.fromOffset(56, 56),
        }),
        Amount = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 1,
            TextSize = 30,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.new(1, 0, 0, 50),
            Text = a1.amount,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v3,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
        }, {
            UIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 26), PaddingRight = UDim.new(0, 30)}),
            UIStroke = createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = v1:map(function(a1) -- Line: 180
                    return (a1 - 0) * -0.09999999999999998 / 1 + 1
                end),
            }),
        }),
    }
    local v6 = createElement
    local v7 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 170, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        BorderSizePixel = 1,
        FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(30, 30),
        Text = "",
        TextColor3 = Color3.fromRGB(27, 42, 53),
        TextSize = 8,
        Visible = not a1.hideBuyButton,
        ZIndex = 1,
    }
    v7[Event.Activated] = a1.onClicked
    v5.Button = v6("TextButton", v7, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        DropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 1,
            Image = "rbxassetid://9073106548",
            ImageTransparency = 0.2,
            SliceScale = 1.25,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 8, 1, 8),
            SliceCenter = Rect.new(39, 39, 39, 39),
        }),
        Icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 1,
            Image = "rbxassetid://9230983672",
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(24, 24),
        }),
    })
    return createElement("TextButton", v4, v5)
end