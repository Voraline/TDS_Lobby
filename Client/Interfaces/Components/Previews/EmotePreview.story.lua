-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.EmotePreview.story
-- Decompile time: 1.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmotePreview = require(script.Parent.EmotePreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), EmotePreview (val), ReactRoblox (val)
    local v1 = createElement(EmotePreview, {
        name = "Poisoned",
        playing = true,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(600, 600),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
    local u20 = ReactRoblox.createRoot(a1)
    u20:render(v1)
    return function() -- Line: 21 -- upvalues: u20 (val)
        u20:unmount()
    end
end