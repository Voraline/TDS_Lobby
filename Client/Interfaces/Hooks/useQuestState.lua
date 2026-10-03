-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useQuestState
-- Decompile time: 3.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local QuestStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.QuestStore)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local useCallback = React.useCallback
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local u43 = RunService:IsRunning()
local u44 = {
    StartMission = "The mission could not be started. Please try again.",
    TrackQuest = "The quest could not be updated. Please try again.",
    CancelQuest = "The mission could not be canceled. Please try again.",
    ClaimQuest = "The quest reward could not be claimed. Please try again.",
    PurchaseMission = "The mission could not be purchased. Check its requirements and your coins.",
}
return function(a1, a2) -- Line: 38
    -- upvalues: ReactCharm (val), QuestStore (val), useState (val), useRef (val), useMemo (val), NewNetwork (val)
    -- upvalues: useCallback (val), u43 (val), u44 (val), useEffect (val)
    local v1 = ReactCharm.useSignalState(QuestStore.getState)
    local v2, u10 = useState(nil)
    local v3, u14 = useState(nil)
    local u17 = useRef(nil)
    local u21 = useMemo(function() -- Line: 44 -- upvalues: NewNetwork (upval)
        return NewNetwork.Channel("Quests")
    end, {})
    local u25 = useCallback(function() -- Line: 48 -- upvalues: u14 (val), QuestStore (upval)
        u14(nil)
        QuestStore.setQuestError(nil)
    end, {})
    local v4 = {u25}
    local u30 = useCallback(function(a1) -- Line: 53 -- upvalues: u17 (val), u10 (val), u25 (val) -- types: a1: string
        if u17.current ~= nil then
            return false
        end
        u17.current = a1
        u10(a1)
        u25()
        return true
    end, v4)
    local u34 = useCallback(function() -- Line: 64 -- upvalues: u17 (val), u10 (val)
        u17.current = nil
        u10(nil)
    end, {})
    local v5 = {u21}
    local u39 = useCallback(function() -- Line: 69 -- upvalues: u21 (val), QuestStore (upval)
        local success, result = pcall(function() -- Line: 70 -- upvalues: u21 (upval)
            return u21:invokeServer("RequestState")
        end)
        if success and typeof(result) == "table" then
            QuestStore.setQuestState(result)
            return result
        end
        local v1 = if not success then ("Quest data request failed: %*"):format(result) else "Quest data was unavailable. Please try again."
        QuestStore.setQuestError(v1)
        warn(v1)
        return nil
    end, v5)
    local v6 = {a1, u30, u39, u34}
    local u47 = useCallback(function() -- Line: 87 -- upvalues: a1 (val), u43 (upval), u30 (val), u39 (val), u34 (val)
        if a1 and u43 and u30("RequestState") then
            local v1 = u39()
            u34()
            return v1
        end
        return nil
    end, v6)
    local v7 = {a1, u21, u30, u39, u34}
    local u56 = useCallback(function(a1_2, ...) -- Line: 97
        -- upvalues: a1 (val), u43 (upval), u30 (val), u21 (val), u39 (val), u44 (upval), u14 (val), u34 (val)
        if a1 and u43 and u30(a1_2) then
            local u6 = {}
            u6[1] = ...
            local success, result, v1 = pcall(function() -- Line: 103 -- upvalues: u21 (upval), a1_2 (val), u6 (val)
                return u21:invokeServer(a1_2, (table.unpack(u6)))
            end)
            local v2 = success and result == true
            if not v2 then
                u14(if not success then u44[a1_2] or ("The quest action \"%*\" could not be completed."):format(a1_2) else if typeof(v1) ~= "string" then u44[a1_2] or ("The quest action \"%*\" could not be completed."):format(a1_2) else if v1 == "" then u44[a1_2] or ("The quest action \"%*\" could not be completed."):format(a1_2) else v1)
                local v3 = if not success then tostring(result) else if v1 == nil then tostring(result) else tostring(v1)
                warn((("Quest request \"%*\" failed: %*"):format(a1_2, v3)))
            else
                u39()
            end
            u34()
            return v2
        end
        return false
    end, v7)
    local v8 = {u47, u25, u56}
    v6 = useMemo(function() -- Line: 128 -- upvalues: u47 (val), u25 (val), u56 (val)
        return {
            RequestState = u47,
            ClearError = u25,
            StartMission = function(a1) -- Line: 132 -- upvalues: u56 (upval) -- types: a1: string
                return u56("StartMission", a1)
            end,
            TrackQuest = function(a1) -- Line: 135 -- upvalues: u56 (upval) -- types: a1: string?
                return u56("TrackQuest", a1)
            end,
            CancelQuest = function(a1) -- Line: 138 -- upvalues: u56 (upval) -- types: a1: string
                return u56("CancelQuest", a1)
            end,
            ClaimQuest = function(a1) -- Line: 141 -- upvalues: u56 (upval) -- types: a1: string
                return u56("ClaimQuest", a1)
            end,
            PurchaseMission = function(a1) -- Line: 144 -- upvalues: u56 (upval) -- types: a1: string
                return u56("PurchaseMission", a1)
            end,
        }
    end, v8)
    local v9 = {a1, u21}
    useEffect(function() -- Line: 150 -- upvalues: a1 (val), u43 (upval), u21 (val), QuestStore (upval), u14 (val)
        if a1 and u43 then
            local u7 = u21:onEvent("QuestStateUpdated", function(a1) -- Line: 155 -- upvalues: QuestStore (upval), u14 (upval)
                QuestStore.setQuestState(a1)
                u14(nil)
            end)
            return function() -- Line: 160 -- upvalues: u7 (val)
                if u7 then
                    u7()
                end
            end
        end
    end, v9)
    v9 = {a1, a2, u47}
    useEffect(function() -- Line: 167 -- upvalues: a1 (val), a2 (val), u47 (val)
        if a1 and a2 ~= false then
            u47()
        end
    end, v9)
    return {
        State = v1.State,
        Loaded = v1.Loaded,
        Error = v3 or v1.Error,
        PendingAction = v2,
    }, v6
end