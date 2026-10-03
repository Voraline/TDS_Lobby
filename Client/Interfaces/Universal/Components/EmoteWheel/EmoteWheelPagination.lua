-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel.EmoteWheelPagination
-- Decompile time: 2.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 16 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = a1.page or 0
    local v2 = a1.maxPages or 0
    local v3 = a1.transparency:map(function(a1) -- Line: 21
        return 1 - a1
    end)
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.2, 0.2),
    }
    local v5 = false
    if v2 > 1 then
        v5 = v1 > 0
    end
    v4.Visible = v5
    v5 = {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        textLabel = createElement("TextLabel", {
            Text = "Page",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.375),
            Size = UDim2.fromScale(1.25, 0.2),
        }, {
            uIStroke = createElement("UIStroke", {
                Thickness = 4,
                Transparency = a1.transparency:map(function(a1) -- Line: 60
                    return 1 - 0.75 * a1
                end),
            }),
        }),
        textLabel1 = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = ("%*/%*"):format(v1, v2),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.625),
            Size = UDim2.fromScale(1.25, 0.2),
        }, {
            uIStroke1 = createElement("UIStroke", {
                Thickness = 4,
                Transparency = a1.transparency:map(function(a1) -- Line: 89
                    return 1 - 0.75 * a1
                end),
            }),
        }),
    }
    local v6 = createElement
    local v7 = {
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectOffset = Vector2.new(0, 550),
        ImageRectSize = Vector2.new(50, 50),
        ImageTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = v3,
        BackgroundColor3 = Color3.fromRGB(244, 244, 244),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(0.2, 0.2),
        ZIndex = 2,
    }

    v7[React.Event.MouseButton1Click] = function() -- Line: 109 -- upvalues: a1 (val)
        a1.onNextPage(false)
    end

    v5.previous = v6("ImageButton", v7, {
        uICorner = createElement("UICorner"),
        uIStroke2 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(159, 159, 159), Transparency = v3}),
        uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint"),
    })
    v6 = createElement
    v7 = {
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectOffset = Vector2.new(0, 500),
        ImageRectSize = Vector2.new(50, 50),
        ImageTransparency = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(244, 244, 244),
        BackgroundTransparency = v3,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        LayoutOrder = 2,
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.2, 0.2),
        ZIndex = 2,
    }

    v7[React.Event.MouseButton1Click] = function() -- Line: 138 -- upvalues: a1 (val)
        a1.onNextPage(true)
    end

    v5.next = v6("ImageButton", v7, {
        uICorner1 = createElement("UICorner"),
        uIStroke3 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(159, 159, 159), Transparency = v3}),
        uIAspectRatioConstraint2 = createElement("UIAspectRatioConstraint"),
    })
    return createElement("Frame", v4, v5)
end)