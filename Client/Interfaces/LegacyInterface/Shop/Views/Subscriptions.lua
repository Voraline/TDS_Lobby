-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Subscriptions
-- Decompile time: 2.68 ms

game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local LocalPlayer = game:GetService("Players").LocalPlayer
local Fusion = require(Shared.UI.Fusion)
require(Shared.UI.ProductInfo)
local New = Fusion.New
local Value = Fusion.Value
local Children = Fusion.Children
local Cleanup = Fusion.Cleanup
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed
local OnChange = Fusion.OnChange
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Parent = script.Parent.Parent.Parent
Components = script.Parent.Parent.Components
SharedComponents = script.Parent.Parent.Parent.Components
StoreController = require(Parent.Controllers.StoreController)
Button = require(SharedComponents.Button)
PurchaseButton = require(Components.PurchaseButton)
Title = require(Components.Title)
Transition = require(SharedComponents.Transition)
Purchasables = require(script.Parent.Parent.Purchasables)
Icons = require(Parent.Icons)
Comma = require(Shared.UI.Comma)

local function Subscriptions(a1, a2) -- Line: 33 -- upvalues: ForValues (val), New (val), Children (val), Sound (val)
    return ForValues(a1, function(a1) -- Line: 34 -- upvalues: New (upval), a2 (val), Children (upval), Sound (upval)
        local Price = a1.Price
        local Frame = New("Frame")
        local v1 = {Size = a2.PassSize, BackgroundTransparency = 1}
        local v2 = Children
        local v3 = {}
        local v4 = PurchaseButton
        local v5 = {
            Size = UDim2.new(1, 0, 1, -25),
            Type = a2.Type,
            Title = a1.Name,
            Description = a1.Description,
        }
        v5.DisplayImage = a1.Image and string.format("rbxassetid://%d", a1.Image) or nil
        v5.DisplayImageSize = a1.ImageSize
        v5.DisplayImagePosition = a1.ImagePosition
        v5.DisplayImageAnchorPoint = a1.ImageAnchorPoint
        v5.Button = {
            Size = UDim2.fromOffset(240, 50),
            Text = ("$%*"):format(Price),
            Color = Color3.fromRGB(10, 220, 80),
            TextColor = Color3.new(1, 1, 1),
            TextStrokeTransparency = 1,
            [Children] = {},
        }

        function v5.Clicked() -- Line: 65 -- upvalues: Sound (upval), a1 (val)
            Sound("Click"):Play()
            StoreController:purchaseSubscription(a1.SubscriptionId)
        end

        v3[1] = v4(v5)
        v1[v2] = v3
        return Frame(v1)
    end, function(a1) -- Line: 72
        a1:Destroy()
    end)
end

return function(a1) -- Line: 77
    -- upvalues: Value (val), Computed (val), New (val), Children (val), Subscriptions (val), Cleanup (val)
    local IsMobile = a1.IsMobile
    local Scale = a1.Scale
    if not Scale then
        Scale = Value(1)
    end
    local v1 = Computed(function() -- Line: 82 -- upvalues: IsMobile (val), Scale (val)
        if not IsMobile then
            return UDim2.fromOffset(260, 173)
        end
        local v1 = Scale:get()
        return UDim2.fromOffset(320 * v1, 173 * v1)
    end)
    local ScrollingFrame = New("ScrollingFrame")
    local v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        Visible = a1.Delayed,
        LayoutOrder = a1.LayoutOrder,
        CanvasSize = UDim2.fromScale(1, 1),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        BottomImage = "rbxassetid://6275896591",
        MidImage = "rbxassetid://6275893557",
        TopImage = "rbxassetid://6275890853",
    }
    v2[Children] = {
        a1[Children],
        if not IsMobile then nil else New("UIPadding")({PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 30)}),
        New("UIGridLayout")({
            CellPadding = UDim2.fromOffset(20, 15),
            CellSize = v1,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        (Subscriptions(Purchasables.Subscriptions, {
            Type = "SUBSCRIPTION",
            Title = "Subscriptions",
            Visible = a1.Visible,
            PassSize = v1,
            TitleIcon = Icons.ShopGamepasses,
            IsMobile = IsMobile,
        })),
    }
    v2[Cleanup] = {}
    return ScrollingFrame(v2)
end