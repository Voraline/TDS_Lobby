-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Count
-- Decompile time: 4.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DifficultyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.DifficultyStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
return function(a1) -- Line: 10
    -- upvalues: useSpring (val), useCharmSelector (val), DifficultyStore (val), useEffect (val), createElement (val)
    local v1, u11 = useSpring(Color3.fromRGB(0, 255, 127), 1, 40, true)
    local u16 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 13
        return a1.selected
    end)
    local v2 = {u16}
    useEffect(function() -- Line: 17 -- upvalues: u16 (val), a1 (val), u11 (val)
        if u16 == a1.DifficultyText then
            u11(Color3.fromRGB(53, 53, 53))
            return
        end
        u11(Color3.fromRGB(0, 0, 0))
    end, v2)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        ZIndex = 11,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromOffset(40, 40),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 3, Color = Color3.new(1, 1, 1)}, {
            uIGradient = createElement("UIGradient", {
                Rotation = 45,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, a1.GradientColor[1]),
                    (ColorSequenceKeypoint.new(1, a1.GradientColor[2])),
                }),
            }),
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Rotation = 5,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = if not a1.Votes[a1.DifficultyText] then "0" else #a1.Votes[a1.DifficultyText],
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
        }, {uIStroke = createElement("UIStroke", {Thickness = 2})}),
        crown = createElement("ImageLabel", {
            Image = "rbxassetid://16727177152",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Rotation = 10,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 4, 0, 0),
            Size = UDim2.fromOffset(32, 32),
            Visible = (function() -- Line: 25 -- upvalues: a1 (val)
                local v1 = 0
                local v2 = false
                for i, j in a1.Votes do
                    if #j ~= 0 and v1 < #j then
                        v1 = #j
                        v2 = i
                    end
                end
                return v2 == a1.DifficultyText
            end)(),
        }),
    })
end