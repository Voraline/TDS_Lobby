-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberThrow.new
-- Decompile time: 12.98 ms

local Object = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactCapturedValue"))
local v1 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
local v2 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local DidCapture = ReactFiberFlags.DidCapture
local Incomplete = ReactFiberFlags.Incomplete
local NoFlags = ReactFiberFlags.NoFlags
local ShouldCapture = ReactFiberFlags.ShouldCapture
local LifecycleEffectMask = ReactFiberFlags.LifecycleEffectMask
local ForceUpdateForLegacySuspense = ReactFiberFlags.ForceUpdateForLegacySuspense
local shouldCaptureSuspense = require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new")).shouldCaptureSuspense
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local NoMode = ReactTypeOfMode.NoMode
local BlockingMode = ReactTypeOfMode.BlockingMode
local DebugTracingMode = ReactTypeOfMode.DebugTracingMode
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local createCapturedValue = require(script.Parent:WaitForChild("ReactCapturedValue")).createCapturedValue
local enqueueCapturedUpdate = v1.enqueueCapturedUpdate
local createUpdate = v1.createUpdate
local CaptureUpdate = v1.CaptureUpdate
local ForceUpdate = v1.ForceUpdate
local enqueueUpdate = v1.enqueueUpdate
local markFailedErrorBoundaryForHotReloading = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading
local hasSuspenseContext = v2.hasSuspenseContext
local InvisibleParentSuspenseContext = v2.InvisibleParentSuspenseContext
local suspenseStackCursor = v2.suspenseStackCursor
local u160 = nil
local u161 = nil
local u162 = nil
local u163 = nil

local function u164(...) -- Line: 87 -- upvalues: u161 (ref), u160 (ref)
    if not u161 then
        u160 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
        u161 = u160.markLegacyErrorBoundaryAsFailed
    end
    return u161(...)
end

local function u165(...) -- Line: 102 -- upvalues: u160 (ref), u163 (ref)
    if u160 == nil then
        u160 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u163 = u160.pingSuspendedRoot
    return u163(...)
end

local function u166(...) -- Line: 109 -- upvalues: u160 (ref), u162 (ref)
    if u160 == nil then
        u160 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u162 = u160.isAlreadyFailedLegacyErrorBoundary
    return u162(...)
end

local logCapturedError = require(script.Parent:WaitForChild("ReactFiberErrorLogger")).logCapturedError
local logComponentSuspended = require(script.Parent:WaitForChild("DebugTracing")).logComponentSuspended
local markComponentSuspended = (require((script.Parent:WaitForChild("SchedulingProfiler")))).markComponentSuspended
local SyncLane = ReactFiberLane.SyncLane
local NoTimestamp = ReactFiberLane.NoTimestamp
local includesSomeLane = ReactFiberLane.includesSomeLane
local mergeLanes = ReactFiberLane.mergeLanes
local pickArbitraryLane = ReactFiberLane.pickArbitraryLane

function createRootErrorUpdate(a1, a2, a3, a4) -- Line: 130
    -- upvalues: createUpdate (val), NoTimestamp (val), CaptureUpdate (val), Object (val), logCapturedError (val)
    local v1 = createUpdate(NoTimestamp, a3)
    v1.tag = CaptureUpdate
    v1.payload = {element = Object.None}
    local value = a2.value

    function v1.callback() -- Line: 144 -- upvalues: a4 (val), value (val), logCapturedError (upval), a1 (val), a2 (val)
        if a4 ~= nil then
            a4(value)
        end
        logCapturedError(a1, a2)
    end

    return v1
end

