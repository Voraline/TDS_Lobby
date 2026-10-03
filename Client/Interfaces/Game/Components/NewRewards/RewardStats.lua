-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardStats
-- Decompile time: 3.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 17 -- upvalues: ReactFlow (val), createElement (val), React (val) -- types: a1: table
    local v1, u5 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.6, speed = 34})
    local v2 = {
        BackgroundTransparency = 0.1,
        BackgroundColor3 = Color3.fromRGB(9, 9, 9),
        Position = UDim2.fromScale(0.58871, 0.119298),
        Size = UDim2.fromScale(0.391577, 0.84386),
    }
    local v3 = {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0183066, 0)})}
    v3.uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.new(1, 1, 1)})
    local v4 = createElement
    local v5 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v6 = {
        uIListLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.0735875, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    local v7 = createElement
    local v8 = {PaddingTop = UDim.new(0, 12)}
    v6.uIPadding = v7("UIPadding", v8)
    v3.stats = v4("Frame", v5, v6, a1.children)
    if not a1.stars then
        v4 = nil
    else
        v5 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.93),
            Size = UDim2.fromScale(0.85, 0.12),
        }
        v6 = {
            uIListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0.04, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }
        v8 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Image = "rbxassetid://17368097932",
            Size = UDim2.fromScale(0.5, 1),
        }
        local v9 = 1 <= a1.stars and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(60, 60, 60)
        v8.ImageColor3 = v9
        v8.ScaleType = Enum.ScaleType.Fit
        v6.star1 = createElement("ImageLabel", v8, {UIAspectRatio = createElement("UIAspectRatioConstraint")})
        v8 = {
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            Image = "rbxassetid://17368097932",
            Size = UDim2.fromScale(0.5, 1),
        }
        v9 = 2 <= a1.stars and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(60, 60, 60)
        v8.ImageColor3 = v9
        v8.ScaleType = Enum.ScaleType.Fit
        v6.star2 = createElement("ImageLabel", v8, {UIAspectRatio = createElement("UIAspectRatioConstraint")})
        v8 = {
            LayoutOrder = 3,
            BackgroundTransparency = 1,
            Image = "rbxassetid://17368097932",
            Size = UDim2.fromScale(0.5, 1),
        }
        v9 = 3 <= a1.stars and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(60, 60, 60)
        v8.ImageColor3 = v9
        v8.ScaleType = Enum.ScaleType.Fit
        v6.star3 = createElement("ImageLabel", v8, {UIAspectRatio = createElement("UIAspectRatioConstraint")})
        v4 = createElement("Frame", v5, v6) or nil
    end
    v3.starRating = v4
    v4 = createElement
    v5 = {
        Visible = a1.adVisible or false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(80, 255, 86),
        ImageColor3 = Color3.fromRGB(89, 255, 186),
        Position = UDim2.fromScale(0.78, 0.925),
        ScaleType = Enum.ScaleType.Tile,
        Selectable = false,
        Size = UDim2.fromScale(0.416476, 0.122548),
        TileSize = UDim2.fromOffset(45, 45),
        Active = true,
    }

    v5[React.Event.Activated] = function() -- Line: 120 -- upvalues: a1 (val)
        if a1.adClicked then
            a1.adClicked()
        end
    end

    v5[React.Event.MouseEnter] = function() -- Line: 126 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v5[React.Event.MouseLeave] = function() -- Line: 131 -- upvalues: u5 (val)
        u5({target = 1})
    end

    v5[React.Event.MouseButton1Down] = function() -- Line: 136 -- upvalues: u5 (val)
        u5({target = 0.9})
    end

    v5[React.Event.MouseButton1Up] = function() -- Line: 141 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v3.adVideoButton = v4("ImageButton", v5, {
        UIScale = createElement("UIScale", {Scale = v1}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0615385, 0)}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(62, 244, 69)}),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.69599, 0.493487),
            Size = UDim2.fromScale(0.653517, 0.809637),
            Text = a1.adText or "N/A",
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            uIStroke = createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(40, 68, 17),
                LineJoinMode = Enum.LineJoinMode.Bevel,
            }),
        }),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://128891223142774",
            Position = UDim2.fromScale(-0.253872, -0.604506),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.717923, 1.59175),
        }),
    })
    return createElement("Frame", v2, v3)
end)