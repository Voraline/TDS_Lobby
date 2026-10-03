-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.WindowFrame
-- Decompile time: 1.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 18 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = {}
    for i, j in a1.children do
        if i ~= "otherChildren" then
            v1[i] = j
        end
    end
    local v2 = {
        BackgroundColor3 = Color3.new(),
        BackgroundTransparency = a1.filterBackgroundTransparency or 0.4,
    }
    local size = a1.size or UDim2.fromScale(0.55, 1)
    v2.Size = size
    local position = a1.position or UDim2.fromScale(0, 0)
    v2.Position = position
    local anchorPoint = a1.anchorPoint or Vector2.new(0, 0)
    v2.AnchorPoint = anchorPoint
    v2.Visible = a1.Visible
    local v3 = {}
    local v4 = {
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(56, 56, 56),
        Position = UDim2.fromScale(0.5, 0),
    }
    local filterSize = a1.filterSize or UDim2.new(1, 30, 0.082, 0)
    v4.Size = filterSize
    v3.filter = createElement("Frame", v4, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 10)}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(33, 33, 33)}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
    }, v1)
    v3.children = createElement(React.Fragment, nil, a1.children.otherChildren or {})
    v3.dropShadow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=9239716855",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 1, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v3.uICorner = createElement("UICorner")
    v3.dropShadow2 = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "http://www.roblox.com/asset/?id=9239716855",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.505097),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 0.989806, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    return createElement("Frame", v2, v3)
end)