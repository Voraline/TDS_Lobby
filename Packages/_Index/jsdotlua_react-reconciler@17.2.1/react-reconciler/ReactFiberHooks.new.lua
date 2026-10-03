-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHooks.new
-- Decompile time: 60.16 ms

local function unimplemented(a1) -- Line: 12 -- types: a1: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. a1)
    error("FIXME (roblox): " .. a1 .. " is unimplemented")
end

local __DEV__ = _G.__DEV__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local Object = v1.Object
local createRef = require(script.Parent.Parent:WaitForChild("react")).createRef
local createBinding = require(script.Parent.Parent:WaitForChild("react")).createBinding
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local ReactHookEffectTags = require(script.Parent:WaitForChild("ReactHookEffectTags"))
local ReactSharedInternals = (require((script.Parent.Parent:WaitForChild("shared")))).ReactSharedInternals
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local enableNewReconciler = ReactFeatureFlags.enableNewReconciler
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local DebugTracingMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).DebugTracingMode
local NoLane = ReactFiberLane.NoLane
local NoLanes = ReactFiberLane.NoLanes
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local mergeLanes = ReactFiberLane.mergeLanes
local removeLanes = ReactFiberLane.removeLanes
local markRootEntangled = ReactFiberLane.markRootEntangled
local markRootMutableRead = ReactFiberLane.markRootMutableRead
local readContext = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).readContext
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Update = ReactFiberFlags.Update
local Passive = ReactFiberFlags.Passive
local PassiveStatic = ReactFiberFlags.PassiveStatic
local MountLayoutDev = ReactFiberFlags.MountLayoutDev
local MountPassiveDev = ReactFiberFlags.MountPassiveDev
local HasEffect = ReactHookEffectTags.HasEffect
local Layout = ReactHookEffectTags.Layout
local Passive_2 = ReactHookEffectTags.Passive
local v2 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local warnIfNotCurrentlyActingUpdatesInDEV = v2.warnIfNotCurrentlyActingUpdatesInDEV
local scheduleUpdateOnFiber = v2.scheduleUpdateOnFiber
local warnIfNotScopedWithMatchingAct = v2.warnIfNotScopedWithMatchingAct
local requestEventTime = v2.requestEventTime
local requestUpdateLane = v2.requestUpdateLane
local markSkippedUpdateLanes = v2.markSkippedUpdateLanes
local getWorkInProgressRoot = v2.getWorkInProgressRoot
local warnIfNotCurrentlyActingEffectsInDEV = v2.warnIfNotCurrentlyActingEffectsInDEV
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName

local function is(a1, a2) -- Line: 114
    local v1
    if a1 ~= a2 then
        v1 = false
        if a1 ~= a1 then
            v1 = a2 ~= a2
        end
    else
        v1 = true
        if a1 == 0 then
            v1 = true
            if 1 / a1 ~= 1 / a2 then
                v1 = false
                if a1 ~= a1 then
                    v1 = a2 ~= a2
                end
            end
        end
    end
    return v1
end

local markWorkInProgressReceivedUpdate = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).markWorkInProgressReceivedUpdate
local getIsHydrating = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new")).getIsHydrating
local makeClientId = require(script.Parent:WaitForChild("ReactFiberHostConfig")).makeClientId
local v3 = require(script.Parent:WaitForChild("ReactMutableSource.new"))
local warnAboutMultipleRenderersDEV = v3.warnAboutMultipleRenderersDEV
local getWorkInProgressVersion = v3.getWorkInProgressVersion
local setWorkInProgressVersion = v3.setWorkInProgressVersion
local markSourceAsDirty = v3.markSourceAsDirty
local logStateUpdateScheduled = require(script.Parent:WaitForChild("DebugTracing")).logStateUpdateScheduled
local markStateUpdateScheduled = require(script.Parent:WaitForChild("SchedulingProfiler")).markStateUpdateScheduled
local ReactCurrentDispatcher = ReactSharedInternals.ReactCurrentDispatcher
local u241 = nil
if __DEV__ then
    u241 = {}
end
local u242 = {}
local u244 = NoLanes
local u245 = nil
local u246 = nil
local u247 = nil
local u248 = false
local u249 = false
local u250 = nil
local u251 = nil
local u252 = 0
local u406 = nil
local u422 = nil
local u438 = nil
local u454 = nil
local u257 = nil
local u258 = nil
local u259 = nil

local function getHighestIndex(a1) -- Line: 256 -- types: a1: table
    local v1 = 0
    for i, j in a1 do
        if v1 < i then
            v1 = i
        end
    end
    return v1
end

local function isArrayOrSparseArray(a1) -- Line: 266
    if type(a1) ~= "table" then
        return false
    end
    for i, j in a1 do
        if type(i) ~= "number" then
            return false
        end
    end
    return true
end

local function mountHookTypesDev() -- Line: 278 -- upvalues: __DEV__ (val), u250 (ref), u251 (ref)
    if __DEV__ then
        local v1 = u250
        if u251 == nil then
            u251 = {v1}
            return
        end
        table.insert(u251, v1)
    end
end

function updateHookTypesDev() -- Line: 291 -- upvalues: __DEV__ (val), u250 (ref), u251 (ref), u252 (ref)
    if __DEV__ then
        local v1 = u250
        if u251 ~= nil then
            u252 = u252 + 1
            if u251[u252] ~= v1 then
                warnOnHookMismatchInDev(v1)
            end
        end
    end
end

local function checkDepsAreArrayDev(a1) -- Line: 305 -- upvalues: __DEV__ (val), console (val), u250 (ref)
    if __DEV__ and a1 ~= nil then
        local v1
        if type(a1) == "table" then
            for i, j in a1 do
                if type(i) ~= "number" then
                    if true then
                        console.error(
                            "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                            u250,
                            (type(a1))
                        )
                    end
                    return
                end
            end
            v1 = true
        else
            v1 = false
        end
        if not v1 then
            console.error(
                "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                u250,
                (type(a1))
            )
        end
    end
end

function warnOnHookMismatchInDev(a1) -- Line: 320
    -- upvalues: __DEV__ (val), getComponentName (val), u245 (ref), u241 (ref), u251 (ref), u252 (ref), console (val)
    if __DEV__ then
        local v1 = getComponentName(u245.type) or "Component"
        if not u241[v1] then
            u241[v1] = true
            if u251 ~= nil then
                local v2, v3, v4
                local v5 = ""
                for i = 1, u252 do
                    v2 = u251[i]
                    v3 = if i ~= u252 then v2 else a1
                    v4 = (tostring(i)) .. ". " .. (v2 or "undefined")
                    while true do
                        if not ((string.len(v4)) < 30) then
                            break
                        end
                        v4 = v4 .. " "
                    end
                    v4 = v4 .. v3 .. "\n"
                    v5 = v5 .. v4
                end
                console.error(
                    "React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n",
                    v1,
                    v5
                )
            end
        end
    end
end

