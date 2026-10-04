-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Navbar
-- Decompile time: 3.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
return function(a1) -- Line: 16 -- upvalues: useState (val), createElement (val), React (val)
    local v1, u4 = useState(Vector2.zero)
    local v2 = a1.Scale or 1
    local v3 = {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = a1.Position,
        Size = a1.Size + UDim2.fromOffset(v1.X / v2, 0),
    }
    local v4 = {(React.createElement(React.Fragment, {}, a1.children or {}))}
    local v5 = createElement
    local v6 = {
        Padding = UDim.new(0.05, 0),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }

    v6[React.Change.AbsoluteContentSize] = function(a1) -- Line: 38 -- upvalues: u4 (val) -- types: a1: userdata
        u4(a1.AbsoluteContentSize + Vector2.new(12, 0))
    end

    v4.listLayout = v5("UIListLayout", v6)
    v4.corner = createElement("UICorner")
    v5 = createElement
    v6 = {
        Text = "",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        LayoutOrder = 6,
        Size = UDim2.fromScale(0.75, 0.75),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        Selectable = true,
    }
    v6[React.Event.Activated] = a1.OnExitActivated
    v4.exitButton = v5("TextButton", v6, {
        content = createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 60, 60),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            stroke = createElement("UIStroke", {
                Thickness = 2,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(168, 58, 58),
            }),
            icon3 = createElement("ImageLabel", {
                Image = "http://www.roblox.com/asset/?id=9674219565",
                BackgroundTransparency = 1,
                ImageColor3 = Color3.fromRGB(235, 235, 235),
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.545, 0.545),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
            }, {aspectRatio = createElement("UIAspectRatioConstraint")}),
        }),
    })
    return createElement("Frame", v3, v4)
end