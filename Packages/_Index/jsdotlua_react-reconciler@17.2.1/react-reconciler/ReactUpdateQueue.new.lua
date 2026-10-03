-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactUpdateQueue.new
-- Decompile time: 9.09 ms

local __DEV__ = _G.__DEV__
local __YOLO__ = _G.__YOLO__
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local NoLane = ReactFiberLane.NoLane
local NoLanes = ReactFiberLane.NoLanes
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local mergeLanes = ReactFiberLane.mergeLanes
local u44 = nil

local function enterDisallowedContextReadInDEV() -- Line: 113 -- upvalues: u44 (ref)
    if not u44 then
        u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
    end
    u44.enterDisallowedContextReadInDEV()
end

local function exitDisallowedContextReadInDEV() -- Line: 119 -- upvalues: u44 (ref)
    if not u44 then
        u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
    end
    u44.exitDisallowedContextReadInDEV()
end

local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Callback = ReactFiberFlags.Callback
local ShouldCapture = ReactFiberFlags.ShouldCapture
local DidCapture = ReactFiberFlags.DidCapture
local debugRenderPhaseSideEffectsForStrictMode = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local StrictMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).StrictMode
local markSkippedUpdateLanes = require(script.Parent:WaitForChild("ReactFiberWorkInProgress")).markSkippedUpdateLanes
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ConsolePatchingDev = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local disableLogs = ConsolePatchingDev.disableLogs
local reenableLogs = ConsolePatchingDev.reenableLogs
local v1 = {UpdateState = 0, ReplaceState = 1, ForceUpdate = 2, CaptureUpdate = 3}
local u114 = false
local u117 = nil
local u118 = nil
if __DEV__ then
    u117 = false
    u118 = nil

    function v1.resetCurrentlyProcessingQueue() -- Line: 179 -- upvalues: u118 (ref)
        u118 = nil
    end
end
local u122 = table.create(210)
local u123 = 210
for i = 1, 210 do
    u122[i] = {eventTime = -1, lane = -1, tag = -1}
end

function v1.initializeUpdateQueue(a1) -- Line: 200
    a1.updateQueue = {baseState = a1.memoizedState, shared = {}}
end

function v1.cloneUpdateQueue(a1, a2) -- Line: 214
    local updateQueue = a2.updateQueue
    local updateQueue_2 = a1.updateQueue
    if updateQueue == updateQueue_2 then
        a2.updateQueue = table.clone(updateQueue_2)
    end
end

function v1.createUpdate(a1, a2, a3, a4) -- Line: 228
    -- upvalues: u123 (ref), u122 (val)
    if not (u123 > 0) then
        return {
            tag = 0,
            eventTime = a1,
            lane = a2,
            payload = a3,
            callback = a4,
        }
    end
    local v1 = u122[u123]
    u122[u123] = nil
    u123 = u123 - 1
    v1.eventTime = a1
    v1.lane = a2
    v1.tag = 0
    v1.payload = a3
    v1.callback = a4
    return v1
end

function v1.enqueueUpdate(a1, a2) -- Line: 278 -- upvalues: __DEV__ (val), u118 (ref), u117 (ref), console (val)
    local updateQueue = a1.updateQueue
    if updateQueue == nil then
        return
    end
    local shared = updateQueue.shared
    local pending = shared.pending
    if pending ~= nil then
        a2.next = pending.next
        pending.next = a2
    else
        a2.next = a2
    end
    shared.pending = a2
    if __DEV__ and u118 == shared and not u117 then
        console.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.")
        u117 = true
    end
end

