-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.QuickCmds.QuickCmdInput
-- Decompile time: 2.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 17 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = {
        Active = true,
        BorderSizePixel = 0,
        Selectable = true,
        AnchorPoint = a1.anchorPoint,
        Position = a1.position,
    }
    local size = a1.size or UDim2.fromScale(0, 1)
    v1.Size = size
    v1.AutomaticSize = Enum.AutomaticSize.X
    v1.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.LayoutOrder = a1.layoutOrder
    local v2 = {
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uIStroke1 = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = -90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(209, 209, 209))),
                }),
            }),
        }),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 3),
            PaddingBottom = UDim.new(0, 3),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        }),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = false,
            TextSize = 20,
            TextWrapped = false,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromScale(0, 0),
            Text = a1.displayText,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
        }, {uIStroke = createElement("UIStroke", {Thickness = 2})}),
    }
    local v3 = createElement
    local v4 = {
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(89, 89, 89),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.955, 0.5),
        Size = UDim2.new(0, 50, 1, 0),
        Text = ("%*"):format(a1.state),
        TextColor3 = Color3.fromRGB(223, 223, 223),
        TextScaled = false,
        TextSize = 20,
        TextWrapped = false,
    }

    v4[React.Event.FocusLost] = function(a1_2) -- Line: 109 -- upvalues: a1 (val)
        local Text = a1_2.Text
        a1_2.Text = ("%*"):format(a1.state)
        if a1.changed then
            a1.changed(Text)
        end
    end

    v2.textBox = v3("TextBox", v4, {
        uIPadding1 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.15, 0),
            PaddingLeft = UDim.new(0.1, 0),
            PaddingRight = UDim.new(0.1, 0),
            PaddingTop = UDim.new(0.15, 0),
        }),
        uIStroke2 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(56, 56, 56)}),
    })
    v2.uISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 24)})
    return createElement("Frame", v1, v2)
end