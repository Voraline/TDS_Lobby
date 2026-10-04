-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Dialog
-- Decompile time: 17.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Components = Interfaces.Universal.Components
local Value = (workspace:WaitForChild("Type")).Value
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local DialogStore = require(Interfaces.Stores.Shared.DialogStore)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local useCharmSelector = require(Interfaces.Hooks.useCharmSelector)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local Dialog = require(Components.Dialog)
local React = require(ReplicatedStorage.Shared.UI.React)
local TutorialFlow = Network.Channel("TutorialFlow")
local createElement = React.createElement
local useRef = React.useRef
local useState = React.useState
local useEffect = React.useEffect
local u91 = nil
local u98 = nil
if Value == "Game" then
    u91 = require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController)
    u98 = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
end

local function isPlacementActive() -- Line: 36 -- upvalues: u91 (ref), u98 (ref)
    local v1
    if u91 then
        v1 = true
        if u91.Active ~= true then
            if not u98 then
                v1 = false
            else
                v1 = true
                if u98.active ~= true then
                    v1 = false
                end
            end
        end
    elseif not u98 then
        v1 = false
    else
        v1 = true
        if u98.active ~= true then
            v1 = false
        end
    end
    return v1
end

local function delayPromise(a1, a2) -- Line: 43
    -- upvalues: TimescaleUtilities (val), Promise (val)
    if a2 then
        return TimescaleUtilities.DelayPromise(a1)
    end
    return Promise.delay(a1)
end

local function getSoundLength(a1, a2) -- Line: 51
    -- upvalues: Promise (val), Create (val), TimescaleUtilities (val)
    local v1 = if not a1 then "" else tostring(a1)
    local v2 = v1:match("^%d+$") or v1:match("rbxassetid://(%d+)")
    if not v2 then
        return Promise.resolve(0)
    end
    local u23 = a2 ~= false
    local u35 = Create("Sound", {
        Name = "PreloadSound",
        SoundId = ("rbxassetid://%*"):format(v2),
        Parent = workspace.CurrentCamera,
    })
    local TimeLength = u35.TimeLength
    if not (TimeLength > 0) then
        return (Promise.new(function(a1, a2, a3) -- Line: 73 -- upvalues: u35 (val), u23 (val), TimescaleUtilities (upval), TimeLength (ref)
            local u19 = false
            a3(function() -- Line: 75 -- upvalues: u19 (ref), u35 (upval)
                u19 = true
                u35:Destroy()
            end)
            while not (0 < u35.TimeLength) do
                if u19 then
                    break
                end
                if not u23 then
                    task.wait(0.03333333333333333)
                else
                    TimescaleUtilities.Wait(0.03333333333333333)
                end
            end
            TimeLength = u35.TimeLength
            if not u19 then
                u35:Destroy()
                v1(TimeLength)
            end
        end))
    end
    u35:Destroy()
    return (Promise.resolve(TimeLength))
end

