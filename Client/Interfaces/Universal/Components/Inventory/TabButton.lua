-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.TabButton
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 15 -- upvalues: ReactFlow (val), createElement (val), React (val) -- types: a1: table
    local v1, u5 = ReactFlow.useSpring({start = 1, target = 1, damper = 0.6, speed = 30})
    local v2 = createElement
    local v3 = {
        BackgroundTransparency = 0.6,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(),
        Position = UDim2.fromScale(0.63, 0.5),
        Size = UDim2.fromScale(0.13, 0.67),
    }
    local v4 = {
        uIScale = createElement("UIScale", {Scale = v1}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.258065, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(65, 78, 93)}),
        holder = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            textLabel = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(-0.125032, 0.5),
                Size = UDim2.fromScale(0, 0.5),
                Text = a1.text,
                TextColor3 = Color3.new(1, 1, 1),
            }),
            uIListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0.03, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            imageLabel = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = -1,
                AnchorPoint = Vector2.new(0, 0.5),
                Image = ("rbxassetid://%*"):format(a1.icon),
                Position = UDim2.fromScale(0.0770532, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(0.4, 3),
            }),
        }),
    }
    local v5 = createElement
    local v6 = {
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextColor3 = Color3.new(),
        Selectable = true,
        Active = true,
    }

    v6[React.Event.Activated] = function() -- Line: 93 -- upvalues: a1 (val)
        a1.onClick()
    end

    v6[React.Event.MouseButton1Down] = function() -- Line: 96 -- upvalues: u5 (val)
        u5({target = 0.9})
    end

    v6[React.Event.MouseButton1Up] = function() -- Line: 101 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v6[React.Event.MouseEnter] = function() -- Line: 106 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v6[React.Event.MouseLeave] = function() -- Line: 112 -- upvalues: u5 (val)
        u5({target = 1})
    end

    v4.textButton = v5("TextButton", v6)
    return v2("Frame", v3, v4)
end)