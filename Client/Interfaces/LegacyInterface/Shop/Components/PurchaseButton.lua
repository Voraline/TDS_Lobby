-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.PurchaseButton
-- Decompile time: 8.42 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local Value = Fusion.Value
local Computed = Fusion.Computed
local Cleanup = Fusion.Cleanup
local Spring = Fusion.Spring
local PurchaseButton = Elements.PurchaseButton
local Parent = script.Parent.Parent.Parent
SharedComponents = script.Parent.Parent.Parent.Components
Button = require(SharedComponents.Button)
return function(a1) -- Line: 18
    -- upvalues: PurchaseButton (val), Value (val), Computed (val), New (val), Cleanup (val), Children (val)
    -- upvalues: Spring (val), Hydrate (val), OnEvent (val)
    local v1 = PurchaseButton:Clone()
    local Thumbnail = v1.Thumbnail
    local u8 = Value(false)
    local u11 = Value(false)
    local u14 = Value(false)
    local u17 = Value(false)
    local u20 = Computed(function() -- Line: 28 -- upvalues: u8 (val), u14 (val)
        return u8:get() or u14:get()
    end)
    local u23 = Computed(function() -- Line: 32 -- upvalues: u11 (val), u17 (val)
        return u11:get() or u17:get()
    end)
    local Frame = New("Frame")
    local v2 = {}
    local Size = a1.Size or UDim2.fromOffset(260, 153)
    v2.Size = Size
    v2.Position = a1.Position
    v2.AnchorPoint = a1.AnchorPoint
    v2.BackgroundTransparency = 1
    v2.Visible = a1.Visible
    v2[Cleanup] = {a1[Cleanup]}
    local v3 = {}
    local Frame_2 = New("Frame")
    local v4 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.4,
    }
    local v5 = {}
    local v6 = New("UICorner")({})
    local v7 = New("UIScale")({
        Scale = Spring(Computed(function() -- Line: 56 -- upvalues: u23 (val), u20 (val)
            if u23:get() then
                return 0.95
            end
            if u20:get() then
                return 1.1
            end
            return 1
        end), 50, 0.8),
    })
    local v8 = Hydrate(v1)
    local v9 = {Image = a1.Background or "rbxassetid://8473994059"}
    local BackgroundColor = a1.BackgroundColor or Color3.fromRGB(121, 121, 121)
    v9.ImageColor3 = BackgroundColor
    v9.Size = UDim2.fromScale(1, 1)
    v9.BackgroundTransparency = 1
    local Activated = OnEvent("Activated")
    v9[Activated] = a1.Clicked
    local MouseEnter = OnEvent("MouseEnter")

    v9[MouseEnter] = function() -- Line: 77 -- upvalues: u8 (val)
        u8:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v9[MouseLeave] = function() -- Line: 80 -- upvalues: u8 (val)
        u8:set(false)
    end

    local MouseButton1Down = OnEvent("MouseButton1Down")

    v9[MouseButton1Down] = function() -- Line: 83 -- upvalues: u11 (val)
        u11:set(true)
    end

    local MouseButton1Up = OnEvent("MouseButton1Up")

    v9[MouseButton1Up] = function() -- Line: 86 -- upvalues: u11 (val)
        u11:set(false)
    end

    local v10 = {}
    local v11 = Hydrate(Thumbnail)
    local v12 = {}
    v12[Children] = {
        Hydrate(Thumbnail.Icon)({
            Image = a1.DisplayImage,
            Size = a1.DisplayImageSize,
            Position = a1.DisplayImagePosition,
            AnchorPoint = a1.DisplayImageAnchorPoint,
        }),
    }
    v11 = v11(v12)
    v12 = Hydrate(v1.PassType)({Text = a1.Type})
    local v13 = Hydrate(v1.Title)({Text = a1.Title})
    local v14 = Hydrate(v1.Glow)({Visible = u20})
    local v15 = Hydrate(v1.DropShadow)
    local v16 = {
        Visible = Computed(function() -- Line: 115 -- upvalues: u20 (val)
            return not u20:get()
        end),
    }
    v15 = v15(v16)
    local Button_2 = a1.Button
    if Button_2 then
        v16 = Button
        local v17 = {}
        local Size_2 = a1.Button.Size or UDim2.fromOffset(240, 50)
        v17.Size = Size_2
        v17.Position = UDim2.new(0.5, 0, 1, 0)
        v17.AnchorPoint = Vector2.new(0.5, 0.5)
        v17.IgnoreHover = true
        v17.NoScale = true
        v17.Icon = a1.Button.Icon
        v17.Text = a1.Button.Text
        v17.TextColor = a1.Button.TextColor
        v17.TextStrokeColor = a1.Button.TextStrokeColor
        v17.RichText = a1.Button.RichText
        v17.TextStrokeTransparency = a1.Button.TextStrokeTransparency
        v17.Color = a1.Button.Color
        v17.Clicking = u17
        v17.Hovering = u14
        v17.ClickSound = ""
        v17.Clicked = a1.Clicked
        v17[Children] = a1.Button[Children]
        Button_2 = v16(v17)
    end
    v10[1] = v11
    v10[2] = v12
    v10[3] = v13
    v10[4] = v14
    v10[5] = v15
    v10[6] = Button_2
    v10[7] = a1[Children]
    v9[Children] = v10
    v5[1] = v6
    v5[2] = v7
    v5[3] = v8(v9)
    v4[Children] = v5
    v3[1] = Frame_2(v4)
    v2[Children] = v3
    return Frame(v2)
end