function v1.enqueueCapturedUpdate(a1, a2) -- Line: 310
    local updateQueue = a1.updateQueue
    local alternate = a1.alternate
    if alternate ~= nil then
        local updateQueue_2 = alternate.updateQueue
        if updateQueue == updateQueue_2 then
            local v1 = nil
            local v2 = nil
            local firstBaseUpdate = updateQueue.firstBaseUpdate
            if firstBaseUpdate == nil then
                v2 = a2
                v1 = a2
            else
                local v3
                local next = firstBaseUpdate
                repeat
                    v3 = {
                        eventTime = next.eventTime,
                        lane = next.lane,
                        tag = next.tag,
                        payload = next.payload,
                        callback = next.callback,
                    }
                    if v2 ~= nil then
                        v2.next = v3
                        v2 = v3
                    else
                        v2 = v3
                        v1 = v3
                    end
                    next = next.next
                until next == nil
                if v2 ~= nil then
                    v2.next = v4
                    v2 = v4
                else
                    v2 = v4
                    v1 = v4
                end
            end
            a1.updateQueue = {
                baseState = updateQueue_2.baseState,
                firstBaseUpdate = v1,
                lastBaseUpdate = v2,
                shared = updateQueue_2.shared,
                effects = updateQueue_2.effects,
            }
            return
        end
    end
    local lastBaseUpdate = updateQueue.lastBaseUpdate
    if lastBaseUpdate ~= nil then
        lastBaseUpdate.next = a2
    else
        updateQueue.firstBaseUpdate = a2
    end
    updateQueue.lastBaseUpdate = a2
end

local function getStateFromUpdate(a1, a2, a3, a4, a5, a6) -- Line: 391
    -- upvalues: __DEV__ (val), u44 (ref), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val)
    -- upvalues: disableLogs (val), __YOLO__ (val), describeError (val), reenableLogs (val), ShouldCapture (val)
    -- upvalues: DidCapture (val), Object (val), u114 (ref)
    local v1, v2, v3
    local tag = a3.tag
    if tag == 1 then
        local payload = a3.payload
        if type(payload) ~= "function" then
            return payload
        end
        if __DEV__ then
            if not u44 then
                u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            u44.enterDisallowedContextReadInDEV()
        end
        v2 = payload(a4, a5)
        if __DEV__ then
            if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a1.mode, StrictMode) ~= 0 then
                disableLogs()
                v1 = nil
                if __YOLO__ then
                    v3 = true
                    payload(a4, a5)
                else
                    local success, result = xpcall(payload, describeError, a4, a5)
                    v3 = success
                    v1 = result
                end
                reenableLogs()
                if not v3 then
                    error(v1)
                end
            end
            if not u44 then
                u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            u44.exitDisallowedContextReadInDEV()
        end
        return v2
    end
    if tag ~= 3 and tag ~= 0 then
        if tag ~= 2 then
            return a4
        end
        u114 = true
        return a4
    end
    if tag == 3 then
        a1.flags = bit32.bor(bit32.band(a1.flags, (bit32.bnot(ShouldCapture))), DidCapture)
    end
    local payload_2 = a3.payload
    if type(payload_2) ~= "function" then
        v2 = payload_2
    else
        if __DEV__ then
            if not u44 then
                u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            u44.enterDisallowedContextReadInDEV()
        end
        v2 = payload_2(a4, a5)
        if __DEV__ then
            if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a1.mode, StrictMode) ~= 0 then
                disableLogs()
                v1 = nil
                if __YOLO__ then
                    v3 = true
                    payload_2(a4, a5)
                else
                    local success_2, result_2 = xpcall(payload_2, describeError, a4, a5)
                    v3 = success_2
                    v1 = result_2
                end
                reenableLogs()
                if not v3 then
                    error(v1)
                end
            end
            if not u44 then
                u44 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
            end
            u44.exitDisallowedContextReadInDEV()
        end
    end
    if v2 == nil then
        return a4
    end
    return Object.assign({}, a4, v2)
end

v1.getStateFromUpdate = getStateFromUpdate

