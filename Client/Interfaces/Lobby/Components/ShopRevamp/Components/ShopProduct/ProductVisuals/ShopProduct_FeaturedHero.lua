-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_FeaturedHero
-- Decompile time: 9.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Client = ReplicatedStorage.Client
local Interfaces = Client.Interfaces
local React = require(Packages.React)
local BattlepassItem = require(Interfaces.Lobby.Components.Battlepass.BattlepassItem)
local Button = require(Interfaces.Universal.Components.Inventory.Button)
local Icons = require(Interfaces.LegacyInterface.Icons)
local LockedProductContent = require(script.Parent.Parent.LockedProductContent)
local ProductFlair = require(script.Parent.Parent.Parent.ProductFlair)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local ViewController = require(Interfaces.LegacyInterface.Controllers.ViewController)
local createElement = React.createElement
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local memo = React.memo
local u57 = {aspectRatio = 1.9}
u57.productLabelSize = UDim2.fromScale(0.75, 0.125)
u57.productLabelPosition = UDim2.fromScale(0.7, 0.065)
u57.subLabelSize = UDim2.fromScale(0.75, 0.06)
u57.subLabelPosition = UDim2.fromScale(0.5, 0.13)
u57.priceLabelSize = UDim2.fromScale(1, 0.175)
u57.priceLabelPosition = UDim2.fromScale(0.025, 0.975)
u57.giftButtonSize = UDim2.fromScale(0.09, 0.175)
u57.giftButtonPosition = UDim2.fromScale(0.975, 0.95)
local u90 = {}
u90.Size = UDim2.fromScale(1.1, 1.1)
u90.Position = UDim2.fromScale(0.5, 0.625)
u90.AnchorPoint = Vector2.new(0.5, 0.5)
local u109 = ("<font color=\"rgb(255,255,255)\">%*</font>"):format((utf8.char(57346)))

local function createPriceIcon(a1) -- Line: 59 -- upvalues: createElement (val), u109 (val)
    if a1.isRobux then
        return createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextScaled = true,
            LayoutOrder = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.9, 0.9),
            Text = u109,
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

local function createPriceRows(a1, a2) -- Line: 98
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
                TextXAlignment = Enum.TextXAlignment.Left,
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

local function formatImage(a1) -- Line: 163
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

local function getPreviewName(a1) -- Line: 171
    if not a1 then
        return nil
    end
    return a1.name or a1.tower or a1.stat
end

local function createProductPreview(a1, a2) -- Line: 179
    -- upvalues: u90 (val), createElement (val), BattlepassItem (val)
    local v1 = {}
    local iconSize = a1.iconSize or u90.Size
    v1.Size = iconSize
    local iconPosition = a1.iconPosition or u90.Position
    v1.Position = iconPosition
    local iconAnchorPoint = a1.iconAnchorPoint or u90.AnchorPoint
    v1.AnchorPoint = iconAnchorPoint
    if a1.icon then
        local v2 = {
            BackgroundTransparency = 1,
            ZIndex = 8,
            AnchorPoint = v1.AnchorPoint,
            Position = v1.Position,
            Size = v1.Size,
        }
        local icon = a1.icon
        v2.Image = if type(icon) ~= "number" then icon or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(icon)
        v2.ScaleType = Enum.ScaleType.Fit
        return createElement("ImageLabel", v2, {UIScale = createElement("UIScale", {Scale = a2.iconScale})})
    end
    local item = a1.item
    if not item then
        return nil
    end
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