return function() -- Line: 97
    -- upvalues: useTagReplicators (val), useReplicatedState (val), useCharmSelector (val), DialogStore (val)
    -- upvalues: useState (val), SettingsController (val), u91 (ref), u98 (ref), useRef (val), useEffect (val)
    -- upvalues: TutorialFlow (val), RunService (val), getSoundLength (val), delayPromise (val)
    -- upvalues: TimescaleUtilities (val), Promise (val), createElement (val), Dialog (val)
    local id, v1
    local v2 = useReplicatedState((useTagReplicators("CurseReplicator"))[1], "VotingActive") or false
    local u13 = useCharmSelector(DialogStore.getState, function(a1) -- Line: 101
        return a1[1]
    end)
    local v3, u22 = useState(SettingsController.Game:Get("Dialog"))
    if u91 then
        v1 = true
        if u91.Active ~= true then
            if not u98 then
                v1 = false
            else
                v1 = true
                if u98.active ~= true then
                    v1 = false
                end
            end
        end
    elseif not u98 then
        v1 = false
    else
        v1 = true
        if u98.active ~= true then
            v1 = false
        end
    end
    local v4, u38 = useState(v1)
    local u41 = useRef(v4)
    local dialog = u13 and u13.dialog
    if not u13 then
        id = ""
    else
        id = u13.id
        if not id then
            id = ""
        end
    end
    local Voice = dialog and dialog.Voice
    local TutorialPrompt = dialog
    if TutorialPrompt then
        TutorialPrompt = dialog.TutorialPrompt
    end
    local v5, u61 = useState(nil)
    local length = if not v5 then nil else if v5.id ~= id then nil else v5.length
    local u88 = true
    if v3 == false then
        u88 = u13
        if u88 then
            u88 = u13.OverrideSetting == true
        end
    end
    local u96 = dialog
    if u96 then
        u96 = dialog.TimeScaled ~= false
    end
    local Flipped = nil
    if dialog then
        Flipped = if dialog.Flipped == nil then dialog.Flip else dialog.Flipped
    end
    local v6 = {id, TutorialPrompt or false, u88}
    useEffect(function() -- Line: 124 -- upvalues: u88 (val), TutorialPrompt (val), TutorialFlow (upval)
        if u88 and TutorialPrompt then
            TutorialFlow:FireServer("PromptShown", TutorialPrompt)
        end
    end, v6)
    useEffect(function() -- Line: 130 -- upvalues: u22 (val), SettingsController (upval)
        u22(SettingsController.Game:Get("Dialog"))
        local u14 = SettingsController.Game:On("Dialog", function(a1) -- Line: 133 -- upvalues: u22 (upval)
            u22(a1)
        end)
        return function() -- Line: 137 -- upvalues: u14 (val)
            u14:Disconnect()
        end
    end, {})
    useEffect(function() -- Line: 142 -- upvalues: u91 (upval), u98 (upval), u41 (val), u38 (val), RunService (upval)
        local v1

        local function updatePlacementActive() -- Line: 143
            -- upvalues: u91 (upval), u98 (upval), u41 (upval), u38 (upval)
            local v1
            if u91 then
                v1 = true
                if u91.Active ~= true then
                    if not u98 then
                        v1 = false
                    else
                        v1 = true
                        if u98.active ~= true then
                            v1 = false
                        end
                    end
                end
            elseif not u98 then
                v1 = false
            else
                v1 = true
                if u98.active ~= true then
                    v1 = false
                end
            end
            if u41.current == v1 then
                return
            end
            u41.current = v1
            u38(v1)
        end

        if u91 then
            v1 = true
            if u91.Active ~= true then
                if not u98 then
                    v1 = false
                else
                    v1 = true
                    if u98.active ~= true then
                        v1 = false
                    end
                end
            end
        elseif not u98 then
            v1 = false
        else
            v1 = true
            if u98.active ~= true then
                v1 = false
            end
        end
        if u41.current ~= v1 then
            u41.current = v1
            u38(v1)
        end
        local u26 = RunService.Heartbeat:Connect(updatePlacementActive)
        return function() -- Line: 157 -- upvalues: u26 (val)
            u26:Disconnect()
        end
    end, {})
    local v7 = useRef(nil)
    if not v7.current or v7.current.id ~= id then
        local current = v7.current
        v7.current = nil
        if current and current.thread then
            current.thread:cancel()
            current.thread = nil
        end
        if u13 and u13.duration and u13.duration ~= (1 / 0) then
            if not Voice then
                local duration = u13.duration
                v6 = (if not u96 then Promise.delay(duration) else TimescaleUtilities.DelayPromise(duration)):andThen(function() -- Line: 196 -- upvalues: DialogStore (upval), id (val)
                    DialogStore.remove(id)
                end)
            else
                v6 = (((((getSoundLength(Voice, u96)):timeout(3)):andThen(function(a1) -- Line: 178 -- upvalues: u61 (val), id (val)
                    u61({id = id, length = a1})
                    return a1
                end)):catch(function() -- Line: 186 -- upvalues: u13 (val)
                    return u13.duration
                end)):andThen(function(a1) -- Line: 189 -- upvalues: delayPromise (upval), u13 (val), u96 (val)
                    return delayPromise(math.max(a1, u13.duration), u96)
                end)):andThen(function() -- Line: 192 -- upvalues: DialogStore (upval), id (val)
                    DialogStore.remove(id)
                end)
            end
            v7.current = {id = id, thread = v6}
        end
    end
    local v8 = not v2
    if v8 then
        local v9 = {}
        local v10 = u88 and dialog ~= nil
        v9.Visible = v10
        v9.DialogId = id
        v9.Speaker = dialog and dialog.Speaker or ""
        v9.DisplayName = dialog and dialog.DisplayName
        v9.Emotion = dialog and dialog.Emotion or ""
        v9.Hidden = dialog and dialog.Hidden
        v9.Text = dialog and dialog.Text or ""
        v9.Flipped = Flipped
        v9.Blip = dialog and dialog.Blip or "Blip"
        v9.Actions = dialog and dialog.Actions
        v9.RichText = dialog and dialog.RichText
        v9.Glitch = dialog and dialog.Glitch or false
        v9.Voice = Voice
        local duration_2 = length
        if not duration_2 then
            duration_2 = u13
            if duration_2 then
                duration_2 = false
                if u13.duration ~= (1 / 0) then
                    duration_2 = u13.duration
                end
            end
        end
        v9.VoiceLength = duration_2
        v9.PageDurations = dialog and dialog.PageDurations
        v9.DisableSkip = v4
        v9.TimeScaled = u96

        function v9.OnSkipDialog() -- Line: 227 -- upvalues: u13 (val), DialogStore (upval), id (val)
            if not u13 then
                return
            end
            DialogStore.remove(id)
        end

        v8 = createElement(Dialog, v9)
    end
    return v8
end