-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.CosmeticPreview
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharmPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CharmPreview)
local EmotePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.EmotePreview)
local FlairPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.FlairPreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local StickerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.StickerPreview)
local TagPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TagPreview)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 23
    -- upvalues: createElement (val), EmotePreview (val), FlairPreview (val), StickerPreview (val), TagPreview (val)
    -- upvalues: CharmPreview (val)
    local v1
    if a1.type == "emotes" then
        v1 = {}
        local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
        v1.AnchorPoint = AnchorPoint
        local Position = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
        v1.Position = Position
        v1.Size = UDim2.fromScale(0.85, 0.85)
        v1.name = a1.name
        v1.children = a1.children
        return createElement(EmotePreview, v1)
    end
    if a1.type == "flairs" then
        v1 = {}
        local AnchorPoint_2 = a1.AnchorPoint or Vector2.new(0.5, 0.5)
        v1.AnchorPoint = AnchorPoint_2
        local Position_2 = a1.Position or UDim2.new(0.5, 0, 0.5, 0)
        v1.Position = Position_2
        local Size = a1.Size or UDim2.fromScale(1, 1)
        v1.Size = Size
        v1.name = a1.name
        v1.children = a1.children
        return createElement(FlairPreview, v1)
    end
    if a1.type == "stickers" then
        v1 = {}
        local AnchorPoint_3 = a1.AnchorPoint or Vector2.new(0.5, 0.5)
        v1.AnchorPoint = AnchorPoint_3
        v1.Position = UDim2.new(0.5, 0, 0.1, 0)
        v1.Size = UDim2.fromScale(0.5, 0.5)
        v1.name = a1.name
        v1.children = a1.children
        return createElement(StickerPreview, v1)
    end
    if a1.type == "tags" then
        v1 = {}
        local AnchorPoint_4 = a1.AnchorPoint or Vector2.new(0.5, 0.5)
        v1.AnchorPoint = AnchorPoint_4
        v1.Position = UDim2.new(0.5, 0, 0.1, 0)
        v1.Size = UDim2.fromScale(0.5, 0.5)
        v1.name = a1.name
        v1.children = a1.children
        return createElement(TagPreview, v1)
    end
    if a1.type ~= "totems" then
        return nil
    end
    v1 = {}
    local AnchorPoint_5 = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint_5
    v1.Position = UDim2.new(0.5, 0, 0, 0)
    v1.Size = UDim2.fromScale(0.7, 0.7)
    v1.name = a1.name
    v1.children = a1.children
    return createElement(CharmPreview, v1)
end))