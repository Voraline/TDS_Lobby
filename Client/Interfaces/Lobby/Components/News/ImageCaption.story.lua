-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption.story
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(script.Parent.ImageCaption)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), ImageCaption (val), ReactRoblox (val)
    local v1 = createElement(ImageCaption, {
        Text = "Flexing on you",
        Image = 111655722531143,
        Size = UDim2.fromOffset(546, 273),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
    local u22 = ReactRoblox.createRoot(a1)
    u22:render(v1)
    return function() -- Line: 21 -- upvalues: u22 (val)
        u22:unmount()
    end
end