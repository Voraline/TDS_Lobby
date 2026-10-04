-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Loading
-- Decompile time: 4.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local React = require(ReplicatedStorage.Shared.UI.React)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
return function(a1) -- Line: 7 -- upvalues: useView (val), React (val), Loader (val)
    local visible = if a1.visible == nil then useView(true):map(function(a1) -- Line: 14
        return a1 == "Loading"
    end) else a1.visible
    return React.createElement("TextButton", {Text = "", BackgroundTransparency = 0, Size = UDim2.fromScale(1, 1), Visible = visible}, {
        gradient = React.createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()),
                (ColorSequenceKeypoint.new(1, Color3.new())),
            }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.963855),
                (NumberSequenceKeypoint.new(1, 0.0401607)),
            }),
        }),
        loader = React.createElement(Loader, {
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.3, 0.3),
            Visible = visible,
        }, {
            aspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
            constraint = React.createElement("UISizeConstraint", {MaxSize = Vector2.new(250, 250), MinSize = Vector2.new(100, 100)}),
        }),
    })
end