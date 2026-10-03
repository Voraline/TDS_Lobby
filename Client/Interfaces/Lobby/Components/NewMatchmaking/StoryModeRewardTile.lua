-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.StoryModeRewardTile
-- Decompile time: 5.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ConsumablePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.ConsumablePreview)
local CratePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CratePreview)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
require(script.Parent.MatchmakingModel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local memo = React.memo
local u64 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
local u65 = {
    Coins = Icons.CoinsTiny,
    EXP = Icons.Experience,
    Experience = Icons.Experience,
    Revive = Icons.Revive,
    Spin = Icons.Spin,
    Timescale = Icons.Timescale,
    ["Tower XP"] = Icons.Experience,
    XP = Icons.Experience,
}
local u74 = {}
u74.Common = Color3.fromRGB(225, 229, 234)
u74.Uncommon = Color3.fromRGB(85, 255, 127)
u74.Rare = Color3.fromRGB(0, 170, 255)

local function getImage(a1) -- Line: 47
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1 or ""
end

return memo(function(a1) -- Line: 55
    -- upvalues: useFontScale (val), MatchmakingStyle (val), u74 (val), u65 (val), createElement (val)
    -- upvalues: ConsumablePreview (val), CratePreview (val), TextMarquee (val), u64 (val), TextLabel (val)
    local v1
    local entry = a1.entry
    local v2 = useFontScale(MatchmakingStyle.getFontSize("body", a1.compact == true))
    local v3 = useFontScale(MatchmakingStyle.getFontSize("bodySmall", v1))
    local v4 = entry.rarity and u74[entry.rarity] or Color3.new(1, 1, 1)
    local v5 = u65[entry.name]
    local v6 = true
    if entry.rewardType ~= "Consumable" then
        v6 = entry.rewardType == "Crate"
    end
    local v7 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        LayoutOrder = a1.layoutOrder or 1,
        Size = UDim2.fromScale(0.15, 1),
    }
    local v8 = {
        AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        RewardsDisplay = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(),
            Image = if not v6 then if type(v5) ~= "number" then v5 or "" else ("rbxassetid://%*"):format(v5) else "",
            Position = UDim2.fromScale(0.5, 0.52),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.72, 0.72),
        }, {
            Consumable = if entry.rewardType ~= "Consumable" then nil else createElement(ConsumablePreview, {
                ZIndex = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                name = entry.name,
            }),
            Crate = if entry.rewardType ~= "Crate" then nil else createElement(CratePreview, {
                ZIndex = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                name = entry.name,
            }),
        }),
        Name = createElement(TextMarquee, {
            alwaysMarquee = true,
            BackgroundTransparency = 1,
            TextScaled = false,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 1),
            FontFace = u64,
            Position = UDim2.fromScale(0.5, 0.98),
            Size = UDim2.fromScale(0.94, 0.24),
            Text = entry.name,
            TextColor3 = Color3.new(1, 1, 1),
            TextSize = v2,
        }, {Stroke = createElement("UIStroke")}),
    }
    local rarity = entry.rarity and createElement(TextLabel, {
        BackgroundTransparency = 1,
        FontWeight = "Bold",
        StrokeThickness = 1,
        TextScaled = false,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.02),
        Size = UDim2.fromScale(0.94, 0.24),
        Text = entry.rarity,
        TextColor3 = v4,
        TextSize = v3,
    })
    v8.Rarity = rarity
    v8.Stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.new(1, 1, 1)})
    v8.Corner = createElement("UICorner", {CornerRadius = UDim.new(0.0409836, 0)})
    return createElement("Frame", v7, v8)
end)