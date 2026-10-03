-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.DailyItem
-- Decompile time: 4.86 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Scale = require(game.ReplicatedStorage.Shared.UI.Components.Scale)
local Hydrate = Fusion.Hydrate
local OnEvent = Fusion.OnEvent
local Children = Fusion.Children
local Value = Fusion.Value
local Computed = Fusion.Computed
local Spring = Fusion.Spring
local New = Fusion.New
local DailyCrate = Elements.DailyCrate
local Parent = script.Parent.Parent.Parent
Icons = require(Parent.Icons)
Button = require(Parent.Components.Button)
ItemPreview = require(Parent.Components.ItemPreview)
ItemController = require(Parent.Controllers.ItemController)
return function(a1) -- Line: 20
    -- upvalues: DailyCrate (val), Value (val), Computed (val), New (val), Children (val), Scale (val), Spring (val)
    -- upvalues: Hydrate (val), OnEvent (val)
    local v1
    local v2 = DailyCrate:Clone()
    local Name = a1.Name
    local u8 = Value(false)
    local u11 = Value(false)
    local u14 = Value(false)
    local u17 = Value(false)

    local function createPurchaseButton(a1_2, a2) -- Line: 31
        -- upvalues: a1 (val), Computed (upval), u8 (val), u11 (val)
        local u5 = a1_2 or a1
        local v1 = Button
        local v2 = {Animate = false}
        local Size = u5.Size or UDim2.fromScale(0.8, 0.225)
        v2.Size = Size
        local Position = u5.Position or UDim2.fromScale(0.5, 0.971)
        v2.Position = Position
        local AnchorPoint = u5.AnchorPoint or Vector2.new(0.5, 1)
        v2.AnchorPoint = AnchorPoint
        v2.LayoutOrder = a2
        v2.Color = u5.PurchaseColor
        v2.Text = Computed(function() -- Line: 41 -- upvalues: u5 (ref)
            local v1 = ""
            local Currency = u5.Currency and u5.Currency:get()
            if Currency == "Robux" then
                v1 = utf8.char(57346)
            end
            local Amount = u5.Amount
            local v2 = if typeof(Amount) ~= "table" then Amount else Amount:get()
            if v1 ~= "" then
                return v1 .. " " .. tostring(v2)
            end
            return v2
        end)
        v2.Clicked = u5.Clicked
        v2.Icon = Computed(function() -- Line: 60 -- upvalues: u5 (ref)
            local Currency = u5.Currency and u5.Currency:get()
            if Currency and Currency ~= "Robux" then
                return Icons[Currency or "Coins"]
            end
            return ""
        end)
        v2.Clicking = u8
        v2.Hovering = u11
        v1 = v1(v2)
        return v1
    end

    local v3 = {}
    if not a1.PriceButtons then
        v3.default = createPurchaseButton(nil, 1)
    else
        local v4
        for i, j in a1.PriceButtons do
            v4 = ("price_%*"):format(i)
            v3[v4] = (createPurchaseButton(j, i))
        end
    end
    local v5 = table.clone(v3)
    v5.layout = New("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.035, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    local u69 = Computed(function() -- Line: 94 -- upvalues: u11 (val), u17 (val)
        return u11:get() or u17:get()
    end)
    local u76 = Computed(function() -- Line: 98 -- upvalues: u8 (val), u14 (val)
        return u8:get() or u14:get()
    end)
    ItemController:init()
    local Frame = New("Frame")
    local v6 = {}
    local Size = a1.Size or v2.Size
    v6.Size = Size
    local Position = a1.Position or v2.Position
    v6.Position = Position
    local AnchorPoint = a1.AnchorPoint or v2.AnchorPoint
    v6.AnchorPoint = AnchorPoint
    v6.BackgroundTransparency = 1
    local v7 = {}
    local v8 = Scale({
        Scale = Spring(Computed(function() -- Line: 113 -- upvalues: u76 (val), u69 (val)
            if u76:get() then
                return 0.95
            end
            if u69:get() then
                return 1.05
            end
            return 1
        end), 50, 0.8),
    })
    local v9 = Hydrate(v2)
    local v10 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local Activated = OnEvent("Activated")
    v10[Activated] = a1.Clicked
    local MouseEnter = OnEvent("MouseEnter")

    v10[MouseEnter] = function() -- Line: 133 -- upvalues: u17 (val)
        u17:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v10[MouseLeave] = function() -- Line: 137 -- upvalues: u17 (val)
        u17:set(false)
    end

    local MouseButton1Down = OnEvent("MouseButton1Down")

    v10[MouseButton1Down] = function() -- Line: 141 -- upvalues: u14 (val)
        u14:set(true)
    end

    local MouseButton1Up = OnEvent("MouseButton1Up")

    v10[MouseButton1Up] = function() -- Line: 145 -- upvalues: u14 (val), a1 (val)
        u14:set(false)
        if a1.Clicked then
            a1.Clicked()
        end
    end

    local v11 = {}
    local v12 = Hydrate(v2.Background)({ImageColor3 = a1.RarityColor})
    local v13 = Hydrate(v2.Icon)
    local v14 = {
        BackgroundTransparency = 1,
        ImageTransparency = if not a1.Icon then 1 else 0,
        Image = a1.Icon,
    }
    v13 = v13(v14)
    if a1.Icon then
        v14 = nil
    else
        v14 = ItemPreview
        v1 = {
            Flat = true,
            PauseAnimation = true,
            IgnoreAnimation = true,
            IgnoreShadow = true,
            HidePreviewText = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        local PreviewSize = a1.PreviewSize or UDim2.fromScale(4, 4)
        v1.Size = PreviewSize
        local CameraOffset = a1.CameraOffset or Value(CFrame.new(0, 3.6, 40))
        v1.CameraOffset = CameraOffset
        v1.Visible = Value(true)
        v1.IsPreview = Value(false)
        v1.Preview = a1.Preview
        v14 = v14(v1)
    end
    v1 = Hydrate(v2.TextLabel)({Text = a1.Name})
    local default = if not a1.PriceButtons then v3.default else New("Frame")({
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0.971),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(0.86, 0.225),
        [Children] = v5,
    })
    v11[1] = v12
    v11[2] = v13
    v11[3] = v14
    v11[4] = v1
    v11[5] = default
    v10[Children] = v11
    v7[1] = v8
    v7[2] = v9(v10)
    v6[Children] = v7
    return Frame(v6)
end