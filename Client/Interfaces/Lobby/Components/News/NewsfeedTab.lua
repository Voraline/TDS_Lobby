-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsfeedTab
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local Event = React.Event
return function(a1) -- Line: 15 -- upvalues: createElement (val), Event (val) -- types: a1: table
    local v1 = a1.SelectedVersion == a1.Version
    local v2 = {
        Size = UDim2.new(0, 80, 0, 25),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 0.5,
        LayoutOrder = a1.LayoutOrder,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Text = a1.Version,
        TextSize = 18,
    }
    local v3 = if not v1 then Color3.fromRGB(147, 147, 147) else Color3.fromRGB(255, 255, 255)
    v2.TextColor3 = v3
    v2.FontFace = Font.fromEnum(Enum.Font.SourceSansBold)
    v2.TextStrokeTransparency = 0.5
    v2.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    v2[Event.Activated] = function() -- Line: 33 -- upvalues: a1 (val)
        if a1.OnActivated then
            a1.OnActivated()
        end
    end

    return createElement("TextButton", v2, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        banner = createElement("TextLabel", {
            ZIndex = 2,
            BackgroundTransparency = 1,
            Text = "New!",
            TextSize = 17,
            TextStrokeTransparency = 0.4,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.new(1, 0, 0, 18),
            Visible = a1.IsNew,
            TextColor3 = Color3.fromRGB(255, 255, 0),
            FontFace = Font.fromEnum(Enum.Font.SourceSansBold),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        }),
    })
end