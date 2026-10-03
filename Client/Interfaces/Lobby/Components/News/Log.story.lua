-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.Log.story
-- Decompile time: 0.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Log = require(script.Parent.Log)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Log (val), ReactRoblox (val)
    local v1 = createElement(Log, {
        SubjectName = "Countdown to Halloween 🎃",
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.1),
        AnchorPoint = Vector2.new(0.5, 0),
        Points = {
            "Only 1 week left until Halloween!",
            "Releases on October 23rd @ 3PM ET",
            "New lobby coming out with the event",
            "New battle pass with exclusive skins",
            "Are you ready for the spookiest event of the year?",
        },
    })
    local u26 = ReactRoblox.createRoot(a1)
    u26:render(v1)
    return function() -- Line: 30 -- upvalues: u26 (val)
        u26:unmount()
    end
end