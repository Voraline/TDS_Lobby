-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StarterPack.Banner.story
-- Decompile time: 2.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useServerTick = require(ReplicatedStorage.Client.Interfaces.Hooks.useServerTick)
local Banner = require(script.Parent.Banner).Banner
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Container() -- Line: 12
    -- upvalues: useReactBinding (val), useServerTick (val), createElement (val), Banner (val)
    local v1 = useReactBinding(true)
    local v2 = useServerTick()
    local u9 = workspace:GetServerTimeNow() + 259200
    return createElement(Banner, {
        Visible = v1,
        Duration = v2:map(function(a1) -- Line: 18 -- upvalues: u9 (val)
            local v1 = math.max(0, u9 - a1)
            return string.format("%02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 / 60 % 60), (math.floor(v1 % 60)))
        end),
        Clicked = function() -- Line: 30
            warn("hi :)")
        end,
    })
end

return function(a1) -- Line: 36 -- upvalues: createElement (val), Container (val), ReactRoblox (val)
    local v1 = createElement(Container)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 41 -- upvalues: u7 (val)
        u7:unmount()
    end
end