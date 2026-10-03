-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_Ticket
-- Decompile time: 5.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local Modules = Shared.Modules
local Interfaces = Client.Interfaces
require(Modules.Enum)
local React = require(Packages.React)
local BattlepassItem = require(Interfaces.Lobby.Components.Battlepass.BattlepassItem)
local Button = require(Interfaces.Universal.Components.Inventory.Button)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local memo = React.memo
local u40 = {aspectRatio = 2}
u40.productLabelSize = UDim2.fromScale(0.75, 0.15)
u40.productLabelPosition = UDim2.fromScale(0.05, 0.075)
u40.subLabelSize = UDim2.fromScale(0.75, 0.125)
u40.subLabelPosition = UDim2.fromScale(0.05, 0.25)
u40.priceLabelSize = UDim2.fromScale(1, 0.25)
u40.priceLabelPosition = UDim2.fromScale(0.05, 0.925)
u40.ownedLabelSize = UDim2.fromScale(0.9, 0.3)
u40.ownedLabelPosition = UDim2.fromScale(0.5, 0.6)
local u73 = {}
u73.Size = UDim2.fromScale(0.7, 0.9)
u73.Position = UDim2.fromScale(0.5, 0.45)
u73.AnchorPoint = Vector2.new(0.5, 0.5)

local function formatImage(a1) -- Line: 55
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

local function getPreviewName(a1) -- Line: 63
    if not a1 then
        return nil
    end
    return a1.name or a1.tower or a1.stat
end

local function createProductPreview(a1, a2) -- Line: 71
    -- upvalues: u73 (val), createElement (val), BattlepassItem (val)
    local item = a1.item
    local v1 = {}
    local iconSize = a1.iconSize or u73.Size
    v1.Size = iconSize
    local iconPosition = a1.iconPosition or u73.Position
    v1.Position = iconPosition
    v1.AnchorPoint = u73.AnchorPoint
    if item then
        local name = if item then item.name or item.tower or item.stat else nil
        return createElement(BattlepassItem, {
            ZIndex = 8,
            playing = false,
            selection = false,
            showPlayer = false,
            showText = false,
            Size = v1.Size,
            Position = v1.Position,
            AnchorPoint = v1.AnchorPoint,
            type = item.type,
            name = name,
            stat = item.stat or name,
            tower = item.tower or name,
            skin = item.skin,
            amount = item.amount,
            icon = item.icon,
        }, {UIScale = createElement("UIScale", {Scale = a2.iconScale})})
    end
    local v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = v1.AnchorPoint,
        Position = v1.Position,
        Size = v1.Size,
    }
    local icon = a1.icon
    v2.Image = if type(icon) ~= "number" then icon or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(icon)
    v2.ScaleType = Enum.ScaleType.Fit
    return createElement("ImageLabel", v2, {
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            }),
        }),
        UIScale = createElement("UIScale", {Scale = a2.iconScale}),
    })
end

