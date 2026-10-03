-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.EventMissions
-- Decompile time: 3.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Challenges = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Challenges)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EventMissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.EventMissionStore)
local MissionMapSelection = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Missions.MissionMapSelection)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local MatchmakingStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore)
local MatchmakingStates = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStates)
local createElement = React.createElement

local function getChallengeData(a1) -- Line: 37 -- upvalues: Challenges (val), table (val) -- types: a1: table?
    local maps, v1
    local v2 = {}
    if not a1 then
        return v2
    end
    for i, j in a1 do
        maps = Challenges(j).maps
        if maps then
            _, v1 = next(maps)
            if v1 then
                table.insert(v2, {map = v1})
            end
        end
    end
    return v2
end

return function() -- Line: 66
    -- upvalues: useViewEnabled (val), useCharmSelector (val), EventMissionStore (val), Enum (val)
    -- upvalues: getChallengeData (val), table (val), Challenges (val), createElement (val), MissionMapSelection (val)
    -- upvalues: ViewController (val), Network (val), MatchmakingStore (val), MatchmakingStates (val)
    local EventMissions_2, EventMissions = useViewEnabled("EventMissions")
    local u8 = useCharmSelector(EventMissionStore.getState, function(a1) -- Line: 70
        return a1[1]
    end)
    local v1 = EventMissions_2 and u8 ~= nil
    local challenges = u8 and u8.challenges
    local gameMode = u8 and u8.gameMode or Enum.Gamemode.Survival
    local modes = u8 and u8.modes
    local v2 = getChallengeData(challenges)
    local useMatchmaking = u8
    if useMatchmaking then
        useMatchmaking = u8.useMatchmaking
    end
    local u39 = table.map(v2, function(a1) -- Line: 83
        return a1.map
    end)
    if v2 and v1 then
        return createElement(MissionMapSelection, {
            Visible = v1,
            filterMapName = function(a1) -- Line: 114
                return a1:gsub("Classic ", "")
            end,
            mode = gameMode,
            matchmakeModes = modes,
            maps = u39,
            tooltips = table.map(challenges, function(a1) -- Line: 91 -- upvalues: Challenges (upval)
                local v1 = Challenges(a1)
                if not v1 then
                    return
                end
                return {
                    header = v1.title or a1,
                    subject = v1.description or "Some sort of challenge...",
                }
            end),
            cancelled = function() -- Line: 103 -- upvalues: u8 (val), EventMissionStore (upval), EventMissions (val)
                if u8 then
                    EventMissionStore.remove(u8.id)
                end
                EventMissions("Hotbar")
            end,
            chosen = function(a1, a2) -- Line: 141
                -- upvalues: table (upval), u39 (val), u8 (val), Challenges (upval), EventMissions (val)
                -- upvalues: useMatchmaking (val), ViewController (upval), Network (upval), EventMissionStore (upval)
                -- upvalues: MatchmakingStore (upval), MatchmakingStates (upval)
                local v1 = table.find(u39, a1) or 0
                local u11 = u8
                if u11 then
                    u11 = u8.challenges[v1]
                end
                local v2 = u11 and Challenges(u11)
                if not v2 then
                    return
                end
                local v3 = v2.title or a1
                EventMissions("MissionPrompt")
                if useMatchmaking then
                    MatchmakingStore.updateSelectionState({
                        christmas = false,
                        mode = a2,
                        matchState = MatchmakingStates.SELECTING,
                        challenge = u11,
                    })
                    EventMissions("Matchmaking")
                    return
                end
                ViewController:prompt({
                    Override = true,
                    Subject = "Start Mission",
                    Icon = "rbxassetid://13691899952",
                    Description = ("Would you like to start \"%*\"?"):format(v3),
                    Buttons = {
                        {
                            Text = "Confirm",
                            Color = Color3.fromRGB(10, 220, 80),
                            Clicked = function() -- Line: 164
                                -- upvalues: ViewController (upval), EventMissions (upval), Network (upval), u11 (val)
                                -- upvalues: u8 (upval), EventMissionStore (upval)
                                ViewController:closePrompt()
                                EventMissions("Loading")
                                local v1, v2 = (Network.Channel("EventMissions")):InvokeServer("Start", u11)
                                if not v1 then
                                    ViewController:notify(v2, 5, (Color3.new(1, 0, 0)))
                                end
                                if u8 then
                                    EventMissionStore.remove(u8.id)
                                end
                                EventMissions("Hotbar")
                            end,
                        },
                        {
                            Text = "Cancel",
                            Color = Color3.fromRGB(39, 39, 39),
                            Clicked = function() -- Line: 182
                                -- upvalues: ViewController (upval), u8 (upval), EventMissionStore (upval)
                                -- upvalues: EventMissions (upval)
                                ViewController:closePrompt()
                                if u8 then
                                    EventMissionStore.remove(u8.id)
                                end
                                EventMissions("Hotbar")
                            end,
                        },
                    },
                })
            end,
        })
    end
end