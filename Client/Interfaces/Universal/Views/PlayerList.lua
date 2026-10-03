-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.PlayerList
-- Decompile time: 2.20 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Components = Interfaces.Universal.Components
local useCharmBinding = require(Interfaces.Hooks.useCharmBinding)
local useCharmSelector = require(Interfaces.Hooks.useCharmSelector)
local useDispatchTracker = require(ReplicatedStorage.Client.Interfaces.Hooks.useDispatchTracker)
local useEvent = require(Interfaces.Hooks.useEvent)
local useMediaQuery = require(Interfaces.Hooks.useMediaQuery)
local useReactBindings = require(Interfaces.Hooks.useReactBindings)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local PlayerList = require(Components.PlayerList)
local PlayerListStore = require(Interfaces.Stores.Shared.PlayerListStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local joinBindings = React.joinBindings
local useCallback = React.useCallback
local useBinding = React.useBinding
local u68 = {
    Inventory = true,
    Shop = true,
    Quests = true,
    ChallengeMaps = true,
    PromptMatchmaking = true,
}
return function() -- Line: 35
    -- upvalues: useView (val), useMediaQuery (val), useCharmBinding (val), PlayerListStore (val)
    -- upvalues: useCharmSelector (val), useBinding (val), joinBindings (val), u68 (val), useEvent (val)
    -- upvalues: UserInputService (val), useReactBindings (val), useDispatchTracker (val), createElement (val)
    -- upvalues: PlayerList (val), useCallback (val), Players (val)
    local v1 = useView(true)
    local v2 = useMediaQuery("xlarge", true)
    local v3 = useCharmBinding(PlayerListStore.getState)
    local v4 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 40
        return a1.players
    end, {})
    local v5, v6 = useBinding(Vector2.zero)
    local v7, v8 = useBinding(Vector2.zero)
    local v9, v10 = useBinding(Vector2.zero)
    local u32 = v3:map(function(a1) -- Line: 48
        return a1.visible == true
    end)
    local v11 = joinBindings({
        v2,
        u32,
        v1:map(function(a1) -- Line: 55 -- upvalues: u68 (upval)
            return u68[a1] == nil
        end),
    }):map(function(a1) -- Line: 58
        return a1[1] and a1[2] and a1[3]
    end)
    useEvent(UserInputService.InputBegan, function(a1) -- Line: 62 -- upvalues: PlayerListStore (upval), u32 (val)
        if a1.UserInputType ~= Enum.UserInputType.Keyboard and a1.UserInputType ~= Enum.UserInputType.Gamepad1 then
            return
        end
        if a1.KeyCode ~= Enum.KeyCode.Tab and a1.KeyCode ~= Enum.KeyCode.DPadRight then
            return
        end
        PlayerListStore.setPlayerlistVisible(not u32:getValue())
    end, {})
    local v12 = {v3, v5, v7, v9}
    useReactBindings(function(a1, a2, a3, a4) -- Line: 77 -- upvalues: PlayerListStore (upval)
        if a1.contentSize ~= a2 + Vector2.yAxis * 44 then
            PlayerListStore.setPlayerListContentSize(a2 + Vector2.yAxis * 44)
        end
        if a1.absolutePosition ~= a3 then
            PlayerListStore.setPlayerListAbsolutePosition(a3)
        end
        if a1.absoluteSize ~= a4 then
            PlayerListStore.setPlayerListAbsoluteSize(a4)
        end
    end, v12, {})
    useDispatchTracker(false)
    return createElement(PlayerList, {
        Players = v4,
        Visible = v11,
        SetContentSize = v6,
        SetAbsolutePosition = v8,
        SetAbsoluteSize = v10,
        ShowProfile = v3:map(function(a1) -- Line: 101
            return a1.showProfile
        end),
        SelectedPlayerId = v3:map(function(a1) -- Line: 105
            return a1.selected
        end),
        SetSelectedPlayerId = useCallback(function(a1) -- Line: 109 -- upvalues: Players (upval), PlayerListStore (upval) -- types: a1: number
            if a1 == Players.LocalPlayer.UserId then
                PlayerListStore.selectProfile(a1)
                return
            end
            PlayerListStore.selectUser(a1)
        end, {}),
        SetShowProfile = useCallback(function(a1) -- Line: 117 -- upvalues: PlayerListStore (upval) -- types: a1: boolean
            PlayerListStore.showProfile(a1)
        end, {}),
    })
end