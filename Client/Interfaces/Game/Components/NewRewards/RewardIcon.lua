-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardIcon
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BattlepassItem = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassItem)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 14
    -- upvalues: ReactFlow (val), useMediaQuery (val), React (val), createElement (val), BattlepassItem (val)
    local v1, u5 = ReactFlow.useSpring({start = 0, target = 1, damper = 0.5, speed = 17})
    local v2 = if useMediaQuery("large") then 130 else 50
    React.useEffect(function() -- Line: 26 -- upvalues: a1 (val), u5 (val)
        local u5_2 = task.delay(a1.index / 10, function() -- Line: 27 -- upvalues: u5 (upval)
            u5({target = 1})
        end)
        return function() -- Line: 33 -- upvalues: u5_2 (val)
            task.cancel(u5_2)
        end
    end, {})
    a1.Position = UDim2.fromScale(0.5, 0.5)
    a1.AnchorPoint = Vector2.new(0.5, 0.5)
    a1.Size = UDim2.fromScale(1, 1)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromOffset(v2, v2)}, {
        icon = createElement("Frame", {
            BackgroundTransparency = 0.1,
            BackgroundColor3 = Color3.fromRGB(18, 18, 18),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(v2, v2),
        }, {
            UIScale = createElement("UIScale", {Scale = v1}),
            icon = createElement(BattlepassItem, a1),
            uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.new(1, 1, 1)}),
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0409836, 0)}),
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        }),
    })
end)