-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.CircularProgressBar
-- Decompile time: 5.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Background)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local createElement = React.createElement
return function(a1) -- Line: 21 -- upvalues: createElement (val) -- types: a1: table
    local u2 = a1.Reverse or false
    local v1 = a1.Factor or 1
    local v2 = a1.Thickness or 2
    if v1 > 1 and v1 <= 3 then
        local v3 = ("@%*x"):format(v1)
    end
    local v4 = {BackgroundTransparency = 1, ZIndex = 2}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = AnchorPoint
    local Size = a1.Size or UDim2.new(1, 8, 1, 8)
    v4.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v4.Position = Position
    local v5 = {}
    local v6 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(0.5, 1),
        Visible = a1.Alpha:map(function(a1) -- Line: 43 -- upvalues: u2 (val)
            if u2 then
                return true
            end
            return a1 >= 0.001
        end),
    }
    local v7 = {}
    local v8 = {BackgroundTransparency = 1, Size = UDim2.fromScale(2, 1)}
    local v9 = {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    local v10 = {}
    local Color = a1.Color or Color3.fromRGB(255, 255, 255)
    v10.Color = Color
    v10.BorderStrokePosition = Enum.BorderStrokePosition.Inner
    v10.Transparency = a1.Transparency or 0
    v10.Thickness = v2
    v9.stroke = createElement("UIStroke", v10, {
        gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 1),
                NumberSequenceKeypoint.new(0.501, 0),
                (NumberSequenceKeypoint.new(1, 0)),
            }),
            Rotation = a1.Alpha:map(function(a1) -- Line: 73 -- upvalues: u2 (val)
                if u2 then
                    return (math.clamp(a1 * 360 - 180, 0, 180))
                end
                return (math.clamp((1 - a1) * 360, 180, 360))
            end),
        }),
    })
    v7.border = createElement("Frame", v8, v9)
    v5.gradient1 = createElement("Frame", v6, v7)
    v6 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(0.5, 1),
        Visible = a1.Alpha:map(function(a1) -- Line: 98 -- upvalues: u2 (val)
            if u2 then
                return true
            end
            return a1 >= 0.501
        end),
    }
    v7 = {}
    v8 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(2, 1),
        Position = UDim2.fromScale(-1, 0),
    }
    v9 = {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}
    v10 = {}
    local Color_2 = a1.Color or Color3.fromRGB(255, 255, 255)
    v10.Color = Color_2
    v10.BorderStrokePosition = Enum.BorderStrokePosition.Inner
    v10.Transparency = a1.Transparency or 0
    v10.Thickness = v2
    v9.stroke = createElement("UIStroke", v10, {
        gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 1),
                NumberSequenceKeypoint.new(0.501, 0),
                (NumberSequenceKeypoint.new(1, 0)),
            }),
            Rotation = a1.Alpha:map(function(a1) -- Line: 129 -- upvalues: u2 (val)
                if u2 then
                    return (math.clamp(a1 * 360 - 180, -180, 0))
                end
                return (math.clamp(math.clamp(1 - a1, 0, 0.5) * 360, 0, 180))
            end),
        }),
    })
    v7.border = createElement("Frame", v8, v9)
    v5.gradient2 = createElement("Frame", v6, v7)
    return createElement("Frame", v4, v5)
end