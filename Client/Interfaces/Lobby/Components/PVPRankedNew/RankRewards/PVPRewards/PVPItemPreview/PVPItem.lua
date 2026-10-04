-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.RankRewards.PVPRewards.PVPItemPreview.PVPItem
-- Decompile time: 18.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
local u50 = {SpinTickets = true, ReviveTickets = true, TimescaleTickets = true}
local u51 = {}
u51.Coins = {Icons.CoinsTiny, Icons.CoinsSmall, Icons.CoinsChest, Icons.CoinsChestBig}
u51.Gems = {Icons.GemsTiny, Icons.GemsSmall, Icons.GemsChest, Icons.GemsChestBig}
u51.Experience = Icons.Experience
u51.TimescaleTickets = Icons.Timescale
u51.SpinTickets = Icons.Spin
u51.ReviveTickets = Icons.Revive

local function mapRewardType(a1, a2) -- Line: 51 -- upvalues: u51 (val) -- types: a1: string, a2: number
    local v1 = u51[a1]
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

local u69 = memo(function(a1) -- Line: 76 -- upvalues: createElement (val)
    return createElement("TextLabel", {
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
        Position = UDim2.new(0.5, 0, 1, -4),
        Size = UDim2.fromScale(1, 0.2),
    }, {uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = a1.Transparency})})
end)
return memo(function(a1) -- Line: 103
    -- upvalues: useBinding (val), createElement (val), EmotePreview (val), TowerPreview (val), CratePreview (val)
    -- upvalues: Fragment (val), u69 (val), CharmPreview (val), StickerPreview (val), ConsumablePreview (val)
    -- upvalues: TagPreview (val), FlairPreview (val), u51 (val), u50 (val), ImageLabel (val)
    local v1, v2, v3
    local Transparency = a1.Transparency or useBinding(0)
    local playing = a1.playing
    local type = a1.type
    local v4 = not (a1.selection == true) and a1.icon ~= false
    local Size = a1.Size
    local AnchorPoint = a1.AnchorPoint
    local Position = a1.Position
    local ZIndex = a1.ZIndex
    local v5 = nil
    if type == "emote" then
        v1 = {}
        v2 = v3 and UDim2.fromScale(0.2, 0.2) or UDim2.fromScale(0.3, 0.3)
        v1.Size = Size + v2
        v2 = v3 and UDim2.fromScale(0.1, -0.25) or UDim2.fromScale(0, 0.01)
        v1.Position = Position + v2
        v1.AnchorPoint = AnchorPoint
        v1.ZIndex = ZIndex
        v1.ImageTransparency = Transparency
        v1.playing = playing
        v1.name = a1.name
        return (createElement(EmotePreview, v1, a1.children))
    end
    if type ~= "tower" and type ~= "skin" then
        local v6, v7
        if type == "crate" then
            local amount_2 = a1.amount
            v6 = {Size = Size}
            v6.Position = v3 and Position + UDim2.fromScale(-0.01, -0.1) or Position
            v6.AnchorPoint = AnchorPoint
            v6.ZIndex = ZIndex
            v6.ImageTransparency = Transparency
            v6.name = a1.name
            v2 = {children = createElement(Fragment, nil, a1.children)}
            v7 = amount_2 and createElement(u69, {text = ("x%*"):format(amount_2), Transparency = Transparency}) or nil
            v2.textLabel = v7
            return (createElement(CratePreview, v6, v2))
        end
        if type == "charm" then
            return (createElement(CharmPreview, {
                Size = Size,
                Position = Position,
                AnchorPoint = AnchorPoint,
                ZIndex = ZIndex,
                ImageTransparency = Transparency,
                name = a1.name,
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
            local amount_3 = a1.amount
            v6 = {
                Size = Size,
                Position = Position,
                AnchorPoint = AnchorPoint,
                ZIndex = ZIndex,
                ImageTransparency = Transparency,
                name = a1.name,
            }
            v2 = {children = createElement(Fragment, nil, a1.children)}
            v7 = amount_3 and createElement(u69, {text = ("x%*"):format(amount_3), Transparency = Transparency}) or nil
            v2.textLabel = v7
            return (createElement(ConsumablePreview, v6, v2))
        end
        if type == "nametag" then
            v1 = {Size = Size}
            v1.Position = v3 and Position + UDim2.fromScale(0, -0.1) or Position
            v1.AnchorPoint = AnchorPoint
            v1.ZIndex = ZIndex
            v1.ImageTransparency = Transparency
            v1.playing = playing
            v1.name = a1.name
            return (createElement(TagPreview, v1, a1.children))
        end
        if type == "flair" then
            v1 = {Size = Size}
            v1.Position = v3 and Position + UDim2.fromScale(0, -0.05) or Position
            v1.AnchorPoint = AnchorPoint
            v1.ZIndex = ZIndex
            v1.name = a1.name
            return (createElement(FlairPreview, v1, {children = createElement(Fragment, nil, a1.children)}))
        end
        if type == "stat" then
            local v8
            local stat = a1.stat
            local amount_4 = a1.amount
            v6 = u51[stat]
            if not v6 then
                v8 = nil
            elseif not v6 or typeof(v6) ~= "table" then
                v8 = v6
            else
                v2 = v6[1]
                if typeof(amount_4) == "number" then
                    if amount_4 >= 1000 then
                        v2 = v6[4]
                    elseif amount_4 >= 100 then
                        v2 = v6[3]
                    elseif amount_4 >= 10 then
                        v2 = v6[2]
                    end
                end
                v8 = v2
            end
            if not v8 then
                return v5
            end
            v6 = ""
            if stat == "Experience" then
                v1 = "XP"
            elseif not u50[stat] then
                v1 = stat
            else
                v1 = ""
                v6 = "x"
            end
            local v9 = {BackgroundTransparency = 1, Size = Size}
            v9.Position = v3 and Position + UDim2.fromScale(0, -0.05) or Position
            v9.AnchorPoint = AnchorPoint
            v9.ZIndex = ZIndex
            v9.Image = v8
            v9.ImageTransparency = Transparency
            local v10 = {children = createElement(Fragment, nil, a1.children)}
            local v11 = not v3 and createElement(u69, {text = ("%*%* %*"):format(v6, a1.amount, v1), Transparency = Transparency}) or nil
            v10.textLabel = v11
            v5 = createElement(ImageLabel, v9, v10)
        end
        return v5
    end
    v1 = {}
    v2 = v3 and UDim2.fromScale(0.4, 0.4) or UDim2.fromScale(0.1, 0.1)
    v1.Size = Size + v2
    v2 = v3 and UDim2.fromScale(0.1, -0.2) or UDim2.fromScale(0, 0)
    v1.Position = Position + v2
    v1.AnchorPoint = AnchorPoint
    v1.ZIndex = ZIndex
    v1.ImageTransparency = Transparency
    v1.tower = a1.tower
    v1.skin = a1.skin or "Default"
    v1.icon = v4
    return (createElement(TowerPreview, v1, a1.children))
end)