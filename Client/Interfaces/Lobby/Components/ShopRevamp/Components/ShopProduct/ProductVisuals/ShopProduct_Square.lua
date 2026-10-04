-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_Square
-- Decompile time: 11.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local Interfaces = Client.Interfaces
local Components = Interfaces.Universal.Components
local React = require(Packages.React)
local BattlepassItem = require(Interfaces.Lobby.Components.Battlepass.BattlepassItem)
local ProductFlair = require(script.Parent.Parent.Parent.ProductFlair)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local TextMarquee = require(Components.TextMarquee)
local createElement = React.createElement
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local memo = React.memo
local u41 = {aspectRatio = 1}
u41.productLabelSize = UDim2.fromScale(0.75, 0.11)
u41.productLabelPosition = UDim2.fromScale(0.5, 0.035)
u41.subLabelSize = UDim2.fromScale(0.75, 0.085)
u41.subLabelPosition = UDim2.fromScale(0.5, 0.15)
u41.priceLabelSize = UDim2.fromScale(1, 0.225)
u41.priceLabelPosition = UDim2.fromScale(0.05, 0.96)
u41.ownedLabelSize = UDim2.fromScale(0.9, 0.3)
u41.ownedLabelPosition = UDim2.fromScale(0.5, 0.6)
local u74 = {}
u74.Size = UDim2.fromScale(1, 1)
u74.Position = UDim2.fromScale(0.5, 0.52)
u74.AnchorPoint = Vector2.new(0.5, 0.5)
local u87 = {}
u87.Size = UDim2.fromScale(0.72, 0.72)
u87.Position = UDim2.fromScale(0.5, 0.56)
u87.AnchorPoint = Vector2.new(0.5, 0.5)
local u104 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

local function formatImage(a1) -- Line: 67
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

local function getPreviewName(a1) -- Line: 75
    if not a1 then
        return nil
    end
    return a1.name or a1.tower or a1.stat
end

local function createProductPreview(a1, a2) -- Line: 83
    -- upvalues: u87 (val), u74 (val), createElement (val), BattlepassItem (val)
    local item = a1.item
    local ItemType = if not item or not item.type then a1.ItemType else tostring(item.type)
    local v1 = if ItemType ~= "sticker" then u74 else u87
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

return memo(function(a1) -- Line: 139
    -- upvalues: createElement (val), u41 (val), ShopProduct_Base (val), ProductFlair (val), TextMarquee (val)
    -- upvalues: u104 (val), TextLabel (val), createProductPreview (val)
    local product = a1.product
    local rarityColor = a1.rarityColor
    local sequence = a1.sequence
    local type = product.item and product.item.type or product.ItemType
    local v1 = false
    if product.owned == true then
        v1 = true
        if type ~= "sticker" then
            v1 = type == "nametag"
        end
    end
    local v2 = {
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = rarityColor,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
    }
    local v3 = {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
            AspectRatio = u41.aspectRatio,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    }
    v3.Base = createElement(ShopProduct_Base, {rarityColor = rarityColor, sequence = sequence})
    v3.ProductFlair = v1 and createElement(ProductFlair, {
        flairText = "Owned",
        theme = "Green",
        native = {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(-0.02, u41.priceLabelPosition.Y.Scale),
            Size = UDim2.fromScale(0.4, 0.4),
        },
        textPosition = UDim2.fromScale(0.45, 0.5),
    })
    v3.FlairDarkeningFrame = v1 and createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 99,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})})
    v3.ProductTitle = createElement(TextMarquee, {
        Name = "ProductTitle",
        BackgroundTransparency = 1,
        TextScaled = true,
        alwaysMarquee = true,
        ZIndex = 9,
        Size = u41.productLabelSize,
        Position = u41.productLabelPosition,
        AnchorPoint = Vector2.new(0.5, 0),
        Text = product.productName or "Product",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = u104,
    }, {
        UIStroke = createElement("UIStroke", {
            Transparency = 0,
            Thickness = 0.125,
            Color = Color3.fromRGB(0, 0, 0),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v3.SubLabelTitle = createElement(TextLabel, {
        Name = "SubLabelTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = u41.subLabelSize,
        Position = u41.subLabelPosition,
        AnchorPoint = Vector2.new(0.5, 0),
        Text = product.subText or "",
        TextColor3 = rarityColor,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }, {})
    v3.ImageFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Preview = createProductPreview(product, sequence)})
    v3.PriceBackgroundFrame = createElement("ImageLabel", {
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
    local v4 = createElement
    local v5 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        ZIndex = 6,
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(1, 0.4),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
    }
    local v6 = {
        UIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.065, 0)}),
    }
    v3.PriceFadeFrame = v4("Frame", v5, v6)
    v4 = not v1
    if v4 then
        v5 = {
            BackgroundTransparency = 1,
            ZIndex = 9,
            AnchorPoint = Vector2.new(0, 1),
            Position = u41.priceLabelPosition,
            Size = u41.priceLabelSize,
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
        local v7 = a1.isRobuxPrice and createElement("TextLabel", {
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
                Transparency = 0.6,
                Color = Color3.fromRGB(0, 0, 0),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        }) or nil
        v6.RobuxIcon = v7
        v7 = not a1.isRobuxPrice and createElement("ImageLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
            Position = UDim2.fromScale(0.05, 0.5),
            Image = a1.priceIcon,
            ScaleType = Enum.ScaleType.Crop,
        }, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}) or nil
        v6.CurrencyIcon = v7
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
        v4 = createElement("Frame", v5, v6)
    end
    v3.PriceContainer = v4
    return createElement("Frame", v2, v3)
end)