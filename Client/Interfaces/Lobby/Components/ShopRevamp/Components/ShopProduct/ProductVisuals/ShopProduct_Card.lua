-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_Card
-- Decompile time: 16.33 ms

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
local TextMarquee = require(Components.TextMarquee)
local createElement = React.createElement
local LockedProductContent = require(script.Parent.Parent.LockedProductContent)
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local memo = React.memo
local u56 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local u57 = {aspectRatio = 0.674}
u57.productLabelSize = UDim2.fromScale(0.8, 0.085)
u57.productLabelPosition = UDim2.fromScale(0.5, 0.035)
u57.subLabelSize = UDim2.fromScale(0.75, 0.06)
u57.subLabelPosition = UDim2.fromScale(0.5, 0.13)
u57.priceLabelSize = UDim2.fromScale(1, 0.135)
u57.priceLabelPosition = UDim2.fromScale(0.05, 0.98)
u57.ownedLabelSize = UDim2.fromScale(0.9, 0.3)
u57.ownedLabelPosition = UDim2.fromScale(0.5, 0.6)
local u96 = ("<font color=\"rgb(255,255,255)\">%*</font>"):format((utf8.char(57346)))

local function createPriceIcon(a1) -- Line: 65 -- upvalues: createElement (val), u96 (val)
    if a1.isRobux then
        return createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            LayoutOrder = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
            Text = u96,
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

local function createPriceRows(a1, a2) -- Line: 104
    -- upvalues: createElement (val), TextLabel (val), createPriceIcon (val)
    local v1
    local v2 = if not a2 then 0 else math.max(#a1 - 1, 0)
    local v3 = 1 / math.max(#a1 + v2 * 0.35, 1)
    local v4 = {
        ListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.01, 0),
        }),
    }
    local v5 = nil
    local v6 = nil
    for i, j in a1, v5, v6 do
        if a2 and i > 1 then
            v1 = ("PriceSeparator_%*"):format(i)
            v4[v1] = (createElement(TextLabel, {
                Name = "PriceSeparatorTextLabel",
                BackgroundTransparency = 1,
                FontWeight = "Bold",
                StrokeThickness = 0.125,
                TextTransparency = 0.25,
                Text = "OR",
                ZIndex = 9,
                LayoutOrder = i * 2 - 1,
                Size = UDim2.fromScale(0.2, v3 * 0.6),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {}))
        end
        v1 = ("PriceRow_%*"):format(i)
        v4[v1] = (createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 9,
            LayoutOrder = i * 2,
            Size = UDim2.fromScale(1, v3),
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
    return v4
end

local u99 = {}
u99.Size = UDim2.fromScale(1.1, 1.1)
u99.Position = UDim2.fromScale(0.5, 0.625)
u99.AnchorPoint = Vector2.new(0.5, 0.5)
local u112 = {}
u112.Size = UDim2.fromScale(0.75, 0.75)
u112.Position = UDim2.fromScale(0.5, 0.6)
u112.AnchorPoint = Vector2.new(0.5, 0.5)

local function formatImage(a1) -- Line: 181
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

local function getPreviewName(a1) -- Line: 189
    if not a1 then
        return nil
    end
    return a1.name or a1.tower or a1.stat
end

local function createProductPreview(a1, a2) -- Line: 197
    -- upvalues: u112 (val), u99 (val), createElement (val), BattlepassItem (val)
    local item = a1.item
    local ItemType = if not item or not item.type then a1.ItemType else tostring(item.type)
    local v1 = if ItemType ~= "emote" then u99 else u112
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

return memo(function(a1) -- Line: 251
    -- upvalues: createElement (val), u57 (val), ShopProduct_Base (val), ProductFlair (val), TextMarquee (val)
    -- upvalues: u56 (val), TextLabel (val), createProductPreview (val), createPriceRows (val)
    -- upvalues: LockedProductContent (val)
    local product = a1.product
    local rarityColor = a1.rarityColor
    local sequence = a1.sequence
    local priceRows = a1.priceRows or {{icon = a1.priceIcon, isRobux = a1.isRobuxPrice, text = a1.priceText}}
    local type = product.item and product.item.type or product.ItemType
    local v1 = false
    if product.owned == true then
        v1 = true
        if type ~= "skin" then
            v1 = type == "emote"
        end
    end
    local v2 = if not a1.priceRowsAreAlternatives then 0 else math.max(#priceRows - 1, 0)
    local v3 = #priceRows + v2 * 0.35
    local v4 = {
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = rarityColor,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
    }
    local v5 = {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
            AspectRatio = u57.aspectRatio,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    }
    v5.Base = createElement(ShopProduct_Base, {rarityColor = rarityColor, sequence = sequence})
    local v6 = a1.locked and createElement("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})}) or nil
    v5.LockedFadeFrame = v6
    v5.ProductFlair = v1 and createElement(ProductFlair, {
        flairText = "Owned",
        theme = "Green",
        native = {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(-0.02, u57.priceLabelPosition.Y.Scale),
            Size = UDim2.fromScale(0.4, 0.4),
        },
        textPosition = UDim2.fromScale(0.45, 0.5),
    })
    v5.FlairDarkeningFrame = v1 and createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 99,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})})
    v5.ProductTitle = createElement(TextMarquee, {
        Name = "ProductTitle",
        BackgroundTransparency = 1,
        TextScaled = true,
        alwaysMarquee = true,
        ZIndex = 9,
        Size = u57.productLabelSize,
        Position = u57.productLabelPosition,
        AnchorPoint = Vector2.new(0.5, 0),
        Text = product.productName or "Product",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = u56,
    }, {
        UIStroke = createElement("UIStroke", {
            Transparency = 0,
            Thickness = 0.125,
            Color = Color3.fromRGB(0, 0, 0),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v5.SubLabelTitle = createElement(TextLabel, {
        Name = "SubLabelTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = u57.subLabelSize,
        Position = u57.subLabelPosition,
        AnchorPoint = Vector2.new(0.5, 0),
        Text = product.subText or "",
        TextColor3 = rarityColor,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    }, {})
    v5.ImageFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Preview = createProductPreview(product, sequence)})
    v5.PriceBackgroundFrame = createElement("ImageLabel", {
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
    v5.PriceFadeFrame = createElement("Frame", {
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
    v5.PriceContainer = not v1 and not a1.locked and createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 9,
        AnchorPoint = Vector2.new(0, 1),
        Position = u57.priceLabelPosition,
        Size = UDim2.fromScale(1, (math.min(0.28, (math.max(v3, 1)) * 0.12))),
    }, (createPriceRows(priceRows, a1.priceRowsAreAlternatives)))
    local locked = a1.locked and createElement(LockedProductContent, {
        message = a1.lockedMessage,
        onRequirementClick = a1.onUnlockRequirementClick,
        robuxPrice = a1.lockedRobuxPrice,
    })
    v5.LockedContainer = locked
    return createElement("Frame", v4, v5)
end)