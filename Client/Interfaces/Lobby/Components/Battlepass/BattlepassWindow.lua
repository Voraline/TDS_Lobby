-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassWindow
-- Decompile time: 6.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local useMediaQuery = require(Hooks.useMediaQuery)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useBinding = React.useBinding
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 15
    -- upvalues: useBinding (val), useTransparencyModifier (val), createElement (val), useMediaQuery (val)
    -- upvalues: ImageLabel (val)
    local title = a1.title
    local subTitle = a1.subTitle
    local render = a1.render
    local Transparency = a1.Transparency or useBinding(0)
    local v1 = useTransparencyModifier(Transparency)
    local v2 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    local BackgroundColor3 = a1.BackgroundColor3 or Color3.fromRGB(0, 0, 0)
    v2.BorderColor3 = BackgroundColor3
    local size = if not a1.size then (useMediaQuery("large", true)):map(function(a1) -- Line: 31
        return a1 and UDim2.fromScale(0.475, 0.574) or UDim2.fromScale(0.4, 0.4)
    end) else a1.size
    v2.Size = size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v2.Position = Position
    v2.Visible = a1.Visible
    local v3 = {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio or 1.65}),
    }
    v3.sizeConstraint = if not a1.disableSizeConstraint then createElement("UISizeConstraint", {MaxSize = Vector2.new(a1.MaxSize or 900, (1 / 0))}) else nil
    v3.content = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 4,
        Size = UDim2.fromScale(1, 1),
        ClipsDescendants = a1.ClipsDescendants,
    }, nil, a1.children or {})
    v3.bG = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://93677620891960",
        disableSpinner = true,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = Transparency,
        Position = UDim2.fromScale(0.5, 0.509),
        Size = UDim2.fromScale(1.13, 1.21),
    })
    local v4 = createElement
    local v5 = ImageLabel
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = ("rbxassetid://%*"):format(render or 15695044073),
        ImageTransparency = v1(a1.renderTransparency or 0.8),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Crop,
        Size = UDim2.fromScale(1, 0.996),
    }
    v3.bGRender = v4(v5, v6, {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0217, 0)})})
    if not title then
        v4 = nil
    else
        v6 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 3,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        }
        local titlePosition = a1.titlePosition or UDim2.fromScale(0.035, 0.03)
        v6.Position = titlePosition
        local titleSize = a1.titleSize or UDim2.fromScale(0.622, 0.111)
        v6.Size = titleSize
        v6.Text = title
        v6.TextColor3 = Color3.fromRGB(255, 255, 255)
        v6.TextTransparency = Transparency
        v6.TextXAlignment = Enum.TextXAlignment.Left
        v4 = createElement("TextLabel", v6) or nil
    end
    v3.title = v4
    if not subTitle then
        v4 = nil
    else
        v6 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 3,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        }
        local subTitlePosition = a1.subTitlePosition or UDim2.fromScale(0.0734, 0.162)
        v6.Position = subTitlePosition
        local subTitleSize = a1.subTitleSize or UDim2.fromScale(0.452, 0.0664)
        v6.Size = subTitleSize
        v6.Text = subTitle
        v6.TextColor3 = Color3.fromRGB(255, 255, 255)
        v6.TextTransparency = v1(0.4)
        v6.TextXAlignment = Enum.TextXAlignment.Left
        v4 = createElement("TextLabel", v6) or nil
    end
    v3.subTitle = v4
    if not subTitle or a1.disableIcon then
        v4 = nil
    else
        v6 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://82991540492128",
            disableSpinner = true,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = Transparency,
        }
        local iconPosition = a1.iconPosition or UDim2.fromScale(0.0354, 0.196)
        v6.Position = iconPosition
        local iconSize = a1.iconSize or UDim2.fromScale(0.0282, 0.0475)
        v6.Size = iconSize
        v6.ScaleType = Enum.ScaleType.Fit
        v4 = createElement(ImageLabel, v6) or nil
    end
    v3.icon = v4
    return createElement("Frame", v2, v3)
end))