-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Binding.story
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Binding = require(script.Parent.Binding)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), Binding (val), ReactRoblox (val)
    local v1 = createElement(Binding, {
        Size = UDim2.fromOffset(50, 50),
        Position = UDim2.fromOffset(20, 20),
        AnchorPoint = Vector2.new(0, 0),
    })
    local u20 = ReactRoblox.createRoot(a1)
    u20:render(v1)
    return function() -- Line: 18 -- upvalues: u20 (val)
        u20:unmount()
    end
end