-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.KickPlayersPrompt.story
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickPlayersPrompt = require(script.Parent.KickPlayersPrompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u21 = {{Name = "CommanderZero", UserId = 101}, {Name = "ScoutMain", UserId = 202}}

local function App() -- Line: 20 -- upvalues: createElement (val), KickPlayersPrompt (val), u21 (val)
    return createElement(KickPlayersPrompt, {
        visible = true,
        players = u21,
        onCancel = function() end,
        onKick = function(a1) end,
        onRetry = function() end,
    })
end

return function(a1) -- Line: 30 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 34 -- upvalues: u4 (val)
        u4:unmount()
    end
end