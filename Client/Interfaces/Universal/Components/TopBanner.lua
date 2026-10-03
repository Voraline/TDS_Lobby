-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBanner
-- Decompile time: 1.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 19 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {}
    if not a1.RemoveGradient then
        v1.uiGradient = createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.719),
                NumberSequenceKeypoint.new(0.279, 0.781),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        })
    end
    v1["header-title"] = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromOffset(24, 40),
        Size = UDim2.new(0.35, 0, 0, 14),
        FontFace = Font.fromEnum(Enum.Font.Gotham),
        Text = a1.SmallTitle,
        TextColor3 = Color3.fromRGB(167, 167, 167),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        uiAspectRatioConstraint = createElement("UIAspectRatioConstraint", {
            AspectRatio = 9.789,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    })
    v1.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromOffset(24, 64),
        Size = UDim2.new(1, 0, 0, 25),
        FontFace = Font.fromEnum(Enum.Font.GothamBold),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)})})
    if a1.children then
        for i, j in a1.children do
            table.insert(v1, j)
        end
    end
    return createElement("Frame", {
        BorderSizePixel = 0,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = a1.BackgroundTransparency or 0,
        LayoutOrder = a1.LayoutOrder,
    }, v1)
end