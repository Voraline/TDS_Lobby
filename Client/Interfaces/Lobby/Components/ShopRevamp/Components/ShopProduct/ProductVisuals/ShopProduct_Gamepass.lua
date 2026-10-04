-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Components.ShopProduct.ProductVisuals.ShopProduct_Gamepass
-- Decompile time: 21.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local Packages = ReplicatedStorage.Packages
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local Modules = Shared.Modules
local Interfaces = Client.Interfaces
local Enum_2 = require(Modules.Enum)
local React = require(Packages.React)
local Button = require(Interfaces.Universal.Components.Inventory.Button)
local Icons = require(Client.Interfaces.LegacyInterface.Icons)
local TextLabel = require(Client.Interfaces.Components.TextLabel)
local ViewController = require(Client.Interfaces.LegacyInterface.Controllers.ViewController)
local ShopProduct_Base = require(script.Parent.ShopProduct_Base)
local useFontScale = require(Client.Interfaces.Hooks.useFontScale)
local useUnscaledGuiProperty = require(Client.Interfaces.Hooks.useUnscaledGuiProperty)
local createElement = React.createElement
local memo = React.memo
local useMemo = React.useMemo
local useRef = React.useRef
local u62 = {}
u62[Enum_2.ShopProductSize.Featured_Duo] = {
    aspectRatio = 2,
    productSize = UDim2.fromScale(0.93, 0.93),
    purchaseButtonAnchorPoint = Vector2.new(1, 1),
    purchaseButtonAlignment = Enum.HorizontalAlignment.Right,
    purchaseButtonSize = UDim2.fromScale(0.65, 0.15),
    purchaseButtonPosition = UDim2.fromScale(0.975, 0.94),
    productLabelSize = UDim2.fromScale(0.8, 0.11),
    productLabelPosition = UDim2.fromScale(0.5, 0.05),
    subLabelSize = UDim2.fromScale(0.75, 0.085),
    subLabelPosition = UDim2.fromScale(0.5, 0.15),
    priceLabelSize = UDim2.fromScale(1, 0.175),
    priceLabelPosition = UDim2.fromScale(0.05, 0.96),
    ownedLabelSize = UDim2.fromScale(0.9, 0.3),
    ownedLabelPosition = UDim2.fromScale(0.5, 0.6),
}
u62[Enum_2.ShopProductSize.Featured_Thirds] = {
    aspectRatio = 1.6,
    purchaseButtonAlignment = Enum.HorizontalAlignment.Left,
    purchaseButtonAnchorPoint = Vector2.new(0, 1),
    purchaseButtonSize = UDim2.fromScale(0.65, 0.2),
    purchaseButtonPosition = UDim2.fromScale(0.035, 0.935),
    productSize = UDim2.fromScale(0.9, 0.9),
    productLabelSize = UDim2.fromScale(0.75, 0.11),
    productLabelPosition = UDim2.fromScale(0.04, 0.06),
    subLabelSize = UDim2.fromScale(0.9, 0.085),
    subLabelPosition = UDim2.fromScale(0.05, 0.18),
    priceLabelSize = UDim2.fromScale(1, 0.125),
    priceLabelPosition = UDim2.fromScale(0.05, 0.98),
    ownedLabelSize = UDim2.fromScale(0.9, 0.3),
    ownedLabelPosition = UDim2.fromScale(0.5, 0.6),
}

local function formatImage(a1) -- Line: 84
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or "rbxassetid://86420908708799"
end

local function formatDescription(a1) -- Line: 92 -- types: a1: string?
    if type(a1) == "string" and a1 ~= "" then
        return (((a1:gsub("\r\n", "\n")):gsub("\r", "\n")):gsub("\n%s*%-", "\n•"))
    end
    return "Description unavailable."
end

local function measureTextHeight(a1, a2, a3) -- Line: 103
    -- upvalues: TextService (val)
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Font = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    GetTextBoundsParams.Size = a3
    GetTextBoundsParams.Text = a1
    GetTextBoundsParams.Width = math.max(1, a2)
    local success, result = pcall(function() -- Line: 110 -- upvalues: TextService (upval), GetTextBoundsParams (val)
        return TextService:GetTextBoundsAsync(GetTextBoundsParams)
    end)
    GetTextBoundsParams:Destroy()
    if not success then
        return a3
    end
    return (math.ceil(result.Y))
end

