-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.EmptyCrates.story
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local EmptyCrates = require(script.Parent.EmptyCrates)
local createElement = React.createElement
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {},
    story = function() -- Line: 10 -- upvalues: createElement (val), EmptyCrates (val)
        return createElement("Frame", {BackgroundColor3 = Color3.fromRGB(25, 25, 25), Size = UDim2.fromScale(1, 1)}, {
            EmptyCrates = createElement(EmptyCrates, {
                onGoToShop = function() end,
            }),
        })
    end,
}