local u118 = UDim.new(0.025, 0)
return memo(function(a1) -- Line: 235
    -- upvalues: createElement (val), u57 (val), ShopProduct_Base (val), u118 (val), ProductFlair (val), TextLabel (val)
    -- upvalues: createProductPreview (val), createPriceRows (val), Button (val), Icons (val), ViewController (val)
    -- upvalues: LockedProductContent (val)
    local v1, v2
    local product = a1.product
    local rarityColor = a1.rarityColor
    local sequence = a1.sequence
    local v3 = product.backgroundColor or rarityColor
    local v4 = product.glowColor or rarityColor
    local v5 = product.owned == true
    local productFlairText_2 = if type(product.productFlairText) ~= "string" then nil else if product.productFlairText == "" then nil else product.productFlairText
    local new = not v5
    if new then
        new = true
        if productFlairText_2 == nil then
            new = product.new
        end
    end
    local priceRows = a1.priceRows or {{icon = a1.priceIcon, isRobux = a1.isRobuxPrice, text = a1.priceText}}
    local v6 = {
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v3,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.95, 0.95),
    }
    local v7 = {
        UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
            AspectRatio = u57.aspectRatio,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    }
    local v8 = {rarityColor = v4, sequence = sequence, UICornerRadius = u118}
    v7.Base = createElement(ShopProduct_Base, v8)
    if not product.background then
        v1 = nil
    else
        v8 = {
            BackgroundTransparency = 1,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }
        local background = product.background
        v8.Image = if type(background) ~= "number" then background or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(background)
        v8.ImageColor3 = v3
        v8.ScaleType = Enum.ScaleType.Crop
        v1 = createElement("ImageLabel", v8, {UICorner = createElement("UICorner", {CornerRadius = u118})}) or nil
    end
    v7.CustomBackground = v1
    v7.ProductFlair = v5 and createElement(ProductFlair, {
        flairText = "Owned",
        theme = "Green",
        native = {
            ZIndex = 100,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(-0.02, u57.priceLabelPosition.Y.Scale),
            Size = UDim2.fromScale(0.22, 0.22),
        },
        textPosition = UDim2.fromScale(0.5, 0.5),
    })
    v1 = v5 and createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 99,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = u118})})
    v7.FlairDarkeningFrame = v1
    if not new then
        v1 = nil
    else
        v8 = {
            theme = "Red",
            flipped = false,
            custom = true,
            flairText = productFlairText_2 or "New",
            textLabelSize = UDim2.fromScale(0.8, 0.55),
        }
        v2 = {ZIndex = 100}
        local productFlairPosition = product.productFlairPosition or UDim2.fromScale(0.145, 0.075)
        v2.Position = productFlairPosition
        local productFlairSize = product.productFlairSize or UDim2.fromScale(0.175, 0.175)
        v2.Size = productFlairSize
        v8.native = v2
        v8.textPosition = UDim2.fromScale(0.475, 0.5)
        v1 = createElement(ProductFlair, v8) or nil
    end
    v7.NewFlair = v1
    v7.FadeFrameRight = createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        ZIndex = 7,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.5, 1),
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = 180,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = u118}),
    })
    v7.FadeFrameBottom = createElement("Frame", {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 7,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0.25),
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
    })
    v7.ProductTitle = createElement(TextLabel, {
        Name = "ProductTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = u57.productLabelSize,
        Position = UDim2.fromScale(0.975, 0.05),
        AnchorPoint = Vector2.new(1, 0),
        Text = product.productName or "Product",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, {})
    v7.SubLabelTitle = createElement(TextLabel, {
        Name = "SubLabelTitle",
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 0.125,
        ZIndex = 9,
        Size = UDim2.fromScale(1, 0.1),
        Position = UDim2.fromScale(0.975, 0.175),
        AnchorPoint = Vector2.new(1, 0),
        Text = product.subText or "",
        TextColor3 = rarityColor,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, {})
    v7.ImageFrame = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {Preview = createProductPreview(product, sequence)})
    v7.PriceBackgroundFrame = createElement("ImageLabel", {
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
    v1 = createElement
    v8 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        ZIndex = 6,
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(1, 0.4),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
    }
    v2 = {
        UIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = u118}),
    }
    v7.PriceFadeFrame = v1("Frame", v8, v2)
    v1 = a1.locked and createElement("Frame", {
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)})}) or nil
    v7.LockedFadeFrame = v1
    v1 = not v5
    if v1 then
        v1 = not a1.locked
        if v1 then
            v8 = {
                BackgroundTransparency = 1,
                ZIndex = 9,
                AnchorPoint = Vector2.new(0, 1),
                Position = u57.priceLabelPosition,
                Size = u57.priceLabelSize,
            }
            v2 = {}
            local v9 = false
            if #priceRows > 1 then
                v9 = createElement("UIScale", {Scale = 2})
            end
            v2.UIScale = v9
            v2.PriceRows = createElement(
                "Frame",
                {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)},
                (createPriceRows(priceRows, a1.priceRowsAreAlternatives))
            )
            v1 = createElement("Frame", v8, v2)
        end
    end
    v7.PriceContainer = v1
    v1 = product.giftId and createElement(Button, {
        aspectRatio = 1,
        text = "",
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        zIndex = 101,
        anchorPoint = Vector2.new(1, 1),
        size = u57.giftButtonSize,
        position = u57.giftButtonPosition,
        icon = Icons.Gift,
        iconSize = UDim2.fromScale(1, 1),
        color = Color3.fromRGB(10, 220, 80),
        onClick = function() -- Line: 485 -- upvalues: ViewController (upval), product (val)
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
    v7.GiftButton = v1
    local locked = a1.locked and createElement(LockedProductContent, {
        message = a1.lockedMessage,
        onRequirementClick = a1.onUnlockRequirementClick,
        robuxPrice = a1.lockedRobuxPrice,
        native = {Size = UDim2.fromScale(0.6, 0.8)},
    })
    v7.LockedContainer = locked
    return createElement("Frame", v6, v7)
end)