return memo(function(a1) -- Line: 123
    -- upvalues: u62 (val), useFontScale (val), useRef (val), Enum_2 (val), useUnscaledGuiProperty (val), useMemo (val)
    -- upvalues: measureTextHeight (val), createElement (val), ShopProduct_Base (val), TextLabel (val), Button (val)
    -- upvalues: Icons (val), ViewController (val)
    local v1
    local product = a1.product
    local v2 = Color3.fromRGB(35, 35, 35)
    local shopProductSize = product.shopProductSize
    local v3 = u62[shopProductSize]
    local u12 = useFontScale({scale = 1, min = 12})
    local v4 = useRef(nil)
    local v5 = shopProductSize == Enum_2.ShopProductSize.Featured_Duo
    local icon = product.icon
    local iconSize = product.iconSize or UDim2.fromScale(1, 1)
    local iconPosition = product.iconPosition or UDim2.fromScale(0.5, 0.5)
    local iconAnchorPoint = product.iconAnchorPoint or Vector2.new(0.5, 0.5)
    local priceText = if a1.priceText == "" then "..." else a1.priceText
    local v6 = ("%* %*"):format(utf8.char(57346), priceText)
    local v7 = if not (product.owned == true) then if not product.subscriptionId then v6 else priceText else "OWNED"
    local descriptionText = a1.descriptionText or product.description
    local u95 = if type(descriptionText) ~= "string" then "Description unavailable." else if descriptionText ~= "" then ((descriptionText:gsub("\r\n", "\n")):gsub("\r", "\n")):gsub("\n%s*%-", "\n•") else "Description unavailable."
    local v8 = useUnscaledGuiProperty(v4, "AbsoluteSize", {})
    local u115 = if not v8 then 0 else v8.X - 16 - 5
    local v9 = {u95, u115, u12}
    local v10 = useMemo(function() -- Line: 151 -- upvalues: u115 (val), measureTextHeight (upval), u95 (val), u12 (val)
        if u115 <= 0 then
            return 0
        end
        return (measureTextHeight(u95, u115, u12))
    end, v9)
    local v11 = {
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v2,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v3.productSize,
    }
    local v12 = {UIScale = createElement("UIScale", {Scale = a1.sequence.buttonScale})}
    v12.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
        AspectRatio = v3.aspectRatio,
        AspectType = Enum.AspectType.FitWithinMaxSize,
        DominantAxis = Enum.DominantAxis.Width,
    })
    v12.Base = createElement(ShopProduct_Base, {rarityColor = v2, sequence = a1.sequence})
    v12.DuoContentFrame = v5 and createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 8,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
        }),
        ShowcaseFrame = createElement("Frame", {
            BackgroundTransparency = 0,
            ZIndex = 8,
            LayoutOrder = 1,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0.35, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.075, 0)}),
            UIGradient = createElement("UIGradient", {
                Rotation = 0,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(171, 24, 27)),
                    ColorSequenceKeypoint.new(0.166, Color3.fromRGB(196, 74, 28)),
                    ColorSequenceKeypoint.new(0.734, Color3.fromRGB(238, 157, 29)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 183, 27))),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.9, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            ProductTitle = createElement(TextLabel, {
                Name = "ProductTitle",
                BackgroundTransparency = 1,
                FontWeight = "Bold",
                StrokeThickness = 0.125,
                ZIndex = 9,
                Size = v3.productLabelSize,
                Position = v3.productLabelPosition,
                AnchorPoint = Vector2.new(0.5, 0),
                Text = product.productName or "Product",
                TextColor3 = Color3.fromRGB(255, 255, 255),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }, {}),
            BackgroundShine = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://84257058893696",
                ImageTransparency = 0.9,
                ZIndex = 4,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ScaleType = Enum.ScaleType.Crop,
            }, {
                UIGradient = createElement("UIGradient", {
                    Rotation = 0,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(0.51, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
            PreviewImage = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = iconAnchorPoint,
                Position = iconPosition,
                Size = iconSize,
                Image = if type(icon) ~= "number" then icon or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(icon),
                ScaleType = Enum.ScaleType.Crop,
            }, {UIScale = createElement("UIScale", {Scale = a1.sequence.iconScale})}),
        }),
        DescriptionFrame = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            ZIndex = 8,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.65, 1),
        }, {
            ProductTitle = createElement(TextLabel, {
                Name = "ProductTitle",
                BackgroundTransparency = 1,
                Text = "Unlocks...",
                FontWeight = "Bold",
                StrokeThickness = 0.125,
                ZIndex = 9,
                Size = UDim2.fromScale(0.9, 0.1),
                Position = UDim2.fromScale(0.5, 0.05),
                AnchorPoint = Vector2.new(0.5, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
                TextXAlignment = Enum.TextXAlignment.Left,
            }, {}),
            InnerGlowImage = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://88103380194506",
                ImageTransparency = 0,
                Visible = true,
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ImageColor3 = Color3.fromRGB(0, 0, 0),
                ScaleType = Enum.ScaleType.Stretch,
            }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.06, 0)})}),
            TextFrame = createElement("ScrollingFrame", {
                BorderSizePixel = 0,
                ScrollBarThickness = 5,
                ZIndex = 8,
                Size = UDim2.fromScale(0.975, 0.55),
                Position = UDim2.fromScale(0, 0.46),
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(25, 25, 25),
                CanvasSize = UDim2.fromOffset(0, 0),
                ElasticBehavior = Enum.ElasticBehavior.Never,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
                ref = v4,
            }, {
                UIPadding = createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 8),
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                }),
                UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.03, 0)}),
                DescriptionLabel = createElement(TextLabel, {
                    Name = "DescriptionLabel",
                    BackgroundTransparency = 1,
                    TextScaled = false,
                    TextWrapped = true,
                    FontWeight = "Bold",
                    ZIndex = 9,
                    Size = UDim2.fromOffset(u115, v10),
                    Position = UDim2.fromScale(0, 0),
                    AnchorPoint = Vector2.new(0, 0),
                    Text = u95,
                    TextColor3 = Color3.fromRGB(230, 230, 230),
                    TextSize = u12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                }, {}),
            }),
        }),
    })
    v12.ThirdsContentFrame = not v5 and createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 8,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        BackgroundShine = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://84257058893696",
            ImageTransparency = 0.9,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ScaleType = Enum.ScaleType.Crop,
        }, {
            UIGradient = createElement("UIGradient", {
                Rotation = -90,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
        }),
        InnerGlowImage = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://88103380194506",
            ImageTransparency = 0,
            Visible = true,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ScaleType = Enum.ScaleType.Stretch,
        }, {
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.05, 0)}),
            UIGradient = createElement("UIGradient", {
                Rotation = -90,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
        }),
        PreviewImage = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = iconAnchorPoint,
            Position = iconPosition,
            Size = iconSize,
            Image = if type(icon) ~= "number" then icon or "rbxassetid://86420908708799" else ("rbxassetid://%*"):format(icon),
            ScaleType = Enum.ScaleType.Fit,
        }, {UIScale = createElement("UIScale", {Scale = a1.sequence.iconScale})}),
        ProductTitle = createElement(TextLabel, {
            Name = "ProductTitle",
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            StrokeThickness = 0.125,
            ZIndex = 9,
            Size = v3.productLabelSize,
            Position = v3.productLabelPosition,
            AnchorPoint = Vector2.new(0, 0),
            Text = product.productName or "Product",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {}),
        SubLabelTitle = createElement(TextLabel, {
            Name = "SubLabelTitle",
            BackgroundTransparency = 1,
            TextTransparency = 0.2,
            FontWeight = "Bold",
            StrokeThickness = 0.125,
            TextWrapped = true,
            TextScaled = true,
            ZIndex = 9,
            Size = v3.subLabelSize,
            Position = v3.subLabelPosition,
            AnchorPoint = Vector2.new(0, 0),
            Text = product.subText or "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {}),
    })
    local v13 = {
        BackgroundTransparency = 1,
        ZIndex = 9,
        AnchorPoint = v3.purchaseButtonAnchorPoint,
        Size = v3.purchaseButtonSize,
        Position = v3.purchaseButtonPosition,
    }
    local v14 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = v3.purchaseButtonAlignment,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.035, 0),
        }),
    }
    local v15 = {
        textSize = 20,
        layoutOrder = 1,
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        zIndex = 5,
        size = UDim2.fromScale(0.25, 1),
        text = v7,
    }
    local v16 = if not v1 then Color3.fromRGB(10, 220, 80) else Color3.fromRGB(90, 90, 90)
    v15.color = v16
    v15.disabled = v1

    function v15.onClick() -- Line: 484 -- upvalues: product (val)
        if product.purchase then
            product.purchase()
        end
    end

    v14.RobuxButton = createElement(Button, v15)
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
        onClick = function() -- Line: 502 -- upvalues: ViewController (upval), product (val)
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
    v14.GiftButton = v17
    v12.PurchaseButtons = createElement("Frame", v13, v14)
    return createElement("Frame", v11, v12)
end)