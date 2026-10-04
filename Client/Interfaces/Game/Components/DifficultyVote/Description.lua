-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Description
-- Decompile time: 4.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DifficultyVote = ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote
local Banner = require(DifficultyVote.Banner)
local DifficultyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.DifficultyStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
return function(a1) -- Line: 12
    -- upvalues: useSpring (val), useCharmSelector (val), DifficultyStore (val), useEffect (val), createElement (val)
    -- upvalues: Banner (val)
    local v1, u11 = useSpring(Color3.fromRGB(0, 255, 127), 1, 40, true)
    local u16 = useCharmSelector(DifficultyStore.getState, function(a1) -- Line: 15
        return a1.selected
    end)
    useEffect(function() -- Line: 19 -- upvalues: u16 (val), a1 (val), u11 (val)
        if u16 == a1.DifficultyText then
            u11(Color3.fromRGB(255, 255, 255))
            return
        end
        u11(Color3.fromRGB(0, 0, 0))
    end)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 255, 127),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, 32),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 12),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        banner = createElement(Banner, {NewMode = a1.NewMode, Revamped = a1.Revamped, SubTitle = a1.SubTitle}),
        title = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 2,
            BackgroundTransparency = 0.5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = v1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.new(1, 0, 0, 12),
        }, {
            textLabel = createElement("TextLabel", {
                TextSize = 32,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Text = a1.DifficultyAlias,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 0, 0, 32),
            }, {uIStroke = createElement("UIStroke", {Thickness = 4})}),
            uIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    })
end