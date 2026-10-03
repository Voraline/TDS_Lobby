-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.VideoFrame
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local u10 = {"rbxassetid://125938892764417", "rbxassetid://125938892764417", "rbxassetid://98559647268239"}
local memo = React.memo
local VideoButton = require(script.Parent.VideoButton)
return memo(function(a1) -- Line: 23 -- upvalues: React (val), VideoButton (val), u10 (val) -- types: a1: table
    local v1 = {}
    local createElement = React.createElement
    local v2 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0.1, 0),
    }
    local v3 = {AspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
    v1.UIListLayout = createElement("UIListLayout", v2, v3)
    for i = 1, 3 do
        v3 = ("VideoButton_%*"):format(i)
        v1[v3] = (React.createElement(VideoButton, {
            Size = UDim2.fromScale(0.3, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            LayoutOrder = i,
            image = u10[i] or "",
            state = a1.videoStates[i],
            onActivated = function() -- Line: 46 -- upvalues: a1 (val), i (val)
                if a1.videoStates[i] == "claim" then
                    a1.onVideoClaimed(i)
                end
            end,
        }))
    end
    local createElement_3 = React.createElement
    v2 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.374, 0.083)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.597, 0.852)
    v2.Size = Size
    return createElement_3("Frame", v2, {
        videoHolder = React.createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
        }, v1),
    })
end)