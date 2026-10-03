-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SpinWheelChances.Disclosure
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardList = require(script.Parent.RewardList)
local createElement = React.createElement
local memo = React.memo
local u21 = Color3.fromRGB(16, 18, 22)
local u26 = Color3.fromRGB(80, 92, 108)
return memo(function(a1) -- Line: 14 -- upvalues: createElement (val), u21 (val), u26 (val), RewardList (val)
    return createElement("SurfaceGui", {
        AlwaysOnTop = false,
        LightInfluence = 0,
        PixelsPerStud = 55,
        ResetOnSpawn = false,
        Adornee = a1.part,
        Face = Enum.NormalId.Front,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }, {
        root = createElement("Frame", {BorderSizePixel = 0, BackgroundColor3 = u21, Size = UDim2.fromScale(1, 1)}, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.1, Color = u26}),
            padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 15),
                PaddingLeft = UDim.new(0, 15),
                PaddingRight = UDim.new(0, 15),
                PaddingTop = UDim.new(0, -15),
            }),
            list = createElement("ScrollingFrame", {
                Active = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                ScrollBarImageTransparency = 0.2,
                ScrollBarThickness = 5,
                Selectable = true,
                SelectionGroup = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.fromScale(0, 0),
                ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
                Position = UDim2.new(0, 0, 0, 38),
                ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Size = UDim2.new(1, 0, 1, -38),
            }, {rows = createElement(RewardList, {shownRewardKeys = a1.shownRewardKeys})}),
        }),
    })
end)