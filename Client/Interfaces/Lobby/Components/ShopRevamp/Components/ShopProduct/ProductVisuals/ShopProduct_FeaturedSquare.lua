-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_FeaturedSquare
-- Decompile time: 13.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local Interfaces = Client.Interfaces
local Components = Interfaces.Universal.Components
local React = require(Packages.React)
local BattlepassItem = require(Interfaces.Lobby.Components.Battlepass.BattlepassItem)
require(Client.Interfaces.LegacyInterface.Icons)
local ProductFlair = require(script.Parent.Parent.Parent.ProductFlair)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
require(Components.TextMarquee)
local createElement = React.createElement
local LockedProductContent = require(script.Parent.Parent.LockedProductContent)
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local memo = React.memo
Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local u57 = {aspectRatio = 1}
u57.productLabelSize = UDim2.fromScale(0.75, 0.11)
u57.productLabelPosition = UDim2.fromScale(0.5, 0.035)
u57.subLabelSize = UDim2.fromScale(0.75, 0.085)
u57.subLabelPosition = UDim2.fromScale(0.5, 0.15)
u57.priceLabelSize = UDim2.fromScale(1, 0.2)
u57.priceLabelPosition = UDim2.fromScale(0.05, 0.96)
local u82 = {}
u82.Size = UDim2.fromScale(1.1, 1.1)
u82.Position = UDim2.fromScale(0.5, 0.625)
u82.AnchorPoint = Vector2.new(0.5, 0.5)
local u101 = ("<font color=\"rgb(255,255,255)\">%*</font>"):format((utf8.char(57346)))

local function createPriceIcon(a1) -- Line: 68 -- upvalues: createElement (val), u101 (val)
    if a1.isRobux then
        return createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            LayoutOrder = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
            Text = u101,
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
        })
    end
    return createElement("ImageLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
        Image = a1.icon,
        ScaleType = Enum.ScaleType.Crop,
    }, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
end

local function createPriceRows(a1) -- Line: 107 -- upvalues: createElement (val), createPriceIcon (val), TextLabel (val)
    local v1
    local v2 = {
        ListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01, 0),
        }),
    }
    for i, j in a1 do
        v1 = ("PriceRow_%*"):format(i)
        v2[v1] = (createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 9,
            LayoutOrder = i,
            Size = UDim2.fromScale(1, 1 / math.max(#a1, 1)),
        }, {
            ListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.02, 0),
            }),
            Icon = createPriceIcon(j),
            Text = createElement(TextLabel, {
                Name = "PriceTextLabel",
                BackgroundTransparency = 1,
                FontWeight = "Bold",
                StrokeThickness = 0.125,
                ZIndex = 9,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.8, 0.78),
                AnchorPoint = Vector2.new(0.5, 0),
                Text = j.text or "",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {}),
        }))
    end
    return v2
end

local u104 = {}
u104.skin = {
    Size = UDim2.fromScale(1.1, 1.1),
    Position = UDim2.fromScale(0.5, 0.625),
    AnchorPoint = Vector2.new(0.5, 0.5),
}
u104.emote = {
    Size = UDim2.fromScale(1.1, 1.1),
    Position = UDim2.fromScale(0.5, 0.625),
    AnchorPoint = Vector2.new(0.5, 0.5),
}
u104.sticker = {
    Size = UDim2.fromScale(0.72, 0.72),
    Position = UDim2.fromScale(0.5, 0.56),
    AnchorPoint = Vector2.new(0.5, 0.5),
}
u104.nametag = {
    Size = UDim2.fromScale(1, 1),
    Position = UDim2.fromScale(0.5, 0.52),
    AnchorPoint = Vector2.new(0.5, 0.5),
}

local function formatImage(a1) -- Line: 176
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

local function getPreviewName(a1) -- Line: 184
    if not a1 then
        return nil
    end
    return a1.name or a1.tower or a1.stat
end

local function createProductPreview(a1, a2) -- Line: 192
    -- upvalues: u104 (val), u82 (val), createElement (val), BattlepassItem (val)
    local item = a1.item
    local ItemType = if not item or not item.type then a1.ItemType else tostring(item.type)
    local v1 = u104[ItemType] or u82
    local iconSize = a1.iconSize or v1.Size
    local iconPosition = a1.iconPosition or v1.Position
    local iconAnchorPoint = a1.iconAnchorPoint or v1.AnchorPoint
    if item then
        local name = if item then item.name or item.tower or item.stat else nil
        return createElement(BattlepassItem, {
            ZIndex = 8,
            playing = false,
            selection = false,
            showPlayer = false,
            showText = false,
            Size = iconSize,
            Position = iconPosition,
            AnchorPoint = iconAnchorPoint,
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
        AnchorPoint = iconAnchorPoint,
        Position = iconPosition,
        Size = iconSize,
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

return memo(function(a1) -- Line: 249
    -- upvalues: u57 (val), createElement (val), ShopProduct_Base (val), ProductFlair (val), TextLabel (val)
    -- upvalues: createProductPreview (val), createPriceRows (val), LockedProductContent (val)
    local product = a1.product
    local rarityColor = a1.rarityColor
    local sequence = a1.sequence
    local v1 = u57
    local type = product.item and product.item.type or product.ItemType
    local v2 = false
    if product.owned == true then
        v2 = true
        if type ~= "skin" then
            v2 = true
            if type ~= "emote" then
                v2 = true
                if type ~= "sticker" then
                    v2 = type == "nametag"
                end
            end
        end
    end
    local priceRows = a1.priceRows or {{icon = a1.priceIcon, isRobux = a1.isRobuxPrice, text = a1.priceText}}
    local v3 = {
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = rarityColor,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
    }
    local v4 = {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
            AspectRatio = v1.aspectRatio,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    }
    v4.Base = createElement(ShopProduct_Base, {rarityColor = rarityColor, sequence = sequence})
    local v5 = a1.locked and createElement("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})}) or nil
    v4.LockedFadeFrame = v5
    v4.ProductFlair = v2 and createElement(ProductFlair, {
        flairText = "Owned",
        theme = "Green",
        native = {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(-0.02, v1.priceLabelPosition.Y.Scale),
            Size = UDim2.fromScale(0.4, 0.4),
        },
        textPosition = UDim2.fromScale(0.45, 0.5),
    })
    v4.FlairDarkeningFrame = v2 and createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 99,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})})
    v4.ProductTitle = createElement(TextLabel, {
        Name = "ProductTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = UDim2.fromScale(1, 0.125),
        Position = UDim2.fromScale(0.5, 0.05),
        AnchorPoint = Vector2.new(0.5, 0),
        Text = product.productName or "Product",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Center,
    }, {})
    v4.SubLabelTitle = createElement(TextLabel, {
        Name = "SubLabelTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = UDim2.fromScale(1, 0.09),
        Position = UDim2.fromScale(0.5, 0.185),
        AnchorPoint = Vector2.new(0.5, 0),
        Text = product.subText or "",
        TextColor3 = rarityColor,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Center,
    }, {})
    v4.ImageFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Preview = createProductPreview(product, sequence)})
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
    v4.PriceContainer = not v2 and not a1.locked and createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 50,
        AnchorPoint = Vector2.new(0, 1),
        Position = v1.priceLabelPosition,
        Size = v1.priceLabelSize,
    }, (createPriceRows(priceRows)))
    local locked = a1.locked and createElement(LockedProductContent, {
        message = a1.lockedMessage,
        onRequirementClick = a1.onUnlockRequirementClick,
        robuxPrice = a1.lockedRobuxPrice,
    })
    v4.LockedContainer = locked
    return createElement("Frame", v3, v4)
end)