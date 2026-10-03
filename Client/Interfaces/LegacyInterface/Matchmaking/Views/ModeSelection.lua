-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Matchmaking.Views.ModeSelection
-- Decompile time: 2.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controllers = script.Parent.Parent.Parent.Controllers
local Lobby = ReplicatedStorage.Client.Interfaces.Stores.Lobby
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local MatchmakingController = require(Controllers.MatchmakingController)
local MatchmakingStore = require(Lobby.MatchmakingStore)
local ModeSelectionPrompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.ModeSelectionPrompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local MatchmakingStates = require(Lobby.MatchmakingStates)
local ViewController = require(Controllers.ViewController)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local useState = React.useState

local function getMaxPlayers(a1, a2) -- Line: 28 -- types: a2: boolean
    if a2 then
        return 1
    end
    local players = a1.players or {}
    return #players
end

local function ModeSelectionContainer(a1) -- Line: 36
    -- upvalues: ReactCharm (val), MatchmakingStore (val), useState (val), useSound (val), MatchmakingController (val)
    -- upvalues: MatchmakingStates (val), ViewController (val), createElement (val), ModeSelectionPrompt (val)
    -- upvalues: Icons (val)
    local v1 = ReactCharm.useSignalState(MatchmakingStore.getMatchState)
    local v2 = ReactCharm.useSignalState(MatchmakingStore.getParty)
    local u15 = ReactCharm.useSignalState(MatchmakingStore.getSelection)
    local v3 = ReactCharm.useSignalState(MatchmakingStore.getSingleParty)
    local u23, u24 = useState(false)
    local Click = useSound("Click")

    local function cancelSelection() -- Line: 44
        -- upvalues: MatchmakingController (upval), MatchmakingStates (upval), ViewController (upval)
        MatchmakingController:updateModeSelection(MatchmakingStates.IDLE, "")
        ViewController:setView("Hotbar")
    end

    local function selectMode(a1) -- Line: 49
        -- upvalues: u23 (val), u24 (val), MatchmakingStore (upval), MatchmakingController (upval)
        -- upvalues: ViewController (upval), u15 (val)
        local v1, v2
        if u23 then
            return
        end
        u24(true)
        if not MatchmakingStore.getIsInParty() then
            v1, v2 = MatchmakingController:createParty(true)
            if not v1 then
                ViewController:notify(string.format("Error: %s", v2 or "unknown"), 5, (Color3.new(1, 0, 0)))
                u24(false)
                return
            end
        end
        MatchmakingController:setCount(a1)
        v1, v2 = MatchmakingController:startMatchmaking(u15.mode, a1, u15.night, u15.difficulty, u15.challenge)
        if not v1 then
            ViewController:notify(string.format("Error: %s", v2 or "Unable to start matchmaking"), 5, (Color3.new(1, 0, 0)))
        end
        u24(false)
    end

    local v4 = {hideQuad = false}
    local v5 = false
    if v1 == MatchmakingStates.SELECTING then
        v5 = not u23
    end
    v4.visible = v5
    v4.anchorPoint = a1.anchorPoint
    v4.position = a1.position
    v4.icon = Icons.Party
    v4.mode = u15.mode
    v4.difficulty = u15.difficulty
    v4.gameId = game.GameId
    if not v3 then
        local players = v2.players or {}
        v5 = #players
    else
        v5 = 1
    end
    v4.maxPlayers = v5
    v5 = true
    if u15.night == nil then
        v5 = u15.christmas ~= nil
    end
    v4.showSolo = v5
    v4.isPrivateServer = workspace:GetAttribute("PrivateServer") == true
    v4.onCancel = cancelSelection
    v4.onSelect = selectMode
    v4.playClick = Click
    return createElement(ModeSelectionPrompt, v4)
end

return function(a1) -- Line: 108
    -- upvalues: ViewController (val), MatchmakingController (val), ReactRoblox (val), createElement (val)
    -- upvalues: ModeSelectionContainer (val)
    ViewController:init()
    MatchmakingController:init()
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.fromScale(1, 1)
    local u20 = ReactRoblox.createRoot(Frame)
    local v1 = {}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0)
    v1.anchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromOffset(0, 0)
    v1.position = Position
    u20:render((createElement(ModeSelectionContainer, v1)))
    Frame.Destroying:Once(function() -- Line: 122 -- upvalues: u20 (val)
        u20:unmount()
    end)
    return Frame
end