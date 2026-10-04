-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Home
-- Decompile time: 10.27 ms

local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Policy = require(ReplicatedStorage.Shared.UI.Policy)
local Purchasables = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Purchasables)
local Sift = require(ReplicatedStorage.Packages.Sift)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Fusion = require(Shared.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Value = Fusion.Value
Components = script.Parent.Parent.Components
FeaturedItems = require(Components.FeaturedItems)
Ad = require(Components.Ad)
AdSlideshow = require(Components.AdSlideshow)
PurchaseButton = require(Components.PurchaseButton)
SharedComponents = Components.Parent.Parent.Components
Transition = require(SharedComponents.Transition)
Controllers = script.Parent.Parent.Parent.Controllers
StoreController = require(Controllers.StoreController)
ViewController = require(Controllers.ViewController)

local function GetSubscriptionPrice(a1) -- Line: 31
    -- upvalues: Value (val), MarketplaceService (val), Comma (val)
    local u3 = Value("...")
    task.spawn(function() -- Line: 34 -- upvalues: MarketplaceService (upval), a1 (val), u3 (val), Comma (upval)
        local success, result = pcall(function() -- Line: 35 -- upvalues: MarketplaceService (upval), a1 (upval)
            return MarketplaceService:GetSubscriptionProductInfoAsync(a1)
        end)
        if not success then
            warn("Failed to load subscription product info:", result)
            u3:set("Unavailable")
            return
        end
        local PriceInRobux = result.PriceInRobux
        local v1 = if not PriceInRobux or not (PriceInRobux > 0) then result.DisplayPrice or "Unavailable" else ("%* %*"):format(utf8.char(57346), (Comma(PriceInRobux)))
        if v1 ~= "Unavailable" then
            v1 = v1 .. " / month"
        end
        u3:set(v1)
    end)
    return u3
end

local function Layout(a1) -- Line: 64 -- upvalues: New (val), Children (val)
    local UseAutomatic = a1.UseAutomatic
    local X = if not a1.Horizontal then if not a1.Vertical then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y else Enum.AutomaticSize.X
    local Horizontal = if not a1.Horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal
    local Frame = New("Frame")
    local v1 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(0, 0)
    v1.Size = Size
    v1.AutomaticSize = if not UseAutomatic then X else Enum.AutomaticSize.XY
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.Visible = a1.Visible
    v1[Children] = {
        New("UIListLayout")({
            FillDirection = Horizontal,
            HorizontalAlignment = a1.HorizontalAlignment,
            VerticalAlignment = a1.VerticalAlignment,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, a1.Padding),
        }),
        a1[Children],
    }
    return Frame(v1)
end

local function HorizontalLayout(a1) -- Line: 97 -- upvalues: Layout (val), Children (val)
    local v1 = Layout
    local v2 = {
        Horizontal = true,
        Size = a1.Size,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = 20,
        UseAutomatic = a1.UseAutomatic,
    }
    v2[Children] = a1[Children]
    return v1(v2)
end

return function(a1) -- Line: 110
    -- upvalues: Value (val), Sift (val), Purchasables (val), MarketplaceService (val), Comma (val), New (val)
    -- upvalues: OnChange (val), Children (val), Layout (val), HorizontalLayout (val), Policy (val), Sound (val)
    ViewController:init()
    local CurrentTab = a1.CurrentTab
    if not CurrentTab then
        CurrentTab = Value("")
    end
    if not a1.Visible then
        Value(true)
    end
    local v1 = StoreController:getFeaturedItems()
    local u22 = ViewController:getEmitter("Inventory")
    local u32 = Purchasables.Subscriptions[(Sift.Array.findWhere(Purchasables.Subscriptions, function(a1) -- Line: 119
        return a1.Name == "V.I.P+ Subscription"
    end))]
    local SubscriptionId = u32.SubscriptionId
    local u37 = Value("...")
    task.spawn(function() -- Line: 34 -- upvalues: MarketplaceService (upval), SubscriptionId (val), u37 (val), Comma (upval)
        local success, result = pcall(function() -- Line: 35 -- upvalues: MarketplaceService (upval), SubscriptionId (upval)
            return MarketplaceService:GetSubscriptionProductInfoAsync(SubscriptionId)
        end)
        if not success then
            warn("Failed to load subscription product info:", result)
            u37:set("Unavailable")
            return
        end
        local PriceInRobux = result.PriceInRobux
        local v1 = if not PriceInRobux or not (PriceInRobux > 0) then result.DisplayPrice or "Unavailable" else ("%* %*"):format(utf8.char(57346), (Comma(PriceInRobux)))
        if v1 ~= "Unavailable" then
            v1 = v1 .. " / month"
        end
        u37:set(v1)
    end)
    local Frame = New("Frame")
    local v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        Visible = a1.Delayed,
        LayoutOrder = a1.LayoutOrder,
    }
    local AbsoluteSize = OnChange("AbsoluteSize")
    v2[AbsoluteSize] = a1.OnSize
    local v3 = {}
    local v4 = a1[Children]
    local v5 = {Vertical = true, UseAutomatic = true, Padding = 20}
    local v6 = {}
    local v7 = HorizontalLayout
    local v8 = {UseAutomatic = true}
    v8[Children] = {
        AdSlideshow({}),
        (FeaturedItems({
            IsSmall = a1.IsMobile,
            Items = v1,
            OpenItem = function(a1) -- Line: 155 -- upvalues: u22 (val)
                u22:Emit("Select", a1.Type .. "s", a1.Value)
                ViewController:setView("Inventory")
            end,
        })),
    }
    v7 = v7(v8)
    local v9 = {
        UseAutomatic = true,
        Size = not (a1.IsMobile ~= true) and UDim2.fromScale(1, 0) or nil,
    }
    v9[Children] = {
        Ad({
            AdType = "Ad3",
            IsLarge = a1.IsMobile,
            Clicked = function() -- Line: 179 -- upvalues: CurrentTab (val)
                CurrentTab:set("Gamepasses")
            end,
        }),
        not a1.IsMobile and Ad({
            Icon = "rbxassetid://11857757188",
            AdType = "Ad4",
            Clicked = function() -- Line: 187 -- upvalues: CurrentTab (val)
                CurrentTab:set("Credits")
                return
            end,
        }) or nil,
        (PurchaseButton({
            Type = "Subscription",
            Size = UDim2.fromOffset(340, 155),
            Title = u32.Name,
            Description = u32.Description,
            DisplayImage = string.format("rbxassetid://%d", u32.Image),
            DisplayImageSize = u32.ImageSize,
            DisplayImagePosition = u32.ImagePosition,
            DisplayImageAnchorPoint = u32.ImageAnchorPoint,
            Visible = Policy("IsEligibleToPurchaseSubscription", false),
            Button = {
                Size = UDim2.fromOffset(240, 50),
                Text = u37,
                Color = Color3.fromRGB(10, 220, 80),
                TextColor = Color3.new(1, 1, 1),
                TextStrokeTransparency = 1,
                [Children] = {},
            },
            Clicked = function() -- Line: 219 -- upvalues: Sound (upval), u32 (val)
                Sound("Click"):Play()
                StoreController:purchaseSubscription(u32.SubscriptionId)
            end,
        })),
    }
    v6[1] = v7
    v6[2] = HorizontalLayout(v9)
    v5[Children] = v6
    v3[1] = v4
    v3[2] = Layout(v5)
    v2[Children] = v3
    return Frame(v2)
end