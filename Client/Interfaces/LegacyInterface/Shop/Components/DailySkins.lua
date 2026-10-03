-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.DailySkins
-- Decompile time: 11.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Fusion = require(Shared.UI.Fusion)
local ProductInfo = require(Shared.UI:WaitForChild("ProductInfo"))
local Scale = require(Shared.UI.Components.Scale)
local New = Fusion.New
local Children = Fusion.Children
local ForValues = Fusion.ForValues
local Value = Fusion.Value
local Computed = Fusion.Computed
local Spring = Fusion.Spring
local Parent = script.Parent.Parent.Parent
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local DailyPrice = require(ReplicatedStorage.Shared.Data.SharedData.DailyPrice)
Controllers = Parent.Controllers
SharedComponents = Parent.Components
Components = script.Parent
Icons = require(Parent.Icons)
Button = require(SharedComponents.Button)
Title = require(Components.Title)
ItemCard = require(Components.ItemCard)
Transition = require(SharedComponents.Transition)
Comma = require(Shared.UI.Comma)
ItemController = require(Controllers.ItemController)
InventoryController = require(Controllers.InventoryController)
local u90 = utf8.char(57346)

local function getTowerPreview(a1) -- Line: 37
    local info = a1.info or {}
    local Preview = info.Preview or {}
    return {
        Name = a1.name,
        Offset = Preview.Offset,
        Rotation = Preview.Rotation,
        Zoom = Preview.Zoom,
    }
end