function createClassErrorUpdate(a1, a2, a3) -- Line: 153
    -- upvalues: createUpdate (val), NoTimestamp (val), CaptureUpdate (val), logCapturedError (val)
    -- upvalues: markFailedErrorBoundaryForHotReloading (val), u164 (val), includesSomeLane (val), SyncLane (val)
    -- upvalues: console (val), getComponentName (val)
    local v1 = createUpdate(NoTimestamp, a3)
    v1.tag = CaptureUpdate
    local getDerivedStateFromError = a1.type.getDerivedStateFromError
    if typeof(getDerivedStateFromError) == "function" then
        local value = a2.value

        function v1.payload() -- Line: 163
            -- upvalues: logCapturedError (upval), a1 (val), a2 (val), getDerivedStateFromError (val), value (val)
            logCapturedError(a1, a2)
            return getDerivedStateFromError(value)
        end
    end
    local stateNode = a1.stateNode
    if stateNode ~= nil and typeof(stateNode.componentDidCatch) == "function" then
        function v1.callback() -- Line: 171
            -- upvalues: markFailedErrorBoundaryForHotReloading (upval), a1 (val), getDerivedStateFromError (val)
            -- upvalues: u164 (upval), stateNode (val), logCapturedError (upval), a2 (val), includesSomeLane (upval)
            -- upvalues: SyncLane (upval), console (upval), getComponentName (upval)
            if _G.__DEV__ then
                markFailedErrorBoundaryForHotReloading(a1)
            end
            if typeof(getDerivedStateFromError) ~= "function" then
                u164(stateNode)
                logCapturedError(a1, a2)
            end
            stateNode:componentDidCatch(a2.value, {componentStack = a2.stack or ""})
            if _G.__DEV__
                and typeof(getDerivedStateFromError) ~= "function"
                and not includesSomeLane(a1.lanes, SyncLane) then
                console.error(
                    "%s: Error boundaries should implement getDerivedStateFromError(). In that method, return a state update to display an error message or fallback UI.",
                    getComponentName(a1.type) or "Unknown"
                )
            end
        end

        return v1
    end
    if _G.__DEV__ then
        function v1.callback() -- Line: 209 -- upvalues: markFailedErrorBoundaryForHotReloading (upval), a1 (val)
            markFailedErrorBoundaryForHotReloading(a1)
        end
    end
    return v1
end

local function attachPingListener(a1, a2, a3) -- Line: 216 -- upvalues: u165 (val)
    local v1
    local pingCache = a1.pingCache
    if pingCache ~= nil then
        v1 = pingCache[a2]
        if v1 == nil then
            pingCache[a2] = {}
        end
    else
        a1.pingCache = {[a2] = {}}
        local pingCache_2 = a1.pingCache
    end
    if not v1[a3] then
        v1[a3] = true

        local function v2() -- Line: 244 -- upvalues: u165 (upval), a1 (val), a2 (val), a3 (val)
            return u165(a1, a2, a3)
        end

        a2:andThen(v2, v2)
    end
end

