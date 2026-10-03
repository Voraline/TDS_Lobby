-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_Currency
-- Decompile time: 7.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local Modules = Shared.Modules
local Interfaces = Client.Interfaces
local Components = Interfaces.Universal.Components
local Enum_2 = require(Modules.Enum)
local React = require(Packages.React)
local Button = require(Interfaces.Universal.Components.Inventory.Button)
local Icons = require(Client.Interfaces.LegacyInterface.Icons)
require(Client.Interfaces.Components.TextLabel)
local ViewController = require(Client.Interfaces.LegacyInterface.Controllers.ViewController)
local CustomSkinRarityComponent = require(Components.CustomSkinRarityComponent)
local ProductFlair = require(script.Parent.Parent.Parent.ProductFlair)
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local createElement = React.createElement
local memo = React.memo
local u57 = {}
u57[Enum_2.ShopProductSize.Currency_Vertical] = {
    aspectRatio = 0.7,
    sizeY = 0.0775,
    positionY = 0.145,
    productLabelSize = UDim2.fromScale(0.75, 0.125),
    productLabelPosition = UDim2.fromScale(0.05, 0.15),
    subLabelSize = UDim2.fromScale(0.75, 0.085),
    subLabelPosition = UDim2.fromScale(0.05, 0.21),
    priceLabelSize = UDim2.fromScale(1, 0.15),
    priceLabelPosition = UDim2.fromScale(0.05, 0.925),
    ownedLabelSize = UDim2.fromScale(0.9, 0.3),
    ownedLabelPosition = UDim2.fromScale(0.5, 0.6),
    imagePosition = UDim2.fromScale(0.525, 0.575),
    imageSize = UDim2.fromScale(0.975, 0.975),
    shopButtonAnchorPoint = Vector2.new(0, 1),
    shopButtonAlignment = Enum.HorizontalAlignment.Left,
    shopButtonPosition = UDim2.fromScale(0.05, 0.965),
    shopButtonSize = UDim2.fromScale(0.9, 0.085),
    productFlairPosition = UDim2.fromScale(1.015, 0.05),
}
u57[Enum_2.ShopProductSize.Currency_Horizontal] = {
    aspectRatio = 1.5,
    sizeY = 0.165,
    positionY = 0.3,
    productLabelSize = UDim2.fromScale(0.75, 0.2),
    productLabelPosition = UDim2.fromScale(0.05, 0.25),
    subLabelSize = UDim2.fromScale(0.75, 0.085),
    subLabelPosition = UDim2.fromScale(0.05, 0.21),
    priceLabelSize = UDim2.fromScale(1, 0.15),
    priceLabelPosition = UDim2.fromScale(0.05, 0.925),
    ownedLabelSize = UDim2.fromScale(0.9, 0.3),
    ownedLabelPosition = UDim2.fromScale(0.5, 0.6),
    imagePosition = UDim2.fromScale(0.7, 0.525),
    imageSize = UDim2.fromScale(1.4, 1.4),
    shopButtonAnchorPoint = Vector2.new(0, 1),
    shopButtonAlignment = Enum.HorizontalAlignment.Left,
    shopButtonPosition = UDim2.fromScale(0.05, 0.925),
    shopButtonSize = UDim2.fromScale(0.9, 0.175),
    productFlairPosition = UDim2.fromScale(1.015, 0.1),
}

local function formatImage(a1) -- Line: 84
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

