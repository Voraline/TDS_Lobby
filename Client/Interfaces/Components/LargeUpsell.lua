-- Script path: ReplicatedStorage.Client.Interfaces.Components.LargeUpsell
-- Decompile time: 11.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useProductInfo = require(ReplicatedStorage.Client.Interfaces.Hooks.useProductInfo)
local createElement = React.createElement
local Event = React.Event
local u43 = utf8.char(57346)
return function(a1) -- Line: 28
    -- upvalues: useProductInfo (val), createElement (val), Event (val), ImageLabel (val), TextLabel (val), u43 (val)
    -- upvalues: ActionButton (val)
    local v1, v2 = useProductInfo(Enum.InfoType.Product, a1.ProductId)
    local PriceInRobux = if not v2 then 0 else v2.PriceInRobux
    local OriginalPrice = a1.OriginalPrice
    local v3 = not v1
    if v3 then
        v3 = false
        if OriginalPrice ~= nil then
            v3 = false
            if OriginalPrice > 0 then
                v3 = PriceInRobux < OriginalPrice
            end
        end
    end
    local v4 = if not v3 or not OriginalPrice then 0 else math.round(PriceInRobux / OriginalPrice * 100)
    local v5 = {
        Active = true,
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Image = "",
        Selectable = true,
        Size = UDim2.fromScale(1, 1),
        Visible = a1.Visible,
        ZIndex = 1,
    }
    v5[Event.Activated] = a1.OnActivated
    local v6 = {
        BackgroundGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 22, 22))),
            }),
        }),
        BackgroundStroke = createElement("UIStroke", {
            Thickness = 0.012,
            Transparency = 0.55,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        DropShadow = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 14, 1, 14),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }),
    }
    v6.Artwork = createElement(ImageLabel, {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        Image = a1.Artwork,
        Position = UDim2.fromScale(0.315, 0.5),
        ScaleType = Enum.ScaleType.Crop,
        Size = UDim2.fromScale(0.55, 0.84),
    }, {
        ForegroundArtwork = if not a1.ForegroundArtwork then nil else createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = a1.ForegroundArtwork,
            Position = UDim2.fromScale(0.4, 0.55),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.8, 1),
        }, {
            Gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.5),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 0.5)),
                }),
            }),
        }),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        Stroke = createElement("UIStroke", {
            Thickness = 0.012,
            Transparency = 0.7,
            Color = Color3.fromRGB(255, 255, 255),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        ArtworkGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.1),
                NumberSequenceKeypoint.new(0.7, 0.1),
                (NumberSequenceKeypoint.new(1, 0.55)),
            }),
        }),
    })
    local v7 = {
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(24, 24, 24),
        Position = UDim2.fromScale(0.79, 0.5),
        Size = UDim2.fromScale(0.34, 0.84),
    }
    local v8 = {Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)})}
    v8.Gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(46, 46, 46)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 18))),
        }),
    })
    v8.Stroke = createElement("UIStroke", {
        Thickness = 0.02,
        Transparency = 0.72,
        Color = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v8.Eyebrow = createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        Text = "LIMITED-TIME OFFER",
        TextScaled = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.045),
        Size = UDim2.fromScale(0.82, 0.07),
        TextColor3 = Color3.fromRGB(255, 190, 94),
    })
    v8.Title = createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Black",
        TextScaled = true,
        StrokeThickness = 2,
        StrokeTransparency = 0.2,
        TextWrapped = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.12),
        Size = UDim2.fromScale(0.86, 0.17),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeColor = Color3.fromRGB(0, 0, 0),
    })
    v8.Divider = createElement("Frame", {
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.3),
        Size = UDim2.fromScale(0.82, 0.008),
    })
    v8.Timer = if not a1.Duration then nil else createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(13, 13, 13),
        Position = UDim2.fromScale(0.5, 0.345),
        Size = UDim2.fromScale(0.82, 0.15),
    }, {
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Stroke = createElement("UIStroke", {
            Thickness = 0.025,
            Transparency = 0.82,
            Color = Color3.fromRGB(255, 255, 255),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        Caption = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            Text = "ENDS IN",
            TextScaled = true,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.06, 0.5),
            Size = UDim2.fromScale(0.5, 0.45),
            TextColor3 = Color3.fromRGB(170, 170, 170),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        Duration = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Black",
            TextScaled = true,
            ZIndex = 5,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.94, 0.5),
            Size = UDim2.fromScale(0.45, 0.5),
            Text = a1.Duration,
            TextColor3 = Color3.fromRGB(255, 190, 94),
            TextXAlignment = Enum.TextXAlignment.Right,
        }),
    })
    v8.Discount = if not v3 then nil else createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 176, 157),
        Position = UDim2.fromScale(0.5, 0.535),
        Size = UDim2.fromScale(0.82, 0.13),
    }, {
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 159, 48)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 52, 62))),
            }),
        }),
        Label = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Black",
            StrokeThickness = 2,
            StrokeTransparency = 0.15,
            TextScaled = true,
            ZIndex = 5,
            Size = UDim2.fromScale(1, 1),
            StrokeColor = Color3.fromRGB(91, 24, 10),
            Text = ("%*%% OFF"):format(v4),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            Padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0.12, 0),
                PaddingLeft = UDim.new(0.08, 0),
                PaddingRight = UDim.new(0.08, 0),
                PaddingTop = UDim.new(0.12, 0),
            }),
        }),
    })
    v8.OriginalPrice = if not v3 or not OriginalPrice then nil else createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        TextScaled = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.68),
        Size = UDim2.fromScale(0.66, 0.08),
        Text = ("WAS %* %*"):format(u43, OriginalPrice),
        TextColor3 = Color3.fromRGB(178, 178, 178),
    }, {
        Strike = createElement("Frame", {
            BorderSizePixel = 0,
            Rotation = -5,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 68, 68),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.07),
        }),
    })
    v8.Purchase = createElement(ActionButton, {
        ReducedMotion = true,
        ShowCurrency = true,
        TextSize = 35,
        Variant = "purchase",
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        CurrencyGlyph = u43,
        Disabled = v1,
        Label = if not v1 then tostring(PriceInRobux) else "...",
        Position = UDim2.fromScale(0.5, 0.865),
        Size = UDim2.fromScale(0.82, 0.15),
        OnActivated = a1.OnActivated,
    })
    v6.OfferPanel = createElement("Frame", v7, v8)
    return createElement("ImageButton", v5, v6)
end