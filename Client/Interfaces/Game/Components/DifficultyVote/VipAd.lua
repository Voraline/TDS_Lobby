-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.VipAd
-- Decompile time: 2.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useGamepass)
local createElement = React.createElement
return function(a1) -- Line: 7 -- upvalues: useGamepass (val), createElement (val), React (val)
    local u3, u4 = useGamepass(10518590)
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 0, 1, 45),
        Size = UDim2.new(1, 0, 0, 40),
        Visible = not u3 and not a1.voteCompleted,
    }
    local v2 = {
        textLabel = createElement("TextLabel", {
            RichText = true,
            Text = "<b><font color=\"rgb(255,148,58)\">[VIP]</font></b> users get <b>x2</b> extra votes!",
            TextSize = 18,
            TextStrokeTransparency = 0,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(0, 40),
        }),
    }
    local v3 = createElement
    local v4 = {
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = ("%* 350"):format((utf8.char(57346))),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(85, 255, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(105.60000000000001, 26.400000000000002),
    }

    v4[React.Event.Activated] = function() -- Line: 55 -- upvalues: u3 (val), u4 (val)
        if u3 then
            return
        end
        u4()
    end

    v2.textButton = v3("TextButton", v4, {
        uIStroke15 = createElement("UIStroke", {Thickness = 2}),
        uICorner8 = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        borderStroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
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