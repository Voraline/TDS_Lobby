-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.SectionDivider.story
-- Decompile time: 0.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SectionDivider = require(script.Parent.SectionDivider)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), SectionDivider (val), ReactRoblox (val)
    local v1 = createElement(SectionDivider, {
        SectionName = "📜 Update Log:",
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.1),
        AnchorPoint = Vector2.new(0.5, 0),
    })
    local u20 = ReactRoblox.createRoot(a1)
    u20:render(v1)
    return function() -- Line: 21 -- upvalues: u20 (val)
        u20:unmount()
    end
end