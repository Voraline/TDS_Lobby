-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Ready
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local Event = React.Event
return function(a1) -- Line: 7 -- upvalues: createElement (val), Event (val)
    local function updateReadyText() -- Line: 8 -- upvalues: a1 (val)
        if a1.readyCount then
            return (("Ready? (%*/%*)"):format(a1.readyCount, a1.playerCount))
        end
        return (("Ready? (0/%*)"):format(a1.playerCount))
    end

    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 1, -10),
        Size = UDim2.new(1, 0, 0, 20),
        Visible = a1.readyVisible,
    }
    local v2 = {}
    local v3 = {
        TextSize = 34,
        TextStrokeTransparency = 0,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
    }
    local v4 = if not a1.readyCount then ("Ready? (0/%*)"):format(a1.playerCount) else ("Ready? (%*/%*)"):format(a1.readyCount, a1.playerCount)
    v3.Text = v4
    v3.TextColor3 = Color3.fromRGB(255, 255, 255)
    v3.AutomaticSize = Enum.AutomaticSize.X
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v3.Size = UDim2.fromOffset(0, 42)
    v2.textLabel = createElement("TextLabel", v3, {uIStroke = createElement("UIStroke", {Thickness = 2})})
    local v5 = createElement
    v3 = {
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(118, 118, 118),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(50, 50),
    }

    v3[Event.Activated] = function() -- Line: 65 -- upvalues: a1 (val)
        if a1.OnClick then
            a1.OnClick()
        end
    end

    v2.readyButton = v5("TextButton", v3, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        borderStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(56, 56, 56),
        }),
        imageLabel = createElement("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=12289762618",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.6, 0.6),
        }),
    })
    v2.uIListLayout = createElement("UIListLayout", {
        Padding = UDim.new(0, 16),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    return createElement("Frame", v1, v2)
end