function v1.processUpdateQueue(a1, a2, a3, a4) -- Line: 500
    -- upvalues: u114 (ref), __DEV__ (val), u118 (ref), NoLanes (val), isSubsetOfLanes (val), mergeLanes (val)
    -- upvalues: NoLane (val), getStateFromUpdate (val), Callback (val), markSkippedUpdateLanes (val)
    local updateQueue = a1.updateQueue
    u114 = false
    if __DEV__ then
        u118 = updateQueue.shared
    end
    local firstBaseUpdate = updateQueue.firstBaseUpdate
    local lastBaseUpdate = updateQueue.lastBaseUpdate
    local pending = updateQueue.shared.pending
    if pending ~= nil then
        updateQueue.shared.pending = nil
        local v1 = pending
        local next = v1.next
        v1.next = nil
        if lastBaseUpdate ~= nil then
            lastBaseUpdate.next = next
        else
            firstBaseUpdate = next
        end
        local alternate = a1.alternate
        if alternate ~= nil then
            local updateQueue_2 = alternate.updateQueue
            local lastBaseUpdate_2 = updateQueue_2.lastBaseUpdate
            if lastBaseUpdate_2 ~= v1 then
                if lastBaseUpdate_2 ~= nil then
                    lastBaseUpdate_2.next = next
                else
                    updateQueue_2.firstBaseUpdate = next
                end
                updateQueue_2.lastBaseUpdate = v1
            end
        end
    end
    if firstBaseUpdate ~= nil then
        local effects, eventTime, lane, next_3, pending_2, v2
        local baseState = updateQueue.baseState
        local v3 = NoLanes
        local v4 = nil
        local v5 = nil
        local v6 = nil
        local next_2 = firstBaseUpdate
        while true do
            lane = next_2.lane
            eventTime = next_2.eventTime
            if isSubsetOfLanes(a4, lane) then
                if v6 ~= nil then
                    v2 = {
                        eventTime = eventTime,
                        lane = NoLane,
                        tag = next_2.tag,
                        payload = next_2.payload,
                        callback = next_2.callback,
                    }
                    v6.next = v2
                    v6 = v2
                end
                baseState = getStateFromUpdate(v7, updateQueue, next_2, baseState, v8, v9)
                if next_2.callback ~= nil and next_2.lane ~= NoLane then
                    v7.flags = bit32.bor(v7.flags, Callback)
                    effects = updateQueue.effects
                    if effects ~= nil then
                        table.insert(effects, next_2)
                    else
                        updateQueue.effects = {next_2}
                    end
                end
            else
                v2 = {
                    eventTime = eventTime,
                    lane = lane,
                    tag = next_2.tag,
                    payload = next_2.payload,
                    callback = next_2.callback,
                }
                if v6 ~= nil then
                    v6.next = v2
                    v6 = v2
                else
                    v5 = v2
                    v6 = v2
                    v4 = baseState
                end
                v3 = mergeLanes(v3, lane)
            end
            next_2 = next_2.next
            if next_2 == nil then
                pending_2 = updateQueue.shared.pending
                if pending_2 == nil then
                    break
                end
                v2 = pending_2
                next_3 = v2.next
                v2.next = nil
                updateQueue.lastBaseUpdate = v2
                updateQueue.shared.pending = nil
            end
        end
        if v6 == nil then
            v4 = baseState
        end
        updateQueue.baseState = v4
        updateQueue.firstBaseUpdate = v5
        updateQueue.lastBaseUpdate = v6
        markSkippedUpdateLanes(v3)
        v7.lanes = v3
        v7.memoizedState = baseState
    end
    if __DEV__ then
        u118 = nil
    end
end

local function callCallback(a1, a2) -- Line: 692
    if type(a1) ~= "function" then
        error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(a1))))
    end
    a1(a2)
end

function v1.resetHasForceUpdateBeforeProcessing() -- Line: 707 -- upvalues: u114 (ref)
    u114 = false
end

function v1.checkHasForceUpdateAfterProcessing() -- Line: 711 -- upvalues: u114 (ref)
    return u114
end

function v1.commitUpdateQueue(a1, a2, a3) -- Line: 715 -- upvalues: u122 (val), u123 (ref)
    local effects = a2.effects
    a2.effects = nil
    if effects ~= nil then
        local callback
        local v1 = nil
        local v2 = nil
        for i, j in effects, v1, v2 do
            callback = j.callback
            if callback ~= nil then
                if type(callback) ~= "function" then
                    error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(callback))))
                end
                callback(a3)
            end
            table.clear(j)
            table.insert(u122, j)
            u123 = u123 + 1
        end
    end
end

return v1