-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.CloseButton
-- Decompile time: 3.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
return React.memo(function(a1) -- Line: 15 -- upvalues: React (val), useSpring (val), useSound (val) -- types: a1: table
    local u4, u5 = React.useState(false)
    local v1, u12 = useSpring(1, 0.6, 40, true)
    local Click = useSound("Click")
    local v2 = {u4}
    React.useEffect(function() -- Line: 20 -- upvalues: u4 (val), u12 (val)
        if u4 then
            u12(1.15)
            return
        end
        u12(1)
    end, v2)
    local createElement = React.createElement
    v2 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.875, 0.08),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.9, 0.077),
        BackgroundTransparency = 0,
        Text = "",
    }

    v2[React.Event.MouseEnter] = function() -- Line: 36 -- upvalues: u5 (val)
        u5(true)
    end

    v2[React.Event.MouseLeave] = function() -- Line: 40 -- upvalues: u5 (val)
        u5(false)
    end

    v2[React.Event.Activated] = function() -- Line: 44 -- upvalues: Click (val), a1 (val)
        Click()
        a1.onClick()
    end

    return createElement("TextButton", v2, {
        UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1, DominantAxis = Enum.DominantAxis.Width}),
        uIScale = React.createElement("UIScale", {Scale = v1}),
        Content = React.createElement("Frame", {
            BackgroundTransparency = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 60, 60),
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            UIStroke = React.createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(168, 58, 58),
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                LineJoinMode = Enum.LineJoinMode.Round,
            }),
            Icon = React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "http://www.roblox.com/asset/?id=9674219565",
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.545, 0.545),
                ImageColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1, DominantAxis = Enum.DominantAxis.Width}),
            }),
        }),
    })
end)