return function(a1) -- Line: 49
    -- upvalues: Value (val), New (val), Computed (val), Children (val), ForValues (val), DailyPrice (val), Enum (val)
    -- upvalues: ProductInfo (val), Sound (val), Scale (val), Spring (val), u90 (val)
    local v1, v2
    ItemController:init()
    local IsMobile = a1.IsMobile
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local Expanded = a1.Expanded
    if not Expanded then
        Expanded = Value(false)
    end

    local function isExpanded() -- Line: 56 -- upvalues: Expanded (val)
        if type(Expanded) == "table" and Expanded.get then
            return Expanded:get()
        end
        return Expanded == true
    end

    local function v3(a1, a2) -- Line: 64 -- upvalues: IsMobile (val)
        if IsMobile then
            return a1
        end
        return a2
    end

    local Frame = New("Frame")
    local v4 = {}
    local Size = a1.Size or Computed(function() -- Line: 69 -- upvalues: Expanded (val), IsMobile (val)
        local v1
        local v2 = if type(Expanded) ~= "table" then Expanded == true else if not Expanded.get then Expanded == true else Expanded:get()
        if v2 then
            v2 = UDim2.fromOffset(1180, 390)
            v1 = UDim2.fromScale(1, 0.85)
            if IsMobile then
                return v2
            end
            return v1
        end
        v2 = UDim2.fromOffset(770, 390)
        v1 = UDim2.fromScale(0.648, 0.85)
        if IsMobile then
            return v2
        end
        return v1
    end)
    v4.Size = Size
    local Position = a1.Position
    if not Position then
        v2 = UDim2.new(0.5, 0, 0, 370)
        v1 = UDim2.fromScale(0, 0)
        Position = if not IsMobile then v1 else v2
    end
    v4.Position = Position
    local AnchorPoint = a1.AnchorPoint
    if not AnchorPoint then
        v2 = Vector2.new(0.5, 0)
        local zero = Vector2.zero
        AnchorPoint = if not IsMobile then zero else v2
    end
    v4.AnchorPoint = AnchorPoint
    v4.LayoutOrder = a1.LayoutOrder
    v4.BackgroundTransparency = 1
    local v5 = Children
    v2 = {}
    v1 = Title({
        Text = "Daily Tower Skins",
        Icon = "rbxassetid://9674090511",
        Position = UDim2.fromOffset(0, 0),
        AnchorPoint = Vector2.new(0, 0),
    })
    local Frame_2 = New("Frame")
    local v6 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1}
    local v7 = Children
    local v8 = {}
    local v9 = New("UIPadding")({
        PaddingLeft = UDim.new(0, 0),
        PaddingRight = UDim.new(0, 0),
        PaddingTop = UDim.new(0, 50),
        PaddingBottom = UDim.new(0, -50),
    })
    local UIListLayout = New("UIListLayout")
    local v10 = {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }
    v10.Padding = Computed(function() -- Line: 102 -- upvalues: Expanded (val)
        return UDim.new(
            if not (if type(Expanded) ~= "table" then Expanded == true else if not Expanded.get then Expanded == true else Expanded:get()) then 0.033 else 0.025,
            0
        )
    end)
    v10.HorizontalAlignment = a1.IsMobile and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
    local v11 = UIListLayout(v10)
    local Skins = a1.Skins or {}
    v8[1] = v9
    v8[2] = v11
    v8[3] = ForValues(Skins, function(a1_2) -- Line: 109
        -- upvalues: Value (upval), Computed (upval), a1 (val), DailyPrice (upval), Enum (upval), ProductInfo (upval)
        -- upvalues: Sound (upval), New (upval), Expanded (val), Children (upval), Visible (val), Scale (upval)
        -- upvalues: Spring (upval), u90 (upval)
        local u6 = ItemController:skin(a1_2.Troop, a1_2.Skin)
        local v1 = ItemController:crate(a1_2.Crate)
        local tower = u6.tower
        if tower and u6 and v1 then
            local Frame, displayName, u61, v2, v3, v4, v5, v6, v7
            local u15 = Value(false)
            local u18 = Value(false)
            local u21 = Value(false)
            local u24 = Value(false)
            local u27 = Computed(function() -- Line: 123 -- upvalues: u15 (val), u21 (val)
                return u15:get() or u21:get()
            end)
            local u30 = Computed(function() -- Line: 127 -- upvalues: u18 (val), u24 (val)
                return u18:get() or u24:get()
            end)
            local u33 = Computed(function() -- Line: 131 -- upvalues: a1 (upval), tower (val), u6 (val)
                if not a1.OnPurchase or not InventoryController:owns(tower) then
                    return "Locked"
                end
                if InventoryController:owns(u6) then
                    return "Owned"
                end
                return "Purchase"
            end)
            local u38 = DailyPrice(a1_2.Troop, a1_2.Skin, a1_2.Crate)
            if not u38 then
                return
            end
            local Type = u38.Type
            if Type then
                Type = Enum.CurrencyType.ToString(u38.Type)
            end
            if not Type then
                return
            end
            if u38.Type ~= Enum.CurrencyType.Robux then
                u61 = Value(u38.Value)

                function v2() -- Line: 168
                    -- upvalues: Sound (upval), u33 (val), a1 (upval), a1_2 (val), tower (val), u38 (val), Type (val)
                    Sound("Click"):Play()
                    if u33:get() ~= "Purchase" then
                        return
                    end
                    a1.OnPurchase(a1_2, {
                        Name = a1_2.Skin,
                        DisplayName = string.format("%s %s", a1_2.Skin, tower.name),
                        Tower = tower.name,
                        Price = u38.Value,
                        Currency = Type,
                    })
                end

                Frame = New("Frame")
                v3 = {
                    Size = Computed(function() -- Line: 185 -- upvalues: Expanded (upval)
                        return UDim2.fromScale(
                            if not (if type(Expanded) ~= "table" then Expanded == true else if not Expanded.get then Expanded == true else Expanded:get()) then 0.3 else 0.18,
                            0.9
                        )
                    end),
                    BackgroundTransparency = 1,
                }
                v4 = Children
                v5 = ItemCard
                v6 = {Name = tower.name}
                displayName = u6.displayName or u6.name
                v6.Skin = displayName
                v6.Rarity = tostring(u6.info.Rarity)
                v6.RarityColor = u6.info.RarityColor:Lerp(Color3.new(), 0.4)
                v6.Preview = Value({Type = "Towers", Item = tower.name, Skin = u6.name})
                v6.Size = UDim2.fromScale(1, 1)
                v6.Position = UDim2.fromScale(0.5, 0.5)
                v6.AnchorPoint = Vector2.new(0.5, 0.5)
                v6.Glow = u27
                v6.Visible = Visible
                v6.Clicked = v2

                function v6.MouseEnter() -- Line: 210 -- upvalues: u15 (val)
                    u15:set(true)
                end

                function v6.MouseLeave() -- Line: 214 -- upvalues: u15 (val)
                    u15:set(false)
                end

                function v6.MouseDown() -- Line: 218 -- upvalues: u18 (val)
                    u18:set(true)
                end

                function v6.MouseUp() -- Line: 222 -- upvalues: u18 (val)
                    u18:set(false)
                end

                v7 = Children
                v6[v7] = {
                    Scale({
                        Scale = Spring(Computed(function() -- Line: 229 -- upvalues: u30 (val), u27 (val)
                            if u30:get() then
                                return 0.95
                            end
                            if u27:get() then
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
                        Text = Computed(function() -- Line: 249 -- upvalues: u33 (val), u61 (ref), Type (val), u90 (upval)
                            local v1 = u33:get()
                            if v1 ~= "Purchase" then
                                return v1
                            end
                            local v2 = u61:get()
                            if not v2 then
                                return "$???"
                            end
                            local v3 = v2
                            if type(v2) == "table" then
                                v3 = v2.PriceInRobux or 0
                            end
                            if Type == "Robux" then
                                return (("%* %*"):format(u90, (Comma(v3))))
                            end
                            return Comma(v3)
                        end),
                        Color = Computed(function() -- Line: 272 -- upvalues: u33 (val)
                            if u33:get() == "Purchase" then
                                return Color3.fromRGB(10, 220, 80)
                            end
                            return Color3.fromRGB(150, 150, 150)
                        end),
                        Icon = Computed(function() -- Line: 280 -- upvalues: u33 (val), Type (val)
                            local v1 = u33:get()
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
                        Hovering = u21,
                        Clicking = u24,
                        Clicked = v2,
                    })),
                }
                v3[v4] = (v5(v6))
                return (Frame(v3))
            end
            if not u38.Value then
                return
            end
            u61 = ProductInfo(u38.Value, Enum.InfoType.Product)

            function v2() -- Line: 168
                -- upvalues: Sound (upval), u33 (val), a1 (upval), a1_2 (val), tower (val), u38 (val), Type (val)
                Sound("Click"):Play()
                if u33:get() ~= "Purchase" then
                    return
                end
                a1.OnPurchase(a1_2, {
                    Name = a1_2.Skin,
                    DisplayName = string.format("%s %s", a1_2.Skin, tower.name),
                    Tower = tower.name,
                    Price = u38.Value,
                    Currency = Type,
                })
            end

            Frame = New("Frame")
            v3 = {
                Size = Computed(function() -- Line: 185 -- upvalues: Expanded (upval)
                    return UDim2.fromScale(
                        if not (if type(Expanded) ~= "table" then Expanded == true else if not Expanded.get then Expanded == true else Expanded:get()) then 0.3 else 0.18,
                        0.9
                    )
                end),
                BackgroundTransparency = 1,
            }
            v4 = Children
            v5 = ItemCard
            v6 = {Name = tower.name}
            displayName = u6.displayName or u6.name
            v6.Skin = displayName
            v6.Rarity = tostring(u6.info.Rarity)
            v6.RarityColor = u6.info.RarityColor:Lerp(Color3.new(), 0.4)
            v6.Preview = Value({Type = "Towers", Item = tower.name, Skin = u6.name})
            v6.Size = UDim2.fromScale(1, 1)
            v6.Position = UDim2.fromScale(0.5, 0.5)
            v6.AnchorPoint = Vector2.new(0.5, 0.5)
            v6.Glow = u27
            v6.Visible = Visible
            v6.Clicked = v2

            function v6.MouseEnter() -- Line: 210 -- upvalues: u15 (val)
                u15:set(true)
            end

            function v6.MouseLeave() -- Line: 214 -- upvalues: u15 (val)
                u15:set(false)
            end

            function v6.MouseDown() -- Line: 218 -- upvalues: u18 (val)
                u18:set(true)
            end

            function v6.MouseUp() -- Line: 222 -- upvalues: u18 (val)
                u18:set(false)
            end

            v7 = Children
            v6[v7] = {
                Scale({
                    Scale = Spring(Computed(function() -- Line: 229 -- upvalues: u30 (val), u27 (val)
                        if u30:get() then
                            return 0.95
                        end
                        if u27:get() then
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
                    Text = Computed(function() -- Line: 249 -- upvalues: u33 (val), u61 (ref), Type (val), u90 (upval)
                        local v1 = u33:get()
                        if v1 ~= "Purchase" then
                            return v1
                        end
                        local v2 = u61:get()
                        if not v2 then
                            return "$???"
                        end
                        local v3 = v2
                        if type(v2) == "table" then
                            v3 = v2.PriceInRobux or 0
                        end
                        if Type == "Robux" then
                            return (("%* %*"):format(u90, (Comma(v3))))
                        end
                        return Comma(v3)
                    end),
                    Color = Computed(function() -- Line: 272 -- upvalues: u33 (val)
                        if u33:get() == "Purchase" then
                            return Color3.fromRGB(10, 220, 80)
                        end
                        return Color3.fromRGB(150, 150, 150)
                    end),
                    Icon = Computed(function() -- Line: 280 -- upvalues: u33 (val), Type (val)
                        local v1 = u33:get()
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
                    Hovering = u21,
                    Clicking = u24,
                    Clicked = v2,
                })),
            }
            v3[v4] = (v5(v6))
            return (Frame(v3))
        end
    end, function(a1) -- Line: 305
        a1:Destroy()
    end)
    v6[v7] = v8
    v2[1] = v1
    v2[2] = Frame_2(v6)
    v4[v5] = v2
    return Frame(v4)
end