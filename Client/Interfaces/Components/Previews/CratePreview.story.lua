-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.CratePreview.story
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CratePreview = require(script.Parent.CratePreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), CratePreview (val), ReactRoblox (val)
    local v1 = createElement(CratePreview, {
        name = "Premium",
        icon = false,
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