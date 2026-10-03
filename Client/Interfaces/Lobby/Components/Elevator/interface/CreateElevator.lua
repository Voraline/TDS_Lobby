-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Elevator.interface.CreateElevator
-- Decompile time: 6.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ElevatorSizeButton = require(script.Parent.ElevatorSizeButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local createElement = React.createElement
local useMemo = React.useMemo
return function(a1) -- Line: 18
    -- upvalues: useMemo (val), Sift (val), createElement (val), ElevatorSizeButton (val), React (val)
    local v1 = useMemo
    local v2 = {a1.sizes, a1.size}
    v1 = v1(function() -- Line: 19 -- upvalues: Sift (upval), a1 (val), createElement (upval), ElevatorSizeButton (upval)
        return Sift.Array.map(a1.sizes, function(a1_2, a2) -- Line: 20 -- upvalues: createElement (upval), ElevatorSizeButton (upval), a1 (upval)
            return createElement(ElevatorSizeButton, {
                key = ("size-%*"):format(a1_2),
                size = a1_2,
                isSelected = a1_2 == a1.size,
                onClick = function() -- Line: 25 -- upvalues: a1 (upval), a1_2 (val)
                    a1.onSetSize(a1_2)
                end,
                native = {LayoutOrder = a2},
            })
        end)
    end, v2)
    local createElement_2 = React.createElement
    local v3 = {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.563, 0.4),
    }
    local v4 = {
        uIGradient = React.createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.1, 0.25),
                NumberSequenceKeypoint.new(0.3, 0),
                NumberSequenceKeypoint.new(0.7, 0),
                NumberSequenceKeypoint.new(0.9, 0.25),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        uIStroke = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(197, 197, 197)}, {
            uIGradient1 = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0),
                    NumberSequenceKeypoint.new(0.8, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    }
    local createElement_6 = React.createElement
    local v5 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(43, 235, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.85),
        Size = UDim2.fromScale(0.333, 0.15),
    }
    local v6 = {}
    local createElement_7 = React.createElement
    local v7 = {}
    v7[React.Event.MouseButton1Click] = a1.onCreate
    v7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
    v7.Text = ""
    v7.TextColor3 = Color3.fromRGB(0, 0, 0)
    v7.TextScaled = true
    v7.TextSize = 14
    v7.TextWrapped = true
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.BackgroundTransparency = 1
    v7.BorderColor3 = Color3.fromRGB(27, 42, 53)
    v7.Size = UDim2.fromScale(1, 1)
    v7.ZIndex = 4
    v6.button = createElement_7("TextButton", v7)
    v6.uIStroke1 = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(255, 255, 255)})
    v6.uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v6.textLabel = React.createElement("TextLabel", {
        Text = "CREATE",
        TextScaled = true,
        TextSize = 24,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.5, 0.5),
    }, {uIStroke2 = React.createElement("UIStroke", {Thickness = 2})})
    v6.dropShadow = React.createElement("ImageLabel", {
        Image = "rbxassetid://18610113607",
        BackgroundTransparency = 1,
        ZIndex = -1,
        ImageColor3 = Color3.fromRGB(170, 255, 127),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 8, 54, 54),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 16, 1, 16),
    })
    v6.innerGlow = React.createElement("ImageLabel", {
        Image = "rbxassetid://85104292402513",
        ImageTransparency = 0.5,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIGradient2 = React.createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
        uICorner1 = React.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
    })
    v4.create = createElement_6("Frame", v5, v6)
    local v8 = createElement
    v5 = {
        Text = "",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        LayoutOrder = 6,
        Size = UDim2.fromScale(0.15, 0.15),
        Position = UDim2.fromScale(0.895, 0.104),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        Selectable = true,
    }
    v5[React.Event.Activated] = a1.onLeave
    v4.exitButton = v8("TextButton", v5, {
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
    v4.frame = React.createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(26, 26, 26),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.0417),
        Size = UDim2.fromScale(0.417, 0.125),
    }, {
        textLabel1 = React.createElement("TextLabel", {
            Text = "Party Size",
            TextScaled = true,
            TextSize = 24,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.5, 0.6),
        }, {uIStroke3 = React.createElement("UIStroke", {Thickness = 2})}),
        uICorner2 = React.createElement("UICorner"),
        uIStroke4 = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(153, 153, 153)}),
    })
    v4.content = React.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.475),
        Size = UDim2.fromScale(1, 0.5),
    }, {
        uIListLayout = React.createElement("UIListLayout", {
            Padding = UDim.new(0, 32),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        buttons = createElement(React.Fragment, {}, v1),
    })
    v4.uIAspectRatioConstraint1 = React.createElement("UIAspectRatioConstraint", {AspectRatio = 2.2})
    v4.sizeConstraint = React.createElement("UISizeConstraint", {MaxSize = Vector2.new(550, 550)})
    return createElement_2("Frame", v3, v4)
end