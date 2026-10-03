-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingStatus.story
-- Decompile time: 0.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MatchmakingStatus = require(script.Parent.MatchmakingStatus)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function App() -- Line: 9 -- upvalues: createElement (val), MatchmakingStatus (val)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Searching = createElement(MatchmakingStatus, {
            title = "SEARCHING FOR GAME...",
            text = "0:24",
            canClose = true,
            position = UDim2.new(0.5, 0, 0, 20),
        }),
        Matched = createElement(MatchmakingStatus, {
            completed = true,
            title = "GAME FOUND!",
            text = "0:47",
            canClose = false,
            position = UDim2.new(0.5, 0, 0, 130),
        }),
    })
end

return function(a1) -- Line: 31 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 35 -- upvalues: u4 (val)
        u4:unmount()
    end
end