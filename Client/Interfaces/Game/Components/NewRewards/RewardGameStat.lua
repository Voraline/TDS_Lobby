-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardGameStat
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 17
    -- upvalues: ReactFlow (val), React (val), createElement (val), TextMarquee (val)
    local v1, u5 = ReactFlow.useSpring({target = 0, start = -2, damper = 0.7, speed = 20})
    local useEffect = React.useEffect
    local v2 = {a1.visible}
    useEffect(function() -- Line: 25 -- upvalues: a1 (val), u5 (val)
        local u2 = task.spawn(function() -- Line: 26 -- upvalues: a1 (upval), u5 (upval)
            task.wait(a1.index * 0.045)
            u5({start = -1, target = 0})
        end)
        return function() -- Line: 34 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v2)
    return createElement("Frame", {BackgroundTransparency = 1, ClipsDescendants = true, Size = UDim2.fromScale(0.9, 0.064)}, {
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = v1:map(function(a1) -- Line: 52
                return UDim2.fromScale(4.66778e-08 + a1 / 2, 0.5)
            end),
            Size = UDim2.fromScale(1, 1),
            Text = a1.leftText or "N/A",
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
        textLabel2 = createElement(TextMarquee, {
            BackgroundTransparency = 1,
            alwaysMarquee = true,
            TextScaled = true,
            AnchorPoint = Vector2.new(1, 0.5),
            padding = UDim.new(0, 3),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = v1:map(function(a1) -- Line: 73
                return UDim2.fromScale(1 - a1 / 2, 0.5)
            end),
            Size = UDim2.fromScale(0.5, 1),
            Text = a1.rightText or "N/A",
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Right,
        }),
    })
end)