-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.EventDirector
-- Decompile time: 15.91 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Definitions = require(ReplicatedStorage.Shared.Modules.LiveEvents.Definitions)
local EventDirector = require(script.Parent.Parent.Components.EventDirector)
local EventDirectorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.EventDirectorStore)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(script.Parent.Parent.Components.EventDirector.Types)
local useAtomSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomSelector)
local useReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorValue)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local createElement = React.createElement
local EventDirector_2 = NewNetwork.Channel("EventDirector")

local function useDirectorRequests() -- Line: 44 -- upvalues: React (val), EventDirector_2 (val), HttpService (val)
    local u3 = React.useRef(true)
    local u7 = React.useRef({})
    local u11 = React.useRef({})
    local v1, u16 = React.useState(0)
    local v2, u21 = React.useState(false)
    local v3, u26 = React.useState(nil)
    local v4, u31 = React.useState(nil)
    React.useEffect(function() -- Line: 53 -- upvalues: u3 (val), u7 (val)
        u3.current = true
        return function() -- Line: 55 -- upvalues: u3 (upval), u7 (upval)
            u3.current = false
            for i in u7.current do
                pcall(task.cancel, i)
            end
            table.clear(u7.current)
        end
    end, {})
    local u41 = React.useCallback(function(a1) -- Line: 64
        -- upvalues: u3 (val), u16 (val), u26 (val), u31 (val), EventDirector_2 (upval), u7 (val), u11 (val), u21 (val)
        if u3.current and not a1.inFlight and not a1.settled then
            a1.inFlight = true
            u16(function(a1) -- Line: 69
                return a1 + 1
            end)
            u26(nil)
            u31(nil)
            local u15 = nil
            u15 = task.defer(function() -- Line: 75
                -- upvalues: EventDirector_2 (upval), a1 (val), u7 (upval), u15 (ref), u3 (upval), u16 (upval)
                -- upvalues: u11 (upval), u21 (upval), u26 (upval), u31 (upval)
                local success, result = pcall(function() -- Line: 76 -- upvalues: EventDirector_2 (upval), a1 (upval)
                    return EventDirector_2:invokeServer("Request", a1.body)
                end)
                u7.current[u15] = nil
                a1.inFlight = false
                if not u3.current then
                    return
                end
                u16(function(a1) -- Line: 84
                    return a1 - 1
                end)
                if success
                    and type(result) == "table"
                    and type(result.ok) == "boolean"
                    and result.retryable ~= true then
                    a1.settled = true
                    for i, j in u11.current do
                        if j.body.requestId == a1.body.requestId then
                            table.remove(u11.current, i)
                            break
                        end
                    end
                    u21(#u11.current > 0)
                    if not result.ok then
                        u26((tostring(result.error or "The server rejected this request.")))
                        return
                    end
                    local data = result.data or {}
                    u31(data.message)
                    a1.onSuccess(data)
                    return
                end
                local v1 = false
                local v2 = nil
                for k, n in u11.current, nil, v2 do
                    if n.body.requestId == a1.body.requestId then
                        v1 = true
                    end
                end
                if not v1 then
                    v2 = a1
                    table.insert(u11.current, v2)
                end
                u21(true)
                u26(if not success or type(result) ~= "table" then "The request was not confirmed. Retry the same request before making further changes." else if type(result.error) ~= "string" then "The request was not confirmed. Retry the same request before making further changes." else result.error)
            end)
            u7.current[u15] = true
            return
        end
    end, {})
    local v5 = {u41}
    local v6 = {u41}
    return (React.useCallback(function(a1, a2, a3) -- Line: 133
        -- upvalues: HttpService (upval), u41 (val)
        local v1 = table.clone(a2 or {})
        v1.operation = a1
        v1.requestId = HttpService:GenerateGUID(false)
        u41({body = v1, onSuccess = a3})
    end, v5)), (React.useCallback(function() -- Line: 142 -- upvalues: u11 (val), u41 (val)
        if u11.current[1] then
            u41(u11.current[1])
        end
    end, v6)), v1 > 0, v2, v3, v4
end

return function(a1) -- Line: 151
    -- upvalues: React (val), useAtomSelector (val), EventDirectorStore (val), useDirectorRequests (val)
    -- upvalues: useTagReplicatorInstance (val), useReplicatorValue (val), EventDirector_2 (val), createElement (val)
    -- upvalues: EventDirector (val), Definitions (val)
    local u4, u5 = React.useState(false)
    local u9 = React.useRef(0)
    local u14 = useAtomSelector(EventDirectorStore.getState, function(a1) -- Line: 154
        return a1.open
    end)
    local Connecting_2, Connecting = React.useState("Connecting")
    local v1, u24 = React.useState({canRunCommands = false, canBroadcast = false})
    local u26, u27, u28, u29, v2, v3 = useDirectorRequests()
    local u41 = useReplicatorValue(useTagReplicatorInstance(a1.screen.Parent, "EventDirectorState", "EventDirectorState"), "Snapshot")
    local v4 = {u26}
    local u47 = React.useCallback(function() -- Line: 167 -- upvalues: u26 (val), u5 (val), Connecting (val), u24 (val)
        u26("bootstrap", nil, function(a1) -- Line: 168 -- upvalues: u5 (upval), Connecting (upval), u24 (upval)
            u5(true)
            Connecting(a1.environment or "Unknown environment")
            u24({
                canRunCommands = a1.canRunCommands == true,
                canBroadcast = a1.canBroadcast == true,
                broadcastModes = a1.broadcastModes,
                broadcastUnavailableReason = a1.broadcastUnavailableReason,
                placeContext = a1.placeContext,
                commandUnavailableReason = a1.commandUnavailableReason,
            })
        end)
    end, v4)
    local useEffect = React.useEffect
    local v5 = {a1.screen}
    useEffect(function() -- Line: 184 -- upvalues: a1 (val)
        local Attribute = a1.screen:GetAttribute("LiveEventControl")
        a1.screen:SetAttribute("LiveEventControl", true)
        return function() -- Line: 187 -- upvalues: a1 (upval), Attribute (val)
            a1.screen:SetAttribute("LiveEventControl", Attribute)
        end
    end, v5)
    local useEffect_2 = React.useEffect
    v5 = {a1.screen, a1.setDisplayOrder, u14}
    useEffect_2(function() -- Line: 192 -- upvalues: u14 (val), a1 (val)
        if not u14 then
            return
        end
        local DisplayOrder = a1.screen.DisplayOrder
        a1.setDisplayOrder(900000)
        return function() -- Line: 198 -- upvalues: a1 (upval), DisplayOrder (val)
            a1.screen.DisplayOrder = DisplayOrder
        end
    end, v5)
    v5 = {u4, u41}
    React.useEffect(function() -- Line: 203 -- upvalues: EventDirectorStore (upval), u4 (val), u41 (val)
        EventDirectorStore.setAvailable(u4 or u41 ~= nil)
    end, v5)
    React.useEffect(function() -- Line: 207 -- upvalues: EventDirectorStore (upval)
        return function() -- Line: 208 -- upvalues: EventDirectorStore (upval)
            EventDirectorStore.setAvailable(false)
            EventDirectorStore.setOpen(false)
        end
    end, {})
    v5 = {u47}
    React.useEffect(function() -- Line: 214 -- upvalues: EventDirector_2 (upval), EventDirectorStore (upval), u47 (val)
        local u0 = true
        local u1 = nil
        local u4 = task.defer(function() -- Line: 217
            -- upvalues: u1 (ref), EventDirector_2 (upval), u0 (ref), EventDirectorStore (upval), u47 (upval)
            u1 = EventDirector_2:onEvent("Open", function() -- Line: 218 -- upvalues: u0 (upval), EventDirectorStore (upval), u47 (upval)
                if u0 then
                    EventDirectorStore.setOpen(true)
                    u47()
                end
            end)
            if u0 then
                u47()
                return
            end
            if u1 then
                u1()
            end
        end)
        return function() -- Line: 230 -- upvalues: u0 (ref), u4 (val), u1 (ref)
            u0 = false
            pcall(task.cancel, u4)
            if u1 then
                u1()
            end
        end
    end, v5)
    v5 = {u4, u28, u29, u27}
    React.useEffect(function() -- Line: 239 -- upvalues: u4 (val), u28 (val), u29 (val), u9 (val), u27 (val)
        if not u4 and not u28 and u29 and not (3 <= u9.current) then
            local u15 = task.delay(math.min(u9.current + 1, 2), function() -- Line: 244 -- upvalues: u9 (upval), u27 (upval)
                local v1 = u9
                v1.current = v1.current + 1
                u27()
            end)
            return function() -- Line: 248 -- upvalues: u15 (val)
                pcall(task.cancel, u15)
            end
        end
    end, v5)
    local v6 = table.clone(u41 or {phase = "Hydrating", environment = Connecting_2})
    v6.error = v2 or v6.error
    v6.message = v3
    v4 = table.clone(v1)
    local canRunCommands = false
    if u41 ~= nil then
        canRunCommands = if u41.canRunCommands == nil then v1.canRunCommands == true else u41.canRunCommands
    end
    v4.canRunCommands = canRunCommands
    local canBroadcast = false
    if u41 ~= nil then
        canBroadcast = if u41.canBroadcast == nil then v1.canBroadcast == true else u41.canBroadcast
    end
    v4.canBroadcast = canBroadcast
    local broadcastModes = if not u41 then v1.broadcastModes else if not u41.broadcastModes then v1.broadcastModes else u41.broadcastModes
    v4.broadcastModes = broadcastModes
    if u41 and u41.canBroadcast ~= nil then
        v4.broadcastUnavailableReason = u41.broadcastUnavailableReason
    end
    if u41 and u41.canRunCommands ~= nil then
        v4.commandUnavailableReason = u41.commandUnavailableReason
    end
    if not u4 and not u41 then
        return nil
    end
    local Fragment = React.Fragment
    local v7 = {}
    local v8 = u14 and createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        Active = true,
        BackgroundColor3 = Color3.new(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }, {
        Director = createElement(EventDirector, {
            actions = Definitions.Actions,
            status = v6,
            busy = u28,
            retryable = u29,
            onRetry = u27,
            capabilities = v4,
            onRunCommand = function(a1) -- Line: 310 -- upvalues: u26 (val), u41 (val)
                u26("run-command", {
                    actionId = a1.actionId,
                    version = a1.version,
                    target = a1.target,
                    parameters = a1.parameters,
                    runId = if not u41 then nil else u41.runId,
                    controlRevision = if not u41 then nil else u41.controlRevision,
                }, function() end)
            end,
            onAction = function(a1, a2) -- Line: 286 -- upvalues: u41 (val), u26 (val) -- types: a1: string, a2: table?
                local v1 = table.clone(a2 or {})
                v1.expectedRevision = v1.revision
                v1.revision = nil
                v1.runId = if not u41 then nil else u41.runId
                v1.controlRevision = if not u41 then nil else u41.controlRevision
                u26(a1, v1, function() end)
            end,
            onClose = function() -- Line: 321 -- upvalues: EventDirectorStore (upval)
                EventDirectorStore.setOpen(false)
            end,
        }),
    })
    v7.Panel = v8
    return createElement(Fragment, {}, v7)
end