function throwException(a1, a2, a3, a4, a5, a6, a7) -- Line: 251
    -- upvalues: Incomplete (val), enableDebugTracing (val), DebugTracingMode (val), getComponentName (val)
    -- upvalues: logComponentSuspended (val), enableSchedulingProfiler (val), markComponentSuspended (val)
    -- upvalues: BlockingMode (val), NoMode (val), hasSuspenseContext (val), suspenseStackCursor (val)
    -- upvalues: InvisibleParentSuspenseContext (val), SuspenseComponent (val), shouldCaptureSuspense (val)
    -- upvalues: DidCapture (val), ForceUpdateForLegacySuspense (val), LifecycleEffectMask (val), ClassComponent (val)
    -- upvalues: IncompleteClassComponent (val), createUpdate (val), NoTimestamp (val), SyncLane (val)
    -- upvalues: ForceUpdate (val), enqueueUpdate (val), mergeLanes (val), attachPingListener (val), ShouldCapture (val)
    -- upvalues: createCapturedValue (val), HostRoot (val), pickArbitraryLane (val), enqueueCapturedUpdate (val)
    -- upvalues: NoFlags (val), u166 (val)
    local return__2, stateNode, type, v1, v2, v3
    a3.flags = bit32.bor(a3.flags, Incomplete)
    if a4 ~= nil and typeof(a4) == "table" and typeof(a4.andThen) == "function" then
        local updateQueue, v4
        local v5 = a4
        if _G.__DEV__ and enableDebugTracing and bit32.band(a3.mode, DebugTracingMode) ~= 0 then
            logComponentSuspended(getComponentName(a3.type) or "Unknown", v5)
        end
        if enableSchedulingProfiler then
            markComponentSuspended(a3, v5)
        end
        if (bit32.band(a3.mode, BlockingMode)) == NoMode then
            local alternate = a3.alternate
            if not alternate then
                a3.updateQueue = nil
                a3.memoizedState = nil
            else
                a3.updateQueue = alternate.updateQueue
                a3.memoizedState = alternate.memoizedState
                a3.lanes = alternate.lanes
            end
        end
        local v6 = hasSuspenseContext(suspenseStackCursor.current, InvisibleParentSuspenseContext)
        local return_ = a2
        while true do
            if return_.tag == SuspenseComponent then
                if shouldCaptureSuspense(return_, v6) then
                    updateQueue = return_.updateQueue
                    if updateQueue ~= nil then
                        updateQueue[v5] = true
                    else
                        return_.updateQueue = {[v5] = true}
                    end
                    if (bit32.band(return_.mode, BlockingMode)) ~= NoMode then
                        attachPingListener(v7, v5, a5)
                        return_.flags = bit32.bor(return_.flags, ShouldCapture)
                        return_.lanes = a5
                        return
                    end
                    return_.flags = bit32.bor(return_.flags, DidCapture)
                    a3.flags = bit32.bor(a3.flags, ForceUpdateForLegacySuspense)
                    a3.flags = bit32.band(a3.flags, (bit32.bnot((bit32.bor(LifecycleEffectMask, Incomplete)))))
                    if a3.tag == ClassComponent then
                        if a3.alternate ~= nil then
                            v4 = createUpdate(NoTimestamp, SyncLane)
                            v4.tag = ForceUpdate
                            enqueueUpdate(a3, v4)
                        else
                            a3.tag = IncompleteClassComponent
                        end
                    end
                    a3.lanes = mergeLanes(a3.lanes, SyncLane)
                    return
                end
            end
            return_ = return_.return_
            if return_ == nil then
                a7()
                v2 = createCapturedValue(
                    (getComponentName(a3.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n\nAdd a <Suspense fallback=...> component higher in the tree to provide a loading indicator or placeholder to display.",
                    a3
                )
                return__2 = a2
                while return__2.tag ~= HostRoot do
                    if return__2.tag == ClassComponent then
                        type = return__2.type
                        stateNode = return__2.stateNode
                        v1 = bit32.band(return__2.flags, DidCapture)
                        if v1 == NoFlags then
                            if typeof(type.getDerivedStateFromError) == "function" then
                                return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                                v1 = pickArbitraryLane(a5)
                                return__2.lanes = mergeLanes(return__2.lanes, v1)
                                enqueueCapturedUpdate(return__2, (createClassErrorUpdate(return__2, v2, v1)))
                                return
                            end
                            if stateNode ~= nil
                                and typeof(stateNode.componentDidCatch) == "function"
                                and not u166(stateNode) then
                                return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                                v1 = pickArbitraryLane(a5)
                                return__2.lanes = mergeLanes(return__2.lanes, v1)
                                enqueueCapturedUpdate(return__2, (createClassErrorUpdate(return__2, v2, v1)))
                                return
                            end
                            return__2 = return__2.return_
                            if return__2 ~= nil then
                                continue
                            end
                            return
                        end
                    end
                    return__2 = return__2.return_
                    if return__2 == nil then
                        return
                    end
                end
                return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                v3 = pickArbitraryLane(a5)
                return__2.lanes = mergeLanes(return__2.lanes, v3)
                enqueueCapturedUpdate(return__2, (createRootErrorUpdate(return__2, v2, v3, a6)))
                return
            end
        end
    end
    a7()
    v2 = createCapturedValue(a4, a3)
    return__2 = a2
    while return__2.tag ~= HostRoot do
        if return__2.tag == ClassComponent then
            type = return__2.type
            stateNode = return__2.stateNode
            v1 = bit32.band(return__2.flags, DidCapture)
            if v1 == NoFlags then
                if typeof(type.getDerivedStateFromError) == "function" then
                    return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                    v1 = pickArbitraryLane(a5)
                    return__2.lanes = mergeLanes(return__2.lanes, v1)
                    enqueueCapturedUpdate(return__2, (createClassErrorUpdate(return__2, v2, v1)))
                    return
                end
                if stateNode ~= nil and typeof(stateNode.componentDidCatch) == "function" and not u166(stateNode) then
                    return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
                    v1 = pickArbitraryLane(a5)
                    return__2.lanes = mergeLanes(return__2.lanes, v1)
                    enqueueCapturedUpdate(return__2, (createClassErrorUpdate(return__2, v2, v1)))
                    return
                end
                return__2 = return__2.return_
                if return__2 ~= nil then
                    continue
                end
                return
            end
        end
        return__2 = return__2.return_
        if return__2 == nil then
            return
        end
    end
    return__2.flags = bit32.bor(return__2.flags, ShouldCapture)
    v3 = pickArbitraryLane(a5)
    return__2.lanes = mergeLanes(return__2.lanes, v3)
    enqueueCapturedUpdate(return__2, (createRootErrorUpdate(return__2, v2, v3, a6)))
end

return {
    throwException = throwException,
    createRootErrorUpdate = createRootErrorUpdate,
    createClassErrorUpdate = createClassErrorUpdate,
}