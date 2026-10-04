-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.DailyEmotes
-- Decompile time: 12.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Fusion = require(Shared.UI.Fusion)
local Scale = require(Shared.UI.Components.Scale)
local New = Fusion.New
local Value = Fusion.Value
local Children = Fusion.Children
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed
local Spring = Fusion.Spring
local Parent = script.Parent.Parent.Parent
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
Controllers = Parent.Controllers
SharedComponents = Parent.Components
Components = script.Parent
Icons = require(Parent.Icons)
Comma = require(Shared.UI.Comma)
Button = require(SharedComponents.Button)
EmotePreview = require(Components.EmotePreview)
Title = require(Components.Title)
Transition = require(SharedComponents.Transition)
ItemController = require(Controllers.ItemController)
InventoryController = require(Controllers.InventoryController)

local function getEmotePreview(a1, a2) -- Line: 32
    local info = a2.info or {}
    local Preview = info.Preview or {}
    return {
        Name = a1,
        Offset = Preview.Offset,
        Rotation = Preview.Rotation,
        Zoom = Preview.Zoom,
    }
end

return function(a1) -- Line: 44
    -- upvalues: Value (val), New (val), Children (val), Computed (val), ForValues (val), Sound (val)
    -- upvalues: getEmotePreview (val), Scale (val), Spring (val)
    ItemController:init()
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local Expires = a1.Expires
    if not Expires then
        Expires = Value("")
    end
    local Frame = New("Frame")
    local v1 = {AutomaticSize = Enum.AutomaticSize.X}
    local Size = a1.Size or UDim2.fromScale(0.5, 1)
    v1.Size = Size
    local Position = a1.Position or UDim2.fromScale(0, 0)
    v1.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0)
    v1.AnchorPoint = AnchorPoint
    v1.BackgroundTransparency = 1
    local v2 = Children
    local v3 = {}
    local v4 = New("UIListLayout")({
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 10),
    })
    local Frame_2 = New("Frame")
    local v5 = {
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
        BackgroundTransparency = 1,
    }
    local v6 = Children
    v5[v6] = {
        Title({
            Text = "Daily Emotes",
            Icons = "rbxassetid://9674141172",
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0),
        }),
        Title({
            Text = Computed(function() -- Line: 80 -- upvalues: Expires (val)
                return "Restock in " .. Expires:get()
            end),
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.fromOffset(275, 40),
        }),
        a1[Children],
    }
    local v7 = Frame_2(v5)
    local Frame_3 = New("Frame")
    v6 = {
        AutomaticSize = Enum.AutomaticSize.X,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(0, 0, 0, 390),
        BackgroundTransparency = 1,
    }
    local v8 = Children
    v6[v8] = {
        New("UIListLayout")({
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 20),
        }),
        (ForValues(a1.Emotes or {}, function(a1_2) -- Line: 107
            -- upvalues: Value (upval), Computed (upval), Sound (upval), a1 (val), New (upval), Children (upval)
            -- upvalues: getEmotePreview (upval), Visible (val), Scale (upval), Spring (upval)
            local u5 = ItemController:emote(a1_2)
            local u10 = InventoryController:ownsComputed(u5)
            local Price = u5.info.Price
            local u17 = ItemController:getPurchaseType(u5)
            local u20 = Value(false)
            local u23 = Value(false)
            local u26 = Value(false)
            local u29 = Value(false)
            local u32 = Computed(function() -- Line: 120 -- upvalues: u23 (val), u29 (val)
                return u23:get() or u29:get()
            end)
            local u35 = Computed(function() -- Line: 124 -- upvalues: u20 (val), u26 (val)
                return u20:get() or u26:get()
            end)

            local function v1() -- Line: 128 -- upvalues: Sound (upval), u10 (val), a1 (upval), u5 (val)
                Sound("Click"):Play()
                if not u10:get() and a1.OnPurchase then
                    a1.OnPurchase(u5)
                end
            end

            local Frame = New("Frame")
            local v2 = {Size = UDim2.new(0, 240, 1, 0), BackgroundTransparency = 1}
            local v3 = Children
            local v4 = EmotePreview
            local v5 = {
                Name = a1_2,
                Creator = u5.info.Creator,
                Preview = getEmotePreview(a1_2, u5),
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Visible = Visible,
                Clicked = v1,
                Clicking = u29,
                Hovering = u26,
                Glow = u35,
            }
            local v6 = Children
            v5[v6] = {
                Scale({
                    Scale = Spring(Computed(function() -- Line: 158 -- upvalues: u32 (val), u35 (val)
                        if u32:get() then
                            return 0.95
                        end
                        if u35:get() then
                            return 1.05
                        end
                        return 1
                    end), 50, 0.8),
                }),
                (Button({
                    Animate = false,
                    ClickSound = "",
                    Size = UDim2.fromScale(0.8, 0.12),
                    Position = UDim2.fromScale(0.5, 1.02),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Color = Computed(function() -- Line: 179 -- upvalues: u10 (val)
                        if not u10:get() then
                            return Color3.fromRGB(10, 220, 80)
                        end
                        return Color3.fromRGB(150, 150, 150)
                    end),
                    Icon = Computed(function() -- Line: 187 -- upvalues: u10 (val), u17 (val)
                        if u10:get() then
                            return ""
                        end
                        return Icons[u17] or ""
                    end),
                    Text = Computed(function() -- Line: 195 -- upvalues: u10 (val), Price (val)
                        if u10:get() then
                            return "Owned"
                        end
                        return string.format("%s", Comma(Price.Value))
                    end),
                    Clicked = v1,
                    Clicking = u23,
                    Hovering = u20,
                })),
            }
            v2[v3] = (v4(v5))
            return Frame(v2)
        end, function(a1) -- Line: 210
            a1:Destroy()
        end)),
    }
    v3[1] = v4
    v3[2] = v7
    v3[3] = Frame_3(v6)
    v1[v2] = v3
    return Frame(v1)
end