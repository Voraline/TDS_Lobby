-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.ModeSelectionPrompt.story
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local ModeSelectionPrompt = require(script.Parent.ModeSelectionPrompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function App() -- Line: 10 -- upvalues: createElement (val), ModeSelectionPrompt (val), Icons (val)
    return createElement(ModeSelectionPrompt, {
        visible = true,
        mode = "pvp",
        gameId = 1176784616,
        maxPlayers = 4,
        isPrivateServer = true,
        anchorPoint = Vector2.new(0.5, 0.5),
        position = UDim2.fromScale(0.5, 0.5),
        icon = Icons.Party,
        onCancel = function() end,
        onSelect = function(a1) end,
    })
end

return function(a1) -- Line: 25 -- upvalues: ReactRoblox (val), createElement (val), App (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(App)))
    return function() -- Line: 29 -- upvalues: u4 (val)
        u4:unmount()
    end
end