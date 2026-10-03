-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.ChapterEntry
-- Decompile time: 3.57 ms

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
return function(a1) -- Line: 30 -- upvalues: NewMaps (val), createElement (val), React (val), u36 (val) -- types: a1: table
    local selected = a1.selected
    local locked = a1.locked
    local v1 = "rbxassetid://138924286251630"
    local map = a1.map and NewMaps(a1.map)
    if map and map.ImageID then
        v1 = ("rbxassetid://%*"):format(map.ImageID)
    end
    local v2 = {
        BackgroundColor3 = Color3.fromRGB(36, 35, 32),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.921, 0.09),
        LayoutOrder = a1.layoutOrder,
        AutoButtonColor = not locked,
        Active = not locked,
        Selectable = not locked,
    }

    v2[React.Event.Activated] = function() -- Line: 49 -- upvalues: locked (val), a1 (val)
        if locked then
            return
        end
        if a1.onActivate then
            a1.onActivate()
        end
    end

    local v3 = {
        Title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.759, 0.279),
            Size = UDim2.fromScale(0.693, 0.411),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            Text = a1.title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2}),
            UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 27}),
        }),
    }
    v3.Preview = createElement("ImageLabel", {
        BorderSizePixel = 0,
        ZIndex = 0,
        BackgroundColor3 = Color3.fromRGB(80, 80, 80),
        Position = UDim2.fromScale(0.299, 0),
        Size = UDim2.fromScale(0.7, 1),
        Image = v1,
        ScaleType = Enum.ScaleType.Crop,
    }, {
        UIGradient = createElement("UIGradient", {Transparency = u36}),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.123, 0)}),
    })
    v3.SubLabel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "Missions cleared",
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(0.613, 0.719),
        Size = UDim2.fromScale(0.542, 0.282),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        UIStroke = createElement("UIStroke", {Thickness = 2}),
        UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
    })
    v3.Counter = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        Position = UDim2.fromScale(0.64, 0.532),
        Size = UDim2.fromScale(0.289, 0.384),
    }, {
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.773, 0.773),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
            Text = ("%* / %*"):format(a1.completed, a1.total),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2}),
            UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.32, 0)}),
        InnerStroke = createElement("UIStroke", {
            Thickness = 0.05,
            Color = Color3.fromRGB(109, 109, 109),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v3.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.159, 0)})
    v3.OuterStroke = createElement("UIStroke", {
        Thickness = 0.03,
        Color = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        Enabled = selected == true,
    })
    v3.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.24})
    v3.InnerStroke = createElement("UIStroke", {
        Thickness = 0.05,
        Color = Color3.fromRGB(109, 109, 109),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v3.Darken = if not selected then createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = if not locked then 0.8 else 0.5,
        Size = UDim2.fromScale(1, 1),
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
    return createElement("ImageButton", v2, v3)
end