return memo(function(a1) -- Line: 127
    -- upvalues: u40 (val), createElement (val), ShopProduct_Base (val), TextLabel (val), createProductPreview (val)
    -- upvalues: Button (val)
    local product = a1.product
    local sequence = a1.sequence
    local v1 = u40
    local aspectRatio = product.aspectRatio or v1.aspectRatio
    v1.aspectRatio = aspectRatio
    local v2 = {
        ["Spin Tickets"] = Color3.fromRGB(255, 251, 0),
        ["Timescale Tickets"] = Color3.fromRGB(0, 255, 55),
        ["Revive Tickets"] = Color3.fromRGB(0, 217, 255),
    }
    local v3 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    local v4 = v2[product.productName] or Color3.fromRGB(75, 75, 75)
    v3.BackgroundColor3 = v4
    v3.Position = UDim2.fromScale(0.5, 0.5)
    v3.Size = UDim2.fromScale(0.9, 0.9)
    v4 = {
        UIGradient = createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 175, 175))),
            }),
        }),
    }
    v4.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
        AspectRatio = v1.aspectRatio,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
    })
    local v5 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://84257058893696",
        ImageTransparency = 0.85,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v6 = v2[product.productName] or Color3.fromRGB(75, 75, 75)
    v5.ImageColor3 = v6
    v5.ScaleType = Enum.ScaleType.Crop
    v4.BackgroundShine = createElement("ImageLabel", v5, {
        UIGradient = createElement("UIGradient", {
            Rotation = 0,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v5 = {hideInnerShadow = true}
    v6 = v2[product.productName] or Color3.fromRGB(75, 75, 75)
    v5.rarityColor = v6
    v5.sequence = sequence
    v4.Base = createElement(ShopProduct_Base, v5)
    v4.ProductTitle = createElement(TextLabel, {
        Name = "ProductTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = v1.productLabelSize,
        Position = v1.productLabelPosition,
        AnchorPoint = Vector2.new(0, 0),
        Text = product.productName or "Product",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {})
    v4.SubLabelTitle = createElement(TextLabel, {
        Name = "SubLabelTitle",
        BackgroundTransparency = 1,
        TextTransparency = 0.25,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = v1.subLabelSize,
        Position = v1.subLabelPosition,
        AnchorPoint = Vector2.new(0, 0),
        Text = product.subText or "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {})
    v4.ImageFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.65, 0.61),
        Size = UDim2.fromScale(1, 1),
    }, {Preview = createProductPreview(product, sequence)})
    local v7 = product.showSpinTicketPreview and product.onSpinTicketPreview and createElement(Button, {
        dontScale = true,
        dontUseRatio = true,
        text = "Preview",
        textSize = 16,
        zIndex = 10,
        anchorPoint = Vector2.new(1, 1),
        color = Color3.fromRGB(0, 170, 255),
        onClick = product.onSpinTicketPreview,
        position = UDim2.fromScale(0.95, 0.93),
        size = UDim2.fromScale(0.3, 0.2),
    }) or nil
    v4.PreviewButton = v7
    v4.PriceBackgroundFrame = createElement("ImageLabel", {
        Image = "rbxassetid://91405171197410",
        ImageTransparency = 1,
        BackgroundTransparency = 1,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1.23),
        Size = UDim2.fromScale(1.475, 1.475),
        ScaleType = Enum.ScaleType.Fit,
        ImageColor3 = Color3.fromRGB(0, 0, 0),
    })
    v4.PriceFadeFrame = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        ZIndex = 6,
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(1, 0.4),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.065, 0)}),
    })
    v5 = {
        BackgroundTransparency = 1,
        ZIndex = 9,
        AnchorPoint = Vector2.new(0, 1),
        Position = v1.priceLabelPosition,
        Size = v1.priceLabelSize,
    }
    v6 = {
        ListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.02, 0),
        }),
    }
    local v8 = a1.isRobuxPrice and createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        LayoutOrder = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
        Position = UDim2.fromScale(0.05, 0.5),
        Text = utf8.char(57346),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }, {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        UIStroke = createElement("UIStroke", {
            Thickness = 0.08,
            Transparency = 0,
            Color = Color3.fromRGB(0, 0, 0),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    }) or nil
    v6.RobuxIcon = v8
    v8 = not a1.isRobuxPrice and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
        Position = UDim2.fromScale(0.05, 0.5),
        Image = a1.priceIcon,
        ScaleType = Enum.ScaleType.Crop,
    }, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}) or nil
    v6.CurrencyIcon = v8
    v6.PriceTextLabel = createElement(TextLabel, {
        Name = "PriceTextLabel",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 6,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.8, 0.6),
        AnchorPoint = Vector2.new(0.5, 0),
        Text = a1.priceText,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {})
    v4.PriceContainer = createElement("Frame", v5, v6)
    return createElement("Frame", v3, v4)
end)