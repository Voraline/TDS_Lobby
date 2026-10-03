-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsfeedBanner.story
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewsfeedBanner = require(script.Parent.NewsfeedBanner)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), NewsfeedBanner (val), ReactRoblox (val)
    local v1 = createElement(NewsfeedBanner, {
        Version = "v1.36.0",
        ImageId = 107789968183999,
        Title = "🎃 Halloween Countdown 🎃",
        Size = UDim2.new(0.5, 0, 0, 125),
        Position = UDim2.fromScale(0.5, 0.1),
        AnchorPoint = Vector2.new(0.5, 0),
    })
    local u22 = ReactRoblox.createRoot(a1)
    u22:render(v1)
    return function() -- Line: 22 -- upvalues: u22 (val)
        u22:unmount()
    end
end