-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Modifier.story
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local Modifier = require(script.Parent.Modifier).Modifier
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), Modifier (val), React (val)
    React.mount(createElement(Modifier, {
        Name = "Fallen",
        Title = "Fallen",
        Description = "You are a fallen angel. You have a chance to get a special hat.",
        AdditionalText = "x1.2",
        Icon = 6739682029,
        Scale = 1.5,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0.5, -120),
        AnchorPoint = Vector2.new(0, 0.5),
    }), a1)
    return function() -- Line: 26
        root:unmount()
    end
end