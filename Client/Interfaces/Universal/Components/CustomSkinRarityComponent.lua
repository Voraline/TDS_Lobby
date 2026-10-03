-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.CustomSkinRarityComponent
-- Decompile time: 1.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BattlepassStars = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassStars)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local UltimateEffect = require(ReplicatedStorage.Client.Interfaces.Game.Components.UltimateEffect)
local createElement = React.createElement
local memo = React.memo
local u32 = {}

u32[Enum.SkinRarity.Gem] = function(a1) -- Line: 17 -- upvalues: createElement (val), UltimateEffect (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = a1.LayoutOrder or 1,
    }, {
        effect = createElement(UltimateEffect, {
            Rotation = true,
            strokeThickness = 2,
            Color = Color3.fromRGB(214, 29, 231),
            SweepColor = Color3.fromRGB(214, 29, 231),
        }, a1.children),
    }, a1.children)
end

u32[Enum.SkinRarity.GoldenButton] = function(a1) -- Line: 32 -- upvalues: createElement (val), UltimateEffect (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = a1.LayoutOrder or 1,
    }, {
        effect = createElement(UltimateEffect, {
            Rotation = true,
            strokeThickness = 2,
            Color = Color3.fromRGB(255, 255, 255),
            SweepColor = Color3.fromRGB(255, 255, 255),
        }, a1.children),
    }, a1.children)
end

u32[Enum.SkinRarity.Golden] = function(a1) -- Line: 47 -- upvalues: createElement (val), UltimateEffect (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = a1.LayoutOrder or 1,
    }, {
        effect = createElement(UltimateEffect, {
            Rotation = true,
            Color = Color3.fromRGB(255, 255, 255),
            SweepColor = Color3.fromRGB(255, 217, 0),
        }, a1.children),
    }, a1.children)
end

u32[Enum.SkinRarity.Ultimate] = function(a1) -- Line: 61 -- upvalues: createElement (val), UltimateEffect (val), BattlepassStars (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = a1.LayoutOrder or 1,
    }, {
        effect = createElement(UltimateEffect, {}, a1.children),
        stars = createElement(BattlepassStars, {rate = 12, speed = 90, scale = 0.3, duration = NumberRange.new(1, 2)}),
    }, a1.children)
end

u32[Enum.SkinRarity.Exclusive] = function(a1) -- Line: 76 -- upvalues: createElement (val), UltimateEffect (val), BattlepassStars (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        LayoutOrder = a1.LayoutOrder or 1,
    }, {
        effect = createElement(UltimateEffect, {Color = Color3.fromRGB(255, 0, 55)}, a1.children),
        stars = createElement(BattlepassStars, {rate = 6, speed = 90, scale = 0.3, duration = NumberRange.new(1, 2)}),
    }, a1.children)
end

return memo(function(a1) -- Line: 95 -- upvalues: u32 (val), createElement (val) -- types: a1: table
    if not u32[tostring(a1.Rarity)] then
        return nil
    end
    return createElement(u32[tostring(a1.Rarity)], {}, a1.children)
end)