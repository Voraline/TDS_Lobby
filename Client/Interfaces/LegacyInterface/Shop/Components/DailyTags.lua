-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.DailyTags
-- Decompile time: 29.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Fusion = require(Shared.UI.Fusion)
local ProductInfo = require(Shared.UI:WaitForChild("ProductInfo"))
local Scale = require(Shared.UI.Components.Scale)
local New = Fusion.New
local Children = Fusion.Children
local ForPairs = Fusion.ForPairs
local Value = Fusion.Value
local Computed = Fusion.Computed
local Spring = Fusion.Spring
local Parent = script.Parent.Parent.Parent
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Data.SharedData.DailyPrice)
Controllers = Parent.Controllers
SharedComponents = Parent.Components
Components = script.Parent
Icons = require(Parent.Icons)
Button = require(SharedComponents.Button)
Transition = require(SharedComponents.Transition)
ItemCard = require(Components.ItemCard)
DailyItem = require(Components.DailyItem)
Title = require(Components.Title)
Comma = require(Shared.UI.Comma)
ItemController = require(Controllers.ItemController)
InventoryController = require(Controllers.InventoryController)
local u94 = utf8.char(57346)

local function BigTag(a1) -- Line: 38
    -- upvalues: Enum (val), ProductInfo (val), Value (val), Computed (val), Sound (val), New (val), Children (val)
    -- upvalues: Scale (val), Spring (val), u94 (val)
    local Frame, u30, u33, u36, u39, u42, u45, u48, u53, v1, v2, v3, v4, v5
    local u5 = ItemController:tag(a1.Name)
    if not u5 then
        return
    end
    local Price = u5.info.Price
    if not Price then
        return
    end
    local Type = Price.Type
    if Type then
        Type = Enum.CurrencyType.ToString(Price.Type)
    end
    if not Type then
        return
    end
    if Price.Type ~= Enum.CurrencyType.Robux then
        u30 = Value(Price.Value)
        u33 = Value(false)
        u36 = Value(false)
        u39 = Value(false)
        u42 = Value(false)
        u45 = Computed(function() -- Line: 70 -- upvalues: u33 (val), u39 (val)
            return u33:get() or u39:get()
        end)
        u48 = Computed(function() -- Line: 74 -- upvalues: u36 (val), u42 (val)
            return u36:get() or u42:get()
        end)
        u53 = Computed(function() -- Line: 78 -- upvalues: u5 (val)
            if InventoryController:owns(u5) then
                return "Owned"
            end
            return "Purchase"
        end)

        function v1() -- Line: 86 -- upvalues: Sound (upval), u53 (val), a1 (val), u5 (val)
            Sound("Click"):Play()
            if u53:get() ~= "Purchase" then
                return
            end
            a1.OnPurchase(u5)
        end

        Frame = New("Frame")
        v2 = {Size = UDim2.new(0.4835, 0, 0.9, 0), BackgroundTransparency = 1}
        v3 = Children
        v4 = ItemCard
        v5 = {
            Rarity = Enum.SkinRarity.ToString(u5.rarity),
            RarityColor = u5.rarityColor:Lerp(Color3.new(), 0.4),
            Preview = Value({
                Type = "Tags",
                Item = u5.name,
                Size = UDim2.fromScale(1, 0.1),
                Position = UDim2.fromScale(0.5, 0.15),
                Text = u5.name,
            }),
            CameraOffset = Value(CFrame.new(0.6, 1.5, 3)),
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Glow = u45,
            Visible = a1.Visible,
            Clicked = v1,
            MouseEnter = function() -- Line: 123 -- upvalues: u33 (val)
                u33:set(true)
            end,
            MouseLeave = function() -- Line: 127 -- upvalues: u33 (val)
                u33:set(false)
            end,
            MouseDown = function() -- Line: 131 -- upvalues: u36 (val)
                u36:set(true)
            end,
            MouseUp = function() -- Line: 135 -- upvalues: u36 (val)
                u36:set(false)
            end,
        }
        v5[Children] = {
            Scale({
                Scale = Spring(Computed(function() -- Line: 142 -- upvalues: u48 (val), u45 (val)
                    if u48:get() then
                        return 0.95
                    end
                    if u45:get() then
                        return 1.05
                    end
                    return 1
                end), 50, 0.8),
            }),
            (Button({
                ClickSound = "",
                Animate = false,
                Size = UDim2.fromScale(0.8, 0.12),
                Position = UDim2.fromScale(0.5, 1.02),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = Computed(function() -- Line: 162 -- upvalues: u53 (val), u30 (ref), Type (val), u94 (upval)
                    local v1 = u53:get()
                    if v1 ~= "Purchase" then
                        return v1
                    end
                    local v2 = u30:get()
                    if not v2 then
                        return "$???"
                    end
                    local v3 = v2
                    if type(v2) == "table" then
                        v3 = v2.PriceInRobux or 0
                    end
                    if Type == "Robux" then
                        return (("%* %*"):format(u94, (Comma(v3))))
                    end
                    return Comma(v3)
                end),
                Color = Computed(function() -- Line: 185 -- upvalues: u53 (val)
                    if u53:get() == "Purchase" then
                        return Color3.fromRGB(10, 220, 80)
                    end
                    return Color3.fromRGB(150, 150, 150)
                end),
                Icon = Computed(function() -- Line: 193 -- upvalues: u53 (val), Type (val)
                    local v1 = u53:get()
                    if v1 == "Owned" then
                        return ""
                    end
                    if v1 ~= "Purchase" then
                        return Icons.Locked
                    end
                    if Type == "Robux" then
                        return ""
                    end
                    return Icons[Type] or ""
                end),
                Hovering = u39,
                Clicking = u42,
                Clicked = v1,
            })),
        }
        v2[v3] = (v4(v5))
        return (Frame(v2))
    end
    if not Price.Value then
        return
    end
    u30 = ProductInfo(Price.Value, Enum.InfoType.Product)
    u33 = Value(false)
    u36 = Value(false)
    u39 = Value(false)
    u42 = Value(false)
    u45 = Computed(function() -- Line: 70 -- upvalues: u33 (val), u39 (val)
        return u33:get() or u39:get()
    end)
    u48 = Computed(function() -- Line: 74 -- upvalues: u36 (val), u42 (val)
        return u36:get() or u42:get()
    end)
    u53 = Computed(function() -- Line: 78 -- upvalues: u5 (val)
        if InventoryController:owns(u5) then
            return "Owned"
        end
        return "Purchase"
    end)

    function v1() -- Line: 86 -- upvalues: Sound (upval), u53 (val), a1 (val), u5 (val)
        Sound("Click"):Play()
        if u53:get() ~= "Purchase" then
            return
        end
        a1.OnPurchase(u5)
    end

    Frame = New("Frame")
    v2 = {Size = UDim2.new(0.4835, 0, 0.9, 0), BackgroundTransparency = 1}
    v3 = Children
    v4 = ItemCard
    v5 = {
        Rarity = Enum.SkinRarity.ToString(u5.rarity),
        RarityColor = u5.rarityColor:Lerp(Color3.new(), 0.4),
        Preview = Value({
            Type = "Tags",
            Item = u5.name,
            Size = UDim2.fromScale(1, 0.1),
            Position = UDim2.fromScale(0.5, 0.15),
            Text = u5.name,
        }),
        CameraOffset = Value(CFrame.new(0.6, 1.5, 3)),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Glow = u45,
        Visible = a1.Visible,
        Clicked = v1,
        MouseEnter = function() -- Line: 123 -- upvalues: u33 (val)
            u33:set(true)
        end,
        MouseLeave = function() -- Line: 127 -- upvalues: u33 (val)
            u33:set(false)
        end,
        MouseDown = function() -- Line: 131 -- upvalues: u36 (val)
            u36:set(true)
        end,
        MouseUp = function() -- Line: 135 -- upvalues: u36 (val)
            u36:set(false)
        end,
    }
    v5[Children] = {
        Scale({
            Scale = Spring(Computed(function() -- Line: 142 -- upvalues: u48 (val), u45 (val)
                if u48:get() then
                    return 0.95
                end
                if u45:get() then
                    return 1.05
                end
                return 1
            end), 50, 0.8),
        }),
        (Button({
            ClickSound = "",
            Animate = false,
            Size = UDim2.fromScale(0.8, 0.12),
            Position = UDim2.fromScale(0.5, 1.02),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = Computed(function() -- Line: 162 -- upvalues: u53 (val), u30 (ref), Type (val), u94 (upval)
                local v1 = u53:get()
                if v1 ~= "Purchase" then
                    return v1
                end
                local v2 = u30:get()
                if not v2 then
                    return "$???"
                end
                local v3 = v2
                if type(v2) == "table" then
                    v3 = v2.PriceInRobux or 0
                end
                if Type == "Robux" then
                    return (("%* %*"):format(u94, (Comma(v3))))
                end
                return Comma(v3)
            end),
            Color = Computed(function() -- Line: 185 -- upvalues: u53 (val)
                if u53:get() == "Purchase" then
                    return Color3.fromRGB(10, 220, 80)
                end
                return Color3.fromRGB(150, 150, 150)
            end),
            Icon = Computed(function() -- Line: 193 -- upvalues: u53 (val), Type (val)
                local v1 = u53:get()
                if v1 == "Owned" then
                    return ""
                end
                if v1 ~= "Purchase" then
                    return Icons.Locked
                end
                if Type == "Robux" then
                    return ""
                end
                return Icons[Type] or ""
            end),
            Hovering = u39,
            Clicking = u42,
            Clicked = v1,
        })),
    }
    v2[v3] = (v4(v5))
    return (Frame(v2))
