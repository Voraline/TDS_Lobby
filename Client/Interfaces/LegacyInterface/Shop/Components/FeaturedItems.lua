-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.FeaturedItems
-- Decompile time: 7.88 ms

local Shared = game:GetService("ReplicatedStorage").Shared
local Elements = require(script.Parent.Elements)
local Fusion = require(Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local New = Fusion.New
local Value = Fusion.Value
local Children = Fusion.Children
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed
local OnChange = Fusion.OnChange
local FeaturedItems = Elements.FeaturedItems
local Parent = script.Parent.Parent.Parent
SharedComponents = Parent.Components
StoreController = require(Parent.Controllers.StoreController)
ItemController = require(Parent.Controllers.ItemController)
Components = script.Parent
FeaturedItem = require(Components.FeaturedItem)
Timer = require(Components.Timer)
Comma = require(Shared.UI.Comma)

local function resolveItem(a1) -- Line: 26
    local Type = a1.Type
    local Value = a1.Value
    local tower = nil
    if Type == "Tower" then
        tower = ItemController.tower
    elseif Type == "Crate" then
        tower = ItemController.crate
    end
    if not tower then
        return
    end
    local v1 = tower(ItemController, Value)
    if not v1 then
        return
    end
    local v2 = {}
    if Type == "Tower" or Type == "Crate" then
        v2.Icon = v1.info.Preview.Icon
        v2.Rarity = "Basic"
    end
    return {v2, v1}
end

return function(a1) -- Line: 55
    -- upvalues: FeaturedItems (val), Value (val), New (val), Computed (val), Children (val), Hydrate (val)
    -- upvalues: OnChange (val), ForValues (val), resolveItem (val)
    local Size
    local u2 = {}
    u2.Basic = Color3.fromRGB(255, 255, 255)
    u2.Rare = Color3.fromRGB(0, 255, 0)
    u2.Legendary = Color3.fromRGB(255, 0, 0)
    local v1 = FeaturedItems:Clone()
    if not a1.IsSmall then
        Size = v1.Size
    else
        Size = UDim2.fromOffset(290, 0)
        if not Size then
            Size = v1.Size
        end
    end
    local u31 = Value(0)
    local IsSmall = a1.IsSmall

    local function v2(a1) -- Line: 73 -- upvalues: IsSmall (val)
        if IsSmall then
            return {a1[1], a1[2], a1[3], a1[4]}
        end
        return a1
    end

    ItemController:init()
    local Frame = New("Frame")
    local v3 = {}
    local Position = a1.Position or v1.Position
    v3.Position = Position
    local AnchorPoint = a1.AnchorPoint or v1.AnchorPoint
    v3.AnchorPoint = AnchorPoint
    v3.BackgroundTransparency = 1
    local v4 = if not IsSmall then Computed(function() -- Line: 95 -- upvalues: u31 (val), Size (val)
        return UDim2.fromOffset(Size.X.Offset, (u31:get()))
    end) else UDim2.fromOffset(290, 0)
    v3.Size = v4
    v4 = Children
    local v5 = Hydrate(v1)
    local v6 = {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0),
    }
    local AbsoluteSize = OnChange("AbsoluteSize")

    v6[AbsoluteSize] = function(a1) -- Line: 105 -- upvalues: u31 (val)
        u31:set(a1.Y)
    end

    local v7 = Children
    local v8 = {}
    local v9 = Hydrate(v1.Holder)
    local v10 = {}
    v10[Children] = {
        ForValues(Computed(function() -- Line: 113 -- upvalues: a1 (val), IsSmall (val)
            local v1 = a1.Items:get()
            if IsSmall then
                return {v1[1], v1[2], v1[3], v1[4]}
            end
            return v1
        end), function(a1_2) -- Line: 116 -- upvalues: resolveItem (upval), u2 (val), a1 (val)
            local v1
            local v2 = resolveItem(a1_2)
            v1, v2 = unpack(v2)
            if not v1 then
                return nil
            end
            return FeaturedItem({
                Rarity = v1.Rarity,
                RarityColor = u2[v1.Rarity],
                Item = v2,
                Icon = "rbxassetid://" .. v1.Icon,
                IconSize = UDim2.fromScale(0.8, 0.8),
                Clicked = function() -- Line: 128 -- upvalues: a1 (upval), a1_2 (val)
                    if a1.OpenItem then
                        a1.OpenItem(a1_2)
                    end
                end,
            })
        end, function(a1) -- Line: 135
            a1:Destroy()
        end),
    }
    v8[1] = v9(v10)
    v6[v7] = v8
    v3[v4] = (v5(v6))
    return Frame(v3)
end