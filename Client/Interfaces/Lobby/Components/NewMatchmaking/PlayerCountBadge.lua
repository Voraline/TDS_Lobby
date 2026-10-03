-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.PlayerCountBadge
-- Decompile time: 1.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Abbreviate = require(ReplicatedStorage.Shared.Modules.Abbreviate)
local React = require(ReplicatedStorage.Shared.UI.React)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local memo = React.memo
local u32 = Color3.fromRGB(8, 9, 11)
return memo(function(a1) -- Line: 24
    -- upvalues: useFontScale (val), MatchmakingStyle (val), createElement (val), u32 (val), Abbreviate (val)
    local v1 = a1.compact == true
    local v2 = math.max(0, (math.floor(a1.playerCount)))
    local v3 = useFontScale(MatchmakingStyle.getFontSize("caption", v1))
    local v4 = a1.ZIndex or 2
    return createElement("Frame", {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = u32,
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        Size = UDim2.fromOffset(if not v1 then 156 else 112, if not v1 then 28 else 18),
        ZIndex = v4,
    }, {
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
            ZIndex = v4 - 1,
        }),
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = false,
            TextWrapped = true,
            FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 1),
            Text = ("%* Playing"):format((Abbreviate(v2))),
            TextColor3 = MatchmakingStyle.colors.text,
            TextSize = v3,
            ZIndex = v4 + 1,
        }, {
            Padding = createElement("UIPadding", {
                PaddingLeft = UDim.new(0, if not v1 then 10 else 7),
                PaddingRight = UDim.new(0, if not v1 then 10 else 7),
            }),
        }),
    })
end)