end

local function SmallTag(a1) -- Line: 220
    -- upvalues: Enum (val), ProductInfo (val), Value (val), Computed (val), Sound (val)
    local u30, u35, v1, v2
    local u5 = ItemController:tag(a1.Name)
    if not u5 then
        return
    end
    local Price = u5.info.Price
    if not Price then
        return
    end
    local Type = Price.Type
    if Type then
        Type = Enum.CurrencyType.ToString(Price.Type)
    end
    if not Type then
        return
    end
    if Price.Type ~= Enum.CurrencyType.Robux then
        u30 = Value(Price.Value)
        u35 = Computed(function() -- Line: 247 -- upvalues: u5 (val)
            if InventoryController:owns(u5) then
                return "Owned"
            end
            return "Purchase"
        end)
        v1 = DailyItem
        v2 = {
            Name = "",
            PurchaseColor = Computed(function() -- Line: 258 -- upvalues: u35 (val)
                if u35:get() == "Purchase" then
                    return Color3.fromRGB(10, 220, 80)
                end
                return Color3.fromRGB(150, 150, 150)
            end),
        }
        v2.Currency = Computed(function() -- Line: 266 -- upvalues: u35 (val), Type (val)
            local v1 = u35:get()
            if v1 == "Owned" then
                return ""
            end
            if v1 == "Purchase" then
                return Type
            end
            return Icons.Locked
        end)
        v2.Amount = Computed(function() -- Line: 279 -- upvalues: u35 (val), u30 (ref)
            if u35:get() == "Owned" then
                return "Owned"
            end
            return (("%*"):format((Comma((u30:get())))))
        end)
        v2.Rarity = Enum.SkinRarity.ToString(u5.rarity)
        v2.RarityColor = u5.rarityColor:Lerp(Color3.new(), 0.4)
        v2.Size = a1.IsMobile and UDim2.fromOffset(180, 180) or nil
        v2.PreviewSize = UDim2.fromScale(0.8, 0.8)
        v2.Preview = Value({
            Type = "Tags",
            Item = u5.name,
            Text = u5.name,
            Size = UDim2.fromScale(1, 0.15),
            Position = UDim2.fromScale(0.5, -0.15),
        })

        function v2.Clicked() -- Line: 300 -- upvalues: Sound (upval), u35 (val), a1 (val), u5 (val)
            Sound("Click"):Play()
            if u35:get() == "Owned" then
                return
            end
            if a1.OnPurchase then
                a1.OnPurchase(u5)
            end
        end

        v1 = v1(v2)
        return v1
    end
    if not Price.Value then
        return
    end
    u30 = ProductInfo(Price.Value, Enum.InfoType.Product)
    u35 = Computed(function() -- Line: 247 -- upvalues: u5 (val)
        if InventoryController:owns(u5) then
            return "Owned"
        end
        return "Purchase"
    end)
    v1 = DailyItem
    v2 = {
        Name = "",
        PurchaseColor = Computed(function() -- Line: 258 -- upvalues: u35 (val)
            if u35:get() == "Purchase" then
                return Color3.fromRGB(10, 220, 80)
            end
            return Color3.fromRGB(150, 150, 150)
        end),
    }
    v2.Currency = Computed(function() -- Line: 266 -- upvalues: u35 (val), Type (val)
        local v1 = u35:get()
        if v1 == "Owned" then
            return ""
        end
        if v1 == "Purchase" then
            return Type
        end
        return Icons.Locked
    end)
    v2.Amount = Computed(function() -- Line: 279 -- upvalues: u35 (val), u30 (ref)
        if u35:get() == "Owned" then
            return "Owned"
        end
        return (("%*"):format((Comma((u30:get())))))
    end)
    v2.Rarity = Enum.SkinRarity.ToString(u5.rarity)
    v2.RarityColor = u5.rarityColor:Lerp(Color3.new(), 0.4)
    v2.Size = a1.IsMobile and UDim2.fromOffset(180, 180) or nil
    v2.PreviewSize = UDim2.fromScale(0.8, 0.8)
    v2.Preview = Value({
        Type = "Tags",
        Item = u5.name,
        Text = u5.name,
        Size = UDim2.fromScale(1, 0.15),
        Position = UDim2.fromScale(0.5, -0.15),
    })

    function v2.Clicked() -- Line: 300 -- upvalues: Sound (upval), u35 (val), a1 (val), u5 (val)
        Sound("Click"):Play()
        if u35:get() == "Owned" then
            return
        end
        if a1.OnPurchase then
            a1.OnPurchase(u5)
        end
    end

    v1 = v1(v2)
    return v1
