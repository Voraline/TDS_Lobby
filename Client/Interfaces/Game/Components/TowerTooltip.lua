-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerTooltip
-- Decompile time: 2.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local TowerAmmo = require(ReplicatedStorage.Client.Interfaces.Game.Components.TowerAmmo)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), useScale (val), TowerAmmo (val)
    local v1 = a1.Level or 0
    local v2 = a1.Name or "Minigunner"
    local v3 = if not a1.Owner then "Your" else a1.Owner .. "'s"
    local v4 = a1.Ammo or 0
    local v5 = a1.MaxAmmo or 0
    local v6 = {BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(44, 44, 44)}
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v6.Position = Position
    local Size = a1.Size or UDim2.fromOffset(224, 52)
    v6.Size = Size
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 1)
    v6.AnchorPoint = AnchorPoint
    local v7 = {scale = createElement("UIScale", {Scale = useScale(1.5)})}
    local v8 = {
        RichText = true,
        TextSize = 18,
        TextStrokeTransparency = 0,
        BackgroundTransparency = 0.4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = string.format("<u>%s Tower</u>", v3),
    }
    local v9 = a1.Owner and Color3.fromRGB(255, 166, 0) or Color3.fromRGB(142, 219, 255)
    v8.TextColor3 = v9
    v8.TextXAlignment = Enum.TextXAlignment.Left
    v8.AutomaticSize = Enum.AutomaticSize.X
    v8.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v8.Size = UDim2.new(0, 0, 0.5, -2)
    v7.owner = createElement("TextLabel", v8, {
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
        }),
        borderStroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
    })
    v7.textLabel = createElement("TextLabel", {
        RichText = true,
        TextSize = 18,
        TextStrokeTransparency = 0,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = string.format("%s | <font color=\"#55aaff\">Lv. %d</font>", v2, v1),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(0, 0, 0.5, -2),
    }, {
        uIPadding1 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
        }),
        borderStroke1 = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
        ammo = createElement(TowerAmmo, {
            Ammo = v4,
            MaxAmmo = v5,
            Size = UDim2.new(1, 0, 0, 16),
            Position = UDim2.new(0, 0, 1, 8),
            AnchorPoint = Vector2.new(0, 0),
        }),
    })
    return createElement("Frame", v6, v7)
end