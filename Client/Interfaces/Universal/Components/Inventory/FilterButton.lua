-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.FilterButton
-- Decompile time: 2.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 15 -- upvalues: ReactFlow (val), createElement (val), React (val) -- types: a1: table
    local v1, u5 = ReactFlow.useSpring({start = 1, target = 1, damper = 0.6, speed = 30})
    local v2 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(21, 21, 21),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
    }
    local position = a1.position or UDim2.fromScale(0.512, 0.5)
    v2.Position = position
    local size = a1.size or UDim2.fromScale(0.67, 0.67)
    v2.Size = size
    v2.Text = ""
    v2.TextColor3 = Color3.new()
    v2.TextScaled = true
    v2.Selectable = true
    v2.Active = true

    v2[React.Event.MouseButton1Down] = function() -- Line: 35 -- upvalues: u5 (val)
        u5({target = 0.9})
    end

    v2[React.Event.MouseButton1Up] = function() -- Line: 40 -- upvalues: u5 (val), a1 (val)
        u5({target = 1.1})
        a1.onClick()
    end

    v2[React.Event.MouseEnter] = function() -- Line: 46 -- upvalues: u5 (val)
        u5({target = 1.1})
    end

    v2[React.Event.MouseLeave] = function() -- Line: 52 -- upvalues: u5 (val)
        u5({target = 1})
    end

    return createElement("TextButton", v2, {
        uIScale = createElement("UIScale", {Scale = v1}),
        aspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://120083696589185",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
        }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}),
        uICorner = createElement("UICorner"),
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(7, 7, 7),
        }),
    })
end)