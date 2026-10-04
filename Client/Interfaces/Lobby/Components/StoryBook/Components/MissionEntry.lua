-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.MissionEntry
-- Decompile time: 7.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local createElement = React.createElement
local u36 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.3508, 0.3944),
    NumberSequenceKeypoint.new(0.6011, 0.0111),
    (NumberSequenceKeypoint.new(1, 0)),
})
return function(a1) -- Line: 29 -- upvalues: NewMaps (val), createElement (val), React (val), u36 (val) -- types: a1: table
    local selected = a1.selected
    local locked = a1.locked
    local v1 = if not selected then Color3.fromRGB(157, 157, 157) else Color3.fromRGB(255, 255, 255)
    local v2 = "rbxassetid://138924286251630"
    local map = a1.map and NewMaps(a1.map)
    if map and map.ImageID then
        v2 = ("rbxassetid://%*"):format(map.ImageID)
    end
    local v3 = {
        BackgroundColor3 = Color3.fromRGB(36, 35, 32),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.985, 0.142),
        LayoutOrder = a1.layoutOrder,
        AutoButtonColor = not locked,
        Active = not locked,
        Selectable = not locked,
    }

    v3[React.Event.Activated] = function() -- Line: 51 -- upvalues: locked (val), a1 (val)
        if locked then
            return
        end
        if a1.onActivate then
            a1.onActivate()
        end
    end

    local v4 = {
        Preview = createElement("ImageLabel", {
            BorderSizePixel = 0,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(80, 80, 80),
            Position = UDim2.fromScale(0.299, 0),
            Size = UDim2.fromScale(0.7, 1),
            Image = v2,
            ScaleType = Enum.ScaleType.Crop,
        }, {
            UIGradient = createElement("UIGradient", {Transparency = u36}),
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.123, 0)}),
        }),
    }
    v4.MissionName = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.702, 0.371),
        Size = UDim2.fromScale(0.693, 0.411),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
        Text = a1.title,
        TextColor3 = v1,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, {
        UIStroke = createElement("UIStroke", {Thickness = 2}),
        UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 27}),
    })
    v4.SubLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.502, 0.676),
        Size = UDim2.fromScale(0.44, 0.411),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
        Text = a1.subtitle,
        TextColor3 = v1,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, {
        UIStroke = createElement("UIStroke", {Thickness = 2}),
        UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 27}),
    })
    v4.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.159, 0)})
    v4.OuterStroke = createElement("UIStroke", {
        Thickness = 0.03,
        Color = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        Enabled = selected == true,
    })
    v4.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.24})
    v4.InnerStroke = createElement("UIStroke", {
        Thickness = 0.05,
        Color = Color3.fromRGB(109, 109, 109),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v4.Darken = if not selected then createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = if not locked then 0.8 else 0.5,
        Size = UDim2.fromScale(1, 1),
        ZIndex = if not locked then 1 else 2,
    }, {
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.123, 0)}),
        Lock = if not locked then nil else createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://137052204118126",
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.261, 0.845),
            ScaleType = Enum.ScaleType.Fit,
        }),
    }) else nil
    return createElement("ImageButton", v3, v4)
end