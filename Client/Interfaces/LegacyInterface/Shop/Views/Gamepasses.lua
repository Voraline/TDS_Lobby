-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Gamepasses
-- Decompile time: 20.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local FFlag = require(ReplicatedStorage.Shared.UI.FFlag)
local Fusion = require(Shared.UI.Fusion)
local ProductInfo = require(Shared.UI.ProductInfo)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local New = Fusion.New
local Value = Fusion.Value
local Children = Fusion.Children
local Cleanup = Fusion.Cleanup
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed
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
local u88 = FFlag("shop.real-prices", false)
local u92 = FFlag("shop.top-passes", {})

local function Gamepasses(a1, a2) -- Line: 35
    -- upvalues: ForValues (val), ProductInfo (val), Computed (val), u88 (val), u92 (val), New (val), Children (val)
    -- upvalues: Sound (val), ViewController (val)
    return ForValues(a1, function(a1) -- Line: 36
        -- upvalues: ProductInfo (upval), Computed (upval), u88 (upval), u92 (upval), a2 (val), New (upval)
        -- upvalues: Children (upval), Sound (upval), ViewController (upval)
        local GamepassId = a1.GamepassId
        local GamepassGiftId = a1.GamepassGiftId
        local u6 = ProductInfo(GamepassId, Enum.InfoType.GamePass)
        local Price = a1.Price
        local u10 = Computed(function() -- Line: 42 -- upvalues: u6 (val), Price (val)
            local v1 = u6:get()
            if not v1 then
                return Price
            end
            return v1.PriceInRobux or Price
        end)
        local v1 = Computed(function() -- Line: 51 -- upvalues: u88 (upval), u10 (val), Price (val)
            if u88:get() then
                return false
            end
            local v1 = u10:get()
            return v1 and v1 < Price
        end)
        local v2 = Computed(function() -- Line: 60 -- upvalues: u92 (upval), GamepassId (val)
            if table.find(u92:get(), GamepassId) ~= nil then
                return 0
            end
            return 1
        end)
        local v3 = Computed(function() -- Line: 66 -- upvalues: u92 (upval), GamepassId (val), a2 (upval)
            local v1 = table.find(u92:get(), GamepassId) ~= nil
            local v2 = a2.PassSize:get()
            if v1 then
                return (UDim2.new(0.45, 0, 0, v2.Y.Offset * 1.8))
            end
            return v2
        end)
        local v4 = Computed(function() -- Line: 75 -- upvalues: u92 (upval), GamepassId (val)
            if table.find(u92:get(), GamepassId) ~= nil then
                return (UDim2.fromOffset(280, 50))
            end
            return (UDim2.fromOffset(240, 50))
        end)
        local Frame = New("Frame")
        local v5 = {Size = v3, BackgroundTransparency = 1, LayoutOrder = v2}
        local v6 = Children
        local v7 = {}
        local v8 = PurchaseButton
        local v9 = {
            Size = UDim2.new(1, 0, 1, -25),
            Type = a2.Type,
            Title = a1.Name,
            Description = a1.Description,
        }
        v9.DisplayImage = a1.Image and string.format("rbxassetid://%d", a1.Image) or nil
        v9.DisplayImageSize = a1.ImageSize
        v9.DisplayImagePosition = a1.ImagePosition
        v9.DisplayImageAnchorPoint = a1.ImageAnchorPoint
        local v10 = {
            Size = v4,
            Text = Computed(function() -- Line: 101 -- upvalues: u10 (val)
                return " " .. Comma(u10:get())
            end),
            Color = Color3.fromRGB(10, 220, 80),
            TextColor = Color3.new(1, 1, 1),
            TextStrokeTransparency = 0.5,
        }
        local v11 = Children
        local v12 = {}
        local TextLabel = New("TextLabel")
        local v13 = {
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            RichText = true,
            Size = UDim2.fromScale(0, 0.5),
            TextColor3 = Color3.fromRGB(255, 45, 38),
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            LayoutOrder = 4,
            Visible = v1,
            Text = "<s>" .. (Comma(Price)) .. "</s>",
        }
        local v14 = Children
        v13[v14] = {
            New("UIStroke")({Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
            (New("UIPadding")({PaddingLeft = UDim.new(0, 2)})),
        }
        v12[1] = TextLabel(v13)
        v10[v11] = v12
        v9.Button = v10

        function v9.Clicked() -- Line: 146 -- upvalues: Sound (upval), a1 (val)
            Sound("Click"):Play()
            StoreController:purchaseGamepass(a1.GamepassId)
        end

        v10 = Children
        v11 = {}
        v12 = Button({
            ZIndex = 999,
            Visible = GamepassGiftId ~= nil,
            Size = UDim2.fromScale(0.12, 0.12),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            Position = UDim2.fromScale(0.1, 0.18),
            Color = Color3.fromRGB(10, 220, 80),
            Icon = Icons.Gift,
            Clicked = function() -- Line: 164 -- upvalues: ViewController (upval), GamepassGiftId (val)
                ViewController:setView((("GiftProduct:%*"):format(GamepassGiftId)))
            end,
        })
        local TextLabel_2 = New("TextLabel")
        v13 = {
            Visible = v1,
            Text = Computed(function() -- Line: 171 -- upvalues: u10 (val), Price (val)
                return string.format("%d%% OFF!", (math.floor((1 - (u10:get()) / Price) * 100)))
            end),
            Size = UDim2.fromScale(0, 0.15),
            Position = UDim2.fromScale(0.5, 0.82),
            AnchorPoint = Vector2.new(0.5, 1),
            TextColor3 = Color3.fromRGB(255, 45, 38),
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            LayoutOrder = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        }
        v14 = Children
        v13[v14] = {
            New("UIStroke")({Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
        }
        v11[1] = v12
        v11[2] = TextLabel_2(v13)
        v9[v10] = v11
        v7[1] = v8(v9)
        v5[v6] = v7
        return Frame(v5)
    end, function(a1) -- Line: 208
        a1:Destroy()
    end)
end

return function(a1) -- Line: 213
    -- upvalues: Value (val), Computed (val), New (val), Children (val), ForValues (val), ProductInfo (val), u88 (val)
    -- upvalues: u92 (val), Sound (val), ViewController (val), Gamepasses (val), Cleanup (val)
    local IsMobile = a1.IsMobile
    local Scale = a1.Scale
    if not Scale then
        Scale = Value(1)
    end
    local v1 = Computed(function() -- Line: 218 -- upvalues: IsMobile (val), Scale (val)
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
    local v3 = Children
    local v4 = {}
    local v5 = a1[Children]
    local v6 = New("UIPadding")({
        PaddingTop = UDim.new(0, 20),
        PaddingLeft = UDim.new(0, 20),
        PaddingRight = UDim.new(0, 20),
    })
    local v7 = New("Frame")({BackgroundTransparency = 1, LayoutOrder = 999, Size = UDim2.fromScale(1, 0)})
    local v8 = New("UIListLayout")({
        Wraps = true,
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 20),
        HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
        VerticalFlex = Enum.UIFlexAlignment.None,
    })
    local Gamepasses_2 = Purchasables.Gamepasses
    local u97 = {Type = "GAMEPASS", Title = "Game Passes", Visible = a1.Visible, PassSize = v1}
    u97.TitleIcon = Icons.ShopGamepasses
    u97.IsMobile = IsMobile
    local v9 = ForValues(Gamepasses_2, function(a1) -- Line: 36
        -- upvalues: ProductInfo (upval), Computed (upval), u88 (upval), u92 (upval), u97 (val), New (upval)
        -- upvalues: Children (upval), Sound (upval), ViewController (upval)
        local GamepassId = a1.GamepassId
        local GamepassGiftId = a1.GamepassGiftId
        local u6 = ProductInfo(GamepassId, Enum.InfoType.GamePass)
        local Price = a1.Price
        local u10 = Computed(function() -- Line: 42 -- upvalues: u6 (val), Price (val)
            local v1 = u6:get()
            if not v1 then
                return Price
            end
            return v1.PriceInRobux or Price
        end)
        local v1 = Computed(function() -- Line: 51 -- upvalues: u88 (upval), u10 (val), Price (val)
            if u88:get() then
                return false
            end
            local v1 = u10:get()
            return v1 and v1 < Price
        end)
        local v2 = Computed(function() -- Line: 60 -- upvalues: u92 (upval), GamepassId (val)
            if table.find(u92:get(), GamepassId) ~= nil then
                return 0
            end
            return 1
        end)
        local v3 = Computed(function() -- Line: 66 -- upvalues: u92 (upval), GamepassId (val), u97 (upval)
            local v1 = table.find(u92:get(), GamepassId) ~= nil
            local v2 = u97.PassSize:get()
            if v1 then
                return (UDim2.new(0.45, 0, 0, v2.Y.Offset * 1.8))
            end
            return v2
        end)
        local v4 = Computed(function() -- Line: 75 -- upvalues: u92 (upval), GamepassId (val)
            if table.find(u92:get(), GamepassId) ~= nil then
                return (UDim2.fromOffset(280, 50))
            end
            return (UDim2.fromOffset(240, 50))
        end)
        local Frame = New("Frame")
        local v5 = {Size = v3, BackgroundTransparency = 1, LayoutOrder = v2}
        local v6 = Children
        local v7 = {}
        local v8 = PurchaseButton
        local v9 = {
            Size = UDim2.new(1, 0, 1, -25),
            Type = u97.Type,
            Title = a1.Name,
            Description = a1.Description,
        }
        v9.DisplayImage = a1.Image and string.format("rbxassetid://%d", a1.Image) or nil
        v9.DisplayImageSize = a1.ImageSize
        v9.DisplayImagePosition = a1.ImagePosition
        v9.DisplayImageAnchorPoint = a1.ImageAnchorPoint
        local v10 = {
            Size = v4,
            Text = Computed(function() -- Line: 101 -- upvalues: u10 (val)
                return " " .. Comma(u10:get())
            end),
            Color = Color3.fromRGB(10, 220, 80),
            TextColor = Color3.new(1, 1, 1),
            TextStrokeTransparency = 0.5,
        }
        local v11 = Children
        local v12 = {}
        local TextLabel = New("TextLabel")
        local v13 = {
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            RichText = true,
            Size = UDim2.fromScale(0, 0.5),
            TextColor3 = Color3.fromRGB(255, 45, 38),
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            LayoutOrder = 4,
            Visible = v1,
            Text = "<s>" .. (Comma(Price)) .. "</s>",
        }
        local v14 = Children
        v13[v14] = {
            New("UIStroke")({Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
            (New("UIPadding")({PaddingLeft = UDim.new(0, 2)})),
        }
        v12[1] = TextLabel(v13)
        v10[v11] = v12
        v9.Button = v10

        function v9.Clicked() -- Line: 146 -- upvalues: Sound (upval), a1 (val)
            Sound("Click"):Play()
            StoreController:purchaseGamepass(a1.GamepassId)
        end

        v10 = Children
        v11 = {}
        v12 = Button({
            ZIndex = 999,
            Visible = GamepassGiftId ~= nil,
            Size = UDim2.fromScale(0.12, 0.12),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            Position = UDim2.fromScale(0.1, 0.18),
            Color = Color3.fromRGB(10, 220, 80),
            Icon = Icons.Gift,
            Clicked = function() -- Line: 164 -- upvalues: ViewController (upval), GamepassGiftId (val)
                ViewController:setView((("GiftProduct:%*"):format(GamepassGiftId)))
            end,
        })
        local TextLabel_2 = New("TextLabel")
        v13 = {
            Visible = v1,
            Text = Computed(function() -- Line: 171 -- upvalues: u10 (val), Price (val)
                return string.format("%d%% OFF!", (math.floor((1 - (u10:get()) / Price) * 100)))
            end),
            Size = UDim2.fromScale(0, 0.15),
            Position = UDim2.fromScale(0.5, 0.82),
            AnchorPoint = Vector2.new(0.5, 1),
            TextColor3 = Color3.fromRGB(255, 45, 38),
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            LayoutOrder = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        }
        v14 = Children
        v13[v14] = {
            New("UIStroke")({Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
        }
        v11[1] = v12
        v11[2] = TextLabel_2(v13)
        v9[v10] = v11
        v7[1] = v8(v9)
        v5[v6] = v7
        return Frame(v5)
    end, function(a1) -- Line: 208
        a1:Destroy()
    end)
    local v10 = Gamepasses
    local Towers = Purchasables.Towers
    local v11 = {
        Type = "TOWER",
        Title = "Tower Passes",
        Visible = a1.Visible,
        PassSize = v1,
        TitleIcon = Icons.ShopTowerGamepass,
        TitlePosition = UDim2.fromOffset(-20, 0),
        IsMobile = IsMobile,
    }
    v4[1] = v5
    v4[2] = v6
    v4[3] = v7
    v4[4] = v8
    v4[5] = v9
    v4[6] = v10(Towers, v11)
    v2[v3] = v4
    v2[Cleanup] = {}
    return ScrollingFrame(v2)
end