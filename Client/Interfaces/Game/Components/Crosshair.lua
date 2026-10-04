-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Crosshair
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 12 -- upvalues: createElement (val) -- types: a1: table
    local spread = a1.spread
    return createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(2, 2),
    }, {
        left = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = spread:map(function(a1) -- Line: 15
                return UDim2.new(0, -a1, 0.5, 0)
            end),
            Size = UDim2.fromOffset(5, 2),
        }, {uIStroke = createElement("UIStroke", {Transparency = 0.7})}),
        uIStroke1 = createElement("UIStroke", {Transparency = 0.7}),
        right = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = spread:map(function(a1) -- Line: 18
                return UDim2.new(1, a1, 0.5, 0)
            end),
            Size = UDim2.fromOffset(5, 2),
        }, {uIStroke2 = createElement("UIStroke", {Transparency = 0.7})}),
        top = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = spread:map(function(a1) -- Line: 21
                return UDim2.new(0.5, 0, 0.5, -a1)
            end),
            Size = UDim2.fromOffset(2, 5),
        }, {uIStroke3 = createElement("UIStroke", {Transparency = 0.7})}),
        bottom = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = spread:map(function(a1) -- Line: 24
                return UDim2.new(0.5, 0, 1, a1)
            end),
            Size = UDim2.fromOffset(2, 5),
        }, {uIStroke4 = createElement("UIStroke", {Transparency = 0.7})}),
    })
end