-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.MostPopularBadge
-- Decompile time: 4.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local ServerCountStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.ServerCountStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local memo = React.memo
local u45 = Color3.fromRGB(44, 232, 81)
local u50 = Color3.fromRGB(32, 171, 55)
return memo(function(a1) -- Line: 31
    -- upvalues: useCharmSelector (val), ServerCountStore (val), MatchmakingModel (val), useFontScale (val)
    -- upvalues: MatchmakingStyle (val), createElement (val), u45 (val), u50 (val)
    local v1
    local v2 = a1.compact == true
    local mostPopularCategory = a1.mostPopularCategory
    local v3 = {mostPopularCategory}
    local v4 = useCharmSelector(ServerCountStore.getState, function(a1) -- Line: 34 -- upvalues: mostPopularCategory (val), MatchmakingModel (upval)
        if mostPopularCategory then
            return mostPopularCategory
        end
        return MatchmakingModel.getMostPopularCategory(a1.serverCount)
    end, v3)
    local v5 = useFontScale(MatchmakingStyle.getFontSize("caption", v2))
    if v4 ~= a1.category then
        return nil
    end
    v3 = (if not v2 then 168 else 108) / 6
    local v6 = a1.ZIndex or 2
    return createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = u45,
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        Size = UDim2.fromOffset(v1, v3),
        ZIndex = v6,
    }, {
        AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 6}),
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.small}),
        DropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9239716855",
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = MatchmakingStyle.transparency.dropShadow,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 14, 1, 14),
            SliceCenter = Rect.new(14, 14, 64, 24),
            ZIndex = v6 - 1,
        }),
        Icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://16381447184",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.1, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.2, 0.6),
            ZIndex = v6 + 1,
        }, {AspectRatio = createElement("UIAspectRatioConstraint")}),
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "Most Popular!",
            TextScaled = false,
            TextWrapped = true,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.2, 0),
            Size = UDim2.fromScale(0.8, 1),
            TextColor3 = MatchmakingStyle.colors.text,
            TextSize = v5,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = v6 + 1,
        }, {
            Padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.1, 0),
            }),
            Stroke = createElement("UIStroke", {Color = u50, Thickness = MatchmakingStyle.strokeThickness.thick}),
        }),
    })
end)