return memo(function(a1) -- Line: 92
    -- upvalues: u57 (val), Enum_2 (val), Icons (val), createElement (val), CustomSkinRarityComponent (val)
    -- upvalues: ShopProduct_Base (val), ProductFlair (val), Button (val), ViewController (val)
    local product = a1.product
    local sequence = a1.sequence
    local v1 = u57[product.shopProductSize] or u57[Enum_2.ShopProductSize.Currency_Horizontal]
    local v2 = a1.product.subText == "Gems"
    local priceText = if a1.priceText == "" then "..." else a1.priceText
    local v3 = ("%* %*"):format(utf8.char(57346), priceText)
    local v4 = product.owned == true
    local v5 = {}
    v5[Icons.Coins] = (Color3.fromRGB(255, 216, 42))
    v5[Icons.Gems] = (Color3.fromHex("#bc76e7"))
    local v6 = {}
    v6[Icons.Coins] = (Color3.fromRGB(255, 238, 0))
    v6[Icons.Gems] = (Color3.fromRGB(240, 25, 255))
    local v7 = {[Icons.Gems] = true}
    local v8 = v5[product.currencyIcon]
    local productFlairText_2 = if type(product.productFlairText) ~= "string" then nil else if product.productFlairText == "" then nil else product.productFlairText
    local v9 = {BackgroundTransparency = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    v9.BackgroundColor3 = v8 or Color3.fromRGB(75, 75, 75)
    v9.Position = UDim2.fromScale(0.5, 0.5)
    v9.Size = UDim2.fromScale(0.95, 0.95)
    local v10 = {}
    local v11 = createElement
    local v12 = {
        AspectRatio = v1.aspectRatio,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
    }
    v10.UIAspectRatioConstraint = v11("UIAspectRatioConstraint", v12)
    v11 = (v2 and {["$100"] = false, ["$500"] = false, ["$1,500"] = true, ["$2,500"] = true} or {["$1,000"] = false, ["$2,500"] = false, ["$5,000"] = true, ["$10,000"] = true})[product.productName]
    if v11 then
        v12 = {LayoutOrder = 0}
        local Gem = v2 and Enum_2.SkinRarity.Gem or Enum_2.SkinRarity.Golden
        v12.Rarity = Gem
        v11 = createElement(CustomSkinRarityComponent, v12, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})})
    end
    v10.RarityBackground = v11
    v10.Base = createElement(ShopProduct_Base, {
        hideInnerShadow = true,
        rarityColor = v8 or Color3.fromRGB(75, 75, 75),
        sequence = sequence,
    })
    v11 = productFlairText_2 and createElement(ProductFlair, {
        flipped = true,
        flairText = productFlairText_2,
        native = {Position = v1.productFlairPosition},
    }) or nil
    v10.ProductFlair = v11
    v12 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v13 = {}
    local v14 = {
        BackgroundTransparency = 1,
        ZIndex = 9,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v1.imagePosition,
        Size = v1.imageSize,
    }
    local icon = product.icon
    v14.Image = if type(icon) ~= "number" then icon or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(icon)
    v14.ScaleType = Enum.ScaleType.Fit
    v13.PreviewImage = createElement("ImageLabel", v14, {UIScale = createElement("UIScale", {Scale = sequence.iconScale})})
    v14 = {
        BackgroundTransparency = 1,
        ImageTransparency = 0.5,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.4875),
        Position = v1.imagePosition,
        Size = v1.imageSize,
    }
    local icon_2 = product.icon
    v14.Image = if type(icon_2) ~= "number" then icon_2 or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(icon_2)
    v14.ScaleType = Enum.ScaleType.Fit
    v14.ImageColor3 = Color3.fromRGB(0, 0, 0)
    v13.PreviewImageShadow = createElement("ImageLabel", v14, {UIScale = createElement("UIScale", {Scale = sequence.iconScale})})
    v10.ImageFrame = createElement("Frame", v12, v13)
    v10.PriceFadeFrame = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.25,
        ZIndex = 7,
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = v8,
        Position = UDim2.fromScale(0.5, 1),
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.7, 1),
                (NumberSequenceKeypoint.new(1, 0)),
            }),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.045, 0)}),
    })
    v12 = {
        BackgroundTransparency = 1,
        ZIndex = 15,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0.05, v1.positionY),
        Size = UDim2.fromScale(0.75, v1.sizeY),
    }
    v13 = {
        priceTextLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = -1,
            TextScaled = true,
            ZIndex = 6,
            AnchorPoint = Vector2.new(0.5, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.85),
            Text = a1.subText,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            stroke = createElement("UIStroke", {
                Thickness = 0.1,
                Transparency = 0.25,
                LineJoinMode = Enum.LineJoinMode.Bevel,
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v6[product.currencyIcon] or Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
                }),
            }),
        }),
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0.225, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v14 = {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.fromScale(1, 0.8)}
    local v15 = {
        currency = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            TextScaled = true,
            ZIndex = 6,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
            Text = product.productName,
            TextColor3 = Color3.fromRGB(255, 252, 252),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            stroke = createElement("UIStroke", {
                Thickness = 0.1,
                Transparency = 0.15,
                LineJoinMode = Enum.LineJoinMode.Bevel,
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        }),
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0.01, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    local v16 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5)}
    local currencyIcon = product.currencyIcon
    v16.Image = if type(currencyIcon) ~= "number" then currencyIcon or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(currencyIcon)
    v16.Position = UDim2.fromScale(0.05, 0.5)
    v16.ScaleType = Enum.ScaleType.Crop
    v16.Size = UDim2.fromScale(1.45, 1.45)
    v15.currencyIcon = createElement("ImageLabel", v16, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    v13.frame = createElement("Frame", v14, v15)
    v10.CurrencyDisplayFrame = createElement("Frame", v12, v13)
    v11 = v7[product.currencyIcon] and createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = true, Size = UDim2.fromScale(1, 1)}, {
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://128413790932853",
            ImageTransparency = 0.91,
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageColor3 = Color3.new(),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            Size = UDim2.fromScale(1.35, 1.35),
        }),
    })
    v10.pattern = v11
    v12 = {
        BackgroundTransparency = 1,
        ZIndex = 20,
        AnchorPoint = v1.shopButtonAnchorPoint,
        Position = v1.shopButtonPosition,
        Size = v1.shopButtonSize,
    }
    v13 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = v1.shopButtonAlignment,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.035, 0),
        }),
    }
    v14 = {
        textSize = 20,
        layoutOrder = 1,
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        zIndex = 5,
        size = UDim2.fromScale(0.3, 1),
        text = if not v4 then v3 else "OWNED",
    }
    v15 = if not v4 then Color3.fromRGB(10, 220, 80) else Color3.fromRGB(90, 90, 90)
    v14.color = v15
    v14.disabled = v4

    function v14.onClick() -- Line: 423 -- upvalues: product (val)
        if product.purchase then
            product.purchase()
        end
    end

    v13.RobuxButton = createElement(Button, v14)
    local v17 = product.giftId and createElement(Button, {
        aspectRatio = 1,
        text = "",
        layoutOrder = 2,
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        zIndex = 5,
        size = UDim2.fromScale(0.25, 1),
        icon = Icons.Gift,
        iconSize = UDim2.fromScale(1, 1),
        color = Color3.fromRGB(10, 220, 80),
        onClick = function() -- Line: 441 -- upvalues: ViewController (upval), product (val)
            ViewController:setView((("GiftProduct:%*"):format(product.giftId)))
            return
        end,
        padding = {
            top = UDim.new(0, 0),
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
        },
    }) or nil
    v13.GiftButton = v17
    v10.ShopButtons = createElement("Frame", v12, v13)
    return createElement("Frame", v9, v10)
end)