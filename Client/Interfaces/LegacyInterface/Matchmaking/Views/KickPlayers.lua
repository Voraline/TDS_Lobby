-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Matchmaking.Views.KickPlayers
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controllers = script.Parent.Parent.Parent.Controllers
local Lobby = ReplicatedStorage.Client.Interfaces.Stores.Lobby
local KickPlayersPrompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.KickPlayersPrompt)
local MatchmakingController = require(Controllers.MatchmakingController)
local MatchmakingStore = require(Lobby.MatchmakingStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local MatchmakingStates = require(Lobby.MatchmakingStates)
local ViewController = require(Controllers.ViewController)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement

local function KickPlayersContainer() -- Line: 20
    -- upvalues: ReactCharm (val), MatchmakingStore (val), useSound (val), MatchmakingController (val)
    -- upvalues: ViewController (val), MatchmakingStates (val), createElement (val), KickPlayersPrompt (val)
    local u4 = ReactCharm.useSignalState(MatchmakingStore.getCount)
    local v1 = ReactCharm.useSignalState(MatchmakingStore.getMatchState)
    local v2 = ReactCharm.useSignalState(MatchmakingStore.getKickingPlayers)
    local u19 = ReactCharm.useSignalState(MatchmakingStore.getSelection)
    return createElement(KickPlayersPrompt, {
        visible = v1 == MatchmakingStates.KICKING,
        players = v2,
        onKick = function(a1) -- Line: 53 -- upvalues: MatchmakingController (upval)
            MatchmakingController:removeKickingPlayer(a1)
        end,
        onRetry = function() -- Line: 27 -- upvalues: MatchmakingController (upval), u19 (val), u4 (val), ViewController (upval)
            local v1, v2 = MatchmakingController:startMatchmaking(u19.mode, u4, u19.night, u19.difficulty, u19.challenge)
            if not v1 then
                ViewController:notify(string.format("Error: %s", v2 or "Unable to start matchmaking"), 5, (Color3.new(1, 0, 0)))
            end
        end,
        onCancel = function() -- Line: 45 -- upvalues: ViewController (upval), MatchmakingController (upval), MatchmakingStates (upval)
            ViewController:setView("Hotbar")
            MatchmakingController:updateModeSelection(MatchmakingStates.IDLE, "")
        end,
        playClick = useSound("Click"),
    })
end

return function(a1) -- Line: 62
    -- upvalues: ViewController (val), MatchmakingController (val), ReactRoblox (val), createElement (val)
    -- upvalues: KickPlayersContainer (val)
    ViewController:init()
    MatchmakingController:init()
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.fromScale(1, 1)
    local u20 = ReactRoblox.createRoot(Frame)
    u20:render((createElement(KickPlayersContainer)))
    Frame.Destroying:Once(function() -- Line: 73 -- upvalues: u20 (val)
        u20:unmount()
    end)
    return Frame
end