local function throwInvalidHookError() -- Line: 372 -- upvalues: Error (val)
    error(Error.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end

local function areHookInputsEqual(a1, a2) -- Line: 387
    -- upvalues: __DEV__ (val), console (val), u250 (ref)
    local v1, v2, v3
    if a2 == nil then
        if __DEV__ then
            console.error(
                "%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.",
                u250
            )
        end
        return false
    end
    local v4 = 0
    for i, j in a1 do
        if v4 < i then
            v4 = i
        end
    end
    local v5 = 0
    for k, n in a2 do
        if v5 < k then
            v5 = k
        end
    end
    if v4 ~= v5 then
        return false
    end
    local v6, v7 = a1, a2
    for m = 1, (math.min(v5, v4)) do
        v3 = v6[m]
        v1 = v7[m]
        if v3 ~= v1 then
            v2 = false
            if v3 ~= v3 then
                v2 = v1 ~= v1
            end
        else
            v2 = true
            if v3 == 0 then
                v2 = true
                if 1 / v3 ~= 1 / v1 then
                    v2 = false
                    if v3 ~= v3 then
                        v2 = v1 ~= v1
                    end
                end
            end
        end
        if not v2 then
            return false
        end
    end
    return true
end

function u242.bailoutHooks(a1, a2, a3) -- Line: 451
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), MountPassiveDev (val), Passive (val)
    -- upvalues: MountLayoutDev (val), Update (val), removeLanes (val)
    a2.updateQueue = a1.updateQueue
    if not __DEV__ or not enableDoubleInvokingEffects then
        a2.flags = bit32.band(a2.flags, (bit32.bnot((bit32.bor(Passive, Update)))))
    else
        a2.flags = bit32.band(a2.flags, (bit32.bnot((bit32.bor(MountPassiveDev, Passive, MountLayoutDev, Update)))))
    end
    a1.lanes = removeLanes(a1.lanes, a3)
end

local u280 = false

function u242.resetHooksAfterThrow() -- Line: 476
    -- upvalues: ReactCurrentDispatcher (val), u242 (val), u248 (ref), u245 (ref), u244 (ref), NoLanes (val), u246 (ref)
    -- upvalues: u247 (ref), __DEV__ (val), u251 (ref), u252 (ref), u250 (ref), u280 (ref), u249 (ref)
    ReactCurrentDispatcher.current = u242.ContextOnlyDispatcher
    if u248 then
        local queue
        local memoizedState = u245.memoizedState
        while memoizedState ~= nil do
            queue = memoizedState.queue
            if queue ~= nil then
                queue.pending = nil
            end
            memoizedState = memoizedState.next
        end
        u248 = false
    end
    u244 = NoLanes
    u245 = nil
    u246 = nil
    u247 = nil
    if __DEV__ then
        u251 = nil
        u252 = 0
        u250 = nil
        u280 = false
    end
    u249 = false
end

local function mountWorkInProgressHook() -- Line: 521 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    return v1
end

local function updateWorkInProgressHook() -- Line: 544 -- upvalues: u246 (ref), u245 (ref), u247 (ref), Error (val)
    local memoizedState
    if u246 ~= nil then
        memoizedState = u246.next
    else
        local alternate = u245.alternate
        memoizedState = if alternate == nil then nil else alternate.memoizedState
    end
    local memoizedState_2 = if u247 ~= nil then u247.next else u245.memoizedState
    if memoizedState_2 == nil then
        if memoizedState == nil then
            error(Error.new("Rendered more hooks than during the previous render."))
        end
        u246 = memoizedState
        local v1 = {
            memoizedState = u246.memoizedState,
            baseState = u246.baseState,
            baseQueue = u246.baseQueue,
            queue = u246.queue,
        }
        if u247 ~= nil then
            u247.next = v1
            u247 = v1
        else
            u247 = v1
            u245.memoizedState = v1
        end
    else
        local next = memoizedState_2.next
        u246 = memoizedState
    end
    return u247
end

function basicStateReducer(a1, a2) -- Line: 619
    if type(a2) == "function" then
        return a2(a1)
    end
    return a2
end

function mountReducer(a1, a2, a3) -- Line: 628 -- upvalues: u247 (ref), u245 (ref) -- types: a1: function, a3: function?
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    local v2 = v1
    v2.baseState = if a3 == nil then a2 else a3(a2)
    v2.memoizedState = v2.baseState
    local u19 = {lastRenderedReducer = a1, lastRenderedState = v1}
    v2.queue = u19
    local u22 = u245

    local function v3(a1, ...) -- Line: 655 -- upvalues: u22 (val), u19 (val)
        dispatchAction(u22, u19, a1, ...)
    end

    u19.dispatch = v3
    return v2.memoizedState, v3
end

function updateReducer(a1, a2, a3) -- Line: 665
    -- upvalues: updateWorkInProgressHook (val), u246 (ref), u244 (ref), u245 (ref), mergeLanes (val)
    -- upvalues: markSkippedUpdateLanes (val), NoLane (val), markWorkInProgressReceivedUpdate (val)
    local v1 = updateWorkInProgressHook()
    local queue = v1.queue
    assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
    queue.lastRenderedReducer = a1
    local v2 = u246
    local baseQueue = v2.baseQueue
    local pending = queue.pending
    if pending ~= nil then
        if baseQueue ~= nil then
            local next = baseQueue.next
            baseQueue.next = pending.next
            pending.next = next
        end
        v2.baseQueue = pending
        queue.pending = nil
    end
    if baseQueue ~= nil then
        local lane, v3, v4, v5
        local next_2 = baseQueue.next
        local baseState = v2.baseState
        local v6 = nil
        local v7 = nil
        local next_3 = nil
        local next_4 = next_2
        repeat
            lane = next_4.lane
            if bit32.band(u244, lane) == lane then
                if next_3 ~= nil then
                    next_3.next = {
                        lane = NoLane,
                        action = next_4.action,
                        eagerReducer = next_4.eagerReducer,
                        eagerState = next_4.eagerState,
                    }
                    next_3 = next_3.next
                end
                baseState = if next_4.eagerReducer ~= v3 then v3(baseState, next_4.action) else next_4.eagerState
            else
                v5 = {
                    lane = lane,
                    action = next_4.action,
                    eagerReducer = next_4.eagerReducer,
                    eagerState = next_4.eagerState,
                }
                if next_3 ~= nil then
                    next_3.next = v5
                    next_3 = next_3.next
                else
                    v7 = v5
                    v6 = baseState
                end
                u245.lanes = mergeLanes(u245.lanes, lane)
                markSkippedUpdateLanes(lane)
            end
            next_4 = next_4.next
        until next_4 == nil or next_4 == next_2
        if next_3 ~= nil then
            next_3.next = v7
        else
            v6 = baseState
        end
        local memoizedState = v1.memoizedState
        if baseState ~= memoizedState then
            v4 = false
            if baseState ~= baseState then
                v4 = memoizedState ~= memoizedState
            end
        else
            v4 = true
            if baseState == 0 then
                v4 = true
                if 1 / baseState ~= 1 / memoizedState then
                    v4 = false
                    if baseState ~= baseState then
                        v4 = memoizedState ~= memoizedState
                    end
                end
            end
        end
        if not v4 then
            markWorkInProgressReceivedUpdate()
        end
        v1.memoizedState = baseState
        v1.baseState = v6
        v1.baseQueue = next_3
        queue.lastRenderedState = baseState
    end
    local dispatch = queue.dispatch
    return v1.memoizedState, dispatch
end

function rerenderReducer(a1, a2, a3) -- Line: 806
    -- upvalues: updateWorkInProgressHook (val), markWorkInProgressReceivedUpdate (val)
    local v1 = updateWorkInProgressHook()
    local queue = v1.queue
    assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
    queue.lastRenderedReducer = a1
    local dispatch = queue.dispatch
    local pending = queue.pending
    local memoizedState = v1.memoizedState
    if pending ~= nil then
        local v2
        queue.pending = nil
        local next = pending.next
        local next_2 = next
        repeat
            memoizedState = a1(memoizedState, next_2.action)
            next_2 = next_2.next
        until next_2 == next
        local memoizedState_2 = v1.memoizedState
        if memoizedState ~= memoizedState_2 then
            v2 = false
            if memoizedState ~= memoizedState then
                v2 = memoizedState_2 ~= memoizedState_2
            end
        else
            v2 = true
            if memoizedState == 0 then
                v2 = true
                if 1 / memoizedState ~= 1 / memoizedState_2 then
                    v2 = false
                    if memoizedState ~= memoizedState then
                        v2 = memoizedState_2 ~= memoizedState_2
                    end
                end
            end
        end
        if not v2 then
            markWorkInProgressReceivedUpdate()
        end
        v1.memoizedState = memoizedState
        if v1.baseQueue == nil then
            v1.baseState = memoizedState
        end
        queue.lastRenderedState = memoizedState
    end
    return memoizedState, dispatch
