-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ElevatorControls
-- Decompile time: 8.92 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local ElevatorController = require(ReplicatedStorage.Client.Controllers.Lobby.ElevatorController)
local PartyStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.PartyStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)
local u42 = require("../Components/Elevator/interface/CreateElevator")
local u45 = require("../Components/Elevator/interface/ElevatorControls")
local u48 = require("../Utility/ElevatorFlow")
local u51 = require("../Components/NewMatchmaking/StoryModeElevatorWindow")
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useAttributes = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttributes)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local useCallback = React.useCallback
local useState = React.useState
local useEffect = React.useEffect

local function ElevatorView(a1) -- Line: 40
    -- upvalues: useAtom (val), ElevatorController (val), useState (val), useSound (val), useCallback (val)
    -- upvalues: useAttributes (val), Players (val), useCharmSelector (val), PartyStore (val), u48 (val)
    -- upvalues: useEffect (val), ViewStateStore (val), createElement (val), React (val), u42 (val), u51 (val)
    -- upvalues: u45 (val)
    local v1 = useAtom(ElevatorController.selectReady)
    local v2, u9 = useState({1})
    local u12, u13 = useState(1)
    local v3, u17 = useState(nil)
    local Click = useSound("Click")
    local v4 = {Click}
    local v5 = useCallback(function(a1, a2, a3) -- Line: 51
        -- upvalues: Click (val), ElevatorController (upval)
        Click()
        ElevatorController.configureStoryMission(a1, a2, a3)
    end, v4)
    local v6 = useCallback(function() -- Line: 58 -- upvalues: Click (val), ElevatorController (upval)
        Click()
        ElevatorController.toggleReady()
    end, {})
    v4 = useAttributes(a1.elevator)
    local u38 = v4.LeaderUserId == Players.LocalPlayer.UserId
    local u42_2 = v4.Initialized == true
    local u46 = v4.Type == "story"
    local v7 = useCallback
    local v8 = {u46, Click, a1.elevator, u12}
    v7 = v7(function() -- Line: 70 -- upvalues: Click (val), u46 (val), u17 (val), a1 (val), ElevatorController (upval), u12 (val)
        Click()
        if u46 then
            u17(a1.elevator)
            return
        end
        ElevatorController.create(u12)
    end, v8)
    local v9 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 80
        return a1.party
    end)
    v8 = useCallback(function(a1) -- Line: 84 -- upvalues: Click (val), u13 (val) -- types: a1: number
        Click()
        u13(a1)
    end, {})
    local v10 = useCallback(function() -- Line: 89 -- upvalues: Click (val), ElevatorController (upval)
        Click()
        ElevatorController.leave()
    end, {})
    local v11 = u38 or not v9
    local v12 = u48.getSetupStep(u38, u42_2, u46, v3 == a1.elevator)
    local u114 = v12 == "story"
    local v13 = {u114}
    useEffect(function() -- Line: 105 -- upvalues: a1 (val), u114 (val), ViewStateStore (upval)
        local setDisplayOrder = a1.setDisplayOrder
        local setIgnoreGuiInset = a1.setIgnoreGuiInset
        if setDisplayOrder then
            setDisplayOrder(if not u114 then 0 else 101)
        end
        if setIgnoreGuiInset then
            setIgnoreGuiInset(u114)
        end
        local v1 = if not u114 then 0 else 20
        ViewStateStore.setBlur(v1)
        return function() -- Line: 120 -- upvalues: setDisplayOrder (val), setIgnoreGuiInset (val), ViewStateStore (upval)
            if setDisplayOrder then
                setDisplayOrder(0)
            end
            if setIgnoreGuiInset then
                setIgnoreGuiInset(false)
            end
            ViewStateStore.setBlur(0)
        end
    end, v13)
    v13 = {u38, u42_2}
    useEffect(function() -- Line: 131 -- upvalues: u42_2 (val), u38 (val), ElevatorController (upval), u9 (val), u13 (val)
        if not u42_2 and u38 then
            local v1 = ElevatorController.getSizes()
            u9(v1)
            u13((math.max((unpack(v1)))))
            return
        end
    end, v13)
    local Fragment = React.Fragment
    local v14 = {}
    local v15 = v12 == "partySize" and createElement(u42, {
        size = u12,
        sizes = v2,
        onSetSize = v8,
        onCreate = v7,
        onLeave = v10,
    }) or nil
    v14.create = v15
    v15 = u114 and createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }, {
        window = createElement(u51, {
            Visible = true,
            PartySize = u12,
            StoryMaxChapter = v4.StoryMaxChapter,
            OnReady = v5,
            Close = v10,
        }),
    }) or nil
    v14.story = v15
    v15 = false
    if v12 == "controls" then
        v15 = createElement(u45, {
            ready = v4.Ready,
            size = v4.Players or 1,
            isReady = v1,
            onToggleReady = v6,
            canLeave = v11,
            onLeave = v10,
        })
    end
    v14.controls = v15
    return createElement(Fragment, {}, v14)
end

return function(a1) -- Line: 177 -- upvalues: useAtom (val), ClientAtoms (val), createElement (val), ElevatorView (val)
    local v1 = useAtom(ClientAtoms.elevatorAtom)
    return v1 and createElement(ElevatorView, {
        elevator = v1,
        setDisplayOrder = a1 and a1.setDisplayOrder,
        setIgnoreGuiInset = a1 and a1.setIgnoreGuiInset,
    })
end