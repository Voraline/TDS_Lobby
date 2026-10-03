-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Tickets
-- Decompile time: 8.09 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local LocalPlayer = Players.LocalPlayer
local Comma = require(Shared.UI.Comma)
local Fusion = require(Shared.UI.Fusion)
local ProductInfo = require(Shared.UI.ProductInfo)
local UserPolicies = require(Shared.Modules.UserPolicies)
local New = Fusion.New
local Value = Fusion.Value
local ForPairs = Fusion.ForPairs
local Children = Fusion.Children
local Cleanup = Fusion.Cleanup
local Computed = Fusion.Computed
local OnChange = Fusion.OnChange
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Parent = script.Parent.Parent.Parent
SharedComponents = script.Parent.Parent.Parent.Components
Components = script.Parent.Parent.Components
Icons = require(Parent.Icons)
Button = require(SharedComponents.Button)
PurchaseButton = require(Components.PurchaseButton)
CurrencyInfo = require(script.Parent.Parent.Purchasables).Currency
StoreController = require(Parent.Controllers.StoreController)
ViewController = require(Parent.Controllers.ViewController)

local function playClickSound() -- Line: 33 -- upvalues: Sound (val)
    Sound("Click"):Play()
end

local function SpinWheelOddsButton(a1) -- Line: 37 -- upvalues: Sound (val)
    return Button({
        ClickSound = "",
        IgnoreHover = true,
        NoScale = true,
        TextStrokeTransparency = 0.5,
        Text = "Odds",
        ZIndex = 999,
        AnchorPoint = Vector2.new(1, 0.5),
        Color = Color3.fromRGB(0, 217, 255),
        Position = UDim2.new(0.5, 120, 1, -56),
        Size = UDim2.fromOffset(110, 40),
        Visible = a1.Visible,
        Clicked = function() -- Line: 51 -- upvalues: Sound (upval), a1 (val)
            Sound("Click"):Play()
            if a1.OnShowOdds then
                a1.OnShowOdds()
            end
        end,
    })
end

