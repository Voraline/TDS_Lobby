-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PlayerVote
-- Decompile time: 1.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 13 -- upvalues: ReactFlow (val), React (val), createElement (val) -- types: a1: table
    local v1, u5 = ReactFlow.useSpring({start = 0, target = 0, speed = 20, damper = 0.6})
    local v2, u10 = ReactFlow.useSpring({start = 0, target = 0, speed = 17, damper = 0.5})
    React.useEffect(function() -- Line: 28 -- upvalues: u5 (val), u10 (val)
        u5({start = -180, target = 0})
        u10({start = 0, target = 1})
    end, {})
    local v3, u20 = React.useBinding("")
    local v4, u28 = React.useBinding(UDim2.fromScale(1, 1))
    local useEffect_2 = React.useEffect
    local v5 = {a1.userId}
    useEffect_2(function() -- Line: 42 -- upvalues: u28 (val), a1 (val), u20 (val)
        u28(UDim2.fromScale(Random.new():NextNumber(0.12, 0.8), (Random.new():NextNumber(0.12, 0.8))))
        local Players = game:GetService("Players")
        local PlayerByUserId = Players:GetPlayerByUserId(a1.userId)
        if PlayerByUserId then
            u20((Players:GetUserThumbnailAsync(PlayerByUserId.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)))
        end
    end, v5)
    return createElement("ImageLabel", {
        BackgroundTransparency = 0.2,
        ZIndex = 9999,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0.2, 0, 0.2, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Rotation = v1,
        Position = v4,
        Image = v3,
    }, {
        AspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        UIScale = createElement("UIScale", {Scale = v2}),
        UIStroke = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(255, 255, 255)}),
    })
end)