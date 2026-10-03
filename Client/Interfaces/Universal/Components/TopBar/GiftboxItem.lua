-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.GiftboxItem
-- Decompile time: 2.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val), React (val) -- types: a1: table
    local sender = a1.sender
    local v1 = {
        BackgroundTransparency = 0,
        Image = ("rbxassetid://%*"):format(a1.cover or 9361085943),
        ImageColor3 = Color3.fromRGB(107, 107, 107),
        ScaleType = Enum.ScaleType.Crop,
        Size = UDim2.new(1, 0, 0, 100),
        LayoutOrder = a1.layoutOrder,
    }
    local v2 = {
        stroke = createElement("UIStroke", {Thickness = 1, Transparency = 0.85, Color = Color3.fromRGB(255, 255, 255)}),
        reward = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 4, 0.5, 0),
            Size = UDim2.fromOffset(96, 96),
        }, {
            glow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://5948620849",
                ZIndex = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }, {aspect = createElement("UIAspectRatioConstraint")}),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = ("rbxassetid://%*"):format(a1.rewardIcon or 9378098303),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(1, 1),
            }),
        }),
        sender = createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = false,
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0.5, 44, 0, 6),
            Size = UDim2.fromOffset(180, 16),
            Text = sender or "",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Visible = sender ~= nil,
        }, {
            stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
            size = createElement("UITextSizeConstraint", {MaxTextSize = 16, MinTextSize = 8}),
        }),
        value = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.new(0.5, 44, 0, if not sender then 18 else 26),
            Size = UDim2.fromOffset(180, 24),
            Text = a1.reward,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
            size = createElement("UITextSizeConstraint", {MaxTextSize = 20, MinTextSize = 8}),
        }),
    }
    local v3 = createElement
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 44, 1, -28),
        Size = UDim2.fromOffset(140, 40),
    }
    local v5 = {}
    local v6 = createElement
    local v7 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutoButtonColor = true,
        BackgroundTransparency = 1,
        Image = "rbxassetid://8429088937",
        ImageColor3 = Color3.fromRGB(255, 170, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.fromScale(1, 1),
        SliceCenter = Rect.new(8, 8, 152, 32),
    }

    v7[React.Event.Activated] = function() -- Line: 130 -- upvalues: a1 (val)
        if a1.onClaim then
            a1.onClaim()
        end
    end

    v5.button = v6("ImageButton", v7, {
        layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Text = "Claim",
            TextScaled = true,
            TextWrapped = true,
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.new(0, 0, 0.5, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
        }),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://6031091004",
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.5, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
    })
    v2.buttonFrame = v3("Frame", v4, v5)
    return createElement("ImageLabel", v1, v2)
end