end

function readFromUnsubcribedMutableSource(a1, a2, a3) -- Line: 871
    -- upvalues: __DEV__ (val), warnAboutMultipleRenderersDEV (val), getWorkInProgressVersion (val)
    -- upvalues: isSubsetOfLanes (val), u244 (ref), setWorkInProgressVersion (val), console (val)
    -- upvalues: markSourceAsDirty (val), Error (val)
    local v1
    if __DEV__ then
        warnAboutMultipleRenderersDEV(a2)
    end
    local v2 = a2._getVersion(a2._source)
    local v3 = getWorkInProgressVersion(a2)
    if v3 ~= nil then
        v1 = v3 == v2
    elseif (isSubsetOfLanes(u244, a1.mutableReadLanes)) then
        setWorkInProgressVersion(a2, v2)
    end
    if not v1 then
        markSourceAsDirty(a2)
        error(Error.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
        return
    end
    local v4 = a3(a2._source)
    if __DEV__ and type(v4) == "function" then
        console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
    end
    return v4
end

function useMutableSource(a1, a2, a3, a4) -- Line: 954
    -- upvalues: getWorkInProgressRoot (val), invariant (val), ReactCurrentDispatcher (val), u247 (ref), u245 (ref)
    -- upvalues: __DEV__ (val), console (val), requestUpdateLane (val), markRootMutableRead (val)
    -- upvalues: markRootEntangled (val)
    local u124, u133
    local u5 = getWorkInProgressRoot()
    invariant(u5 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
    local _getVersion = a2._getVersion
    local u17 = _getVersion(a2._source)
    local current = ReactCurrentDispatcher.current
    assert(current ~= nil, "dispatcher was nil, this is a bug in React")
    local v1, u35 = current.useState(function() -- Line: 979 -- upvalues: u5 (val), a2 (val), a3 (val)
        return readFromUnsubcribedMutableSource(u5, a2, a3)
    end)
    local u166 = v1
    local v2 = u247
    local memoizedState = a1.memoizedState
    if memoizedState.refs == nil then
        error((tostring((debug.traceback()))))
    end
    local refs = memoizedState.refs
    local getSnapshot = refs.getSnapshot
    local source = memoizedState.source
    local subscribe = memoizedState.subscribe
    local u53 = u245
    local v3 = {refs = refs, source = a2, subscribe = a4}
    a1.memoizedState = v3
    local v4 = {a3, a2, a4}
    current.useEffect(function() -- Line: 1008
        -- upvalues: refs (val), a3 (val), u35 (ref), _getVersion (val), a2 (val), u17 (val), __DEV__ (upval)
        -- upvalues: console (upval), u166 (ref), requestUpdateLane (upval), u53 (val), markRootMutableRead (upval)
        -- upvalues: u5 (val), markRootEntangled (upval)
        local v1
        refs.getSnapshot = a3
        refs.setSnapshot = u35
        local v2 = _getVersion(a2._source)
        local v3 = u17
        if v3 ~= v2 then
            v1 = false
            if v3 ~= v3 then
                v1 = v2 ~= v2
            end
        else
            v1 = true
            if v3 == 0 then
                v1 = true
                if 1 / v3 ~= 1 / v2 then
                    v1 = false
                    if v3 ~= v3 then
                        v1 = v2 ~= v2
                    end
                end
            end
        end
        if not v1 then
            v1 = a3(a2._source)
            if __DEV__ and type(v1) == "function" then
                console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
            end
            local v4 = u166
            if v4 ~= v1 then
                v3 = false
                if v4 ~= v4 then
                    v3 = v1 ~= v1
                end
            else
                v3 = true
                if v4 == 0 then
                    v3 = true
                    if 1 / v4 ~= 1 / v1 then
                        v3 = false
                        if v4 ~= v4 then
                            v3 = v1 ~= v1
                        end
                    end
                end
            end
            if not v3 then
                u35(v1)
                v3 = requestUpdateLane(u53)
                markRootMutableRead(u5, v3)
            end
            markRootEntangled(u5, u5.mutableReadLanes)
        end
    end, v4)
    v4 = {a2, a4}
    current.useEffect(function() -- Line: 1046
        -- upvalues: refs (val), a2 (val), requestUpdateLane (upval), u53 (val), markRootMutableRead (upval), u5 (val)
        -- upvalues: a4 (val), __DEV__ (upval), console (upval)
        local v1 = a4(a2._source, function() -- Line: 1047
            -- upvalues: refs (upval), a2 (upval), requestUpdateLane (upval), u53 (upval), markRootMutableRead (upval)
            -- upvalues: u5 (upval)
            local getSnapshot = refs.getSnapshot
            local setSnapshot = refs.setSnapshot
            local success, result = pcall(function() -- Line: 1052
                -- upvalues: setSnapshot (val), getSnapshot (val), a2 (upval), requestUpdateLane (upval), u53 (upval)
                -- upvalues: markRootMutableRead (upval), u5 (upval)
                setSnapshot(getSnapshot(a2._source))
                local v1 = requestUpdateLane(u53)
                markRootMutableRead(u5, v1)
            end)
            if not success then
                setSnapshot(function() -- Line: 1066 -- upvalues: result (val)
                    error(result)
                end)
            end
        end)
        if __DEV__ and type(v1) ~= "function" then
            console.error("Mutable source subscribe function must return an unsubscribe function.")
        end
        return v1
    end, v4)
    if getSnapshot ~= a3 then
        v3 = false
        if getSnapshot ~= getSnapshot then
            v3 = a3 ~= a3
        end
    else
        v3 = true
        if getSnapshot == 0 then
            v3 = true
            if 1 / getSnapshot ~= 1 / a3 then
                v3 = false
                if getSnapshot ~= getSnapshot then
                    v3 = a3 ~= a3
                end
            end
        end
    end
    if not v3 then
        u124 = {}
        u124.lastRenderedReducer = basicStateReducer
        u124.lastRenderedState = u166
        u133 = u245

        function u35(...) -- Line: 1115 -- upvalues: u133 (val), u124 (val)
            dispatchAction(u133, u124, ...)
        end

        u124.dispatch = u35
        v2.queue = u124
        v2.baseQueue = nil
        u166 = readFromUnsubcribedMutableSource(u5, a2, a3)
        v2.baseState = u166
        v2.memoizedState = v2.baseState
    else
        if source ~= a2 then
            v3 = false
            if source ~= source then
                v3 = a2 ~= a2
            end
        else
            v3 = true
            if source == 0 then
                v3 = true
                if 1 / source ~= 1 / a2 then
                    v3 = false
                    if source ~= source then
                        v3 = a2 ~= a2
                    end
                end
            end
        end
        if not v3 then
            u124 = {}
            u124.lastRenderedReducer = basicStateReducer
            u124.lastRenderedState = u166
            u133 = u245

            function u35(...) -- Line: 1115 -- upvalues: u133 (val), u124 (val)
                dispatchAction(u133, u124, ...)
            end

            u124.dispatch = u35
            v2.queue = u124
            v2.baseQueue = nil
            u166 = readFromUnsubcribedMutableSource(u5, a2, a3)
            v2.baseState = u166
            v2.memoizedState = v2.baseState
        else
            if subscribe ~= a4 then
                v3 = false
                if subscribe ~= subscribe then
                    v3 = a4 ~= a4
                end
            else
                v3 = true
                if subscribe == 0 then
                    v3 = true
                    if 1 / subscribe ~= 1 / a4 then
                        v3 = false
                        if subscribe ~= subscribe then
                            v3 = a4 ~= a4
                        end
                    end
                end
            end
            if not v3 then
                u124 = {}
                u124.lastRenderedReducer = basicStateReducer
                u124.lastRenderedState = u166
                u133 = u245

                function u35(...) -- Line: 1115 -- upvalues: u133 (val), u124 (val)
                    dispatchAction(u133, u124, ...)
                end

                u124.dispatch = u35
                v2.queue = u124
                v2.baseQueue = nil
                u166 = readFromUnsubcribedMutableSource(u5, a2, a3)
                v2.baseState = u166
                v2.memoizedState = v2.baseState
            end
        end
    end
    return u166
end

function mountMutableSource(a1, a2, a3) -- Line: 1129 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    local v2 = v1
    v2.memoizedState = {refs = {getSnapshot = a2}, source = a1, subscribe = a3}
    return useMutableSource(v2, a1, a2, a3)
end

function updateMutableSource(a1, a2, a3) -- Line: 1152 -- upvalues: updateWorkInProgressHook (val)
    return useMutableSource(updateWorkInProgressHook(), a1, a2, a3)
end

function mountState(a1) -- Line: 1167 -- upvalues: u247 (ref), u245 (ref)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    local v2 = v1
    local v3 = if type(a1) ~= "function" then a1 else a1()
    v2.baseState = v3
    v2.memoizedState = v2.baseState
    local u17 = {lastRenderedState = v3}
    u17.lastRenderedReducer = basicStateReducer
    v2.queue = u17
    local u19 = u245

    local function v4(a1, ...) -- Line: 1189 -- upvalues: u19 (val), u17 (val)
        dispatchAction(u19, u17, a1, ...)
    end

    u17.dispatch = v4
    return v2.memoizedState, v4
end

function updateState(a1) -- Line: 1198
    return updateReducer(basicStateReducer, a1)
end

function rerenderState(a1) -- Line: 1202
    return rerenderReducer(basicStateReducer, a1)
end

local function pushEffect(a1, a2, a3, a4) -- Line: 1206 -- upvalues: u245 (ref)
    local v1 = {tag = a1, create = a2, destroy = a3, deps = a4}
    local updateQueue = u245.updateQueue
    if updateQueue == nil then
        local v2 = {}
        u245.updateQueue = v2
        v1.next = v1
        v2.lastEffect = v1
        return v1
    end
    local lastEffect = updateQueue.lastEffect
    if lastEffect == nil then
        updateQueue.lastEffect = v1
        v1.next = v1
        return v1
    end
    local next = lastEffect.next
    lastEffect.next = v1
    v1.next = next
    updateQueue.lastEffect = v1
    return v1
end

function mountBinding(a1) -- Line: 1242 -- upvalues: u247 (ref), u245 (ref), createBinding (val)
    local v1
    local v2 = {}
    if u247 ~= nil then
        u247.next = v2
    else
        u245.memoizedState = v2
    end
    local v3 = v2
    v2, v1 = createBinding(a1)
    v3.memoizedState = {v2, v1}
    return v2, v1
end

function updateBinding(a1) -- Line: 1251 -- upvalues: updateWorkInProgressHook (val)
    return unpack((updateWorkInProgressHook()).memoizedState)
end

function mountRef(a1) -- Line: 1256 -- upvalues: u247 (ref), u245 (ref), createRef (val)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    local v2 = v1
    v1 = createRef()
    v1.current = a1
    v2.memoizedState = v1
    return v1
end

function updateRef(a1) -- Line: 1268 -- upvalues: updateWorkInProgressHook (val)
    return updateWorkInProgressHook().memoizedState
end

local function mountEffectImpl(a1, a2, a3, a4) -- Line: 1273
    -- upvalues: u247 (ref), u245 (ref), pushEffect (val), HasEffect (val)
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    local v2 = v1
    u245.flags = bit32.bor(u245.flags, a1)
    v2.memoizedState = pushEffect(bit32.bor(HasEffect, a2), a3, nil, a4)
end

function updateEffectImpl(a1, a2, a3, a4) -- Line: 1285
    -- upvalues: updateWorkInProgressHook (val), u246 (ref), areHookInputsEqual (val), pushEffect (val), u245 (ref)
    -- upvalues: HasEffect (val)
    local v1 = updateWorkInProgressHook()
    local destroy = nil
    if u246 ~= nil then
        local memoizedState = u246.memoizedState
        destroy = memoizedState.destroy
        if a4 ~= nil and areHookInputsEqual(a4, memoizedState.deps) then
            v1.memoizedState = pushEffect(a2, a3, destroy, a4)
            return
        end
    end
    u245.flags = bit32.bor(u245.flags, a1)
    v1.memoizedState = pushEffect(bit32.bor(HasEffect, a2), a3, destroy, a4)
end

local function mountEffect(a1, a2) -- Line: 1311
    -- upvalues: __DEV__ (val), warnIfNotCurrentlyActingEffectsInDEV (val), u245 (ref)
    -- upvalues: enableDoubleInvokingEffects (val), MountPassiveDev (val), Passive (val), PassiveStatic (val)
    -- upvalues: Passive_2 (val), u247 (ref), pushEffect (val), HasEffect (val)
    local v1, v2, v3
    if __DEV__ then
        if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
            warnIfNotCurrentlyActingEffectsInDEV(u245)
        end
    end
    if __DEV__ and enableDoubleInvokingEffects then
        v1 = bit32.bor(MountPassiveDev, Passive, PassiveStatic)
        v3 = {}
        if u247 ~= nil then
            u247.next = v3
        else
            u245.memoizedState = v3
        end
        v2 = v3
        u245.flags = bit32.bor(u245.flags, v1)
        v2.memoizedState = pushEffect(bit32.bor(HasEffect, Passive_2), a1, nil, a2)
        return
    end
    v1 = bit32.bor(Passive, PassiveStatic)
    v3 = {}
    if u247 ~= nil then
        u247.next = v3
    else
        u245.memoizedState = v3
    end
    v2 = v3
    u245.flags = bit32.bor(u245.flags, v1)
    v2.memoizedState = pushEffect(bit32.bor(HasEffect, Passive_2), a1, nil, a2)
end

local function updateEffect(a1, a2) -- Line: 1341
    -- upvalues: __DEV__ (val), warnIfNotCurrentlyActingEffectsInDEV (val), u245 (ref), Passive (val), Passive_2 (val)
    if __DEV__ then
        if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
            warnIfNotCurrentlyActingEffectsInDEV(u245)
        end
    end
    updateEffectImpl(Passive, Passive_2, a1, a2)
end

local function mountLayoutEffect(a1, a2) -- Line: 1356
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), MountLayoutDev (val), Update (val), Layout (val)
    -- upvalues: u247 (ref), u245 (ref), pushEffect (val), HasEffect (val)
    local v1, v2
    if __DEV__ and enableDoubleInvokingEffects then
        local v3 = bit32.bor(MountLayoutDev, Update)
        v2 = {}
        if u247 ~= nil then
            u247.next = v2
        else
            u245.memoizedState = v2
        end
        v1 = v2
        u245.flags = bit32.bor(u245.flags, v3)
        v1.memoizedState = pushEffect(bit32.bor(HasEffect, Layout), a1, nil, a2)
        return
    end
    v2 = {}
    if u247 ~= nil then
        u247.next = v2
    else
        u245.memoizedState = v2
    end
    v1 = v2
    u245.flags = bit32.bor(u245.flags, Update)
    v1.memoizedState = pushEffect(bit32.bor(HasEffect, Layout), a1, nil, a2)
end

local function updateLayoutEffect(a1, a2) -- Line: 1373
    -- upvalues: Update (val), Layout (val)
    updateEffectImpl(Update, Layout, a1, a2)
end

function imperativeHandleEffect(a1, a2) -- Line: 1381
    -- upvalues: __DEV__ (val), Object (val), console (val), Array (val)
    if a2 ~= nil and type(a2) == "function" then
        a2((a1()))
        return function() -- Line: 1390 -- upvalues: a2 (val)
            return a2(nil)
        end
    end
    if a2 == nil then
        return nil
    end
    if __DEV__ then
        local v1 = false
        if getmetatable(a2) ~= nil then
            v1 = #Object.keys(a2) == 0
        end
        if not v1 then
            console.error(
                "Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.",
                "an object with keys {" .. (Array.join(Object.keys(a2), ", ")) .. "}"
            )
        end
    end
    a2.current = a1()
    return function() -- Line: 1415 -- upvalues: a2 (val)
        a2.current = nil
    end
end

function mountImperativeHandle(a1, a2, a3) -- Line: 1424
    -- upvalues: __DEV__ (val), console (val), Array (val), enableDoubleInvokingEffects (val), mountEffectImpl (val)
    -- upvalues: MountLayoutDev (val), Update (val), Layout (val)
    if __DEV__ and type(a2) ~= "function" then
        console.error(
            "Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.",
            if a2 == nil then "nil" else type(a2)
        )
    end
    local v1 = if a3 == nil then nil else Array.concat(a3, {a1})
    if __DEV__ and enableDoubleInvokingEffects then
        return mountEffectImpl(bit32.bor(MountLayoutDev, Update), Layout, function() -- Line: 1447 -- upvalues: a2 (val), a1 (val)
            return imperativeHandleEffect(a2, a1)
        end, v1)
    end
    return mountEffectImpl(Update, Layout, function() -- Line: 1453 -- upvalues: a2 (val), a1 (val)
        return imperativeHandleEffect(a2, a1)
    end, v1)
end

function updateImperativeHandle(a1, a2, a3) -- Line: 1459
    -- upvalues: __DEV__ (val), console (val), Update (val), Layout (val)
    if __DEV__ and type(a2) ~= "function" then
        local v1 = "nil"
        if a2 then
            v1 = type(a2)
        end
        console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", v1)
    end
    if a3 ~= nil then
        table.insert(table.clone(a3), a1)
    end
    return updateEffectImpl(Update, Layout, function() -- Line: 1486 -- upvalues: a2 (val), a1 (val)
        return imperativeHandleEffect(a2, a1)
    end, nil)
end

function mountDebugValue(a1, a2) end

local u334 = mountDebugValue

function mountCallback(a1, a2) -- Line: 1499 -- upvalues: u247 (ref), u245 (ref) -- types: a2: table?
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    v1.memoizedState = {a1, a2}
    return a1
end

function updateCallback(a1, a2) -- Line: 1507
    -- upvalues: updateWorkInProgressHook (val), areHookInputsEqual (val)
    local v1 = updateWorkInProgressHook()
    local memoizedState = v1.memoizedState
    if memoizedState ~= nil and a2 ~= nil and areHookInputsEqual(a2, memoizedState[2]) then
        return memoizedState[1]
    end
    v1.memoizedState = {a1, a2}
    return a1
end

function mountMemo(a1, a2) -- Line: 1526 -- upvalues: u247 (ref), u245 (ref) -- types: a1: function, a2: table?
    local v1 = {}
    if u247 ~= nil then
        u247.next = v1
    else
        u245.memoizedState = v1
    end
    local v2 = v1
    v1 = {a1()}
    v2.memoizedState = {v1, a2}
    return unpack(v1)
end

function updateMemo(a1, a2) -- Line: 1538
    -- upvalues: updateWorkInProgressHook (val), areHookInputsEqual (val)
    local v1 = updateWorkInProgressHook()
    local memoizedState = v1.memoizedState
    if memoizedState ~= nil and a2 ~= nil and areHookInputsEqual(a2, memoizedState[2]) then
        return unpack(memoizedState[1])
    end
    local v2 = {a1()}
    v1.memoizedState = {v2, a2}
    return unpack(v2)
end

function u242.getIsUpdatingOpaqueValueInRenderPhaseInDEV() -- Line: 1688 -- upvalues: __DEV__ (val)
    if __DEV__ then
        return false
    end
    return nil
end

function mountOpaqueIdentifier() -- Line: 1710
    -- upvalues: __DEV__ (val), console (val), makeClientId (val), getIsHydrating (val)
    local v1 = nil
    if not __DEV__ then
        v1 = makeClientId
    else
        console.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
    end
    if not getIsHydrating() then
        local v2 = v1()
        mountState(v2)
        return v2
    end
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
    error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
    return nil
end

function updateOpaqueIdentifier() -- Line: 1777
    return (updateState(nil))
end

function rerenderOpaqueIdentifier() -- Line: 1782
    return (rerenderState(nil))
end

function dispatchAction(a1, a2, a3, ...) -- Line: 1787
    -- upvalues: __DEV__ (val), console (val), requestEventTime (val), requestUpdateLane (val), u245 (ref), u248 (ref)
    -- upvalues: u249 (ref), NoLanes (val), ReactCurrentDispatcher (val), u258 (ref)
    -- upvalues: warnIfNotScopedWithMatchingAct (val), warnIfNotCurrentlyActingUpdatesInDEV (val)
    -- upvalues: scheduleUpdateOnFiber (val), enableDebugTracing (val), DebugTracingMode (val), getComponentName (val)
    -- upvalues: logStateUpdateScheduled (val), enableSchedulingProfiler (val), markStateUpdateScheduled (val)
    local v1
    if __DEV__ then
        v1 = nil
        if (select("#", ...)) == 1 then
            v1 = select(1, ...)
        end
        if type(v1) == "function" then
            console.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
        end
    end
    local v2 = requestEventTime()
    v1 = requestUpdateLane(a1)
    local v3 = {lane = v1, action = a3}
    local pending = a2.pending
    if pending ~= nil then
        v3.next = pending.next
        pending.next = v3
    else
        v3.next = v3
    end
    a2.pending = v3
    local alternate = a1.alternate
    if a1 == u245 then
        u248 = true
        u249 = true
        if __DEV__ and enableDebugTracing and bit32.band(a1.mode, DebugTracingMode) ~= 0 then
            logStateUpdateScheduled(getComponentName(a1.type) or "Unknown", v1, a3)
        end
        if enableSchedulingProfiler then
            markStateUpdateScheduled(a1, v1)
        end
        return
    end
    if alternate ~= nil and alternate == u245 then
        u248 = true
        u249 = true
        if __DEV__ and enableDebugTracing and bit32.band(a1.mode, DebugTracingMode) ~= 0 then
            logStateUpdateScheduled(getComponentName(a1.type) or "Unknown", v1, a3)
        end
        if enableSchedulingProfiler then
            markStateUpdateScheduled(a1, v1)
        end
        return
    end
    if a1.lanes == NoLanes then
        if alternate ~= nil and alternate.lanes ~= NoLanes then
            if __DEV__ then
                if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
                    warnIfNotScopedWithMatchingAct(a1)
                    warnIfNotCurrentlyActingUpdatesInDEV(a1)
                end
            end
            scheduleUpdateOnFiber(a1, v1, v2)
            if __DEV__ and enableDebugTracing and bit32.band(a1.mode, DebugTracingMode) ~= 0 then
                logStateUpdateScheduled(getComponentName(a1.type) or "Unknown", v1, a3)
            end
            if enableSchedulingProfiler then
                markStateUpdateScheduled(a1, v1)
            end
            return
        end
        local lastRenderedReducer = a2.lastRenderedReducer
        if lastRenderedReducer ~= nil then
            local v4
            local current = nil
            if __DEV__ then
                current = ReactCurrentDispatcher.current
                ReactCurrentDispatcher.current = u258
            end
            local lastRenderedState = a2.lastRenderedState
            local success, result = pcall(lastRenderedReducer, lastRenderedState, a3)
            if success then
                v3.eagerReducer = lastRenderedReducer
                v3.eagerState = result
            end
            if __DEV__ then
                ReactCurrentDispatcher.current = current
            end
            if result ~= lastRenderedState then
                v4 = false
                if result ~= result then
                    v4 = lastRenderedState ~= lastRenderedState
                end
            else
                v4 = true
                if result == 0 then
                    v4 = true
                    if 1 / result ~= 1 / lastRenderedState then
                        v4 = false
                        if result ~= result then
                            v4 = lastRenderedState ~= lastRenderedState
                        end
                    end
                end
            end
            if v4 then
                return
            end
        end
    end
    if __DEV__ then
        if type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__ then
            warnIfNotScopedWithMatchingAct(a1)
            warnIfNotCurrentlyActingUpdatesInDEV(a1)
        end
    end
    scheduleUpdateOnFiber(a1, v1, v2)
    if __DEV__ and enableDebugTracing and bit32.band(a1.mode, DebugTracingMode) ~= 0 then
        logStateUpdateScheduled(getComponentName(a1.type) or "Unknown", v1, a3)
    end
    if enableSchedulingProfiler then
        markStateUpdateScheduled(a1, v1)
    end
end

local u355 = {
    readContext = readContext,
    useCallback = throwInvalidHookError,
    useContext = throwInvalidHookError,
    useEffect = throwInvalidHookError,
    useImperativeHandle = throwInvalidHookError,
    useLayoutEffect = throwInvalidHookError,
    useMemo = throwInvalidHookError,
    useReducer = throwInvalidHookError,
    useRef = throwInvalidHookError,
    useBinding = throwInvalidHookError,
    useState = throwInvalidHookError,
    useDebugValue = throwInvalidHookError,
    useMutableSource = throwInvalidHookError,
    useOpaqueIdentifier = throwInvalidHookError,
    unstable_isNewReconciler = enableNewReconciler,
}
u242.ContextOnlyDispatcher = u355
local u358 = {readContext = readContext}
u358.useCallback = mountCallback
u358.useContext = readContext
u358.useEffect = mountEffect
u358.useImperativeHandle = mountImperativeHandle
u358.useLayoutEffect = mountLayoutEffect
u358.useMemo = mountMemo
u358.useReducer = mountReducer
u358.useRef = mountRef
u358.useBinding = mountBinding
u358.useState = mountState
u358.useDebugValue = mountDebugValue
u358.useMutableSource = mountMutableSource
u358.useOpaqueIdentifier = mountOpaqueIdentifier
u358.unstable_isNewReconciler = enableNewReconciler
local u369 = {readContext = readContext}
u369.useCallback = updateCallback
u369.useContext = readContext
u369.useEffect = updateEffect
u369.useImperativeHandle = updateImperativeHandle
u369.useLayoutEffect = updateLayoutEffect
u369.useMemo = updateMemo
u369.useReducer = updateReducer
u369.useRef = updateRef
u369.useBinding = updateBinding
u369.useState = updateState
u369.useDebugValue = u334
u369.useMutableSource = updateMutableSource
u369.useOpaqueIdentifier = updateOpaqueIdentifier
u369.unstable_isNewReconciler = enableNewReconciler
local u379 = {readContext = readContext}
u379.useCallback = updateCallback
u379.useContext = readContext
u379.useEffect = updateEffect
u379.useImperativeHandle = updateImperativeHandle
u379.useLayoutEffect = updateLayoutEffect
u379.useMemo = updateMemo
u379.useReducer = rerenderReducer
u379.useRef = updateRef
u379.useBinding = updateBinding
u379.useState = rerenderState
u379.useDebugValue = u334
u379.useMutableSource = updateMutableSource
u379.useOpaqueIdentifier = rerenderOpaqueIdentifier
u379.unstable_isNewReconciler = enableNewReconciler
if __DEV__ then
    local function v4() -- Line: 2002 -- upvalues: console (val)
        console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
    end

    local function v5() -- Line: 2011 -- upvalues: console (val)
        console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
    end

    u406 = {
        readContext = function(a1, a2) -- Line: 2021 -- upvalues: readContext (val)
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2024 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val) -- types: a2: table?
            local v1
            u250 = "useCallback"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and a2 ~= nil then
                if type(a2) == "table" then
                    for i, j in a2 do
                        if type(i) ~= "number" then
                            if true then
                                console.error(
                                    "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                                    u250,
                                    (type(a2))
                                )
                            end
                            return mountCallback(a1, a2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error(
                        "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                        u250,
                        (type(a2))
                    )
                end
            end
            return mountCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2030 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), readContext (val)
            u250 = "useContext"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2035
            -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val), mountEffect (val)
            local v1
            u250 = "useEffect"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and a2 ~= nil then
                if type(a2) == "table" then
                    for i, j in a2 do
                        if type(i) ~= "number" then
                            if true then
                                console.error(
                                    "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                                    u250,
                                    (type(a2))
                                )
                            end
                            return mountEffect(a1, a2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error(
                        "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                        u250,
                        (type(a2))
                    )
                end
            end
            return mountEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2045
            -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val)
            local v1
            u250 = "useImperativeHandle"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and a3 ~= nil then
                if type(a3) == "table" then
                    for i, j in a3 do
                        if type(i) ~= "number" then
                            if true then
                                console.error(
                                    "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                                    u250,
                                    (type(a3))
                                )
                            end
                            return mountImperativeHandle(a1, a2, a3)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error(
                        "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                        u250,
                        (type(a3))
                    )
                end
            end
            return mountImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2055
            -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val), mountLayoutEffect (val)
            local v1
            u250 = "useLayoutEffect"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and a2 ~= nil then
                if type(a2) == "table" then
                    for i, j in a2 do
                        if type(i) ~= "number" then
                            if true then
                                console.error(
                                    "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                                    u250,
                                    (type(a2))
                                )
                            end
                            return mountLayoutEffect(a1, a2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error(
                        "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                        u250,
                        (type(a2))
                    )
                end
            end
            return mountLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2066
            -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), console (val), ReactCurrentDispatcher (val), u257 (ref)
            local current, v1, v2
            u250 = "useMemo"
            if __DEV__ then
                v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            if __DEV__ and a2 ~= nil then
                if type(a2) == "table" then
                    v2 = a2
                    for i, j in v2 do
                        if type(i) ~= "number" then
                            if true then
                                console.error(
                                    "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                                    u250,
                                    (type(a2))
                                )
                            end
                            current = ReactCurrentDispatcher.current
                            ReactCurrentDispatcher.current = u257
                            v2 = {pcall(mountMemo, a1, a2)}
                            ReactCurrentDispatcher.current = current
                            if not v2[1] then
                                error(v2[2])
                            end
                            return unpack(v2, 2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error(
                        "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                        u250,
                        (type(a2))
                    )
                end
            end
            current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            v2 = {pcall(mountMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v2[1] then
                error(v2[2])
            end
            return unpack(v2, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2084
            -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useReducer"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local success, result, v2 = pcall(mountReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v2
        end,
        useRef = function(a1) -- Line: 2102 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useRef"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountRef(a1)
        end,
        useBinding = function(a1) -- Line: 2108 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useBinding"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountBinding(a1)
        end,
        useState = function(a1) -- Line: 2113 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useState"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local success, result, v2 = pcall(mountState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v2
        end,
        useDebugValue = function(a1, a2) -- Line: 2127 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref) -- types: a2: function?
            u250 = "useDebugValue"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountDebugValue(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 2142 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useMutableSource"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 2157 -- upvalues: u250 (ref), __DEV__ (val), u251 (ref)
            u250 = "useOpaqueIdentifier"
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u422 = {
        readContext = function(a1, a2) -- Line: 2167 -- upvalues: readContext (val)
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2170 -- upvalues: u250 (ref), __DEV__ (val), console (val) -- types: a2: table?
            u250 = "useCallback"
            updateHookTypesDev()
            if __DEV__ and a2 ~= nil then
                local v1
                if type(a2) == "table" then
                    for i, j in a2 do
                        if type(i) ~= "number" then
                            if true then
                                console.error(
                                    "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                                    u250,
                                    (type(a2))
                                )
                            end
                            return mountCallback(a1, a2)
                        end
                    end
                    v1 = true
                else
                    v1 = false
                end
                if not v1 then
                    console.error(
                        "%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.",
                        u250,
                        (type(a2))
                    )
                end
            end
            return mountCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2176 -- upvalues: u250 (ref), readContext (val)
            u250 = "useContext"
            updateHookTypesDev()
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2181 -- upvalues: u250 (ref), mountEffect (val) -- types: a1: function, a2: table?
            u250 = "useEffect"
            updateHookTypesDev()
            return mountEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2190 -- upvalues: u250 (ref) -- types: a2: function, a3: table?
            u250 = "useImperativeHandle"
            updateHookTypesDev()
            return mountImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2199 -- upvalues: u250 (ref), mountLayoutEffect (val) -- types: a1: function, a2: table?
            u250 = "useLayoutEffect"
            updateHookTypesDev()
            return mountLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2209
            -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useMemo"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local v1 = {pcall(mountMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v1[1] then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2225
            -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useReducer"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local success, result, v1 = pcall(mountReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useRef = function(a1) -- Line: 2243 -- upvalues: u250 (ref)
            u250 = "useRef"
            updateHookTypesDev()
            return mountRef(a1)
        end,
        useBinding = function(a1) -- Line: 2249 -- upvalues: u250 (ref)
            u250 = "useBinding"
            updateHookTypesDev()
            return mountBinding(a1)
        end,
        useState = function(a1) -- Line: 2254 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useState"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local success, result, v1 = pcall(mountState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useDebugValue = function(a1, a2) -- Line: 2268 -- upvalues: u250 (ref) -- types: a2: function?
            u250 = "useDebugValue"
            updateHookTypesDev()
            return mountDebugValue(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 2283 -- upvalues: u250 (ref)
            u250 = "useMutableSource"
            updateHookTypesDev()
            return mountMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 2298 -- upvalues: u250 (ref)
            u250 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return mountOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u438 = {
        readContext = function(a1, a2) -- Line: 2308 -- upvalues: readContext (val)
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2311 -- upvalues: u250 (ref) -- types: a2: table?
            u250 = "useCallback"
            updateHookTypesDev()
            return updateCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2316 -- upvalues: u250 (ref), readContext (val)
            u250 = "useContext"
            updateHookTypesDev()
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2321 -- upvalues: u250 (ref), updateEffect (val) -- types: a1: function, a2: table?
            u250 = "useEffect"
            updateHookTypesDev()
            return updateEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2330 -- upvalues: u250 (ref) -- types: a2: function, a3: table?
            u250 = "useImperativeHandle"
            updateHookTypesDev()
            return updateImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2339 -- upvalues: u250 (ref), updateLayoutEffect (val) -- types: a1: function, a2: table?
            u250 = "useLayoutEffect"
            updateHookTypesDev()
            return updateLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2349
            -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useMemo"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local v1 = {pcall(updateMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v1[1] then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2365
            -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useReducer"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local success, result, v1 = pcall(updateReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useRef = function(a1) -- Line: 2383 -- upvalues: u250 (ref)
            u250 = "useRef"
            updateHookTypesDev()
            return updateRef(a1)
        end,
        useBinding = function(a1) -- Line: 2389 -- upvalues: u250 (ref)
            u250 = "useBinding"
            updateHookTypesDev()
            return updateBinding(a1)
        end,
        useState = function(a1) -- Line: 2394 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useState"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local success, result, v1 = pcall(updateState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useDebugValue = function(a1, a2) -- Line: 2408 -- upvalues: u250 (ref), u334 (val) -- types: a2: function?
            u250 = "useDebugValue"
            updateHookTypesDev()
            return u334(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 2423 -- upvalues: u250 (ref)
            u250 = "useMutableSource"
            updateHookTypesDev()
            return updateMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 2438 -- upvalues: u250 (ref)
            u250 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return updateOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u454 = {
        readContext = function(a1, a2) -- Line: 2448 -- upvalues: readContext (val)
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2451 -- upvalues: u250 (ref) -- types: a2: table?
            u250 = "useCallback"
            updateHookTypesDev()
            return mountCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2456 -- upvalues: u250 (ref), readContext (val)
            u250 = "useContext"
            updateHookTypesDev()
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2461 -- upvalues: u250 (ref), updateEffect (val) -- types: a1: function, a2: table?
            u250 = "useEffect"
            updateHookTypesDev()
            return updateEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2470 -- upvalues: u250 (ref) -- types: a2: function, a3: table?
            u250 = "useImperativeHandle"
            updateHookTypesDev()
            return updateImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2479 -- upvalues: u250 (ref), updateLayoutEffect (val) -- types: a1: function, a2: table?
            u250 = "useLayoutEffect"
            updateHookTypesDev()
            return updateLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2489
            -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u259 (ref)
            u250 = "useMemo"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u259
            local v1 = {pcall(updateMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v1[1] then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2505
            -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u259 (ref)
            u250 = "useReducer"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u259
            local success, result, v1 = pcall(rerenderReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useRef = function(a1) -- Line: 2524 -- upvalues: u250 (ref)
            u250 = "useRef"
            updateHookTypesDev()
            return updateRef(a1)
        end,
        useBinding = function(a1) -- Line: 2530 -- upvalues: u250 (ref)
            u250 = "useBinding"
            updateHookTypesDev()
            return updateBinding(a1)
        end,
        useState = function(a1) -- Line: 2535 -- upvalues: u250 (ref), ReactCurrentDispatcher (val), u259 (ref)
            u250 = "useState"
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u259
            local success, result, v1 = pcall(rerenderState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useDebugValue = function(a1, a2) -- Line: 2549 -- upvalues: u250 (ref), u334 (val) -- types: a2: function?
            u250 = "useDebugValue"
            updateHookTypesDev()
            return u334(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 2564 -- upvalues: u250 (ref)
            u250 = "useMutableSource"
            updateHookTypesDev()
            return updateMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 2579 -- upvalues: u250 (ref)
            u250 = "useOpaqueIdentifier"
            updateHookTypesDev()
            return rerenderOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    local v6 = {
        readContext = function(a1, a2) -- Line: 2589 -- upvalues: console (val), readContext (val)
            console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2593 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref) -- types: a2: table?
            u250 = "useCallback"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2599 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), readContext (val)
            u250 = "useContext"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2605
            -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), mountEffect (val)
            u250 = "useEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2615
            -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useImperativeHandle"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2625
            -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), mountLayoutEffect (val)
            u250 = "useLayoutEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2636
            -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useMemo"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local v2 = {pcall(mountMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v2[1] then
                error(v2[2])
            end
            return unpack(v2, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2653
            -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useReducer"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local success, result, v2 = pcall(mountReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v2
        end,
        useRef = function(a1) -- Line: 2672 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useRef"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountRef(a1)
        end,
        useBinding = function(a1) -- Line: 2679 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useBinding"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountBinding(a1)
        end,
        useState = function(a1) -- Line: 2685
            -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref), ReactCurrentDispatcher (val), u257 (ref)
            u250 = "useState"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u257
            local success, result, v2 = pcall(mountState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v2
        end,
        useDebugValue = function(a1, a2) -- Line: 2700 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref) -- types: a2: function?
            u250 = "useDebugValue"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountDebugValue(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 2718 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useMutableSource"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 2734 -- upvalues: u250 (ref), console (val), __DEV__ (val), u251 (ref)
            u250 = "useOpaqueIdentifier"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            if __DEV__ then
                local v1 = u250
                if u251 ~= nil then
                    table.insert(u251, v1)
                else
                    u251 = {v1}
                end
            end
            return mountOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    u258 = {
        readContext = function(a1, a2) -- Line: 2745 -- upvalues: console (val), readContext (val)
            console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2749 -- upvalues: u250 (ref), console (val) -- types: a2: table?
            u250 = "useCallback"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return mountCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2755 -- upvalues: u250 (ref), console (val), readContext (val)
            u250 = "useContext"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2761
            -- upvalues: u250 (ref), console (val), updateEffect (val)
            u250 = "useEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2771 -- upvalues: u250 (ref), console (val) -- types: a2: function, a3: table?
            u250 = "useImperativeHandle"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2781
            -- upvalues: u250 (ref), console (val), updateLayoutEffect (val)
            u250 = "useLayoutEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2792
            -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useMemo"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local v1 = {pcall(updateMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v1[1] then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2809
            -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useReducer"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local success, result, v1 = pcall(updateReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useRef = function(a1) -- Line: 2829 -- upvalues: u250 (ref), console (val)
            u250 = "useRef"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateRef(a1)
        end,
        useBinding = function(a1) -- Line: 2836 -- upvalues: u250 (ref), console (val)
            u250 = "useBinding"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateBinding(a1)
        end,
        useState = function(a1) -- Line: 2842 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useState"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local success, result, v1 = pcall(updateState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useDebugValue = function(a1, a2) -- Line: 2857 -- upvalues: u250 (ref), console (val), u334 (val) -- types: a2: function?
            u250 = "useDebugValue"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return u334(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 2875 -- upvalues: u250 (ref), console (val)
            u250 = "useMutableSource"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 2891 -- upvalues: u250 (ref), console (val)
            u250 = "useOpaqueIdentifier"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
    v6 = {
        readContext = function(a1, a2) -- Line: 2902 -- upvalues: console (val), readContext (val)
            console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
            return readContext(a1, a2)
        end,
        useCallback = function(a1, a2) -- Line: 2906 -- upvalues: u250 (ref), console (val) -- types: a2: table?
            u250 = "useCallback"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateCallback(a1, a2)
        end,
        useContext = function(a1, a2) -- Line: 2912 -- upvalues: u250 (ref), console (val), readContext (val)
            u250 = "useContext"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return readContext(a1, a2)
        end,
        useEffect = function(a1, a2) -- Line: 2918
            -- upvalues: u250 (ref), console (val), updateEffect (val)
            u250 = "useEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateEffect(a1, a2)
        end,
        useImperativeHandle = function(a1, a2, a3) -- Line: 2928 -- upvalues: u250 (ref), console (val) -- types: a2: function, a3: table?
            u250 = "useImperativeHandle"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateImperativeHandle(a1, a2, a3)
        end,
        useLayoutEffect = function(a1, a2) -- Line: 2938
            -- upvalues: u250 (ref), console (val), updateLayoutEffect (val)
            u250 = "useLayoutEffect"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateLayoutEffect(a1, a2)
        end,
        useMemo = function(a1, a2) -- Line: 2949
            -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useMemo"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local v1 = {pcall(updateMemo, a1, a2)}
            ReactCurrentDispatcher.current = current
            if not v1[1] then
                error(v1[2])
            end
            return unpack(v1, 2)
        end,
        useReducer = function(a1, a2, a3) -- Line: 2966
            -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useReducer"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local success, result, v1 = pcall(rerenderReducer, a1, a2, a3)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useRef = function(a1) -- Line: 2986 -- upvalues: u250 (ref), console (val)
            u250 = "useRef"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateRef(a1)
        end,
        useBinding = function(a1) -- Line: 2993 -- upvalues: u250 (ref), console (val)
            u250 = "useBinding"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateBinding(a1)
        end,
        useState = function(a1) -- Line: 2999 -- upvalues: u250 (ref), console (val), ReactCurrentDispatcher (val), u258 (ref)
            u250 = "useState"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            local current = ReactCurrentDispatcher.current
            ReactCurrentDispatcher.current = u258
            local success, result, v1 = pcall(rerenderState, a1)
            ReactCurrentDispatcher.current = current
            if not success then
                error(result)
            end
            return result, v1
        end,
        useDebugValue = function(a1, a2) -- Line: 3014 -- upvalues: u250 (ref), console (val), u334 (val) -- types: a2: function?
            u250 = "useDebugValue"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return u334(a1, a2)
        end,
        useMutableSource = function(a1, a2, a3) -- Line: 3032 -- upvalues: u250 (ref), console (val)
            u250 = "useMutableSource"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return updateMutableSource(a1, a2, a3)
        end,
        useOpaqueIdentifier = function() -- Line: 3048 -- upvalues: u250 (ref), console (val)
            u250 = "useOpaqueIdentifier"
            console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
            updateHookTypesDev()
            return rerenderOpaqueIdentifier()
        end,
        unstable_isNewReconciler = enableNewReconciler,
    }
end

function u242.renderWithHooks(a1, a2, a3, a4, a5, a6) -- Line: 3059
    -- upvalues: u244 (ref), u245 (ref), __DEV__ (val), u251 (ref), u252 (ref), NoLanes (val)
    -- upvalues: ReactCurrentDispatcher (val), u438 (ref), u422 (ref), u406 (ref), u358 (val), u369 (val), u249 (ref)
    -- upvalues: Error (val), u246 (ref), u247 (ref), u454 (ref), u379 (val), u355 (val), u250 (ref), u248 (ref)
    local v1
    u244 = a6
    u245 = a2
    if __DEV__ then
        u251 = if a1 == nil then nil else a1._debugHookTypes
        u252 = 0
    end
    a2.memoizedState = nil
    a2.updateQueue = nil
    a2.lanes = NoLanes
    if not __DEV__ then
        ReactCurrentDispatcher.current = if a1 == nil then u358 or u369 else not (a1.memoizedState ~= nil) and u358 or u369
    elseif a1 == nil then
        if u251 == nil then
            ReactCurrentDispatcher.current = u406
        else
            ReactCurrentDispatcher.current = u422
        end
    elseif a1.memoizedState ~= nil then
        ReactCurrentDispatcher.current = u438
    elseif u251 == nil then
        ReactCurrentDispatcher.current = u406
    else
        ReactCurrentDispatcher.current = u422
    end
    local v2 = a3(a4, a5)
    if u249 then
        v1 = 0
        repeat
            u249 = false
            if v1 >= 25 then
                error(Error.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
            end
            v1 = v1 + 1
            u246 = nil
            u247 = nil
            a2.updateQueue = nil
            if __DEV__ then
                u252 = 0
            end
            ReactCurrentDispatcher.current = __DEV__ and u454 or u379
            v2 = a3(a4, a5)
        until not u249
    end
    ReactCurrentDispatcher.current = u355
    if __DEV__ then
        a2._debugHookTypes = u251
    end
    v1 = false
    if u246 ~= nil then
        v1 = u246.next ~= nil
    end
    u244 = NoLanes
    u245 = nil
    u246 = nil
    u247 = nil
    if __DEV__ then
        u250 = nil
        u251 = nil
        u252 = 0
    end
    u248 = false
    if v1 then
        error(Error.new("Rendered fewer hooks than expected. This may be caused by an accidental early return statement."))
    end
    return v2
end

return u242