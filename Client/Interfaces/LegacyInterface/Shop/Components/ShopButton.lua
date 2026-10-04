-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.ShopButton
-- Decompile time: 4.60 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local Computed = Fusion.Computed
local OnEvent = Fusion.OnEvent
local Value = Fusion.Value
local Tween = Fusion.Tween
local Computed_2 = Fusion.Computed
local BigShopButton = Elements.BigShopButton
local SmallShopButton = Elements.SmallShopButton
return function(a1) -- Line: 14
    -- upvalues: SmallShopButton (val), BigShopButton (val), Value (val), Computed_2 (val), Hydrate (val), OnEvent (val)
    -- upvalues: Children (val), Tween (val)
    local v1 = (not (a1.Type ~= "Small") and SmallShopButton or BigShopButton):Clone()
    local Thumbnail = v1.Thumbnail
    local u11 = Value(false)
    local u16 = Computed_2(function() -- Line: 20 -- upvalues: a1 (val)
        local v1 = a1.Extra and a1.Extra:get() or 0
        if v1 > 0 then
            return string.format("%d%% EXTRA!", v1)
        end
        return ""
    end)
    local v2 = Hydrate(v1)
    local v3 = {}
    local MouseEnter = OnEvent("MouseEnter")

    v3[MouseEnter] = function() -- Line: 30 -- upvalues: u11 (val)
        u11:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v3[MouseLeave] = function() -- Line: 34 -- upvalues: u11 (val)
        u11:set(false)
    end

    local v4 = Children
    local v5 = {}
    local v6 = Hydrate(v1.Price)
    local v7 = {}
    v7[Children] = {Hydrate(v1.Price.Value)({Text = a1.Robux})}
    v6 = v6(v7)
    v7 = Hydrate(Thumbnail)
    local v8 = {}
    v8[Children] = {
        Hydrate(Thumbnail.Icon)({
            Image = a1.CurrencyImage,
            Size = a1.CurrencyImageSize,
            Position = a1.CurrencyImagePosition,
        }),
        Hydrate(Thumbnail.Extra)({
            Text = u16,
            Visible = Computed_2(function() -- Line: 57 -- upvalues: u16 (val)
                return u16:get() ~= ""
            end),
        }),
        Hydrate(Thumbnail.PassType)({Text = a1.PassType}),
        Hydrate(Thumbnail.Title)({Text = a1.Title}),
        Hydrate(Thumbnail.Background)({
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = Tween(Computed_2(function() -- Line: 75 -- upvalues: u11 (val)
                if u11:get() then
                    return (UDim2.fromScale(1, 1))
                end
                return (UDim2.fromScale(1.2, 1.2))
            end), TweenInfo.new(0.3, Enum.EasingStyle.Linear)),
        }),
        (Hydrate(Thumbnail.Shine)({
            Position = Tween(Computed_2(function() -- Line: 86 -- upvalues: u11 (val)
                if u11:get() then
                    return (UDim2.fromScale(1.5, 0))
                end
                return (UDim2.fromScale(0, 0))
            end), TweenInfo.new(0.2, Enum.EasingStyle.Linear)),
        })),
    }
    v5[1] = v6
    v5[2] = v7(v8)
    v3[v4] = v5
    return v2(v3)
end