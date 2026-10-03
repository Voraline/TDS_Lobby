-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PVP.PVPLeaderboardCard
-- Decompile time: 3.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local memo = React.memo
local u25 = memo(function(a1) -- Line: 25 -- upvalues: createElement (val), ImageLabel (val)
    return createElement("Frame", {
        BackgroundTransparency = 0.45,
        ZIndex = 0,
        BackgroundColor3 = Color3.fromRGB(195, 24, 24),
        Position = UDim2.fromScale(0.623333, 0),
        Size = UDim2.fromScale(0.378, 1),
    }, {
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.424419, 1),
                NumberSequenceKeypoint.new(0.588795, 0.7875),
                NumberSequenceKeypoint.new(0.70666, 0.6625),
                (NumberSequenceKeypoint.new(1, 0.3)),
            }),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0666667, 0)}),
        rankIcon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = ("rbxassetid://%*"):format(a1.rankIcon or 79552995243967),
            Position = UDim2.fromScale(0.6, 0),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.new(0.35, 9, 0.63, 0),
        }),
    })
end)
local u28 = memo(function(a1) -- Line: 57 -- upvalues: createElement (val)
    local v1 = {BackgroundTransparency = 1}
    local size = a1.size or UDim2.fromScale(0.5, 0.8)
    v1.Size = size
    v1.LayoutOrder = a1.layoutOrder
    return createElement("Frame", v1, {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0.06, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        name = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(0.5, 1),
            Text = a1.name,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Right,
        }),
        value = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            LayoutOrder = 2,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(0.5, 1),
            Text = a1.value,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
    })
end)
local u31 = memo(function(a1) -- Line: 103 -- upvalues: createElement (val)
    return createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(26, 26, 26),
        Position = UDim2.fromScale(0.5, 1.05),
        Size = UDim2.fromScale(1, 0.333),
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)}),
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.75}),
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }, a1.children or {})
end)
return memo(function(a1) -- Line: 128
    -- upvalues: createElement (val), u31 (val), u28 (val), Comma (val), u25 (val), ImageLabel (val)
    local v1 = {BackgroundColor3 = Color3.fromRGB(38, 38, 38)}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.65, 0.5)
    v1.Position = position
    local size = a1.size or UDim2.fromScale(0.857143, 0.75)
    v1.Size = size
    local v2 = {
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(163, 163, 163)}),
        corner = createElement("UICorner", {CornerRadius = UDim.new(0.0667, 0)}),
        stats = createElement(u31, {}, {
            wins = createElement(u28, {name = "Wins", layoutOrder = 0, value = Comma(a1.wins or 0)}),
            losses = createElement(u28, {name = "Losses", layoutOrder = 1, value = Comma(a1.losses or 0)}),
        }),
        rank = createElement(u25, {rankIcon = a1.rankIcon}),
        blur = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://96286062923748",
            ZIndex = 0,
            ImageColor3 = Color3.fromRGB(163, 163, 163),
            Size = UDim2.fromScale(1, 1),
        }),
        playerBackground = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://82300031097737",
            ZIndex = 0,
            ImageColor3 = Color3.fromRGB(131, 131, 131),
            Position = UDim2.fromOffset(-2, -2),
            Size = UDim2.fromScale(0.228, 1.04),
        }),
        playerHeadshot = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 0,
            Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=352&h=352"):format(a1.userId or 19004289),
            Position = UDim2.fromScale(0.01, -0.06),
            Size = UDim2.fromScale(0.19, 0.19),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            ScaleType = Enum.ScaleType.Fit,
        }),
    }
    local v3 = {
        BackgroundTransparency = 1,
        TextSize = 18,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.23, 0.2),
        Size = UDim2.fromScale(0.74, 0.24),
    }
    local displayName = a1.displayName or a1.userName or "Player"
    v3.Text = displayName
    v3.TextColor3 = Color3.new(1, 1, 1)
    v3.TextXAlignment = Enum.TextXAlignment.Left
    v2.displayName = createElement("TextLabel", v3, {stroke = createElement("UIStroke", {Thickness = 2})})
    v2.userName = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 14,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.23, 0.45),
        Size = UDim2.fromScale(0.6, 0.18),
        Text = ("@%*"):format(a1.userName or "Player"),
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {stroke = createElement("UIStroke", {Thickness = 2})})
    return createElement("Frame", v1, v2)
end)