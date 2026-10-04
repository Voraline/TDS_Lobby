-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.StatsPanel.StatsDetectionEntry
-- Decompile time: 6.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
return function(a1) -- Line: 18
    -- upvalues: React (val), useSound (val), createElement (val), BattlepassPreview (val)
    local u4, u5 = React.useState(a1.value)
    local Click = useSound("Click")
    local v1 = {
        AspectRatio = 1,
        Size = UDim2.fromScale(0.95, 0.95),
        innerSize = UDim2.fromScale(0.95, 0.95),
    }
    local v2 = u4 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v1.color = v2

    function v1.clicked() -- Line: 27 -- upvalues: Click (val), a1 (val), u4 (val), u5 (val)
        Click()
        a1.onConfirm(not u4)
        u5(not u4)
    end

    return createElement(BattlepassPreview, v1, {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            ScaleType = Enum.ScaleType.Fit,
            Image = a1.icon,
        }),
        name = createElement("TextLabel", {
            TextWrapped = true,
            BackgroundTransparency = 1,
            TextSize = 24,
            ZIndex = 3,
            Text = a1.name,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom,
        }, {
            padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
            }),
            stroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.5,
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Bevel,
            }),
        }),
    })
end