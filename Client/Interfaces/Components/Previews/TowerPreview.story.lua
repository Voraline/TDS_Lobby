-- Script path: ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview.story
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TowerPreview = require(script.Parent.TowerPreview)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), TowerPreview (val), ReactRoblox (val)
    local v1 = createElement(TowerPreview, {
        ImageTransparency = 0,
        ClipsDescendants = true,
        shadow = false,
        icon = false,
        tower = "Hacker",
        skin = "Default",
        level = 4,
        path = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(600, 600),
        AnchorPoint = Vector2.new(0.5, 0.5),
        cameraOffset = CFrame.new(0, 0.2, -1.75),
    })
    local u25 = ReactRoblox.createRoot(a1)
    u25:render(v1)
    return function() -- Line: 35 -- upvalues: u25 (val)
        u25:unmount()
    end
end