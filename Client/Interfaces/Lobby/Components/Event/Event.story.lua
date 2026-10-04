-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Event.Event.story
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Story() -- Line: 9 -- upvalues: React (val), Parent (val)
    return React.createElement(Parent, {
        Title = "Event Title",
        EventDescription = "Event Description",
        EventSmallDescription = "Event Small Description",
        EventThumbnail = "rbxassetid://5430597512",
        EventObjective = "OBJECTIVE",
        Size = UDim2.fromOffset(900, 550),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Rewards = {
            {Icon = "rbxassetid://5430597512", Text = "Reward 1"},
            {Icon = "rbxassetid://5430597512", Text = "Reward 2"},
        },
    }, {})
end

return function(a1) -- Line: 33 -- upvalues: ReactRoblox (val), createElement (val), Story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Story)))
    return function() -- Line: 37 -- upvalues: u4 (val)
        u4:unmount()
    end
end