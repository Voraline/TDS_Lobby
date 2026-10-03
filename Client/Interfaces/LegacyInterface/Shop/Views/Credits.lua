-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Credits
-- Decompile time: 7.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local Shared = ReplicatedStorage.Shared
local Comma = require(Shared.UI.Comma)
local Fusion = require(Shared.UI.Fusion)
local ProductInfo = require(Shared.UI.ProductInfo)
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
ShopButton = require(Components.ShopButton)
PurchaseButton = require(Components.PurchaseButton)
Tabs = require(Components.Tabs)
Title = require(Components.Title)
CurrencyInfo = require(script.Parent.Parent.Purchasables).Currency
Transition = require(SharedComponents.Transition)
StoreController = require(Parent.Controllers.StoreController)
InventoryController = require(Parent.Controllers.InventoryController)
ViewController = require(Parent.Controllers.ViewController)

local function Credits(a1) -- Line: 36
    -- upvalues: Value (val), Computed (val), New (val), Children (val), ForPairs (val), ProductInfo (val), Comma (val)
    -- upvalues: Sound (val)
    local IsMobile = a1.IsMobile
    local HasGems = a1.HasGems
    if not HasGems then
        HasGems = Value(false)
    end
    local GridLayout = a1.GridLayout
    if not GridLayout then
        GridLayout = Value(false)
    end
    local Visible = a1.Visible
    local Currency = a1.Currency
    local u14 = nil
    local u20 = Computed(function() -- Line: 45 -- upvalues: GridLayout (val), IsMobile (val)
        if GridLayout:get() and not IsMobile then
            return UDim2.fromOffset(50, 50)
        end
        return UDim2.fromOffset(40, 40)
    end)
    local v1 = Computed(function() -- Line: 53 -- upvalues: GridLayout (val)
        return GridLayout:get() and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY
    end)
    local Frame = New("Frame")
    local v2 = {
        BackgroundTransparency = 1,
        Size = Computed(function() -- Line: 59 -- upvalues: GridLayout (val)
            return UDim2.fromScale(if not GridLayout:get() then 0 else 1, 0)
        end),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = v1,
        Visible = Visible,
    }
    local v3 = Children
    local Frame_2 = New("Frame")
    local v4 = {BackgroundTransparency = 1, AutomaticSize = v1}
    v4.Size = Computed(function() -- Line: 71 -- upvalues: GridLayout (val)
        return UDim2.fromScale(if not GridLayout:get() then 0 else 1, 0)
    end)
    local v5 = Children
    local v6 = {}
    local UIListLayout = New("UIListLayout")
    local v7 = {Padding = UDim.new(0, if not IsMobile then 40 else 20)}
    v7.HorizontalAlignment = IsMobile and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
    v7.SortOrder = Enum.SortOrder.LayoutOrder
    local v8 = UIListLayout(v7)
    local Frame_3 = New("Frame")
    local v9 = {
        Position = UDim2.new(0, 0, 0, 70),
        BackgroundTransparency = 1,
        Size = Computed(function() -- Line: 86 -- upvalues: GridLayout (val), IsMobile (val)
            if not GridLayout:get() then
                return UDim2.fromOffset(0, 120)
            end
            return UDim2.new(0, if not IsMobile then 780 else 740, 1, 0)
        end),
        AutomaticSize = Computed(function() -- Line: 94 -- upvalues: GridLayout (val), HasGems (val)
            local v1 = GridLayout:get()
            if HasGems and not HasGems:get() and v1 then
                return Enum.AutomaticSize.Y
            end
            if not v1 then
                return Enum.AutomaticSize.XY
            end
            return Enum.AutomaticSize.None
        end),
    }
    local v10 = Children
    v9[v10] = {
        Computed(function() -- Line: 111 -- upvalues: u14 (ref), GridLayout (val), New (upval), a1 (val), u20 (val), IsMobile (val)
            local v1
            if u14 then
                u14:Destroy()
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
                u14 = UIListLayout(v1)
            else
                local UIGridLayout = New("UIGridLayout")
                v1 = {}
                local GridPadding = a1.GridPadding or u20
                v1.CellPadding = GridPadding
                local GridSize = a1.GridSize or UDim2.fromOffset(340, 153)
                v1.CellSize = GridSize
                v1.HorizontalAlignment = Enum.HorizontalAlignment.Center
                v1.SortOrder = Enum.SortOrder.LayoutOrder
                u14 = UIGridLayout(v1)
            end
            return u14
        end),
        (ForPairs(CurrencyInfo[Currency], function(a1, a2) -- Line: 141
            -- upvalues: ProductInfo (upval), Computed (upval), New (upval), IsMobile (val), Children (upval)
            -- upvalues: Comma (upval), Currency (val), Sound (upval)
            local u5 = ProductInfo(a2.ProductId, Enum.InfoType.Product)
            local GiftId = a2.GiftId
            local Robux = a2.Robux
            local u10 = Computed(function() -- Line: 147 -- upvalues: u5 (val), Robux (val)
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
                Title = string.format("$%s", Comma(a2.Currency)),
                Type = string.upper(Currency),
                DisplayImage = string.format("rbxassetid://%d", a2.Image),
                DisplayImageSize = a2.ImageSize,
                DisplayImagePosition = a2.ImagePosition,
                Button = {
                    TextStrokeTransparency = 0.5,
                    Color = Color3.fromRGB(10, 220, 80),
                    Size = UDim2.fromOffset(240, 50),
                    Text = Computed(function() -- Line: 183 -- upvalues: Comma (upval), u10 (val)
                        return " " .. Comma(u10:get())
                    end),
                },
                Clicked = function() -- Line: 188 -- upvalues: Sound (upval), Currency (upval), a2 (val)
                    Sound("Click"):Play()
                    local v1, v2 = StoreController:purchaseCurrency(Currency, a2.Currency)
                    if not v1 then
                        local v3 = v2 or string.format("Unknown error occured while purchasing \"%s %s\"", Currency, a2.Currency)
                        ViewController:notifyError(v3)
                    end
                end,
            }
            local v6 = Children
            v5[v6] = {
                Button({
                    ZIndex = 999,
                    Visible = GiftId ~= nil,
                    Size = UDim2.fromScale(0.12, 0.12),
                    SizeConstraint = Enum.SizeConstraint.RelativeXX,
                    Position = UDim2.fromScale(0.1, 0.18),
                    Color = Color3.fromRGB(10, 220, 80),
                    Icon = Icons.Gift,
                    Clicked = function() -- Line: 222 -- upvalues: GiftId (val)
                        ViewController:setView((("GiftProduct:%*"):format(GiftId)))
                    end,
                }),
            }
            v3[1] = v4(v5)
            v1[v2] = v3
            return a1, Frame(v1)
        end, function(a1, a2) -- Line: 232
            a2:Destroy()
        end)),
    }
    v6[1] = v8
    v6[2] = Frame_3(v9)
    v4[v5] = v6
    v2[v3] = (Frame_2(v4))
    return (Frame(v2))
