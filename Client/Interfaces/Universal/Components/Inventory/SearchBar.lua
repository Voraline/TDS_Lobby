-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.SearchBar
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 18 -- upvalues: React (val), createElement (val) -- types: a1: table
    local u4 = React.useRef(nil)
    local v1 = {u4}
    React.useEffect(function() -- Line: 21 -- upvalues: u4 (val), a1 (val)
        if u4.current then
            (u4.current:GetPropertyChangedSignal("Text")):Connect(function() -- Line: 23 -- upvalues: u4 (upval), a1 (upval)
                local Text = u4.current.Text
                a1.onSearch(Text)
            end)
        end
    end, v1)
    v1 = {
        Active = true,
        Selectable = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(21, 21, 21),
    }
    local position = a1.position or UDim2.new(0.24, 0, 0.5, 0)
    v1.Position = position
    local size = a1.size or UDim2.fromScale(0.444372, 0.666667)
    v1.Size = size
    return createElement("Frame", v1, {
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://93748616033191",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(-2.90889e-08, 0.5),
            Size = UDim2.fromScale(0.06, 0.06),
            ScaleType = Enum.ScaleType.Fit,
        }, {
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectType = Enum.AspectType.ScaleWithParentSize}),
        }),
        textBox = createElement("TextBox", {
            BackgroundTransparency = 1,
            Text = "",
            TextScaled = true,
            AnchorPoint = Vector2.new(1, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            PlaceholderText = a1.placeholderText or "[ Search ]",
            Position = UDim2.fromScale(0.971823, 0.5),
            Size = UDim2.fromScale(0.849281, 0.75),
            TextColor3 = Color3.new(1, 1, 1),
            ref = u4,
        }, {
            uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0.1, 0), PaddingRight = UDim.new(0.1, 0)}),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.23, 0)}),
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(7, 7, 7),
        }),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0),
            PaddingTop = UDim.new(0.05, 0),
        }),
    })
end)