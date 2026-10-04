-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassItem
-- Decompile time: 21.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local Components = ReplicatedStorage.Client.Interfaces.Components
local Previews = Components.Previews
local CharmPreview = require(Previews.CharmPreview)
local ConsumablePreview = require(Previews.ConsumablePreview)
local CratePreview = require(Previews.CratePreview)
local EmotePreview = require(Previews.EmotePreview)
local FlairPreview = require(Previews.FlairPreview)
local ImageLabel = require(Components.ImageLabel)
local StickerPreview = require(Previews.StickerPreview)
local TagPreview = require(Previews.TagPreview)
local TowerPreview = require(Previews.TowerPreview)
local Fragment = React.Fragment
local useBinding = React.useBinding
local createElement = React.createElement
local memo = React.memo
local u55 = {SpinTickets = true, ReviveTickets = true, TimescaleTickets = true}
local u56 = {}
u56.Coins = {Icons.CoinsTiny, Icons.CoinsSmall, Icons.CoinsChest, Icons.CoinsChestBig}
u56.Gems = {Icons.GemsTiny, Icons.GemsSmall, Icons.GemsChest, Icons.GemsChestBig}
u56.Experience = Icons.Experience
u56.TimescaleTickets = Icons.Timescale
u56.SpinTickets = Icons.Spin
u56.ReviveTickets = Icons.Revive

local function mapRewardType(a1, a2) -- Line: 52 -- upvalues: u56 (val) -- types: a1: string, a2: number
    local v1 = u56[a1]
    if not v1 then
        return
    end
    if v1 and typeof(v1) == "table" then
        local v2 = v1[1]
        if typeof(a2) == "number" then
            if a2 >= 1000 then
                return v1[4]
            end
            if a2 >= 100 then
                return v1[3]
            end
            if a2 >= 10 then
                v2 = v1[2]
            end
        end
        return v2
    end
    return v1
end

