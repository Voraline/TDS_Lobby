-- Script path: ReplicatedStorage.Client.Interfaces.Components.ActionButton
-- Decompile time: 13.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProductInfoCache = require(ReplicatedStorage.Shared.Modules.ProductInfoCache)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local Event = React.Event
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
local useSpring = ReactFlow.useSpring
local u33 = utf8.char(57346)

local function glossGradient() -- Line: 48 -- upvalues: createElement (val)
    return createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
        }),
    })
end

local function strokeThickness(a1) -- Line: 58 -- types: a1: number?
    if not a1 then
        return 0.02
    end
    if a1 > 1 then
        return a1 / 25
    end
    return a1
end

local function labelStroke(a1, a2, a3) -- Line: 70
    -- upvalues: createElement (val)
    local v1 = {
        Color = a1 or Color3.fromRGB(0, 0, 0),
        LineJoinMode = Enum.LineJoinMode.Bevel,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }
    local v2 = a2 or 0.03
    v1.Thickness = if v2 then if not (v2 > 1) then v2 else v2 / 25 else 0.02
    v1.Transparency = a3 or 0.5
    return createElement("UIStroke", v1)
end

local function textLabel(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 80
    -- upvalues: createElement (val), labelStroke (val)
    return createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = false,
        TextWrapped = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = a2,
        Text = a1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = a3,
        TextTransparency = if not a8 then 0 else 0.2,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = a4,
    }, {Stroke = labelStroke(a5, a6, a7)})
end

local function currencyContent(a1, a2, a3, a4, a5, a6) -- Line: 116
    -- upvalues: createElement (val), labelStroke (val)
    local v1 = {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 4),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    if not a3 then
        v1.CurrencyIcon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Image = a2 or "rbxassetid://6794338720",
            ImageTransparency = if not a6 then 0 else 0.35,
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            ZIndex = a5,
        })
    else
        v1.CurrencyGlyph = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.new(0, 0, 1, 0),
            Text = a3,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = a4,
            TextTransparency = if not a6 then 0 else 0.2,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            ZIndex = a5,
        }, {Stroke = labelStroke(Color3.fromRGB(40, 68, 17), 3, 0)})
    end
    v1.Value = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Size = UDim2.new(0, 0, 1, 0),
        Text = a1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = a4,
        TextTransparency = if not a6 then 0 else 0.2,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = a5,
    }, {Stroke = labelStroke(Color3.fromRGB(40, 68, 17), 3, 0)})
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(0, 0, 0.620000005, 0),
        ZIndex = a5,
    }, v1)
end