end

local function Title_2(a1) -- Line: 242
    -- upvalues: Value (val), New (val), Computed (val), Children (val), TextService (val)
    local IsMobile = a1.IsMobile
    local u4 = Value(Vector2.zero)
    local TextLabel = New("TextLabel")
    local v1 = {
        LayoutOrder = if not IsMobile then 2 else 0,
        Font = Enum.Font.SourceSansSemibold,
        Text = "Purchasing credits supports future development of the game and studio. Thank you!",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = not IsMobile,
        TextSize = if not IsMobile then 14 else 24,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = if not IsMobile then 1 else 0.5,
        SizeConstraint = Enum.SizeConstraint.RelativeXY,
        Size = Computed(function() -- Line: 260 -- upvalues: u4 (val), IsMobile (val)
            local v1 = u4:get()
            if IsMobile then
                return UDim2.fromOffset((v1 and v1.X or 0) + 20, 32)
            end
            return UDim2.fromScale(0.8, 0.1)
        end),
    }
    v1[Children] = {
        New("UICorner")({CornerRadius = UDim.new(0, 8)}),
        (New("UIStroke")({Thickness = 2, Transparency = 0.6})),
    }
    local u68 = TextLabel(v1)
    task.defer(function() -- Line: 281 -- upvalues: TextService (upval), u68 (val), u4 (val)
        local v1 = Vector2.new(9000000000, 32)
        u4:set((TextService:GetTextSize(u68.Text, u68.TextSize, u68.Font, v1)))
    end)
    return u68
