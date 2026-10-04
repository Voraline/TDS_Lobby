-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.Items
-- Decompile time: 12.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Previews = Components.Previews
local CharmPreview = require(Previews.CharmPreview)
local ConsumablePreview = require(Previews.ConsumablePreview)
local CrateDisplayName = require(ReplicatedStorage.Client.Interfaces.CrateDisplayName)
local CratePreview = require(Previews.CratePreview)
local EmotePreview = require(Previews.EmotePreview)
local FlairPreview = require(Previews.FlairPreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local StickerPreview = require(Previews.StickerPreview)
local TagPreview = require(Previews.TagPreview)
local TextLabel = require(Components.TextLabel)
local TowerPreview = require(Previews.TowerPreview)
local Change = React.Change
local createElement = React.createElement
local memo = React.memo
local useState = React.useState

local function getItemDisplayName(a1) -- Line: 27 -- upvalues: CrateDisplayName (val)
    if type(a1.DisplayName) == "string" and a1.DisplayName ~= "" then
        return a1.DisplayName
    end
    if a1.Type == "crate" then
        return CrateDisplayName.withSuffix(a1.Name)
    end
    return a1.Name or "Minigunner"
end

local u57 = memo(function(a1) -- Line: 37
    -- upvalues: CrateDisplayName (val), createElement (val), EmotePreview (val), TowerPreview (val), CratePreview (val)
    -- upvalues: CharmPreview (val), StickerPreview (val), ConsumablePreview (val), TagPreview (val), FlairPreview (val)
    -- upvalues: TextLabel (val)
    local Type = a1.Type
    local DisplayName_2 = if type(a1.DisplayName) ~= "string" then if a1.Type ~= "crate" then a1.Name or "Minigunner" else CrateDisplayName.withSuffix(a1.Name) else if a1.DisplayName == "" then if a1.Type ~= "crate" then a1.Name or "Minigunner" else CrateDisplayName.withSuffix(a1.Name) else a1.DisplayName
    local v1 = nil
    if Type == "emote" then
        v1 = createElement(EmotePreview, {
            ZIndex = 2,
            playing = false,
            Size = UDim2.fromScale(1.25, 1.25),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    elseif Type == "tower" or Type == "skin" then
        v1 = createElement(TowerPreview, {
            ZIndex = 2,
            Size = UDim2.fromScale(1.25, 1.25),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            tower = a1.Name,
            skin = a1.Skin or "Default",
            icon = a1.Icon,
        })
    elseif Type == "crate" then
        v1 = createElement(CratePreview, {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    elseif Type == "charm" then
        v1 = createElement(CharmPreview, {
            ZIndex = 2,
            Size = UDim2.fromScale(1.25, 1.25),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    elseif Type == "sticker" then
        v1 = createElement(StickerPreview, {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    elseif Type == "consumable" then
        v1 = createElement(ConsumablePreview, {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    elseif Type == "nametag" then
        v1 = createElement(TagPreview, {
            ZIndex = 2,
            playing = false,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    elseif Type == "flair" then
        v1 = createElement(FlairPreview, {
            ZIndex = 2,
            playing = false,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ImageTransparency = a1.transparency or 0,
            name = a1.Name,
        })
    end
    local v2 = {
        BorderSizePixel = 0,
        Text = "",
        BackgroundColor3 = Color3.fromRGB(0, 68, 50),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Size = a1.Size or UDim2.new(0.3, 0, 0, 160)
    v2.Size = Size
    v2.BackgroundTransparency = a1.transparency
    local v3 = {
        innerGlow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://85104292402513",
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = Color3.fromRGB(0, 170, 127),
            ImageTransparency = a1.transparency:map(function(a1) -- Line: 145
                return math.map(a1, 0, 1, 0.25, 1)
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = -90,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        }),
        uICorner1 = createElement("UICorner"),
        uIGradient1 = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(89, 89, 89))),
            }),
        }),
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(0, 170, 127),
            Transparency = a1.transparency,
        }),
        icon = v1,
    }
    local Details = a1.Details and createElement(TextLabel, {
        FontWeight = "SemiBold",
        ZIndex = 2,
        RichText = true,
        StrokeThickness = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.889),
        Size = UDim2.fromScale(0.95, 0.111),
        Text = a1.Details,
        TextColor3 = Color3.fromRGB(199, 199, 199),
        TextTransparency = a1.transparency,
        StrokeTransparency = a1.transparency,
    }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 17})})
    v3.details = Details
    v3.title = if a1.Type == "nametag" then nil else createElement(TextLabel, {
        TextScaled = true,
        ZIndex = 3,
        StrokeThickness = 2,
        FontWeight = "SemiBold",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.739),
        Size = UDim2.fromScale(0.95, 0.15),
        Text = DisplayName_2,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextTransparency = a1.transparency,
        StrokeTransparency = a1.transparency,
    }, {uITextSizeConstraint1 = createElement("UITextSizeConstraint", {MaxTextSize = 24})})
    local v4 = {
        TextScaled = true,
        ZIndex = 2,
        StrokeThickness = 2,
        FontWeight = "SemiBold",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.02),
        Size = UDim2.fromScale(1, 0.152),
        Text = a1.Rarity,
    }
    local RarityColor = a1.RarityColor or Color3.fromRGB(85, 255, 127)
    v4.TextColor3 = RarityColor
    v4.TextTransparency = a1.transparency
    v4.StrokeTransparency = a1.transparency
    v3.rarity = createElement(TextLabel, v4, {uITextSizeConstraint2 = createElement("UITextSizeConstraint", {MaxTextSize = 24})})
    v3.uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint")
    v3.uITextSizeConstraint3 = createElement("UITextSizeConstraint", {MaxTextSize = 14})
    return createElement("TextButton", v2, v3)
end)
return function(a1) -- Line: 250
    -- upvalues: useState (val), createElement (val), u57 (val), Sift (val), Change (val), React (val)
    local merge, v1, v2, v3
    local v4 = {}
    local u4, u5 = useState(0)
    for i, j in a1.Items do
        v1 = createElement
        v2 = u57
        merge = Sift.Dictionary.merge
        v3 = {transparency = a1.Transparency}
        v1 = v1(v2, (merge(j, v3)))
        table.insert(v4, v1)
    end
    local v5 = createElement
    local v6 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, u4),
        LayoutOrder = a1.LayoutOrder,
    }
    local v7 = {}
    local v8 = createElement
    v1 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
        ItemLineAlignment = Enum.ItemLineAlignment.Center,
        Padding = UDim.new(0.02, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Wraps = true,
    }

    v1[Change.AbsoluteContentSize] = function(a1) -- Line: 283 -- upvalues: u4 (val), u5 (val) -- types: a1: userdata
        local v1 = a1.AbsoluteContentSize.Y + 10 + 10
        if v1 ~= u4 then
            u5(v1)
        end
    end

    v7.listLayout = v8("UIListLayout", v1)
    v7.padding = createElement("UIPadding", {PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10)})
    v7[1] = createElement(React.Fragment, nil, v4)
    return v5("Frame", v6, v7)
end