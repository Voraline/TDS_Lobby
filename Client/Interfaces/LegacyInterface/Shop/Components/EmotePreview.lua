-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.EmotePreview
-- Decompile time: 3.21 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Value = Fusion.Value
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local Spring = Fusion.Spring
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent
local New = Fusion.New
local Emote = Elements.Emote
ItemPreview = require(script.Parent.Parent.Parent.Components.ItemPreview)
Button = require(script.Parent.Parent.Parent.Components.Button)

local function addUDim2(a1, a2) -- Line: 16
    return UDim2.new(a1.X.Scale + a2.X.Scale, a1.X.Offset + a2.X.Offset, a1.Y.Scale + a2.Y.Scale, a1.Y.Offset + a2.Y.Offset)
end

return function(a1) -- Line: 25
    -- upvalues: Emote (val), Value (val), Computed (val), Hydrate (val), OnEvent (val), Children (val), New (val)
    -- upvalues: Spring (val)
    local v1 = Emote:Clone()
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local v2 = Computed(function() -- Line: 29 -- upvalues: Visible (val)
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
    local Clicking = a1.Clicking
    if not Clicking then
        Clicking = Value(false)
    end
    local Hovering = a1.Hovering
    if not Hovering then
        Hovering = Value(false)
    end
    local v3 = Hydrate(v1)
    local v4 = {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        Color = a1.Color,
    }
    local MouseEnter = OnEvent("MouseEnter")

    v4[MouseEnter] = function() -- Line: 43 -- upvalues: Hovering (val)
        Hovering:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v4[MouseLeave] = function() -- Line: 47 -- upvalues: Hovering (val)
        Hovering:set(false)
    end

    local MouseButton1Down = OnEvent("MouseButton1Down")

    v4[MouseButton1Down] = function() -- Line: 51 -- upvalues: Clicking (val)
        Clicking:set(true)
    end

    local MouseButton1Up = OnEvent("MouseButton1Up")

    v4[MouseButton1Up] = function() -- Line: 55 -- upvalues: Clicking (val), a1 (val)
        Clicking:set(false)
        if a1.Clicked then
            a1.Clicked()
        end
    end

    local v5 = {}
    local v6 = Hydrate(v1.Title)({Text = a1.Name, Visible = a1.Name ~= nil})
    local v7 = Hydrate(v1.Credit)
    local v8 = {Visible = a1.Creator ~= nil}
    v8[Children] = {Hydrate(v1.Credit.Value)({Text = a1.Creator})}
    v7 = v7(v8)
    v8 = Hydrate(v1.Glow)({Visible = a1.Glow})
    local Frame = New("Frame")
    local v9 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ClipsDescendants = true}
    v9[Children] = {
        ItemPreview({
            Size = UDim2.fromScale(3, 1.2),
            Position = Spring(v2, 10, 0.6),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Visible = a1.Visible,
            Preview = Value({Type = "Emotes", Item = a1.Name}),
        }),
    }
    local v10 = Frame(v9)
    v5[1] = v6
    v5[2] = v7
    v5[3] = v8
    v5[4] = v10
    v5[5] = a1[Children]
    v4[Children] = v5
    return v3(v4)
end