-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.PlayFooter
-- Decompile time: 4.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 12 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(9, 9, 9),
        Position = UDim2.fromScale(0.293, 0.842),
        Size = UDim2.fromScale(0.693, 0.128),
    }
    local v2 = {
        XPMultiplier = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "XP Multiplier: 1X",
            TextSize = 30,
            TextWrapped = true,
            Position = UDim2.fromScale(0.033, 0.258),
            Size = UDim2.fromScale(0.377, 0.461),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 193, 69),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            UIStroke = createElement("UIStroke", {
                Thickness = 0.05,
                Color = Color3.fromRGB(69, 41, 9),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        }),
    }
    v2.Stats = createElement("Frame", {BackgroundTransparency = 1, BorderSizePixel = 0, Size = UDim2.fromScale(1, 1)}, {
        UIListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.03, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        UIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.003, 0),
            PaddingLeft = UDim.new(0.033, 0),
            PaddingRight = UDim.new(0.033, 0),
            PaddingTop = UDim.new(0.02, 0),
        }),
    })
    local v3 = {AnchorPoint = Vector2.new(0.5, 0.5)}
    local v4 = a1.enabled and Color3.fromRGB(80, 255, 86) or Color3.fromRGB(90, 90, 90)
    v3.BackgroundColor3 = v4
    v3.Position = UDim2.fromScale(0.815, 0.5)
    v3.Size = UDim2.fromScale(0.312, 0.628)
    v3.Active = a1.enabled
    v3.AutoButtonColor = a1.enabled
    v3.Selectable = a1.enabled

    v3[React.Event.Activated] = function() -- Line: 68 -- upvalues: a1 (val)
        if a1.enabled then
            a1.onPlay()
        end
    end

    v4 = {}
    local v5 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.619),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Heavy),
    }
    v5.Text = if not a1.enabled then "Locked" else "Play Level"
    v5.TextColor3 = Color3.fromRGB(255, 255, 255)
    local v6 = {}
    local v7 = {Thickness = 2}
    local v8 = a1.enabled and Color3.fromRGB(40, 68, 17) or Color3.fromRGB(50, 50, 50)
    v7.Color = v8
    v7.LineJoinMode = Enum.LineJoinMode.Bevel
    v6.UIStroke = createElement("UIStroke", v7)
    v4.TextLabel = createElement("TextLabel", v5, v6)
    v4.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 4.59})
    v4.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.062, 0)})
    v4.UIGradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(130, 130, 130)),
    })
    v5 = {Thickness = 2}
    v6 = a1.enabled and Color3.fromRGB(62, 244, 69) or Color3.fromRGB(50, 50, 50)
    v5.Color = v6
    v4.UIStroke = createElement("UIStroke", v5)
    v2.Play = createElement("ImageButton", v3, v4)
    v2.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.1, 0)})
    v2.UIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})
    return createElement("Frame", v1, v2)
end