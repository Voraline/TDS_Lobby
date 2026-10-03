-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Tutorial.TutorialRewards
-- Decompile time: 0.76 ms

local React = require(game:GetService("ReplicatedStorage").Shared.UI.React)
local u37 = (require((((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib")))).import(
    script,
    game:GetService("ReplicatedStorage"),
    "Client",
    "Interfaces",
    "Universal",
    "Components",
    "RewardItem"
)
return {
    TutorialRewards = function(a1) -- Line: 14 -- upvalues: React (val), u37 (val)
        return React.createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = a1.AnchorPoint,
            Size = a1.Size,
            Position = a1.Position,
        }, {
            React.createElement("UIListLayout", {
                Padding = UDim.new(0, 8),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
            }),
            React.createElement(u37, {
                Icon = "rbxassetid://16129597279",
                RewardText = "Demoman",
                LayoutOrder = 1,
                Size = UDim2.fromOffset(128, 172),
            }),
            (React.createElement(u37, {
                Icon = "rbxassetid://5870325711",
                RewardText = "600 Coins",
                LayoutOrder = 2,
                Size = UDim2.fromOffset(128, 172),
            })),
        })
    end,
}