end

return function(a1) -- Line: 291
    -- upvalues: New (val), OnChange (val), Children (val), Credits (val), Computed (val), Title_2 (val), Cleanup (val)
    ViewController:init()
    StoreController:init()
    local IsMobile = a1.IsMobile
    local Visible = a1.Visible
    local Delayed = a1.Delayed
    local u16 = InventoryController:showGems()
    local Frame = New("Frame")
    local v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 20),
    }
    local v2 = IsMobile and UDim2.fromOffset(0, 0) or UDim2.new(1, 0, 1, -120)
    v1.Size = v2
    v1.AutomaticSize = IsMobile and Enum.AutomaticSize.XY or Enum.AutomaticSize.None
    v1.Visible = Delayed
    v1.LayoutOrder = a1.LayoutOrder
    local AbsoluteSize = OnChange("AbsoluteSize")
    v1[AbsoluteSize] = a1.OnSize
    local v3 = {}
    local v4 = a1[Children]
    local v5 = New("UIPadding")({PaddingBottom = UDim.new(0, 20)})
    local UIListLayout = New("UIListLayout")
    local v6 = {FillDirection = Enum.FillDirection.Vertical}
    v6.HorizontalAlignment = IsMobile and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
    v6.VerticalAlignment = IsMobile and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Center
    v6.SortOrder = Enum.SortOrder.LayoutOrder
    v6.Padding = UDim.new(0, if not IsMobile then 80 else 40)
    local v7 = UIListLayout(v6)
    local Frame_2 = New("Frame")
    local v8 = {
        AutomaticSize = Enum.AutomaticSize.XY,
        Size = UDim2.fromScale(0, 0),
        Position = UDim2.fromScale(0, 0),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
    }
    local v9 = {}
    local UIListLayout_2 = New("UIListLayout")
    local v10 = {
        FillDirection = IsMobile and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
    }
    v10.HorizontalAlignment = IsMobile and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
    v10.SortOrder = Enum.SortOrder.LayoutOrder
    v10.VerticalAlignment = Enum.VerticalAlignment.Top
    local v11 = IsMobile and UDim.new(0, 40) or UDim.new(0, 80)
    v10.Padding = v11
    local v12 = UIListLayout_2(v10)
    v11 = {Currency = "Coins", Products = {1, 2, 3, 4}, HasGems = u16}
    v11.GridSize = not IsMobile and UDim2.fromOffset(340, 153) or nil
    v11.GridLayout = Computed(function() -- Line: 356 -- upvalues: u16 (val)
        return not u16:get()
    end)
    v11.Visible = Visible
    v11.IsMobile = IsMobile
    v10 = Credits(v11)
    v11 = Credits
    local v13 = {
        Currency = "Gems",
        Products = {1, 2, 3, 4},
        IsMobile = IsMobile,
        Visible = Computed(function() -- Line: 368 -- upvalues: Visible (val), u16 (val)
            return Visible:get() and u16:get()
        end),
    }
    v9[1] = v12
    v9[2] = v10
    v9[3] = v11(v13)
    v8[Children] = v9
    v6 = Frame_2(v8)
    v8 = Title_2
    v3[1] = v4
    v3[2] = v5
    v3[3] = v7
    v3[4] = v6
    v3[5] = (v8({LayoutOrder = 0, IsMobile = IsMobile}))
    v1[Children] = v3
    v1[Cleanup] = {}
    return Frame(v1)
end