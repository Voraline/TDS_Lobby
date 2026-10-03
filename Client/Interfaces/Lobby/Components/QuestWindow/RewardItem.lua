-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.RewardItem
-- Decompile time: 3.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ItemPreview = require(ReplicatedStorage.Client.Interfaces.Components.ItemPreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local QuestViewModels = require(script.Parent.QuestViewModels)
local createElement = React.createElement
local textStroke = StudioElements.textStroke
return function(a1) -- Line: 20
    -- upvalues: QuestViewModels (val), createElement (val), ItemPreview (val), textStroke (val), Tooltip (val)
    local v1 = QuestViewModels.toRewardItemProps(a1.Reward, a1.LayoutOrder or 0)
    local RewardName = v1.RewardName
    local RewardValue = v1.RewardValue
    local v2 = v1.RewardNametag ~= nil
    local v3 = true
    if v1.RewardType ~= "tower" then
        v3 = true
        if v1.RewardType ~= "crates" then
            v3 = true
            if v1.RewardType ~= "nametag" then
                v3 = v1.RewardType == "tag"
            end
        end
    end
    local v4 = if v3 then nil else if RewardValue == "" then nil else if RewardValue == RewardName then nil else RewardValue
    local TooltipKey = a1.TooltipKey or ("QuestReward_%*_%*_%*"):format(v1.RewardType or "reward", a1.LayoutOrder or 0, (tostring(a1.Reward)))
    local v5 = a1.PreviewScale or 1
    local v6 = 0.9856 * v5
    local v7 = math.min(0.94, 0.7296 * v5)
    local v8 = {
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.new(0.3889, 0, 1.5455, 0),
    }
    local v9 = {}
    local v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(v6, 0, v7, 0),
    }
    local v11 = {AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
    v11.Background = createElement("ImageLabel", {
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        Image = "rbxassetid://85205412837336",
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(90, 90, 90),
        Position = UDim2.new(0.5, 0, 0.4901, 0),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.new(1.5962, 0, 1.6139, 0),
    })
    v11.Nametag = if not v2 then nil else createElement(ItemPreview, {
        Flat = true,
        HidePreviewText = true,
        IgnoreAnimation = true,
        IgnoreShadow = true,
        PauseAnimation = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        CameraOffset = CFrame.new(0, 3.6, 40),
        Position = UDim2.fromScale(0.5, 0.48),
        Preview = {
            Type = "Tags",
            Item = v1.RewardNametag,
            Position = UDim2.fromScale(0.5, 0.15),
            Size = UDim2.fromScale(1, 0.15),
        },
        Size = UDim2.fromScale(1, 1),
    })
    v11.Icon = if not v1.RewardIcon then if v2 then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.72, 0.52),
        Text = string.upper((string.sub(v1.RewardType or "?", 1, 1))),
        TextColor3 = Color3.fromRGB(245, 245, 245),
    }, {
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 22, MinTextSize = 8}),
    }) else if not v2 then createElement("ImageLabel", {
        BackgroundTransparency = 0.999,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(163, 162, 165),
        Image = v1.RewardIcon,
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.new(0.8678, 0, 0.8678, 0),
    }) else if v2 then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.72, 0.52),
        Text = string.upper((string.sub(v1.RewardType or "?", 1, 1))),
        TextColor3 = Color3.fromRGB(245, 245, 245),
    }, {
        TextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 22, MinTextSize = 8}),
    })
    v11.QuantityLabel = if not a1.ShowQuantity or v1.RewardValue == "" or v2 then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 1),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.new(0.5, 0, 1, 1),
        Size = UDim2.new(1.1, 0, 0.24, 0),
        Text = v1.RewardValue,
        TextColor3 = Color3.fromRGB(255, 255, 255),
    }, {Stroke = textStroke({Transparency = 0.35, Color = Color3.fromRGB(0, 0, 0)})})
    v9.Item = createElement("Frame", v10, v11)
    v9.Tooltip = if RewardName == "" then nil else createElement(Tooltip, {Header = RewardName, Name = TooltipKey, Subject = v4})
    return createElement("Frame", v8, v9)
end