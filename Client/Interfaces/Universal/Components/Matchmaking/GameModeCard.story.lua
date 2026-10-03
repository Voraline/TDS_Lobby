-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.GameModeCard.story
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameModeCard = require(script.Parent.GameModeCard)
local GameModeData = require(ReplicatedStorage.Shared.Data.GameModeData)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
return function(a1) -- Line: 8 -- upvalues: ReactRoblox (val), React (val), GameModeCard (val), GameModeData (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.25, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        aspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.55}),
        uiListLayout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.Name,
            Padding = UDim.new(0.1, 0),
        }),
        card1 = React.createElement(GameModeCard, {
            title = "Fallen",
            subTitle = "For the experienced user",
            character = 76374497500215,
            background = 136297780799266,
            hideOnPrevious = true,
            subTitleColor = Color3.fromRGB(160, 82, 255),
            rewardInfo = GameModeData.Casual,
        }, {}),
    })))
    return function() -- Line: 39 -- upvalues: u4 (val)
        u4:unmount()
    end
end