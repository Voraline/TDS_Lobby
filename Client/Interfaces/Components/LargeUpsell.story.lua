-- Script path: ReplicatedStorage.Client.Interfaces.Components.LargeUpsell.story
-- Decompile time: 0.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LargeUpsell = require(script.Parent.LargeUpsell)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {},
    story = function() -- Line: 10 -- upvalues: useReactBinding (val), createElement (val), LargeUpsell (val)
        return createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(24, 18, 34),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.85, 0.85),
        }, {
            AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.816}),
            Upsell = createElement(LargeUpsell, {
                Artwork = "rbxassetid://16455010681",
                ForegroundArtwork = "rbxassetid://16455010332",
                OriginalPrice = 740,
                ProductId = 1759399952,
                Title = "Starter Bundle!",
                Visible = true,
                Duration = useReactBinding("167:50:46"),
                OnActivated = function() end,
            }),
        })
    end,
}