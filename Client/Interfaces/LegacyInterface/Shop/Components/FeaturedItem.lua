-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.FeaturedItem
-- Decompile time: 7.83 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local OnEvent = Fusion.OnEvent
local Children = Fusion.Children
local Computed = Fusion.Computed
local Cleanup = Fusion.Cleanup
local Value = Fusion.Value
local Spring = Fusion.Spring
local FeaturedItem = Elements.FeaturedItem
local Parent = script.Parent.Parent.Parent
Icons = require(Parent.Icons)
Button = require(Parent.Components.Button)
ItemPreview = require(Parent.Components.ItemPreview)
return function(a1) -- Line: 19
    -- upvalues: FeaturedItem (val), Value (val), Hydrate (val), Cleanup (val), OnEvent (val), Children (val), New (val)
    -- upvalues: Spring (val), Computed (val)
    local ImageLabel, v1, v2
    local v3 = FeaturedItem:Clone()
    local Item = a1.Item
    local u8 = Value(false)
    local u11 = Value(false)
    local u12 = nil
    local v4 = Hydrate(v3)
    local v5 = {}

    v5[Cleanup] = function() -- Line: 30 -- upvalues: u12 (ref)
        if u12 then
            u12:Destroy()
            u12 = nil
        end
    end

    local Activated = OnEvent("Activated")
    v5[Activated] = a1.Clicked
    local MouseEnter = OnEvent("MouseEnter")

    v5[MouseEnter] = function() -- Line: 38 -- upvalues: u8 (val)
        u8:set(true)
    end

    local MouseLeave = OnEvent("MouseLeave")

    v5[MouseLeave] = function() -- Line: 41 -- upvalues: u8 (val)
        u8:set(false)
    end

    local MouseButton1Down = OnEvent("MouseButton1Down")

    v5[MouseButton1Down] = function() -- Line: 44 -- upvalues: u11 (val)
        u11:set(true)
    end

    local MouseButton1Up = OnEvent("MouseButton1Up")

    v5[MouseButton1Up] = function() -- Line: 47 -- upvalues: u11 (val)
        u11:set(false)
    end

    local v6 = {}
    local v7 = New("UIScale")({
        Scale = Spring(Computed(function() -- Line: 54 -- upvalues: u11 (val), u8 (val)
            if u11:get() then
                return 0.95
            end
            if u8:get() then
                return 1.1
            end
            return 1
        end), 50, 0.8),
    })
    local v8 = Hydrate(v3.Background)({ImageColor3 = a1.RarityColor})
    local v9 = Hydrate(v3.Icon)
    local v10 = {Visible = false, Image = a1.Icon, Size = a1.IconSize}
    v9 = v9(v10)
    if Item.type == "tower" or Item.type == "skin" then
        ImageLabel = New("ImageLabel")
        v1 = {BackgroundTransparency = 1}
        v2 = not (Item.type ~= "crate") and UDim2.fromScale(0.9, 0.9) or UDim2.fromScale(1.1, 1.1)
        v1.Size = v2
        v1.Position = UDim2.fromScale(0.5, 0.5)
        v1.AnchorPoint = Vector2.new(0.5, 0.5)
        v1.Image = Computed(function() -- Line: 88 -- upvalues: Item (val)
            local Icon = if not Item.tower then Item.info.Preview.Icon else Item.info.Icon
            return not (type(Icon) ~= "number") and ("rbxassetid://%*"):format(Icon) or Icon or ""
        end)
        v10 = ImageLabel(v1)
    elseif Item.type ~= "crate" then
        v10 = ItemPreview({
            ZIndex = 5,
            Flat = true,
            PauseAnimation = true,
            IgnoreAnimation = true,
            IgnoreShadow = true,
            HidePreviewText = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(4, 4),
            Position = UDim2.fromScale(0.5, 0.5),
            CameraOffset = Value(CFrame.new(0, 3.6, 40)),
            IsPreview = Value(false),
            Visible = Computed(function() -- Line: 116 -- upvalues: Item (val)
                return Item ~= nil
            end),
            Preview = Computed(function() -- Line: 120 -- upvalues: Item (val)
                local info = Item.tower and Item.tower.info or Item.info
                local v1 = {emote = "Emotes", crate = "Crates", tag = "Tags"}
                local v2 = {Type = v1[Item.type]}
                local name = Item.tower and Item.tower.name or Item.name
                v2.Item = name
                v2.Skin = Item.tower and Item.name or "Default"
                v2.Preview = info.Preview
                return v2
            end),
        })
    else
        ImageLabel = New("ImageLabel")
        v1 = {BackgroundTransparency = 1}
        v2 = not (Item.type ~= "crate") and UDim2.fromScale(0.9, 0.9) or UDim2.fromScale(1.1, 1.1)
        v1.Size = v2
        v1.Position = UDim2.fromScale(0.5, 0.5)
        v1.AnchorPoint = Vector2.new(0.5, 0.5)
        v1.Image = Computed(function() -- Line: 88 -- upvalues: Item (val)
            local Icon = if not Item.tower then Item.info.Preview.Icon else Item.info.Icon
            return not (type(Icon) ~= "number") and ("rbxassetid://%*"):format(Icon) or Icon or ""
        end)
        v10 = ImageLabel(v1)
    end
    v6[1] = v7
    v6[2] = v8
    v6[3] = v9
    v6[4] = v10
    v5[Children] = v6
    v4 = v4(v5)
    return v4
end