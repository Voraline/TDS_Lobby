-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberRoot.new
-- Decompile time: 1.88 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Set = v1.Set
local Map = v1.Map
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactRootTags = require(script.Parent:WaitForChild("ReactRootTags"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local noTimeout = ReactFiberHostConfig.noTimeout
local supportsHydration = ReactFiberHostConfig.supportsHydration
local createHostRootFiber = (require((script.Parent:WaitForChild("ReactFiber.new")))).createHostRootFiber
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local NoLanes = ReactFiberLane.NoLanes
local NoLanePriority = ReactFiberLane.NoLanePriority
local NoTimestamp = ReactFiberLane.NoTimestamp
local createLaneMap = ReactFiberLane.createLaneMap
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local enableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local unstable_getThreadID = (require((script.Parent.Parent:WaitForChild("scheduler")))).tracing.unstable_getThreadID
local initializeUpdateQueue = (require((script.Parent:WaitForChild("ReactUpdateQueue.new")))).initializeUpdateQueue
local LegacyRoot = ReactRootTags.LegacyRoot
local BlockingRoot = ReactRootTags.BlockingRoot
local ConcurrentRoot = ReactRootTags.ConcurrentRoot
local v2 = {}

local function FiberRootNode(a1, a2, a3) -- Line: 47
    -- upvalues: noTimeout (val), NoLanePriority (val), createLaneMap (val), NoLanes (val), NoTimestamp (val)
    -- upvalues: supportsHydration (val), enableSchedulerTracing (val), unstable_getThreadID (val), Set (val), Map (val)
    -- upvalues: enableSuspenseCallback (val), BlockingRoot (val), ConcurrentRoot (val), LegacyRoot (val)
    local v1 = {
        tag = a2,
        containerInfo = a1,
        timeoutHandle = noTimeout,
        hydrate = a3,
        callbackPriority = NoLanePriority,
        eventTimes = createLaneMap(NoLanes),
        expirationTimes = createLaneMap(NoTimestamp),
        pendingLanes = NoLanes,
        suspendedLanes = NoLanes,
        pingedLanes = NoLanes,
        expiredLanes = NoLanes,
        mutableReadLanes = NoLanes,
        finishedLanes = NoLanes,
        entangledLanes = NoLanes,
        entanglements = createLaneMap(NoLanes),
    }
    if supportsHydration then
        v1.mutableSourceEagerHydrationData = nil
    end
    if enableSchedulerTracing then
        v1.interactionThreadID = unstable_getThreadID()
        v1.memoizedInteractions = Set.new()
        v1.pendingInteractionMap = Map.new()
    end
    if enableSuspenseCallback then
        v1.hydrationCallbacks = nil
    end
    if _G.__DEV__ then
        if a2 == BlockingRoot then
            v1._debugRootType = "createBlockingRoot()"
            return v1
        end
        if a2 == ConcurrentRoot then
            v1._debugRootType = "createRoot()"
            return v1
        end
        if a2 == LegacyRoot then
            v1._debugRootType = "createLegacyRoot()"
        end
    end
    return v1
end

function v2.createFiberRoot(a1, a2, a3, a4) -- Line: 103
    -- upvalues: FiberRootNode (val), enableSuspenseCallback (val), createHostRootFiber (val)
    -- upvalues: initializeUpdateQueue (val)
    local v1 = FiberRootNode(a1, a2, a3)
    if enableSuspenseCallback then
        v1.hydrationCallbacks = a4
    end
    local v2 = createHostRootFiber(a2)
    v1.current = v2
    v2.stateNode = v1
    initializeUpdateQueue(v2)
    return v1
end

return v2