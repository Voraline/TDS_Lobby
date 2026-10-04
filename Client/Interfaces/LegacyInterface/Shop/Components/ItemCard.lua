-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.ItemCard
-- Decompile time: 7.67 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Value = Fusion.Value
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent
local Spring = Fusion.Spring
local New = Fusion.New
local TowerSkin = Elements.TowerSkin
ItemPreview = require(script.Parent.Parent.Parent.Components.ItemPreview)
Controllers = script.Parent.Parent.Parent.Controllers
ItemController = require(Controllers.ItemController)

local function addUDim2(a1, a2) -- Line: 18
    return UDim2.new(a1.X.Scale + a2.X.Scale, a1.X.Offset + a2.X.Offset, a1.Y.Scale + a2.Y.Scale, a1.Y.Offset + a2.Y.Offset)
end

return function(a1) -- Line: 27
    -- upvalues: TowerSkin (val), Value (val), Computed (val), Hydrate (val), OnEvent (val), Children (val), New (val)
    -- upvalues: Spring (val)
    local v1 = TowerSkin:Clone()
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local v2 = Computed(function() -- Line: 31 -- upvalues: Visible (val)
        local v1, v2
        local v3 = UDim2.fromScale(0.5, 0.55)
        if not Visible:get() then
            v2 = UDim2.fromOffset(40, 0)
            v1 = UDim2.new(v3.X.Scale + v2.X.Scale, v3.X.Offset + v2.X.Offset, v3.Y.Scale + v2.Y.Scale, v3.Y.Offset + v2.Y.Offset)
        else
            v1 = v3
            if not v1 then
                v2 = UDim2.fromOffset(40, 0)
                v1 = UDim2.new(v3.X.Scale + v2.X.Scale, v3.X.Offset + v2.X.Offset, v3.Y.Scale + v2.Y.Scale, v3.Y.Offset + v2.Y.Offset)
            end
        end
        return v1
    end)
    local v3 = Hydrate(v1)
    local v4 = {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        ImageColor3 = a1.RarityColor,
        Color = a1.Color,
    }
    local MouseEnter = OnEvent("MouseEnter")
    v4[MouseEnter] = a1.MouseEnter
    local MouseLeave = OnEvent("MouseLeave")
    v4[MouseLeave] = a1.MouseLeave
    local Activated = OnEvent("Activated")
    v4[Activated] = a1.Clicked
    local MouseButton1Down = OnEvent("MouseButton1Down")
    v4[MouseButton1Down] = a1.MouseDown
    local MouseButton1Up = OnEvent("MouseButton1Up")

    v4[MouseButton1Up] = function() -- Line: 48 -- upvalues: a1 (val)
        if a1.MouseUp then
            a1.MouseUp()
        end
        if a1.Clicked then
            a1.Clicked()
        end
    end

    local v5 = {}
    local v6 = Hydrate(v1.TowerName)({
        ZIndex = 10,
        Visible = a1.Name ~= nil,
        Text = Computed(function() -- Line: 62 -- upvalues: a1 (val)
            local Name_2 = ""
            if a1.Name ~= nil then
                if typeof(a1.Name) == "string" then
                    Name_2 = a1.Name
                elseif a1.Name:get() ~= nil then
                    Name_2 = a1.Name:get()
                end
            end
            return string.upper(Name_2)
        end),
    })
    local v7 = Hydrate(v1.SkinName)({ZIndex = 10, Text = a1.Skin or "", Visible = a1.Skin ~= nil})
    local v8 = Hydrate(v1.Rarity)
    local v9 = {Visible = a1.Rarity ~= nil, ZIndex = 10}
    v9[Children] = {
        Hydrate(v1.Rarity.Value)({Text = a1.Rarity, TextColor3 = a1.TextColor}),
    }
    v8 = v8(v9)
    v9 = Hydrate(v1.Glow)({Visible = a1.Glow or false})
    local Frame = New("Frame")
    local v10 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ClipsDescendants = true}
    local v11 = {}
    local v12 = ItemPreview
    local v13 = {Visible = a1.Visible, Preview = a1.Preview, CameraOffset = a1.CameraOffset}
    local PreviewSize = a1.PreviewSize or UDim2.fromScale(3, 1.2)
    v13.Size = PreviewSize
    v13.Position = Spring(v2, 10, 0.6)
    v13.AnchorPoint = Vector2.new(0.5, 0.5)
    v11[1] = v12(v13)
    v10[Children] = v11
    local v14 = Frame(v10)
    v5[1] = v6
    v5[2] = v7
    v5[3] = v8
    v5[4] = v9
    v5[5] = v14
    v5[6] = a1[Children]
    v4[Children] = v5
    return v3(v4)
end