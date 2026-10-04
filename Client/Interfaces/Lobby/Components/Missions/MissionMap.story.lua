-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Missions.MissionMap.story
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local MissionMap = require(script.Parent.MissionMap)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Content() -- Line: 9 -- upvalues: createElement (val), MissionMap (val), Enum (val)
    return createElement(MissionMap, {
        name = "Candy Valley",
        mode = Enum.Gamemode.Survival,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
end

return function(a1) -- Line: 18 -- upvalues: createElement (val), Content (val), ReactRoblox (val)
    local v1 = createElement(Content)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 23 -- upvalues: u7 (val)
        u7:unmount()
    end
end