local function CurrencySection(a1) -- Line: 61
    -- upvalues: Value (val), Computed (val), New (val), Children (val), ForPairs (val), ProductInfo (val), Comma (val)
    -- upvalues: Sound (val), SpinWheelOddsButton (val)
    local IsMobile = a1.IsMobile
    local GridLayout = a1.GridLayout
    if not GridLayout then
        GridLayout = Value(false)
    end
    local Visible = a1.Visible
    local Currency = a1.Currency
    local u10 = a1.LocalizedName or Currency
    local ShowOdds = a1.ShowOdds
    local OnShowOdds = a1.OnShowOdds
    local u13 = nil
    local u17 = if not OnShowOdds then nil else Computed(function() -- Line: 72 -- upvalues: ShowOdds (val)
        local v1 = ShowOdds
        if typeof(ShowOdds) == "table" and ShowOdds.get then
            v1 = ShowOdds:get()
        end
        return v1 == true
    end)
    local u24 = Computed(function() -- Line: 82 -- upvalues: GridLayout (val), IsMobile (val)
        if GridLayout:get() and not IsMobile then
            return UDim2.fromOffset(50, 50)
        end
        return UDim2.fromOffset(40, 40)
    end)
    local v1 = Computed(function() -- Line: 90 -- upvalues: GridLayout (val)
        return GridLayout:get() and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY
    end)
    local Frame = New("Frame")
    local v2 = {
        BackgroundTransparency = 1,
        Size = Computed(function() -- Line: 96 -- upvalues: GridLayout (val)
            return UDim2.fromScale(if not GridLayout:get() then 0 else 1, 0)
        end),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = v1,
        Visible = Visible,
    }
    local v3 = Children
    local Frame_2 = New("Frame")
    local v4 = {
        BackgroundTransparency = 1,
        AutomaticSize = v1,
        Size = Computed(function() -- Line: 108 -- upvalues: GridLayout (val)
            return UDim2.fromScale(if not GridLayout:get() then 0 else 1, 0)
        end),
    }
    local v5 = Children
    local v6 = {}
    local v7 = New("UIListLayout")({
        Padding = UDim.new(0, 20),
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    local Frame_3 = New("Frame")
    local v8 = {
        Position = UDim2.new(0, 0, 0, 70),
        BackgroundTransparency = 1,
        Size = Computed(function() -- Line: 122 -- upvalues: GridLayout (val), IsMobile (val)
            if not GridLayout:get() then
                return UDim2.fromOffset(0, 120)
            end
            return UDim2.new(0, if not IsMobile then 780 else 740, 1, 0)
        end),
        AutomaticSize = Computed(function() -- Line: 130 -- upvalues: GridLayout (val)
            if not GridLayout:get() then
                return Enum.AutomaticSize.XY
            end
            return Enum.AutomaticSize.None
        end),
    }
    local v9 = Children
    v8[v9] = {
        Computed(function() -- Line: 141 -- upvalues: u13 (ref), GridLayout (val), New (upval), a1 (val), u24 (val), IsMobile (val)
            local v1
            if u13 then
                u13:Destroy()
            end
            if not GridLayout:get() then
                local UIListLayout = New("UIListLayout")
                v1 = {}
                local v2 = IsMobile and UDim.new(0, 50) or UDim.new(0, 25)
                v1.Padding = v2
                v1.FillDirection = IsMobile and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
                v1.HorizontalAlignment = IsMobile and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
                v1.VerticalAlignment = IsMobile and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Center
                v1.SortOrder = Enum.SortOrder.LayoutOrder
                u13 = UIListLayout(v1)
            else
                local UIGridLayout = New("UIGridLayout")
                v1 = {}
                local GridPadding = a1.GridPadding or u24
                v1.CellPadding = GridPadding
                local GridSize = a1.GridSize or UDim2.fromOffset(340, 153)
                v1.CellSize = GridSize
                v1.HorizontalAlignment = Enum.HorizontalAlignment.Center
                v1.SortOrder = Enum.SortOrder.LayoutOrder
                u13 = UIGridLayout(v1)
            end
            return u13
        end),
        (ForPairs(CurrencyInfo[Currency], function(a1, a2) -- Line: 171
            -- upvalues: ProductInfo (upval), Computed (upval), New (upval), IsMobile (val), Children (upval)
            -- upvalues: Comma (upval), u10 (val), Sound (upval), Currency (val), OnShowOdds (val)
            -- upvalues: SpinWheelOddsButton (upval), u17 (val)
            local u5 = ProductInfo(a2.ProductId, Enum.InfoType.Product)
            local Robux = a2.Robux
            local u9 = Computed(function() -- Line: 176 -- upvalues: u5 (val), Robux (val)
                local v1 = u5:get()
                if not v1 then
                    return Robux
                end
                return v1.PriceInRobux or Robux
            end)
            local Frame = New("Frame")
            local v1 = {}
            local v2 = IsMobile and UDim2.fromOffset(340, 153) or UDim2.fromOffset(260, 153)
            v1.Size = v2
            v1.BackgroundTransparency = 1
            v2 = Children
            local v3 = {}
            local v4 = PurchaseButton
            local v5 = {
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Title = string.format("x%s", Comma(a2.Currency)),
                Type = string.upper(u10),
                DisplayImage = string.format("rbxassetid://%d", a2.Image),
                DisplayImageSize = a2.ImageSize,
                DisplayImagePosition = a2.ImagePosition,
            }
            v5.Button = {
                TextStrokeTransparency = 0.5,
                Color = Color3.fromRGB(10, 220, 80),
                Size = UDim2.fromOffset(240, 50),
                Text = Computed(function() -- Line: 212 -- upvalues: Comma (upval), u9 (val)
                    return " " .. Comma(u9:get())
                end),
            }

            function v5.Clicked() -- Line: 217 -- upvalues: Sound (upval), Currency (upval), a2 (val)
                Sound("Click"):Play()
                local v1, v2 = StoreController:purchaseCurrency(Currency, a2.Currency)
                if not v1 then
                    local v3 = v2 or string.format("Unknown error occured while purchasing \"%s %s\"", Currency, a2.Currency)
                    ViewController:notifyError(v3)
                end
            end

            local v6 = Children
            v5[v6] = {
                OnShowOdds and SpinWheelOddsButton({Visible = u17, OnShowOdds = OnShowOdds}) or nil,
            }
            v3[1] = v4(v5)
            v1[v2] = v3
            return a1, Frame(v1)
        end, function(a1, a2) -- Line: 249
            a2:Destroy()
        end)),
    }
    v6[1] = v7
    v6[2] = Frame_3(v8)
    v4[v5] = v6
    v2[v3] = (Frame_2(v4))
    return (Frame(v2))
end

return function(a1) -- Line: 259
    -- upvalues: Value (val), UserPolicies (val), LocalPlayer (val), New (val), OnChange (val), Children (val)
    -- upvalues: CurrencySection (val), Computed (val), Cleanup (val)
    local v1 = {}
    ViewController:init()
    StoreController:init()
    local IsMobile = a1.IsMobile
    local Visible = a1.Visible
    local Delayed = a1.Delayed
    local u15 = Value(false)
    local u22 = (UserPolicies(LocalPlayer)):andThen(function(a1) -- Line: 270 -- upvalues: u15 (val)
        u15:set(a1.ArePaidRandomItemsRestricted == false)
    end)
    table.insert(v1, function() -- Line: 274 -- upvalues: u22 (val)
        u22:cancel()
    end)
    local Frame = New("Frame")
    local v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 20),
    }
    local v3 = IsMobile and UDim2.fromOffset(0, 0) or UDim2.new(1, 0, 1, -120)
    v2.Size = v3
    v2.AutomaticSize = IsMobile and Enum.AutomaticSize.XY or Enum.AutomaticSize.None
    v2.Visible = Delayed
    v2.LayoutOrder = a1.LayoutOrder
    local AbsoluteSize = OnChange("AbsoluteSize")
    v2[AbsoluteSize] = a1.OnSize
    local v4 = {}
    local v5 = a1[Children]
    local UIPadding = New("UIPadding")
    local v6 = {}
    local v7 = if not IsMobile then UDim.new(0, 0) else UDim.new(0, 20)
    v6.PaddingBottom = v7
    v7 = if IsMobile then UDim.new(0, 0) else UDim.new(0, 20)
    v6.PaddingTop = v7
    local v8 = UIPadding(v6)
    local UIListLayout = New("UIListLayout")
    v7 = {FillDirection = Enum.FillDirection.Vertical}
    v7.HorizontalAlignment = IsMobile and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
    v7.VerticalAlignment = Enum.VerticalAlignment.Top
    v7.SortOrder = Enum.SortOrder.LayoutOrder
    v7.Padding = UDim.new(0, if not IsMobile then 80 else 40)
    v6 = UIListLayout(v7)
    local Frame_2 = New("Frame")
    local v9 = {
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(0, 0),
        Position = UDim2.fromScale(0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
    }
    local v10 = {}
    local v11 = New("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 40),
    })
    local v12 = CurrencySection({
        Currency = "TimescaleTickets",
        LocalizedName = "Timescale Tickets",
        GridLayout = false,
        Products = {1, 2, 3, 4},
        GridSize = not IsMobile and UDim2.fromOffset(340, 153) or nil,
        Visible = Visible,
        IsMobile = IsMobile,
    })
    local v13 = {
        Currency = "SpinTickets",
        LocalizedName = "Spin Tickets",
        GridLayout = false,
        Products = {1, 2, 3, 4},
        GridSize = not IsMobile and UDim2.fromOffset(340, 153) or nil,
        IsMobile = IsMobile,
    }
    v13.Visible = Computed(function() -- Line: 342 -- upvalues: Visible (val), u15 (val)
        return Visible:get() and u15:get()
    end)
    local v14 = CurrencySection(v13)
    v13 = CurrencySection
    v10[1] = v11
    v10[2] = v12
    v10[3] = v14
    v10[4] = v13({
        Currency = "ReviveTickets",
        LocalizedName = "Revive Tickets",
        Products = {1, 2, 3, 4},
        IsMobile = IsMobile,
        Visible = Visible,
    })
    v9[Children] = v10
    v4[1] = v5
    v4[2] = v8
    v4[3] = v6
    v4[4] = Frame_2(v9)
    v2[Children] = v4
    v2[Cleanup] = v1
    return Frame(v2)
end