local u74 = memo(function(a1) -- Line: 77 -- upvalues: createElement (val)
    local v1 = {
        TextSize = 18,
        TextScaled = true,
        BackgroundTransparency = 1,
        ZIndex = 2,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = a1.text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = a1.Transparency,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local position = a1.position or UDim2.new(0.5, 0, 1, -4)
    v1.Position = position
    local size = a1.size or UDim2.fromScale(1, 0.2)
    v1.Size = size
    v1.TextYAlignment = a1.textYAlignment
    return createElement("TextLabel", v1, {uIStroke1 = createElement("UIStroke", {Thickness = 4, Transparency = a1.Transparency})})
end)
return memo(function(a1) -- Line: 105
    -- upvalues: useBinding (val), createElement (val), EmotePreview (val), TowerPreview (val), Fragment (val)
    -- upvalues: u74 (val), CratePreview (val), CharmPreview (val), StickerPreview (val), ConsumablePreview (val)
    -- upvalues: TagPreview (val), FlairPreview (val), Asset (val), ImageLabel (val), u56 (val), u55 (val)
    local v1, v2, v3, v4
    local Transparency = a1.Transparency or useBinding(0)
    local playing = a1.playing
    local type = a1.type
    local v5 = not (a1.selection == true) and a1.icon ~= false
    local Size = a1.Size
    local AnchorPoint = a1.AnchorPoint
    local Position = a1.Position
    local ZIndex = a1.ZIndex
    local v6 = nil
    if type == "emote" then
        v1 = {}
        v3 = v4 and UDim2.fromScale(0.2, 0.2) or UDim2.fromScale(0.3, 0.3)
        v1.Size = Size + v3
        v3 = v4 and UDim2.fromScale(0.1, -0.25) or UDim2.fromScale(0, 0.01)
        v1.Position = Position + v3
        v1.AnchorPoint = AnchorPoint
        v1.ZIndex = ZIndex
        v1.ImageTransparency = Transparency
        v1.playing = playing
        v1.name = a1.name
        return (createElement(EmotePreview, v1, a1.children))
    end
    if type ~= "tower" and type ~= "skin" then
        local v7, v8, v9, v10, v11, v12
        if type == "crate" then
            local amount = a1.amount
            v2 = {Size = Size}
            v2.Position = v4 and Position + UDim2.fromScale(-0.01, -0.1) or Position
            v2.AnchorPoint = AnchorPoint
            v2.ZIndex = ZIndex
            v2.ImageTransparency = Transparency
            v2.name = a1.name
            v2.icon = a1.useIcon
            v2.flat = a1.flat
            v3 = {children = createElement(Fragment, nil, a1.children)}
            v9 = amount and createElement(u74, {text = ("x%*"):format(amount), Transparency = Transparency}) or nil
            v3.textLabel = v9
            return (createElement(CratePreview, v2, v3))
        end
        if type == "charm" then
            return (createElement(CharmPreview, {
                Size = Size,
                Position = Position,
                AnchorPoint = AnchorPoint,
                ZIndex = ZIndex,
                ImageTransparency = Transparency,
                name = a1.name,
                playing = a1.playing,
            }, a1.children))
        end
        if type == "sticker" then
            return (createElement(StickerPreview, {
                Size = Size,
                Position = Position,
                AnchorPoint = AnchorPoint,
                ZIndex = ZIndex,
                ImageTransparency = Transparency,
                name = a1.name,
            }, a1.children))
        end
        if type == "consumable" then
            local amount_2 = a1.amount
            v2 = {
                Size = Size,
                Position = Position,
                AnchorPoint = AnchorPoint,
                ZIndex = ZIndex,
                ImageTransparency = Transparency,
                name = a1.name,
            }
            v3 = {children = createElement(Fragment, nil, a1.children)}
            v9 = amount_2 and createElement(u74, {text = ("x%*"):format(amount_2), Transparency = Transparency}) or nil
            v3.textLabel = v9
            return (createElement(ConsumablePreview, v2, v3))
        end
        if type == "nametag" then
            v7 = a1.showPlayer == true
            v2 = {Size = Size}
            v2.Position = v4 and Position + UDim2.fromScale(0, -0.1) or Position
            v2.AnchorPoint = AnchorPoint
            v2.ZIndex = ZIndex
            v2.ImageTransparency = Transparency
            v2.playing = playing
            v2.name = a1.name
            v2.showPlayer = a1.showPlayer
            v2.tagAnchorPoint = if v7 then nil else Vector2.new(0.5, 0.5)
            v2.tagPosition = if v7 then nil else UDim2.fromScale(0.5, 0.5)
            v2.tagSize = if v7 then nil else UDim2.fromScale(1, 0.15)
            return (createElement(TagPreview, v2, a1.children))
        end
        if type == "flair" then
            v1 = {Size = Size}
            v1.Position = v4 and Position + UDim2.fromScale(0, -0.05) or Position
            v1.AnchorPoint = AnchorPoint
            v1.ZIndex = ZIndex
            v1.name = a1.name
            return (createElement(FlairPreview, v1, {children = createElement(Fragment, nil, a1.children)}))
        end
        if type == "modifier" then
            v7 = Asset("Modifiers", a1.name)
            if not v7 then
                return v6
            end
            v8 = v7.icon or 0
            local displayName = v7.displayName or a1.name
            v2 = a1.showText ~= false
            v10 = {BackgroundTransparency = 1, Size = Size}
            v10.Position = v4 and Position + UDim2.fromScale(0, -0.05) or Position
            v10.AnchorPoint = AnchorPoint
            v10.ZIndex = ZIndex
            v10.Image = v8
            v10.ImageTransparency = Transparency
            v10.ScaleType = Enum.ScaleType.Fit
            v11 = {children = createElement(Fragment, nil, a1.children)}
            v12 = not v4 and v2 and createElement(u74, {
                size = UDim2.fromScale(1, 0.4),
                position = UDim2.new(0.5, 0, 1, -6),
                text = ("%*"):format(displayName),
                textYAlignment = Enum.TextYAlignment.Bottom,
                Transparency = Transparency,
            }) or nil
            v11.textLabel = v12
            return (createElement(ImageLabel, v10, v11))
        end
        if type ~= "stat" then
            if type == "icon" then
                v1 = {BackgroundTransparency = 1, Size = Size}
                v1.Position = v4 and Position + UDim2.fromScale(0, -0.05) or Position
                v1.AnchorPoint = AnchorPoint
                v1.ZIndex = ZIndex
                v1.Image = a1.icon or 0
                v1.ImageTransparency = Transparency
                v1.ScaleType = Enum.ScaleType.Fit
                v2 = {children = createElement(Fragment, nil, a1.children)}
                v3 = not v4 and createElement(u74, {
                    size = UDim2.fromScale(1, 0.4),
                    position = UDim2.new(0.5, 0, 1, -6),
                    text = ("%*"):format(a1.label or a1.name),
                    textYAlignment = Enum.TextYAlignment.Bottom,
                    Transparency = Transparency,
                }) or nil
                v2.textLabel = v3
                v6 = createElement(ImageLabel, v1, v2)
            end
            return v6
        end
        local stat = a1.stat
        local amount_3 = a1.amount
        v2 = u56[stat]
        if not v2 then
            v8 = nil
        elseif not v2 or typeof(v2) ~= "table" then
            v8 = v2
        else
            v3 = v2[1]
            if typeof(amount_3) == "number" then
                if amount_3 >= 1000 then
                    v3 = v2[4]
                elseif amount_3 >= 100 then
                    v3 = v2[3]
                elseif amount_3 >= 10 then
                    v3 = v2[2]
                end
            end
            v8 = v3
        end
        if not v8 then
            return v6
        end
        v2 = ""
        if stat == "Experience" then
            v1 = "XP"
        elseif not u55[stat] then
            v1 = stat
        else
            v1 = ""
            v2 = "x"
        end
        v10 = {BackgroundTransparency = 1, Size = Size}
        v10.Position = v4 and Position + UDim2.fromScale(0, -0.05) or Position
        v10.AnchorPoint = AnchorPoint
        v10.ZIndex = ZIndex
        v10.Image = v8
        v10.ImageTransparency = Transparency
        v10.ScaleType = Enum.ScaleType.Fit
        v11 = {children = createElement(Fragment, nil, a1.children)}
        v12 = not v4 and createElement(u74, {text = ("%*%* %*"):format(v2, a1.amount, v1), Transparency = Transparency}) or nil
        v11.textLabel = v12
        return (createElement(ImageLabel, v10, v11))
    end
    v1 = {}
    v3 = v4 and UDim2.fromScale(0.4, 0.4) or UDim2.fromScale(0.1, 0.1)
    v1.Size = Size + v3
    v3 = v4 and UDim2.fromScale(0.1, -0.2) or UDim2.fromScale(0, 0)
    v1.Position = Position + v3
    v1.AnchorPoint = AnchorPoint
    v1.ZIndex = ZIndex
    v1.ImageTransparency = Transparency
    v1.tower = a1.tower
    v1.skin = a1.skin or "Default"
    v1.icon = v5
    v2 = {}
    v2.children = createElement(Fragment, nil, a1.children)
    v3 = a1.amount and not v4 and createElement(u74, {text = ("+%* XP"):format(a1.amount), Transparency = Transparency}) or nil
    v2.textLabel = v3
    return (createElement(TowerPreview, v1, v2))
end)