return function(a1) -- Line: 203
    -- upvalues: useState (val), useRef (val), useSpring (val), useFontScale (val), useEffect (val)
    -- upvalues: ProductInfoCache (val), createElement (val), Event (val), glossGradient (val), currencyContent (val)
    -- upvalues: u33 (val), textLabel (val)
    local v1 = a1.Variant or "primary"
    local u5 = a1.Disabled == true
    local v2 = v1 == "danger"
    local u13 = a1.ReducedMotion == true
    local v3 = true
    if a1.ShowCurrency ~= true then
        v3 = v1 == "purchase"
    end
    local v4, u24 = useState(nil)
    local u27 = useRef(false)
    local v5, u31 = useSpring({target = 1, start = 1, damper = 0.6, speed = 40})
    local v6 = useFontScale({scale = a1.FontScale or 1, size = a1.TextSize or 20})
    local TextSize = if not a1.TextSizeIsScaled then v6 else if not a1.TextSize then v6 else a1.TextSize
    local v7 = {u5, u13}
    useEffect(function() -- Line: 225 -- upvalues: u5 (val), u27 (val), u31 (val), u13 (val)
        if u5 then
            u27.current = false
            u31({target = 1}, u13)
        end
    end, v7)
    local v8 = useEffect
    v7 = {a1.ProductId}
    v8(function() -- Line: 234 -- upvalues: a1 (val), u24 (val), ProductInfoCache (upval)
        if not a1.ProductId then
            u24(nil)
            return
        end
        local u18 = ((ProductInfoCache.getProductInfo(a1.ProductId, Enum.InfoType.Product)):andThen(function(a1) -- Line: 241 -- upvalues: u24 (upval)
            u24(a1.PriceInRobux)
        end)):catch(warn)
        return function() -- Line: 246 -- upvalues: u18 (val)
            u18:cancel()
        end
    end, v7)
    local Label = if not v4 then a1.Label else tostring(v4)
    local v9 = a1.ZIndex or 1
    local BackgroundColor3 = if not u5 then if not a1.BackgroundColor3 then if not v2 then Color3.fromRGB(80, 255, 83) else Color3.fromRGB(220, 37, 37) else a1.BackgroundColor3 else Color3.fromRGB(68, 110, 69)
    local StrokeColor = if not a1.StrokeColor then if not v2 then Color3.fromRGB(85, 255, 82) else Color3.fromRGB(163, 55, 55) else a1.StrokeColor
    local v10 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v10.AnchorPoint = AnchorPoint
    v10.LayoutOrder = a1.LayoutOrder
    v10.Position = a1.Position
    v10.Size = a1.Size
    v10.Visible = a1.Visible
    v10.ZIndex = v9
    local v11 = {}
    local v12 = {
        Active = not u5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutoButtonColor = false,
        BackgroundColor3 = BackgroundColor3,
    }
    v12.BackgroundTransparency = if not u5 then 0 else 0.25
    v12.BorderSizePixel = 1
    v12.Image = ""
    v12.ImageColor3 = Color3.fromRGB(89, 255, 186)
    v12.ImageTransparency = if not u5 then 0 else 0.35
    v12.Position = UDim2.fromScale(0.5, 0.5)
    v12.ScaleType = Enum.ScaleType.Tile
    v12.Selectable = not u5
    v12.Size = UDim2.fromScale(1, 1)
    v12.ZIndex = v9
    v12.ref = a1.ButtonRef
    local Activated = Event.Activated
    v12[Activated] = if not u5 then a1.OnActivated else nil
    local MouseButton1Down = Event.MouseButton1Down
    v12[MouseButton1Down] = if not u5 then function() -- Line: 293 -- upvalues: u31 (val), u13 (val)
        u31({target = 0.95}, u13)
    end else nil
    local MouseButton1Up = Event.MouseButton1Up
    v12[MouseButton1Up] = if not u5 then function() -- Line: 300 -- upvalues: u31 (val), u27 (val), u13 (val)
        u31({target = if not u27.current then 1 else 1.06}, u13)
    end else nil
    local MouseEnter = Event.MouseEnter
    v12[MouseEnter] = if not u5 then function() -- Line: 307 -- upvalues: u27 (val), u31 (val), u13 (val)
        u27.current = true
        u31({target = 1.06}, u13)
    end else nil
    local MouseLeave = Event.MouseLeave
    v12[MouseLeave] = if not u5 then function() -- Line: 315 -- upvalues: u27 (val), u31 (val), u13 (val)
        u27.current = false
        u31({target = 1}, u13)
    end else nil
    local v13 = {Scale = createElement("UIScale", {Scale = v5})}
    v13.Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)})
    v13.Gradient = glossGradient()
    v13.Stroke = createElement("UIStroke", {
        Thickness = 0.02,
        Color = StrokeColor,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        Transparency = if not u5 then 0 else 0.5,
    })
    local v14 = if not v3 then textLabel(Label, UDim2.new(0, 0, 0.5, 0), TextSize, v9, Color3.fromRGB(0, 0, 0), 2, 0.5, u5) else currencyContent(Label, a1.CurrencyIcon, if not a1.ProductId then a1.CurrencyGlyph else a1.CurrencyGlyph or u33, TextSize, v9, u5)
    v13.Label = v14
    v11.Button = createElement("ImageButton", v12, v13)
    return createElement("Frame", v10, v11)
end