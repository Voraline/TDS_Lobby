-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_Base
-- Decompile time: 6.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local createElement = React.createElement

local function transformValue(a1, a2, a3, a4, a5) -- Line: 16
    -- upvalues: 
    return a4 + (a1 - a2) * (a5 - a4) / (a3 - a2)
end

local function adjustColor(a1, a2) -- Line: 26 -- types: a1: userdata, a2: number
    local v1 = math.clamp(a2, -1, 1)
    if v1 >= 0 then
        return a1:Lerp(Color3.new(1, 1, 1), v1)
    end
    return a1:Lerp(Color3.new(0, 0, 0), -v1)
end

return React.memo(function(a1) -- Line: 37 -- upvalues: createElement (val), React (val), adjustColor (val) -- types: a1: table
    local rarityColor = a1.rarityColor
    local sequence = a1.sequence
    local UICornerRadius = a1.UICornerRadius
    local Fragment = React.Fragment
    local v1 = {
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.05, 0)}),
    }
    v1.UIScale = createElement("UIScale", {Scale = sequence.buttonScale})
    v1.ContentGradient = createElement("UIGradient", {
        Rotation = -90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, adjustColor(rarityColor, -0.25))),
        }),
    })
    v1.UIShadow = createElement("UIShadow", {
        Transparency = 0.5,
        BlurRadius = UDim.new(0.05, 0),
        Offset = UDim2.fromOffset(0, 5),
        Spread = UDim2.fromOffset(4, 4),
    })
    local v2 = not a1.hideInnerShadow and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://88103380194506",
        ImageTransparency = 0,
        ZIndex = -2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ScaleType = Enum.ScaleType.Stretch,
    }, {
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.05, 0)}),
    }) or nil
    v1.InnerShadowImage = v2
    v1.ShineImage = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://70784928442253",
        ImageTransparency = 0,
        Visible = true,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = adjustColor(rarityColor, 0.25),
        ScaleType = Enum.ScaleType.Stretch,
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = 45,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.4),
                NumberSequenceKeypoint.new(0.5, 0),
                (NumberSequenceKeypoint.new(1, 0.4)),
            }),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.05, 0)}),
    })
    v1.BackgroundShine = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://84257058893696",
        ImageTransparency = 0.85,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        ImageColor3 = adjustColor(a1.rarityColor, 0.5),
        ScaleType = Enum.ScaleType.Crop,
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0.95),
                (NumberSequenceKeypoint.new(1, 0)),
            }),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.05, 0)}),
    })
    v1.BottomFadeFrame = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.8,
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.fromScale(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0),
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.065, 0)}),
    })
    v1.InnerGlowImage = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://88103380194506",
        Visible = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1.01),
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ImageTransparency = sequence.outlineTransparency:map(function(a1) -- Line: 159 -- types: a1: number
            return (a1 - 0) * 0.30000000000000004 / 1 + 0.7
        end),
        ScaleType = Enum.ScaleType.Stretch,
    }, {
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.065, 0)}),
    })
    v1.ProductStrokeFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 6,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        UIStroke = createElement("UIStroke", {
            Thickness = 2,
            Color = adjustColor(rarityColor, 0.25),
            Transparency = sequence.borderTransparency,
            StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
        }),
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.05, 0)}),
    })
    v1.SelectedStrokeFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 7,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        UIStroke = createElement("UIStroke", {
            Thickness = 3,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = sequence.outlineTransparency,
            StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
        }),
        UICorner = createElement("UICorner", {CornerRadius = UICornerRadius or UDim.new(0.05, 0)}),
    })
    return createElement(Fragment, nil, v1)
end)