end

return function(a1) -- Line: 314
    -- upvalues: Value (val), New (val), Children (val), ForPairs (val), BigTag (val), SmallTag (val)
    local UIGridLayout, v1, v2, v3, v4, v5
    ItemController:init()
    local IsMobile = a1.IsMobile
    local v6 = a1.Small == true
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end

    local function v7(a1, a2) -- Line: 321 -- upvalues: IsMobile (val)
        if IsMobile then
            return a1
        end
        return a2
    end

    local Frame = New("Frame")
    local v8 = {}
    local Size = a1.Size
    if not Size then
        v4 = UDim2.new(if not v6 then 0.45 else 0.5, 0, 0, 390)
        v5 = UDim2.fromScale(0.45, 0.85)
        Size = if not IsMobile then v5 else v4
    end
    v8.Size = Size
    local Position = a1.Position
    if not Position then
        v4 = UDim2.new(0.5, 0, 0, 370)
        v5 = UDim2.fromScale(0, 0)
        Position = if not IsMobile then v5 else v4
    end
    v8.Position = Position
    local AnchorPoint = a1.AnchorPoint
    if not AnchorPoint then
        v4 = Vector2.new(0.5, 0)
        local zero = Vector2.zero
        AnchorPoint = if not IsMobile then zero else v4
    end
    v8.AnchorPoint = AnchorPoint
    v8.AutomaticSize = a1.AutomaticSize
    v8.LayoutOrder = a1.LayoutOrder
    v8.BackgroundTransparency = 1
    v4 = {}
    v5 = Title
    local v9 = {Text = a1.Title, Icon = ("rbxassetid://%*"):format(a1.TitleIcon or 9674090511)}
    local TitlePosition = a1.TitlePosition or UDim2.new(0.5, 0, 0, 0)
    v9.Position = TitlePosition
    local TitleAnchorPoint = a1.TitleAnchorPoint or Vector2.new(0.5, 0)
    v9.AnchorPoint = TitleAnchorPoint
    v5 = v5(v9)
    local Frame_2 = New("Frame")
    local v10 = {
        Size = UDim2.new(1, 0, 1, -50),
        Position = UDim2.fromOffset(0, 50),
        BackgroundTransparency = 1,
    }
    local v11 = {}
    if a1.Small == true then
        UIGridLayout = New("UIGridLayout")
        v2 = {}
        v3 = IsMobile and UDim2.fromOffset(0, 0) or UDim2.fromOffset(10, 10)
        v2.CellPadding = v3
        v3 = IsMobile and UDim2.fromScale(0.333, 0.5) or UDim2.fromScale(0.32, 0.4)
        v2.CellSize = v3
        v1 = UIGridLayout(v2)
    else
        local UIListLayout = New("UIListLayout")
        v2 = {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.033, 0),
        }
        v2.HorizontalAlignment = a1.IsMobile and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
        v1 = UIListLayout(v2)
        if not v1 then
            UIGridLayout = New("UIGridLayout")
            v2 = {}
            v3 = IsMobile and UDim2.fromOffset(0, 0) or UDim2.fromOffset(10, 10)
            v2.CellPadding = v3
            v3 = IsMobile and UDim2.fromScale(0.333, 0.5) or UDim2.fromScale(0.32, 0.4)
            v2.CellSize = v3
            v1 = UIGridLayout(v2)
        end
    end
    local Tags = a1.Tags or {}
    v11[1] = v1
    v11[2] = ForPairs(Tags, function(a1_2, a2) -- Line: 363 -- upvalues: Visible (val), a1 (val), BigTag (upval), SmallTag (upval)
        local v1 = {
            Name = a2,
            LayoutOrder = a1_2,
            Visible = Visible,
            Big = a1.Big,
            OnPurchase = a1.OnPurchase,
        }
        return a1_2, if a1.Small == true then SmallTag(v1) else BigTag(v1)
    end, function(a1, a2) -- Line: 380
        a2:Destroy()
    end)
    v10[Children] = v11
    v4[1] = v5
    v4[2] = Frame_2(v10)
    v8[Children] = v4
    return Frame(v8)
end