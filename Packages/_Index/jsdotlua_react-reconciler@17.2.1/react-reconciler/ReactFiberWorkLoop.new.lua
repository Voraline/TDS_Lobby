-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberWorkLoop.new
-- Decompile time: 91.66 ms

local flushPassiveUnmountEffects, flushWorkAndMicroTasks, u538
local __DEV__ = _G.__DEV__
local __YOLO__ = _G.__YOLO__
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local Set = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Set
local u24 = {}
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local scheduler = require(script.Parent.Parent:WaitForChild("scheduler"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local skipUnmountedBoundaries = ReactFeatureFlags.skipUnmountedBoundaries
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local v2 = require(script.Parent.Parent:WaitForChild("shared"))
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local v3 = v2.ReactSharedInternals
local invariant = v2.invariant
local v4 = require(script.Parent:WaitForChild("SchedulerWithReactIntegration.new"))
local scheduleCallback = v4.scheduleCallback
local cancelCallback = v4.cancelCallback
local getCurrentPriorityLevel = v4.getCurrentPriorityLevel
local runWithPriority = v4.runWithPriority
local shouldYield = v4.shouldYield
local requestPaint = v4.requestPaint
local now = v4.now
local NoPriority = v4.NoPriority
local ImmediatePriority = v4.ImmediatePriority
local UserBlockingPriority = v4.UserBlockingPriority
local NormalPriority = v4.NormalPriority
local flushSyncCallbackQueue = v4.flushSyncCallbackQueue
local scheduleSyncCallback = v4.scheduleSyncCallback
local DebugTracing = require(script.Parent:WaitForChild("DebugTracing"))
local SchedulingProfiler = require(script.Parent:WaitForChild("SchedulingProfiler"))
local v5 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing
local __interactionsRef = v5.__interactionsRef
local __subscriberRef = v5.__subscriberRef
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local u174 = require(script.Parent:WaitForChild("ReactFiber.new"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local LegacyRoot = require(script.Parent:WaitForChild("ReactRootTags")).LegacyRoot
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local SyncLane = ReactFiberLane.SyncLane
local SyncBatchedLane = ReactFiberLane.SyncBatchedLane
local NoTimestamp = ReactFiberLane.NoTimestamp
local findUpdateLane = ReactFiberLane.findUpdateLane
local findTransitionLane = ReactFiberLane.findTransitionLane
local findRetryLane = ReactFiberLane.findRetryLane
local includesSomeLane = ReactFiberLane.includesSomeLane
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local mergeLanes = ReactFiberLane.mergeLanes
local removeLanes = ReactFiberLane.removeLanes
local pickArbitraryLane = ReactFiberLane.pickArbitraryLane
local hasDiscreteLanes = ReactFiberLane.hasDiscreteLanes
local includesNonIdleWork = ReactFiberLane.includesNonIdleWork
local includesOnlyRetries = ReactFiberLane.includesOnlyRetries
local includesOnlyTransitions = ReactFiberLane.includesOnlyTransitions
local getNextLanes = ReactFiberLane.getNextLanes
local returnNextLanesPriority = ReactFiberLane.returnNextLanesPriority
local setCurrentUpdateLanePriority = ReactFiberLane.setCurrentUpdateLanePriority
local getCurrentUpdateLanePriority = ReactFiberLane.getCurrentUpdateLanePriority
local markStarvedLanesAsExpired = ReactFiberLane.markStarvedLanesAsExpired
local getLanesToRetrySynchronouslyOnError = ReactFiberLane.getLanesToRetrySynchronouslyOnError
local getMostRecentEventTime = ReactFiberLane.getMostRecentEventTime
local markRootUpdated = ReactFiberLane.markRootUpdated
local markRootSuspended = ReactFiberLane.markRootSuspended
local markRootPinged = ReactFiberLane.markRootPinged
local markRootExpired = ReactFiberLane.markRootExpired
local markDiscreteUpdatesExpired = ReactFiberLane.markDiscreteUpdatesExpired
local markRootFinished = ReactFiberLane.markRootFinished
local schedulerPriorityToLanePriority = ReactFiberLane.schedulerPriorityToLanePriority
local lanePriorityToSchedulerPriority = ReactFiberLane.lanePriorityToSchedulerPriority
local ReactFiberTransition = require(script.Parent:WaitForChild("ReactFiberTransition"))
local v6 = require(script.Parent:WaitForChild("ReactFiberUnwindWork.new"))
local unwindWork = v6.unwindWork
local unwindInterruptedWork = v6.unwindInterruptedWork
local v7 = require(script.Parent:WaitForChild("ReactFiberThrow.new"))
local throwException = v7.throwException
local createRootErrorUpdate = v7.createRootErrorUpdate
local createClassErrorUpdate = v7.createClassErrorUpdate
local u274 = require(script.Parent:WaitForChild("ReactFiberCommitWork.new"))
local commitBeforeMutationLifeCycles = u274.commitBeforeMutationLifeCycles
local commitPlacement = u274.commitPlacement
local commitWork = u274.commitWork
local commitDeletion = u274.commitDeletion
local commitPassiveUnmount = u274.commitPassiveUnmount
local commitPassiveUnmountInsideDeletedTree = u274.commitPassiveUnmountInsideDeletedTree
local commitPassiveMount = u274.commitPassiveMount
local commitDetachRef = u274.commitDetachRef
local invokeLayoutEffectMountInDEV = u274.invokeLayoutEffectMountInDEV
local invokePassiveEffectMountInDEV = u274.invokePassiveEffectMountInDEV
local invokeLayoutEffectUnmountInDEV = u274.invokeLayoutEffectUnmountInDEV
local invokePassiveEffectUnmountInDEV = u274.invokePassiveEffectUnmountInDEV
local recursivelyCommitLayoutEffects = u274.recursivelyCommitLayoutEffects
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local enqueueUpdate = require(script.Parent:WaitForChild("ReactUpdateQueue.new")).enqueueUpdate
local resetContextDependencies = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).resetContextDependencies
local RobloxReactProfiling = require(script.Parent.RobloxReactProfiling)
local u320 = nil
local u321 = {}

local function u322(a1, a2, a3) -- Line: 240 -- upvalues: u321 (val)
    if not u321.originalBeginWorkRef then
        u321.originalBeginWorkRef = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).beginWork
    end
    return u321.originalBeginWorkRef(a1, a2, a3)
end

local function v8(a1, a2, a3) -- Line: 249 -- upvalues: u321 (val)
    if not u321.completeWorkRef then
        u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
    end
    return u321.completeWorkRef(a1, a2, a3)
end

local u324 = nil

local function initReactFiberHooks() -- Line: 259 -- upvalues: u324 (ref), u321 (val)
    u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
    u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
    u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
    u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
end

local function v9() -- Line: 268 -- upvalues: u321 (val), u324 (ref)
    if not u321.resetHooksAfterThrowRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.resetHooksAfterThrowRef()
end

local function v10() -- Line: 276 -- upvalues: u321 (val), u324 (ref)
    if not u321.ContextOnlyDispatcherRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.ContextOnlyDispatcherRef
end

local function v11() -- Line: 284 -- upvalues: u321 (val), u324 (ref)
    if not u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef()
end

local createCapturedValue = require(script.Parent:WaitForChild("ReactCapturedValue")).createCapturedValue
local push = v1.push
local pop = v1.pop
local v12 = v1.createCursor
local u348 = require(script.Parent:WaitForChild("ReactProfilerTimer.new"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local u366 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local current = ReactCurrentFiber.current
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local v13 = require(script.Parent.Parent:WaitForChild("shared")).ReactErrorUtils
local invokeGuardedCallback = v13.invokeGuardedCallback
local hasCaughtError = v13.hasCaughtError
local clearCaughtError = v13.clearCaughtError
local onCommitRoot = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).onCommitRoot
local onCommitRoot_2 = require(script.Parent:WaitForChild("ReactTestSelectors")).onCommitRoot
local enqueueTask = require(script.Parent.Parent:WaitForChild("shared")).enqueueTask
local doesFiberContain = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).doesFiberContain
local ReactCurrentDispatcher = v3.ReactCurrentDispatcher
local ReactCurrentOwner = v3.ReactCurrentOwner
local IsSomeRendererActing = v3.IsSomeRendererActing
local u431 = nil
local u433 = {}
u24.NoContext = 0
u24.RetryAfterError = 64
local u437 = 0
local u438 = nil
local u439 = nil
local NoLanes = ReactFiberLane.NoLanes
u24.subtreeRenderLanes = ReactFiberLane.NoLanes
local u444 = v12(ReactFiberLane.NoLanes)
local u445 = 0
local u446 = nil
local NoLanes_2 = ReactFiberLane.NoLanes
local ReactFiberWorkInProgress = require(script.Parent:WaitForChild("ReactFiberWorkInProgress"))
local workInProgressRootSkippedLanes = ReactFiberWorkInProgress.workInProgressRootSkippedLanes
local NoLanes_3 = ReactFiberLane.NoLanes
local NoLanes_4 = ReactFiberLane.NoLanes
local u459 = nil
local u460 = 0
local u461 = (1 / 0)
local u462 = nil

local function resetRenderTimer() -- Line: 419 -- upvalues: u461 (ref), now (val)
    u461 = now() + 500
end

function u24.getRenderTargetTime() -- Line: 423 -- upvalues: u461 (ref)
    return u461
end

local u465 = false
local u466 = nil
local u467 = nil
local u468 = false
local u469 = nil
local u470 = NoPriority
local NoLanes_5 = ReactFiberLane.NoLanes
local u472 = nil
local u473 = 0
local u474 = nil
local u475 = 0
local u476 = nil
local u477 = NoTimestamp
local NoLanes_6 = ReactFiberLane.NoLanes
local NoLanes_7 = ReactFiberLane.NoLanes
local u480 = nil
local u481 = false

function u24.getWorkInProgressRoot() -- Line: 463 -- upvalues: u438 (ref)
    return u438
end

function u24.requestEventTime() -- Line: 467 -- upvalues: u437 (ref), now (val), u477 (ref), NoTimestamp (val)
    if bit32.band(u437, 48) ~= 0 then
        return now()
    end
    if u477 ~= NoTimestamp then
        return u477
    end
    u477 = now()
    return u477
end

function u24.requestUpdateLane(a1) -- Line: 489
    -- upvalues: ReactTypeOfMode (val), SyncLane (val), getCurrentPriorityLevel (val), ImmediatePriority (val)
    -- upvalues: SyncBatchedLane (val), ReactFeatureFlags (val), u437 (ref), NoLanes (ref), ReactFiberLane (val)
    -- upvalues: pickArbitraryLane (val), NoLanes_6 (ref), NoLanes_2 (ref), ReactFiberTransition (val), NoLanes_7 (ref)
    -- upvalues: u459 (ref), findTransitionLane (val), UserBlockingPriority (val), findUpdateLane (val)
    -- upvalues: schedulerPriorityToLanePriority (val), getCurrentUpdateLanePriority (val), __DEV__ (val), console (val)
    local mode = a1.mode
    if (bit32.band(mode, ReactTypeOfMode.BlockingMode)) == ReactTypeOfMode.NoMode then
        return SyncLane
    end
    if (bit32.band(mode, ReactTypeOfMode.ConcurrentMode)) == ReactTypeOfMode.NoMode then
        if getCurrentPriorityLevel() == ImmediatePriority then
            return SyncLane
        end
        return SyncBatchedLane
    end
    if not ReactFeatureFlags.deferRenderPhaseUpdateToNextBatch
        and bit32.band(u437, 16) ~= 0
        and NoLanes ~= ReactFiberLane.NoLanes then
        return pickArbitraryLane(NoLanes)
    end
    if NoLanes_6 == ReactFiberLane.NoLanes then
        NoLanes_6 = NoLanes_2
    end
    if ReactFiberTransition.requestCurrentTransition() ~= ReactFiberTransition.NoTransition then
        if NoLanes_7 ~= ReactFiberLane.NoLanes then
            NoLanes_7 = if u459 == nil then ReactFiberLane.NoLanes else u459.pendingLanes
        end
        return findTransitionLane(NoLanes_6, NoLanes_7)
    end
    local v1 = getCurrentPriorityLevel()
    if bit32.band(u437, 4) ~= 0 and v1 == UserBlockingPriority then
        return (findUpdateLane(ReactFiberLane.InputDiscreteLanePriority, NoLanes_6))
    end
    local v2 = schedulerPriorityToLanePriority(v1)
    if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        local v3 = getCurrentUpdateLanePriority()
        if v2 ~= v3 and v3 ~= ReactFiberLane.NoLanePriority and __DEV__ then
            console.error(
                "Expected current scheduler lane priority %s to match current update lane priority %s",
                tostring(v2),
                (tostring(v3))
            )
        end
    end
    return (findUpdateLane(v2, NoLanes_6))
end

function requestRetryLane(a1) -- Line: 593
    -- upvalues: ReactTypeOfMode (val), SyncLane (val), getCurrentPriorityLevel (val), ImmediatePriority (val)
    -- upvalues: SyncBatchedLane (val), NoLanes_6 (ref), ReactFiberLane (val), NoLanes_2 (ref), findRetryLane (val)
    local mode = a1.mode
    if (bit32.band(mode, ReactTypeOfMode.BlockingMode)) == ReactTypeOfMode.NoMode then
        return SyncLane
    end
    if (bit32.band(mode, ReactTypeOfMode.ConcurrentMode)) == ReactTypeOfMode.NoMode then
        if getCurrentPriorityLevel() == ImmediatePriority then
            return SyncLane
        end
        return SyncBatchedLane
    end
    if NoLanes_6 == ReactFiberLane.NoLanes then
        NoLanes_6 = NoLanes_2
    end
    return findRetryLane(NoLanes_6)
end

function u24.scheduleUpdateOnFiber(a1, a2, a3) -- Line: 615
    -- upvalues: u433 (val), markRootUpdated (val), u438 (ref), ReactFeatureFlags (val), u437 (ref), NoLanes_3 (ref)
    -- upvalues: mergeLanes (val), u445 (ref), NoLanes (ref), getCurrentPriorityLevel (val), SyncLane (val), u320 (ref)
    -- upvalues: u461 (ref), now (val), flushSyncCallbackQueue (val), UserBlockingPriority (val)
    -- upvalues: ImmediatePriority (val), u472 (ref), Set (val), u459 (ref)
    u433.checkForNestedUpdates()
    local v1 = u433.markUpdateLaneFromFiberToRoot(a1, a2)
    if v1 == nil then
        return nil
    end
    markRootUpdated(v1, a2, a3)
    if v1 == u438 then
        u433.warnAboutRenderPhaseUpdatesInDEV(a1)
        if ReactFeatureFlags.deferRenderPhaseUpdateToNextBatch or bit32.band(u437, 16) == 0 then
            NoLanes_3 = mergeLanes(NoLanes_3, a2)
        end
        if u445 == 4 then
            u433.markRootSuspended(v1, NoLanes)
        end
    end
    local v2 = getCurrentPriorityLevel()
    if a2 ~= SyncLane then
        if bit32.band(u437, 4) ~= 0 then
            if v2 == UserBlockingPriority or v2 == ImmediatePriority then
                if u472 ~= nil then
                    u472:add(v1)
                else
                    u472 = Set.new({v1})
                end
            end
        end
        u320(v1, a3)
        u433.schedulePendingInteractions(v1, a2)
    elseif bit32.band(u437, 8) == 0 or bit32.band(u437, 48) ~= 0 then
        u320(v1, a3)
        u433.schedulePendingInteractions(v1, a2)
        if u437 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
    else
        u433.schedulePendingInteractions(v1, a2)
        u433.performSyncWorkOnRoot(v1)
    end
    u459 = v1
    return v1
end

function u433.markUpdateLaneFromFiberToRoot(a1, a2) -- Line: 725
    -- upvalues: mergeLanes (val), __DEV__ (val), ReactFiberFlags (val), u433 (val), ReactWorkTags (val)
    local alternate_2
    a1.lanes = mergeLanes(a1.lanes, a2)
    local alternate = a1.alternate
    if alternate ~= nil then
        alternate.lanes = mergeLanes(alternate.lanes, a2)
    end
    if __DEV__
        and alternate == nil
        and (bit32.band(a1.flags, (bit32.bor(ReactFiberFlags.Placement, ReactFiberFlags.Hydrating)))) ~= ReactFiberFlags.NoFlags then
        u433.warnAboutUpdateOnNotYetMountedFiberInDEV(a1)
    end
    local v1 = a1
    local return_ = a1.return_
    local v2, v3 = a2, a1
    while return_ ~= nil do
        return_.childLanes = mergeLanes(return_.childLanes, v2)
        alternate_2 = return_.alternate
        if alternate_2 ~= nil then
            alternate_2.childLanes = mergeLanes(alternate_2.childLanes, v2)
        elseif __DEV__
            and (bit32.band(return_.flags, (bit32.bor(ReactFiberFlags.Placement, ReactFiberFlags.Hydrating)))) ~= ReactFiberFlags.NoFlags then
            u433.warnAboutUpdateOnNotYetMountedFiberInDEV(v3)
        end
        v1 = return_
        return_ = return_.return_
    end
    if v1.tag == ReactWorkTags.HostRoot then
        return v1.stateNode
    end
    return nil
end

function u320(a1, a2) -- Line: 780
    -- upvalues: markStarvedLanesAsExpired (val), u438 (ref), NoLanes (ref), ReactFiberLane (val), getNextLanes (val)
    -- upvalues: returnNextLanesPriority (val), cancelCallback (val), scheduleSyncCallback (val)
    -- upvalues: RobloxReactProfiling (val), u433 (val), scheduleCallback (val), ImmediatePriority (val)
    -- upvalues: lanePriorityToSchedulerPriority (val)
    local callbackNode = a1.callbackNode
    markStarvedLanesAsExpired(a1, a2)
    local v1 = getNextLanes(a1, if a1 ~= u438 then ReactFiberLane.NoLanes else NoLanes)
    local v2 = returnNextLanesPriority()
    if v1 == ReactFiberLane.NoLanes then
        if callbackNode ~= nil then
            cancelCallback(callbackNode)
            a1.callbackNode = nil
            a1.callbackPriority = ReactFiberLane.NoLanePriority
        end
        return
    end
    if callbackNode ~= nil then
        if a1.callbackPriority == v2 then
            return
        end
        cancelCallback(callbackNode)
    end
    local v3 = if v2 == ReactFiberLane.SyncLanePriority then scheduleSyncCallback(function() -- Line: 825 -- upvalues: RobloxReactProfiling (upval), a1 (val), u433 (upval)
        local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(a1)
        local v2 = u433.performSyncWorkOnRoot(a1)
        RobloxReactProfiling.profileRootAfterYielding(v1)
        return v2
    end) else if v2 ~= ReactFiberLane.SyncBatchedLanePriority then scheduleCallback(lanePriorityToSchedulerPriority(v2), function() -- Line: 843 -- upvalues: RobloxReactProfiling (upval), a1 (val), u433 (upval)
        local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(a1)
        local v2 = u433.performConcurrentWorkOnRoot(a1)
        RobloxReactProfiling.profileRootAfterYielding(v1)
        return v2
    end) else scheduleCallback(ImmediatePriority, function() -- Line: 833 -- upvalues: RobloxReactProfiling (upval), a1 (val), u433 (upval)
        local v1 = RobloxReactProfiling.profileRootBeforeUnitOfWork(a1)
        local v2 = u433.performSyncWorkOnRoot(a1)
        RobloxReactProfiling.profileRootAfterYielding(v1)
        return v2
    end)
    a1.callbackPriority = v2
    a1.callbackNode = v3
end

function u433.performConcurrentWorkOnRoot(a1) -- Line: 859
    -- upvalues: u477 (ref), NoTimestamp (val), NoLanes_6 (ref), ReactFiberLane (val), NoLanes_7 (ref), invariant (val)
    -- upvalues: u437 (ref), u24 (val), getNextLanes (val), u438 (ref), NoLanes (ref), u433 (val)
    -- upvalues: includesSomeLane (val), NoLanes_2 (ref), NoLanes_3 (ref), ReactFiberHostConfig (val)
    -- upvalues: getLanesToRetrySynchronouslyOnError (val), u446 (ref), u320 (ref), now (val)
    u477 = NoTimestamp
    NoLanes_6 = ReactFiberLane.NoLanes
    NoLanes_7 = ReactFiberLane.NoLanes
    invariant(bit32.band(u437, 48) == 0, "Should not already be working.")
    local callbackNode = a1.callbackNode
    if u24.flushPassiveEffects() and a1.callbackNode ~= callbackNode then
        return nil
    end
    local v1 = getNextLanes(a1, if a1 ~= u438 then ReactFiberLane.NoLanes else NoLanes)
    if v1 == ReactFiberLane.NoLanes then
        return nil
    end
    local v2 = u433.renderRootConcurrent(a1, v1)
    if includesSomeLane(NoLanes_2, NoLanes_3) then
        u433.prepareFreshStack(a1, ReactFiberLane.NoLanes)
    elseif v2 ~= 0 then
        if v2 == 2 then
            u437 = bit32.bor(u437, 64)
            if a1.hydrate then
                a1.hydrate = false
                ReactFiberHostConfig.clearContainer(a1.containerInfo)
            end
            v1 = getLanesToRetrySynchronouslyOnError(a1)
            if v1 ~= ReactFiberLane.NoLanes then
                v2 = u433.renderRootSync(a1, v1)
            end
        end
        if v2 == 1 then
            local v3 = u446
            u433.prepareFreshStack(a1, ReactFiberLane.NoLanes)
            u433.markRootSuspended(a1, v1)
            u320(a1, now())
            error(v3)
        end
        a1.finishedWork = a1.current.alternate
        a1.finishedLanes = v1
        u433.finishConcurrentRender(a1, v2, v1)
    end
    u320(a1, now())
    if a1.callbackNode == callbackNode then
        return function() -- Line: 954 -- upvalues: u433 (upval), a1 (val)
            return u433.performConcurrentWorkOnRoot(a1)
        end
    end
    return nil
end

local u490 = 0
local u491 = false

function shouldForceFlushFallbacksInDEV() -- Line: 967 -- upvalues: __DEV__ (val), u490 (ref)
    return __DEV__ and u490 > 0
end

function u433.finishConcurrentRender(a1, a2, a3) -- Line: 972
    -- upvalues: invariant (val), u433 (val), includesOnlyRetries (val), u460 (ref), now (val), getNextLanes (val)
    -- upvalues: ReactFiberLane (val), isSubsetOfLanes (val), u24 (val), markRootPinged (val)
    -- upvalues: ReactFiberHostConfig (val), includesOnlyTransitions (val), getMostRecentEventTime (val)
    if a2 ~= 0 and a2 ~= 1 then
        local v1
        if a2 == 2 then
            u433.commitRoot(a1)
            return
        end
        if a2 == 3 then
            u433.markRootSuspended(a1, a3)
            if includesOnlyRetries(a3) and not shouldForceFlushFallbacksInDEV() then
                v1 = u460 + 500 - now()
                if v1 > 10 then
                    if (getNextLanes(a1, ReactFiberLane.NoLanes)) ~= ReactFiberLane.NoLanes then
                        return
                    end
                    local suspendedLanes = a1.suspendedLanes
                    if not isSubsetOfLanes(suspendedLanes, a3) then
                        markRootPinged(a1, suspendedLanes, (u24.requestEventTime()))
                        return
                    end
                    a1.timeoutHandle = ReactFiberHostConfig.scheduleTimeout(function() -- Line: 1021 -- upvalues: u433 (upval), a1 (val)
                        return u433.commitRoot(a1)
                    end, v1)
                    return
                end
            end
            u433.commitRoot(a1)
            return
        end
        if a2 ~= 4 then
            if a2 == 5 then
                u433.commitRoot(a1)
                return
            end
            invariant(false, "Unknown root exit status.")
            return
        end
        u433.markRootSuspended(a1, a3)
        if includesOnlyTransitions(a3) then
            return
        end
        if not shouldForceFlushFallbacksInDEV() then
            v1 = getMostRecentEventTime(a1, a3)
            local v2 = now() - v1
            local v3 = jnd(v2) - v2
            if v3 > 10 then
                a1.timeoutHandle = ReactFiberHostConfig.scheduleTimeout(function() -- Line: 1056 -- upvalues: u433 (upval), a1 (val)
                    return u433.commitRoot(a1)
                end, v3)
                return
            end
        end
        u433.commitRoot(a1)
        return
    end
    invariant(false, "Root did not complete. This is a bug in React.")
end

function u433.markRootSuspended(a1, a2) -- Line: 1072
    -- upvalues: removeLanes (val), NoLanes_4 (ref), NoLanes_3 (ref), markRootSuspended (val)
    markRootSuspended(a1, (removeLanes(removeLanes(a2, NoLanes_4), NoLanes_3)))
end

function u433.performSyncWorkOnRoot(a1) -- Line: 1084
    -- upvalues: invariant (val), u437 (ref), u24 (val), u438 (ref), includesSomeLane (val), NoLanes (ref), u433 (val)
    -- upvalues: NoLanes_2 (ref), NoLanes_3 (ref), getNextLanes (val), ReactFiberLane (val), LegacyRoot (val)
    -- upvalues: ReactFiberHostConfig (val), getLanesToRetrySynchronouslyOnError (val), u446 (ref), u320 (ref)
    -- upvalues: now (val)
    local v1, v2
    invariant(bit32.band(u437, 48) == 0, "Should not already be working.")
    u24.flushPassiveEffects()
    if a1 ~= u438 or not includesSomeLane(a1.expiredLanes, NoLanes) then
        v2 = u433.renderRootSync(a1, (getNextLanes(a1, ReactFiberLane.NoLanes)))
    else
        v1 = NoLanes
        v2 = u433.renderRootSync(a1, v1)
        if includesSomeLane(NoLanes_2, NoLanes_3) then
            v1 = getNextLanes(a1, v1)
            v2 = u433.renderRootSync(a1, v1)
        end
    end
    if a1.tag ~= LegacyRoot and v2 == 2 then
        u437 = bit32.bor(u437, 64)
        if a1.hydrate then
            a1.hydrate = false
            ReactFiberHostConfig.clearContainer(a1.containerInfo)
        end
        v1 = getLanesToRetrySynchronouslyOnError(a1)
        if v1 ~= ReactFiberLane.NoLanes then
            v2 = u433.renderRootSync(a1, v1)
        end
    end
    if v2 == 1 then
        local v3 = u446
        u433.prepareFreshStack(a1, ReactFiberLane.NoLanes)
        u433.markRootSuspended(a1, v1)
        u320(a1, now())
        error(v3)
    end
    a1.finishedWork = a1.current.alternate
    a1.finishedLanes = v1
    u433.commitRoot(a1)
    u320(a1, now())
    return nil
end

function u24.flushRoot(a1, a2) -- Line: 1166
    -- upvalues: markRootExpired (val), u320 (ref), now (val), u437 (ref), u461 (ref), flushSyncCallbackQueue (val)
    markRootExpired(a1, a2)
    u320(a1, now())
    if bit32.band(u437, 48) == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
end

function u24.getExecutionContext() -- Line: 1178 -- upvalues: u437 (ref)
    return u437
end

function u24.flushDiscreteUpdates() -- Line: 1182
    -- upvalues: u437 (ref), __DEV__ (val), console (val), u433 (val), u24 (val)
    if bit32.band(u437, 49) == 0 then
        u433.flushPendingDiscreteUpdates()
        u24.flushPassiveEffects()
        return
    end
    if __DEV__ and bit32.band(u437, 16) ~= 0 then
        console.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is already rendering.")
    end
end

function u24.deferredUpdates(a1) -- Line: 1212
    -- upvalues: ReactFeatureFlags (val), getCurrentUpdateLanePriority (val), __YOLO__ (val)
    -- upvalues: setCurrentUpdateLanePriority (val), ReactFiberLane (val), runWithPriority (val), describeError (val)
    -- upvalues: NormalPriority (val)
    local v1, v2
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        return runWithPriority(NormalPriority, a1)
    end
    local v3 = getCurrentUpdateLanePriority()
    if __YOLO__ then
        v1 = true
        setCurrentUpdateLanePriority(ReactFiberLane.DefaultLanePriority)
        v2 = runWithPriority(NormalPriority, a1)
    else
        setCurrentUpdateLanePriority(ReactFiberLane.DefaultLanePriority)
        local success, result = xpcall(runWithPriority, describeError, NormalPriority, a1)
        v1 = success
        v2 = result
    end
    setCurrentUpdateLanePriority(v3)
    if v1 then
        return v2
    end
    error(v2)
end

function u433.flushPendingDiscreteUpdates() -- Line: 1241
    -- upvalues: u472 (ref), markDiscreteUpdatesExpired (val), u320 (ref), now (val), flushSyncCallbackQueue (val)
    if u472 ~= nil then
        local v1 = u472
        u472 = nil
        v1:forEach(function(a1) -- Line: 1247 -- upvalues: markDiscreteUpdatesExpired (upval), u320 (upval), now (upval)
            markDiscreteUpdatesExpired(a1)
            u320(a1, now())
        end)
    end
    flushSyncCallbackQueue()
end

function u24.batchedUpdates(a1, a2) -- Line: 1256
    -- upvalues: u437 (ref), __YOLO__ (val), describeError (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    local v3 = u437
    u437 = bit32.bor(u437, 1)
    if __YOLO__ then
        v1 = true
        v2 = a1(a2)
    else
        local success, result = xpcall(a1, describeError, a2)
        v1 = success
        v2 = result
    end
    if v3 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end

function u24.batchedEventUpdates(a1, a2) -- Line: 1284
    -- upvalues: u437 (ref), __YOLO__ (val), describeError (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    local v3 = u437
    u437 = bit32.bor(u437, 2)
    if __YOLO__ then
        v1 = true
        v2 = a1(a2)
    else
        local success, result = xpcall(a1, describeError, a2)
        v1 = success
        v2 = result
    end
    if v3 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end

function u24.discreteUpdates(a1, a2, a3, a4, a5) -- Line: 1313
    -- upvalues: u437 (ref), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val)
    -- upvalues: setCurrentUpdateLanePriority (val), ReactFiberLane (val), runWithPriority (val), describeError (val)
    -- upvalues: UserBlockingPriority (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1 = u437
    u437 = bit32.bor(u437, 4)
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        local success_2, result_2 = xpcall(runWithPriority, describeError, UserBlockingPriority, function() -- Line: 1349 -- upvalues: a1 (val), a2 (val), a3 (val), a4 (val), a5 (val)
            return a1(a2, a3, a4, a5)
        end)
        if v1 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
        if success_2 then
            return result_2
        end
        error(result_2)
        return
    end
    local v2 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(ReactFiberLane.InputDiscreteLanePriority)
    local success, result = xpcall(runWithPriority, describeError, UserBlockingPriority, function() -- Line: 1325 -- upvalues: a1 (val), a2 (val), a3 (val), a4 (val), a5 (val)
        return a1(a2, a3, a4, a5)
    end)
    setCurrentUpdateLanePriority(v2)
    if v1 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if success then
        return result
    end
    error(result)
end

function u24.unbatchedUpdates(a1, a2) -- Line: 1370
    -- upvalues: u437 (ref), __YOLO__ (val), describeError (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1, v2
    local v3 = u437
    u437 = bit32.band(u437, 4294967294)
    u437 = bit32.bor(u437, 8)
    if __YOLO__ then
        v1 = true
        v2 = a1(a2)
    else
        local success, result = xpcall(a1, describeError, a2)
        v1 = success
        v2 = result
    end
    if v3 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if v1 then
        return v2
    end
    error(v2)
end

function u24.flushSync(a1, a2) -- Line: 1398
    -- upvalues: u437 (ref), __DEV__ (val), console (val), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val)
    -- upvalues: setCurrentUpdateLanePriority (val), ReactFiberLane (val), __YOLO__ (val), runWithPriority (val)
    -- upvalues: describeError (val), ImmediatePriority (val), flushSyncCallbackQueue (val)
    local v1, v2, v3
    local v4 = u437
    if bit32.band(v4, 48) ~= 0 then
        if __DEV__ then
            console.error("flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.")
        end
        return a1(a2)
    end
    u437 = bit32.bor(u437, 1)
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        if __YOLO__ then
            v1 = true
            v2 = if not a1 then nil else runWithPriority(ImmediatePriority, function() -- Line: 1483 -- upvalues: a1 (val), a2 (val)
                return a1(a2)
            end)
        elseif not a1 then
            v1 = true
            v2 = nil
        else
            local success_2, result_2 = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 1471 -- upvalues: a1 (val), a2 (val)
                return a1(a2)
            end)
            v1 = success_2
            v2 = result_2
        end
        u437 = v4
        flushSyncCallbackQueue()
        if not v1 then
            error(v2)
        end
        return v2
    end
    v1 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
    if __YOLO__ then
        v2 = true
        setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
        v3 = if not a1 then nil else runWithPriority(ImmediatePriority, function() -- Line: 1441 -- upvalues: a1 (val), a2 (val)
            return a1(a2)
        end)
    elseif not a1 then
        v2 = true
        v3 = nil
    else
        local success, result = xpcall(runWithPriority, describeError, ImmediatePriority, function() -- Line: 1428 -- upvalues: a1 (val), a2 (val)
            return a1(a2)
        end)
        v2 = success
        v3 = result
    end
    setCurrentUpdateLanePriority(v1)
    u437 = v4
    flushSyncCallbackQueue()
    if not v2 then
        error(v3)
    end
    return v3
end

function u24.flushControlled(a1) -- Line: 1504
    -- upvalues: u437 (ref), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val)
    -- upvalues: setCurrentUpdateLanePriority (val), ReactFiberLane (val), runWithPriority (val), describeError (val)
    -- upvalues: ImmediatePriority (val), u461 (ref), now (val), flushSyncCallbackQueue (val)
    local v1 = u437
    u437 = bit32.bor(u437, 1)
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        local success_2, result_2 = xpcall(runWithPriority, describeError, ImmediatePriority, a1)
        if v1 == 0 then
            u461 = now() + 500
            flushSyncCallbackQueue()
        end
        if not success_2 then
            error(result_2)
        end
        return
    end
    local v2 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
    local success, result = xpcall(runWithPriority, describeError, ImmediatePriority, a1)
    setCurrentUpdateLanePriority(v2)
    if v1 == 0 then
        u461 = now() + 500
        flushSyncCallbackQueue()
    end
    if success then
        return
    end
    error(result)
end

function u24.pushRenderLanes(a1, a2) -- Line: 1544
    -- upvalues: push (val), u444 (val), u24 (val), mergeLanes (val), NoLanes_2 (ref)
    push(u444, u24.subtreeRenderLanes, a1)
    u24.subtreeRenderLanes = mergeLanes(u24.subtreeRenderLanes, a2)
    NoLanes_2 = mergeLanes(NoLanes_2, a2)
end

function u24.popRenderLanes(a1) -- Line: 1550 -- upvalues: u24 (val), u444 (val), pop (val)
    u24.subtreeRenderLanes = u444.current
    pop(u444, a1)
end

function u433.prepareFreshStack(a1, a2) -- Line: 1555
    -- upvalues: ReactFiberLane (val), ReactFiberHostConfig (val), u439 (ref), unwindInterruptedWork (val), u438 (ref)
    -- upvalues: u174 (val), NoLanes (ref), u24 (val), NoLanes_2 (ref), u445 (ref), u446 (ref)
    -- upvalues: workInProgressRootSkippedLanes (val), NoLanes_3 (ref), NoLanes_4 (ref), ReactFeatureFlags (val)
    -- upvalues: u476 (ref), __DEV__ (val), u366 (val)
    a1.finishedWork = nil
    a1.finishedLanes = ReactFiberLane.NoLanes
    local timeoutHandle = a1.timeoutHandle
    if timeoutHandle ~= ReactFiberHostConfig.noTimeout then
        a1.timeoutHandle = ReactFiberHostConfig.noTimeout
        ReactFiberHostConfig.cancelTimeout(timeoutHandle)
    end
    if u439 ~= nil then
        local return_ = u439.return_
        while return_ ~= nil do
            unwindInterruptedWork(return_)
            return_ = return_.return_
        end
    end
    u438 = a1
    u439 = u174.createWorkInProgress(a1.current, nil)
    NoLanes = a2
    u24.subtreeRenderLanes = a2
    NoLanes_2 = a2
    u445 = 0
    u446 = nil
    workInProgressRootSkippedLanes(ReactFiberLane.NoLanes)
    NoLanes_3 = ReactFiberLane.NoLanes
    NoLanes_4 = ReactFiberLane.NoLanes
    if ReactFeatureFlags.enableSchedulerTracing then
        u476 = nil
    end
    if __DEV__ then
        u366.discardPendingWarnings()
    end
end

function u433.handleError(a1, a2) -- Line: 1595
    -- upvalues: u439 (ref), resetContextDependencies (val), u321 (val), u324 (ref), resetCurrentFiber (val)
    -- upvalues: ReactCurrentOwner (val), u445 (ref), u446 (ref), ReactFeatureFlags (val), ReactTypeOfMode (val)
    -- upvalues: u348 (val), throwException (val), NoLanes (ref), u24 (val), u433 (val)
    local result, success
    while true do
        local return_ = u439
        success, result = pcall(function() -- Line: 1599
            -- upvalues: resetContextDependencies (upval), u321 (upval), u324 (upval), resetCurrentFiber (upval)
            -- upvalues: ReactCurrentOwner (upval), return_ (ref), u445 (upval), u446 (upval), a2 (ref), u439 (upval)
            -- upvalues: ReactFeatureFlags (upval), ReactTypeOfMode (upval), u348 (upval), throwException (upval)
            -- upvalues: a1 (val), NoLanes (upval), u24 (upval), u433 (upval)
            resetContextDependencies()
            if not u321.resetHooksAfterThrowRef then
                u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
                u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
                u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
                u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
            end
            u321.resetHooksAfterThrowRef()
            resetCurrentFiber()
            ReactCurrentOwner.current = nil
            if return_ ~= nil and return_.return_ ~= nil then
                if ReactFeatureFlags.enableProfilerTimer
                    and bit32.band(return_.mode, ReactTypeOfMode.ProfileMode) ~= 0 then
                    u348.stopProfilerTimerIfRunningAndRecordDelta(return_, true)
                end
                throwException(a1, return_.return_, return_, a2, NoLanes, u24.onUncaughtError, u24.renderDidError)
                u433.completeUnitOfWork(return_)
                return
            end
            u445 = 1
            u446 = a2
            u439 = nil
        end)
        if success then
            break
        end
        if u439 == return_ and return_ ~= nil then
            return_ = return_.return_
            u439 = return_
        end
    end
end

function u433.pushDispatcher() -- Line: 1674 -- upvalues: ReactCurrentDispatcher (val), u321 (val), u324 (ref)
    local current = ReactCurrentDispatcher.current
    if not u321.ContextOnlyDispatcherRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    ReactCurrentDispatcher.current = u321.ContextOnlyDispatcherRef
    if current ~= nil then
        return current
    end
    if not u321.ContextOnlyDispatcherRef then
        u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
        u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
        u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
    end
    return u321.ContextOnlyDispatcherRef
end

function u433.popDispatcher(a1) -- Line: 1691 -- upvalues: ReactCurrentDispatcher (val)
    ReactCurrentDispatcher.current = a1
end

function u433.pushInteractions(a1) -- Line: 1695 -- upvalues: ReactFeatureFlags (val), __interactionsRef (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return nil
    end
    local current = __interactionsRef.current
    __interactionsRef.current = a1.memoizedInteractions
    return current
end

function u433.popInteractions(a1) -- Line: 1704 -- upvalues: ReactFeatureFlags (val), __interactionsRef (val)
    if ReactFeatureFlags.enableSchedulerTracing then
        __interactionsRef.current = a1
    end
end

function u24.markCommitTimeOfFallback() -- Line: 1710 -- upvalues: u460 (ref), now (val)
    u460 = now()
end

function u24.markSkippedUpdateLanes(a1) -- Line: 1714 -- upvalues: ReactFiberWorkInProgress (val)
    ReactFiberWorkInProgress.markSkippedUpdateLanes(a1)
end

function u24.renderDidSuspend() -- Line: 1718 -- upvalues: u445 (ref)
    if u445 == 0 then
        u445 = 3
    end
end

function u24.renderDidSuspendDelayIfPossible() -- Line: 1724
    -- upvalues: u445 (ref), u438 (ref), includesNonIdleWork (val), workInProgressRootSkippedLanes (val)
    -- upvalues: NoLanes_3 (ref), u433 (val), NoLanes (ref)
    if u445 == 0 or u445 == 3 then
        u445 = 4
    end
    if u438 ~= nil then
        if includesNonIdleWork(workInProgressRootSkippedLanes()) or includesNonIdleWork(NoLanes_3) then
            u433.markRootSuspended(u438, NoLanes)
        end
    end
end

function u24.renderDidError() -- Line: 1752 -- upvalues: u445 (ref)
    if u445 ~= 5 then
        u445 = 2
    end
end

function u24.renderHasNotSuspendedYet() -- Line: 1760 -- upvalues: u445 (ref)
    return u445 == 0
end

function u433.renderRootSync(a1, a2) -- Line: 1766
    -- upvalues: u437 (ref), u433 (val), u438 (ref), NoLanes (ref), __DEV__ (val), enableDebugTracing (val)
    -- upvalues: DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val), __YOLO__ (val)
    -- upvalues: describeError (val), resetContextDependencies (val), ReactFeatureFlags (val), u439 (ref)
    -- upvalues: invariant (val), ReactFiberLane (val), u445 (ref)
    local result, success, v1, v2
    local v3 = u437
    u437 = bit32.bor(u437, 16)
    local v4 = u433.pushDispatcher()
    if u438 ~= a1 or NoLanes ~= a2 then
        u433.prepareFreshStack(a1, a2)
        u433.startWorkOnPendingInteractions(a1, a2)
    end
    local v5 = u433.pushInteractions(a1)
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStarted(a2)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStarted(a2)
    end
    while true do
        v2 = nil
        if __YOLO__ then
            v1 = true
            u433.workLoopSync()
        else
            success, result = xpcall(u433.workLoopSync, describeError)
            v1 = success
            v2 = result
        end
        if v1 then
            break
        end
        u433.handleError(a1, v2)
    end
    resetContextDependencies()
    if ReactFeatureFlags.enableSchedulerTracing then
        u433.popInteractions(v5)
    end
    u437 = v3
    u433.popDispatcher(v4)
    if u439 ~= nil then
        invariant(false, "Cannot commit an incomplete root. This error is likely caused by a bug in React. Please file an issue.")
    end
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStopped()
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStopped()
    end
    u438 = nil
    NoLanes = ReactFiberLane.NoLanes
    return u445
end

function u433.workLoopSync() -- Line: 1842 -- upvalues: u439 (ref), u433 (val)
    while u439 ~= nil do
        u433.performUnitOfWork(u439)
    end
end

function u433.renderRootConcurrent(a1, a2) -- Line: 1849
    -- upvalues: u437 (ref), u433 (val), u438 (ref), NoLanes (ref), u461 (ref), now (val), __DEV__ (val)
    -- upvalues: enableDebugTracing (val), DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val)
    -- upvalues: __YOLO__ (val), describeError (val), resetContextDependencies (val), ReactFeatureFlags (val)
    -- upvalues: u439 (ref), ReactFiberLane (val), u445 (ref)
    local result, success, v1, v2
    local v3 = u437
    u437 = bit32.bor(u437, 16)
    local v4 = u433.pushDispatcher()
    if u438 ~= a1 or NoLanes ~= a2 then
        u461 = now() + 500
        u433.prepareFreshStack(a1, a2)
        u433.startWorkOnPendingInteractions(a1, a2)
    end
    local v5 = u433.pushInteractions(a1)
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStarted(a2)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStarted(a2)
    end
    while true do
        if __YOLO__ then
            v1 = true
            v2 = "break"
            u433.workLoopConcurrent()
        else
            success, result = xpcall(u433.workLoopConcurrent, describeError)
            v2 = result
            if success then
                v2 = "break"
            end
        end
        if v2 == "break" then
            break
        end
        if not v1 then
            u433.handleError(a1, v2)
        end
    end
    resetContextDependencies()
    if ReactFeatureFlags.enableSchedulerTracing then
        u433.popInteractions(v5)
    end
    u433.popDispatcher(v4)
    u437 = v3
    if __DEV__ and enableDebugTracing then
        DebugTracing.logRenderStopped()
    end
    if u439 ~= nil then
        if enableSchedulingProfiler then
            SchedulingProfiler.markRenderYielded()
        end
        return 0
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markRenderStopped()
    end
    u438 = nil
    NoLanes = ReactFiberLane.NoLanes
    return u445
end

function u433.workLoopConcurrent() -- Line: 1933 -- upvalues: u439 (ref), shouldYield (val), u433 (val)
    while u439 ~= nil do
        if shouldYield() then
            break
        end
        u433.performUnitOfWork(u439)
    end
end

function u433.performUnitOfWork(a1) -- Line: 1940
    -- upvalues: RobloxReactProfiling (val), setCurrentFiber (val), ReactFeatureFlags (val), ReactTypeOfMode (val)
    -- upvalues: u348 (val), u433 (val), u24 (val), resetCurrentFiber (val), u439 (ref), ReactCurrentOwner (val)
    local v1
    local v2 = RobloxReactProfiling.profileUnitOfWorkBefore(a1)
    local alternate = a1.alternate
    setCurrentFiber(a1)
    if not ReactFeatureFlags.enableProfilerTimer
        or (bit32.band(a1.mode, ReactTypeOfMode.ProfileMode)) == ReactTypeOfMode.NoMode then
        v1 = u433.beginWork(alternate, a1, u24.subtreeRenderLanes)
    else
        u348.startProfilerTimer(a1)
        v1 = u433.beginWork(alternate, a1, u24.subtreeRenderLanes)
        u348.stopProfilerTimerIfRunningAndRecordDelta(a1, true)
    end
    resetCurrentFiber()
    a1.memoizedProps = a1.pendingProps
    if v1 ~= nil then
        u439 = v1
    else
        u433.completeUnitOfWork(a1)
    end
    ReactCurrentOwner.current = nil
    RobloxReactProfiling.profileUnitOfWorkAfter(v2)
end

function u433.completeUnitOfWork(a1) -- Line: 1978
    -- upvalues: ReactFiberFlags (val), setCurrentFiber (val), ReactFeatureFlags (val), ReactTypeOfMode (val), u24 (val)
    -- upvalues: u321 (val), u348 (val), resetCurrentFiber (val), u439 (ref), unwindWork (val), u445 (ref)
    local alternate, child, return_, sibling, subtreeRenderLanes, subtreeRenderLanes_2, v1, v2
    local v3 = a1
    repeat
        alternate = v3.alternate
        return_ = v3.return_
        v1 = bit32.band(v3.flags, ReactFiberFlags.Incomplete)
        if v1 ~= ReactFiberFlags.NoFlags then
            v1 = unwindWork(v3, u24.subtreeRenderLanes)
            if v1 ~= nil then
                v1.flags = bit32.band(v1.flags, ReactFiberFlags.HostEffectMask)
                u439 = v1
                return
            end
            if ReactFeatureFlags.enableProfilerTimer then
                v2 = bit32.band(v3.mode, ReactTypeOfMode.ProfileMode)
                if v2 ~= ReactTypeOfMode.NoMode then
                    u348.stopProfilerTimerIfRunningAndRecordDelta(v3, false)
                    v2 = v3.actualDuration or 0
                    child = v3.child
                    while child ~= nil do
                        v2 = v2 + (child.actualDuration or 0)
                        child = child.sibling
                    end
                    v3.actualDuration = v2
                end
            end
            if return_ ~= nil then
                return_.flags = bit32.bor(return_.flags, ReactFiberFlags.Incomplete)
                return_.subtreeFlags = ReactFiberFlags.NoFlags
                return_.deletions = nil
            end
        else
            setCurrentFiber(v3)
            if not ReactFeatureFlags.enableProfilerTimer then
                subtreeRenderLanes_2 = u24.subtreeRenderLanes
                if not u321.completeWorkRef then
                    u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
                end
                v1 = u321.completeWorkRef(alternate, v3, subtreeRenderLanes_2)
            elseif (bit32.band(v3.mode, ReactTypeOfMode.ProfileMode)) ~= ReactTypeOfMode.NoMode then
                u348.startProfilerTimer(v3)
                subtreeRenderLanes = u24.subtreeRenderLanes
                if not u321.completeWorkRef then
                    u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
                end
                v1 = u321.completeWorkRef(alternate, v3, subtreeRenderLanes)
                u348.stopProfilerTimerIfRunningAndRecordDelta(v3, false)
            else
                subtreeRenderLanes_2 = u24.subtreeRenderLanes
                if not u321.completeWorkRef then
                    u321.completeWorkRef = require(script.Parent:WaitForChild("ReactFiberCompleteWork.new")).completeWork
                end
                v1 = u321.completeWorkRef(alternate, v3, subtreeRenderLanes_2)
            end
            resetCurrentFiber()
            if v1 ~= nil then
                u439 = v1
                return
            end
        end
        sibling = v3.sibling
        if sibling ~= nil then
            u439 = sibling
            return
        end
        u439 = return_
    until v3 == nil
    if u445 == 0 then
        u445 = 5
    end
end

function u433.commitRoot(a1) -- Line: 2086
    -- upvalues: getCurrentPriorityLevel (val), runWithPriority (val), ImmediatePriority (val)
    -- upvalues: RobloxReactProfiling (val), u433 (val)
    local u2 = getCurrentPriorityLevel()
    runWithPriority(ImmediatePriority, function() -- Line: 2088 -- upvalues: RobloxReactProfiling (upval), u433 (upval), a1 (val), u2 (val)
        RobloxReactProfiling.profileCommitBefore()
        local v1 = u433.commitRootImpl(a1, u2)
        RobloxReactProfiling.profileCommitAfter()
        return v1
    end)
    return nil
end

function u433.commitRootImpl(a1, a2) -- Line: 2099
    -- upvalues: u24 (val), u469 (ref), invariant (val), u437 (ref), __DEV__ (val), enableDebugTracing (val)
    -- upvalues: DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val), ReactFiberLane (val)
    -- upvalues: mergeLanes (val), markRootFinished (val), u472 (ref), hasDiscreteLanes (val), u438 (ref), u439 (ref)
    -- upvalues: NoLanes (ref), ReactFiberFlags (val), ReactFeatureFlags (val), getCurrentUpdateLanePriority (val)
    -- upvalues: setCurrentUpdateLanePriority (val), u433 (val), ReactCurrentOwner (val), u480 (ref)
    -- upvalues: ReactFiberHostConfig (val), u481 (ref), u348 (val), setCurrentFiber (val), invokeGuardedCallback (val)
    -- upvalues: recursivelyCommitLayoutEffects (val), hasCaughtError (val), clearCaughtError (val), u431 (ref)
    -- upvalues: resetCurrentFiber (val), __YOLO__ (val), describeError (val), u468 (ref), scheduleCallback (val)
    -- upvalues: NormalPriority (val), requestPaint (val), NoLanes_5 (ref), u470 (ref), u476 (ref), u467 (ref)
    -- upvalues: enableDoubleInvokingEffects (val), SyncLane (val), u474 (ref), u473 (ref), onCommitRoot (val)
    -- upvalues: onCommitRoot_2 (val), u320 (ref), now (val), u465 (ref), u466 (ref), flushSyncCallbackQueue (val)
    local result, success, v1, v2, v3, v4, v5
    repeat
        u24.flushPassiveEffects()
    until u469 == nil
    flushRenderPhaseStrictModeWarningsInDEV()
    invariant(bit32.band(u437, 48) == 0, "Should not already be working.")
    local finishedWork = a1.finishedWork
    local finishedLanes = a1.finishedLanes
    if __DEV__ and enableDebugTracing then
        DebugTracing.logCommitStarted(finishedLanes)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markCommitStarted(finishedLanes)
    end
    if finishedWork == nil then
        if __DEV__ and enableDebugTracing then
            DebugTracing.logCommitStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markCommitStopped()
        end
        return nil
    end
    a1.finishedWork = nil
    a1.finishedLanes = ReactFiberLane.NoLanes
    invariant(
        finishedWork ~= a1.current,
        "Cannot commit the same tree as before. This error is likely caused by a bug in React. Please file an issue."
    )
    a1.callbackNode = nil
    local v6 = mergeLanes(finishedWork.lanes, finishedWork.childLanes)
    markRootFinished(a1, v6)
    if u472 ~= nil and not hasDiscreteLanes(v6) and u472:has(a1) then
        u472:delete(a1)
    end
    if a1 == u438 then
        u438 = nil
        u439 = nil
        NoLanes = ReactFiberLane.NoLanes
    end
    local v7 = (bit32.band(
        finishedWork.subtreeFlags,
        (bit32.bor(ReactFiberFlags.BeforeMutationMask, ReactFiberFlags.MutationMask, ReactFiberFlags.LayoutMask, ReactFiberFlags.PassiveMask))
    )) ~= ReactFiberFlags.NoFlags
    local v8 = (bit32.band(
        finishedWork.flags,
        (bit32.bor(ReactFiberFlags.BeforeMutationMask, ReactFiberFlags.MutationMask, ReactFiberFlags.LayoutMask, ReactFiberFlags.PassiveMask))
    )) ~= ReactFiberFlags.NoFlags
    if v7 then
        v3 = nil
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
            v3 = getCurrentUpdateLanePriority()
            setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
        end
        v4 = u437
        u437 = bit32.bor(u437, 32)
        v5 = u433.pushInteractions(a1)
        ReactCurrentOwner.current = nil
        u480 = ReactFiberHostConfig.prepareForCommit(a1.containerInfo)
        u481 = false
        u433.commitBeforeMutationEffects(finishedWork)
        u480 = nil
        if ReactFeatureFlags.enableProfilerTimer then
            u348.recordCommitTime()
        end
        u433.commitMutationEffects(finishedWork, a1, a2)
        if u481 then
            ReactFiberHostConfig.afterActiveInstanceBlur()
        end
        ReactFiberHostConfig.resetAfterCommit(a1.containerInfo)
        a1.current = finishedWork
        if __DEV__ and enableDebugTracing then
            DebugTracing.logLayoutEffectsStarted(finishedLanes)
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markLayoutEffectsStarted(finishedLanes)
        end
        if not __DEV__ then
            v2 = nil
            if __YOLO__ then
                v1 = true
                recursivelyCommitLayoutEffects(finishedWork, a1, u24.captureCommitPhaseError, u24.schedulePassiveEffectCallback)
            else
                success, result = xpcall(
                    recursivelyCommitLayoutEffects,
                    describeError,
                    finishedWork,
                    a1,
                    u24.captureCommitPhaseError,
                    u24.schedulePassiveEffectCallback
                )
                v1 = success
                v2 = result
            end
            if not v1 then
                u431(finishedWork, finishedWork, v2)
            end
        else
            setCurrentFiber(finishedWork)
            invokeGuardedCallback(
                nil,
                recursivelyCommitLayoutEffects,
                nil,
                finishedWork,
                a1,
                u24.captureCommitPhaseError,
                u24.schedulePassiveEffectCallback
            )
            if hasCaughtError() then
                v1 = clearCaughtError()
                u431(finishedWork, finishedWork, v1)
            end
            resetCurrentFiber()
        end
        if __DEV__ and enableDebugTracing then
            DebugTracing.logLayoutEffectsStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markLayoutEffectsStopped()
        end
        if (bit32.band(finishedWork.subtreeFlags, ReactFiberFlags.PassiveMask)) ~= ReactFiberFlags.NoFlags then
            if not u468 then
                u468 = true
                scheduleCallback(NormalPriority, function() -- Line: 2332 -- upvalues: u24 (upval)
                    u24.flushPassiveEffects()
                    return nil
                end)
            end
        elseif (bit32.band(finishedWork.flags, ReactFiberFlags.PassiveMask)) ~= ReactFiberFlags.NoFlags and not u468 then
            u468 = true
            scheduleCallback(NormalPriority, function() -- Line: 2332 -- upvalues: u24 (upval)
                u24.flushPassiveEffects()
                return nil
            end)
        end
        requestPaint()
        if ReactFeatureFlags.enableSchedulerTracing then
            u433.popInteractions(v5)
        end
        u437 = v4
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler and v3 ~= nil then
            setCurrentUpdateLanePriority(v3)
        end
    elseif not v8 then
        a1.current = finishedWork
        if ReactFeatureFlags.enableProfilerTimer then
            u348.recordCommitTime()
        end
    else
        v3 = nil
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
            v3 = getCurrentUpdateLanePriority()
            setCurrentUpdateLanePriority(ReactFiberLane.SyncLanePriority)
        end
        v4 = u437
        u437 = bit32.bor(u437, 32)
        v5 = u433.pushInteractions(a1)
        ReactCurrentOwner.current = nil
        u480 = ReactFiberHostConfig.prepareForCommit(a1.containerInfo)
        u481 = false
        u433.commitBeforeMutationEffects(finishedWork)
        u480 = nil
        if ReactFeatureFlags.enableProfilerTimer then
            u348.recordCommitTime()
        end
        u433.commitMutationEffects(finishedWork, a1, a2)
        if u481 then
            ReactFiberHostConfig.afterActiveInstanceBlur()
        end
        ReactFiberHostConfig.resetAfterCommit(a1.containerInfo)
        a1.current = finishedWork
        if __DEV__ and enableDebugTracing then
            DebugTracing.logLayoutEffectsStarted(finishedLanes)
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markLayoutEffectsStarted(finishedLanes)
        end
        if not __DEV__ then
            v2 = nil
            if __YOLO__ then
                v1 = true
                recursivelyCommitLayoutEffects(finishedWork, a1, u24.captureCommitPhaseError, u24.schedulePassiveEffectCallback)
            else
                success, result = xpcall(
                    recursivelyCommitLayoutEffects,
                    describeError,
                    finishedWork,
                    a1,
                    u24.captureCommitPhaseError,
                    u24.schedulePassiveEffectCallback
                )
                v1 = success
                v2 = result
            end
            if not v1 then
                u431(finishedWork, finishedWork, v2)
            end
        else
            setCurrentFiber(finishedWork)
            invokeGuardedCallback(
                nil,
                recursivelyCommitLayoutEffects,
                nil,
                finishedWork,
                a1,
                u24.captureCommitPhaseError,
                u24.schedulePassiveEffectCallback
            )
            if hasCaughtError() then
                v1 = clearCaughtError()
                u431(finishedWork, finishedWork, v1)
            end
            resetCurrentFiber()
        end
        if __DEV__ and enableDebugTracing then
            DebugTracing.logLayoutEffectsStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markLayoutEffectsStopped()
        end
        if (bit32.band(finishedWork.subtreeFlags, ReactFiberFlags.PassiveMask)) ~= ReactFiberFlags.NoFlags then
            if not u468 then
                u468 = true
                scheduleCallback(NormalPriority, function() -- Line: 2332 -- upvalues: u24 (upval)
                    u24.flushPassiveEffects()
                    return nil
                end)
            end
        elseif (bit32.band(finishedWork.flags, ReactFiberFlags.PassiveMask)) ~= ReactFiberFlags.NoFlags and not u468 then
            u468 = true
            scheduleCallback(NormalPriority, function() -- Line: 2332 -- upvalues: u24 (upval)
                u24.flushPassiveEffects()
                return nil
            end)
        end
        requestPaint()
        if ReactFeatureFlags.enableSchedulerTracing then
            u433.popInteractions(v5)
        end
        u437 = v4
        if ReactFeatureFlags.decoupleUpdatePriorityFromScheduler and v3 ~= nil then
            setCurrentUpdateLanePriority(v3)
        end
    end
    v3 = u468
    if u468 then
        u468 = false
        u469 = a1
        NoLanes_5 = finishedLanes
        u470 = a2
    end
    local pendingLanes = a1.pendingLanes
    if pendingLanes == ReactFiberLane.NoLanes then
        u467 = nil
    elseif ReactFeatureFlags.enableSchedulerTracing then
        if u476 ~= nil then
            v4 = u476
            u476 = nil
            v5 = #v4
            for i = 1, v5 do
                scheduleInteractions(a1, v4[i], a1.memoizedInteractions)
            end
        end
        u433.schedulePendingInteractions(a1, pendingLanes)
    end
    if __DEV__ and enableDoubleInvokingEffects and not v3 then
        commitDoubleInvokeEffectsInDEV(a1.current, false)
    end
    if ReactFeatureFlags.enableSchedulerTracing and not v3 then
        u433.finishPendingInteractions(a1, finishedLanes)
    end
    if pendingLanes ~= SyncLane then
        u473 = 0
    elseif a1 ~= u474 then
        u473 = 0
        u474 = a1
    else
        u473 = u473 + 1
    end
    onCommitRoot(finishedWork.stateNode, a2)
    if __DEV__ then
        onCommitRoot_2()
    end
    u320(a1, now())
    if u465 then
        u465 = false
        v4 = u466
        u466 = nil
        error(v4)
    end
    if bit32.band(u437, 8) ~= 0 then
        if __DEV__ and enableDebugTracing then
            DebugTracing.logCommitStopped()
        end
        if enableSchedulingProfiler then
            SchedulingProfiler.markCommitStopped()
        end
        return nil
    end
    flushSyncCallbackQueue()
    if __DEV__ and enableDebugTracing then
        DebugTracing.logCommitStopped()
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markCommitStopped()
    end
    return nil
end

function u433.commitBeforeMutationEffects(a1) -- Line: 2483
    -- upvalues: u433 (val), ReactFiberFlags (val), __DEV__ (val), setCurrentFiber (val), invokeGuardedCallback (val)
    -- upvalues: hasCaughtError (val), clearCaughtError (val), u24 (val), resetCurrentFiber (val), __YOLO__ (val)
    -- upvalues: describeError (val)
    local result, success, v1, v2
    local sibling = a1
    while sibling ~= nil do
        if sibling.deletions ~= nil then
            u433.commitBeforeMutationEffectsDeletions(sibling.deletions)
        end
        if sibling.child ~= nil
            and (bit32.band(sibling.subtreeFlags, ReactFiberFlags.BeforeMutationMask)) ~= ReactFiberFlags.NoFlags then
            u433.commitBeforeMutationEffects(sibling.child)
        end
        if not __DEV__ then
            v2 = nil
            if __YOLO__ then
                v1 = true
                u433.commitBeforeMutationEffectsImpl(sibling)
            else
                success, result = xpcall(u433.commitBeforeMutationEffectsImpl, describeError, sibling)
                v1 = success
                v2 = result
            end
            if not v1 then
                u24.captureCommitPhaseError(sibling, sibling.return_, v2)
            end
        else
            setCurrentFiber(sibling)
            invokeGuardedCallback(nil, u433.commitBeforeMutationEffectsImpl, nil, sibling)
            if hasCaughtError() then
                u24.captureCommitPhaseError(sibling, sibling.return_, (clearCaughtError()))
            end
            resetCurrentFiber()
        end
        sibling = sibling.sibling
    end
end

function u433.commitBeforeMutationEffectsImpl(a1) -- Line: 2526
    -- upvalues: u481 (ref), u480 (ref), ReactWorkTags (val), u274 (val), doesFiberContain (val)
    -- upvalues: ReactFiberHostConfig (val), ReactFiberFlags (val), setCurrentFiber (val)
    -- upvalues: commitBeforeMutationLifeCycles (val), resetCurrentFiber (val), u468 (ref), scheduleCallback (val)
    -- upvalues: NormalPriority (val), u24 (val)
    local alternate = a1.alternate
    local flags = a1.flags
    if not u481
        and u480 ~= nil
        and a1.tag == ReactWorkTags.SuspenseComponent
        and u274.isSuspenseBoundaryBeingHidden(alternate, a1)
        and doesFiberContain(a1, u480) then
        u481 = true
        ReactFiberHostConfig.beforeActiveInstanceBlur()
    end
    if (bit32.band(flags, ReactFiberFlags.Snapshot)) ~= ReactFiberFlags.NoFlags then
        setCurrentFiber(a1)
        commitBeforeMutationLifeCycles(alternate, a1)
        resetCurrentFiber()
    end
    if (bit32.band(flags, ReactFiberFlags.Passive)) ~= ReactFiberFlags.NoFlags and not u468 then
        u468 = true
        scheduleCallback(NormalPriority, function() -- Line: 2554 -- upvalues: u24 (upval)
            u24.flushPassiveEffects()
            return nil
        end)
    end
end

function u433.commitBeforeMutationEffectsDeletions(a1) -- Line: 2562
    -- upvalues: doesFiberContain (val), u480 (ref), u481 (ref), ReactFiberHostConfig (val)
    local v1 = #a1
    for i = 1, v1 do
        if doesFiberContain(a1[i], u480) then
            u481 = true
            ReactFiberHostConfig.beforeActiveInstanceBlur()
        end
    end
end

function u433.commitMutationEffects(a1, a2, a3) -- Line: 2578
    -- upvalues: commitDeletion (val), describeError (val), u24 (val), ReactFiberFlags (val), u433 (val), __DEV__ (val)
    -- upvalues: setCurrentFiber (val), invokeGuardedCallback (val), hasCaughtError (val), clearCaughtError (val)
    -- upvalues: resetCurrentFiber (val), __YOLO__ (val)
    local deletions, result, result_2, success, success_2, v1, v2
    local sibling = a1
    local v3, v4 = a2, a3
    while sibling ~= nil do
        deletions = sibling.deletions
        if deletions ~= nil then
            for i, j in deletions do
                success, result = xpcall(commitDeletion, describeError, v3, j, sibling, v4)
                if not success then
                    u24.captureCommitPhaseError(j, sibling, result)
                end
            end
        end
        if sibling.child ~= nil
            and (bit32.band(sibling.subtreeFlags, ReactFiberFlags.MutationMask)) ~= ReactFiberFlags.NoFlags then
            u433.commitMutationEffects(sibling.child, v3, v4)
        end
        if not __DEV__ then
            v2 = nil
            if __YOLO__ then
                v1 = true
                u433.commitMutationEffectsImpl(sibling, v3, v4)
            else
                success_2, result_2 = xpcall(u433.commitMutationEffectsImpl, describeError, sibling, v3, v4)
                v1 = success_2
                v2 = result_2
            end
            if not v1 then
                u24.captureCommitPhaseError(sibling, sibling.return_, v2)
            end
        else
            setCurrentFiber(sibling)
            invokeGuardedCallback(nil, u433.commitMutationEffectsImpl, nil, sibling, v3, v4)
            if hasCaughtError() then
                u24.captureCommitPhaseError(sibling, sibling.return_, (clearCaughtError()))
            end
            resetCurrentFiber()
        end
        sibling = sibling.sibling
    end
end

function u433.commitMutationEffectsImpl(a1, a2, a3) -- Line: 2648
    -- upvalues: ReactFiberFlags (val), commitDetachRef (val), commitPlacement (val), commitWork (val)
    local flags = a1.flags
    if bit32.band(flags, ReactFiberFlags.Ref) ~= 0 then
        local alternate = a1.alternate
        if alternate ~= nil then
            commitDetachRef(alternate)
        end
    end
    local v1 = bit32.band(flags, (bit32.bor(ReactFiberFlags.Placement, ReactFiberFlags.Update, ReactFiberFlags.Hydrating)))
    if v1 == ReactFiberFlags.Placement then
        commitPlacement(a1)
        a1.flags = bit32.band(a1.flags, (bit32.bnot(ReactFiberFlags.Placement)))
        return
    end
    if v1 ~= ReactFiberFlags.PlacementAndUpdate then
        if v1 == ReactFiberFlags.Update then
            commitWork(a1.alternate, a1)
        end
        return
    end
    commitPlacement(a1)
    a1.flags = bit32.band(a1.flags, (bit32.bnot(ReactFiberFlags.Placement)))
    commitWork(a1.alternate, a1)
end

function u433.commitMutationEffectsDeletions(a1, a2, a3, a4) -- Line: 2714
    -- upvalues: commitDeletion (val), describeError (val), u24 (val)
    local result, success
    for i, j in a1 do
        success, result = xpcall(commitDeletion, describeError, a3, j, a2, a4)
        if not success then
            u24.captureCommitPhaseError(j, a2, result)
        end
    end
end

function u24.schedulePassiveEffectCallback() -- Line: 2732
    -- upvalues: u468 (ref), scheduleCallback (val), NormalPriority (val), u24 (val)
    if not u468 then
        u468 = true
        scheduleCallback(NormalPriority, function() -- Line: 2735 -- upvalues: u24 (upval)
            u24.flushPassiveEffects()
            return nil
        end)
    end
end

local u536 = nil

function u24.flushPassiveEffects() -- Line: 2744
    -- upvalues: u470 (ref), NoPriority (val), NormalPriority (val), ReactFeatureFlags (val)
    -- upvalues: getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val)
    -- upvalues: schedulerPriorityToLanePriority (val), __YOLO__ (val), runWithPriority (val), describeError (val)
    -- upvalues: u536 (ref)
    local v1, v2
    if u470 == NoPriority then
        return false
    end
    local v3 = if not (NormalPriority < u470) then u470 else NormalPriority
    u470 = NoPriority
    if not ReactFeatureFlags.decoupleUpdatePriorityFromScheduler then
        return runWithPriority(v3, u536)
    end
    local v4 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(v3))
    if __YOLO__ then
        v1 = true
        setCurrentUpdateLanePriority(schedulerPriorityToLanePriority(v3))
        v2 = runWithPriority(v3, u536)
    else
        local success, result = xpcall(runWithPriority, describeError, v3, u536)
        v1 = success
        v2 = result
    end
    setCurrentUpdateLanePriority(v4)
    if not v1 then
        error(v2)
    end
    return v2
end

function u538(a1, a2) -- Line: 2788
    -- upvalues: ReactFeatureFlags (val), ReactWorkTags (val), u462 (ref), ReactFiberFlags (val), u538 (ref)
    -- upvalues: __DEV__ (val), setCurrentFiber (val), invokeGuardedCallback (val), commitPassiveMount (val)
    -- upvalues: hasCaughtError (val), clearCaughtError (val), u24 (val), resetCurrentFiber (val), __YOLO__ (val)
    -- upvalues: describeError (val)
    local result, stateNode, success, v1, v2, v3, v4, v5
    local sibling = a2
    while sibling ~= nil do
        v2 = nil
        if ReactFeatureFlags.enableProfilerTimer
            and ReactFeatureFlags.enableProfilerCommitHooks
            and sibling.tag == ReactWorkTags.Profiler then
            v2 = u462
            u462 = sibling
        end
        v3 = bit32.band(sibling.subtreeFlags, ReactFiberFlags.PassiveMask)
        if sibling.child ~= nil and v3 ~= ReactFiberFlags.NoFlags then
            u538(v1, sibling.child)
        end
        v4 = bit32.band(sibling.flags, ReactFiberFlags.Passive)
        if v4 ~= ReactFiberFlags.NoFlags then
            if not __DEV__ then
                v5 = nil
                if __YOLO__ then
                    v4 = true
                    commitPassiveMount(v1, sibling)
                else
                    success, result = xpcall(commitPassiveMount, describeError, v1, sibling)
                    v4 = success
                    v5 = result
                end
                if not v4 then
                    u24.captureCommitPhaseError(sibling, sibling.return_, v5)
                end
            else
                setCurrentFiber(sibling)
                invokeGuardedCallback(nil, commitPassiveMount, nil, v1, sibling)
                if hasCaughtError() then
                    u24.captureCommitPhaseError(sibling, sibling.return_, (clearCaughtError()))
                end
                resetCurrentFiber()
            end
        end
        if ReactFeatureFlags.enableProfilerTimer
            and ReactFeatureFlags.enableProfilerCommitHooks
            and sibling.tag == ReactWorkTags.Profiler then
            if v2 ~= nil then
                stateNode = v2.stateNode
                stateNode.passiveEffectDuration = stateNode.passiveEffectDuration + sibling.stateNode.passiveEffectDuration
            end
            u462 = v2
        end
        sibling = sibling.sibling
    end
end

function flushPassiveUnmountEffects(a1) -- Line: 2857
    -- upvalues: u433 (val), ReactFiberFlags (val), flushPassiveUnmountEffects (val), setCurrentFiber (val)
    -- upvalues: commitPassiveUnmount (val), resetCurrentFiber (val)
    local child, deletions, v1, v2
    local sibling = a1
    while sibling ~= nil do
        deletions = sibling.deletions
        if deletions ~= nil then
            v1 = #deletions
            for i = 1, v1 do
                v2 = deletions[i]
                u433.flushPassiveUnmountEffectsInsideOfDeletedTree(v2, sibling)
                u433.detachFiberAfterEffects(v2)
            end
        end
        child = sibling.child
        if child ~= nil
            and (bit32.band(sibling.subtreeFlags, ReactFiberFlags.PassiveMask)) ~= ReactFiberFlags.NoFlags then
            flushPassiveUnmountEffects(child)
        end
        if (bit32.band(sibling.flags, ReactFiberFlags.Passive)) ~= ReactFiberFlags.NoFlags then
            setCurrentFiber(sibling)
            commitPassiveUnmount(sibling)
            resetCurrentFiber()
        end
        sibling = sibling.sibling
    end
end

function u433.flushPassiveUnmountEffectsInsideOfDeletedTree(a1, a2) -- Line: 2897
    -- upvalues: ReactFiberFlags (val), u433 (val), setCurrentFiber (val), commitPassiveUnmountInsideDeletedTree (val)
    -- upvalues: resetCurrentFiber (val)
    if (bit32.band(a1.subtreeFlags, ReactFiberFlags.PassiveStatic)) ~= ReactFiberFlags.NoFlags then
        local child = a1.child
        while child ~= nil do
            u433.flushPassiveUnmountEffectsInsideOfDeletedTree(child, a2)
            child = child.sibling
        end
    end
    if (bit32.band(a1.flags, ReactFiberFlags.PassiveStatic)) ~= ReactFiberFlags.NoFlags then
        setCurrentFiber(a1)
        commitPassiveUnmountInsideDeletedTree(a1, a2)
        resetCurrentFiber()
    end
end

function u536() -- Line: 2929
    -- upvalues: u469 (ref), NoLanes_5 (ref), ReactFiberLane (val), invariant (val), u437 (ref), __DEV__ (val)
    -- upvalues: enableDebugTracing (val), DebugTracing (val), enableSchedulingProfiler (val), SchedulingProfiler (val)
    -- upvalues: u433 (val), flushPassiveUnmountEffects (val), u538 (ref), enableDoubleInvokingEffects (val)
    -- upvalues: ReactFeatureFlags (val), flushSyncCallbackQueue (val), u475 (ref)
    if u469 == nil then
        return false
    end
    local v1 = u469
    local v2 = NoLanes_5
    u469 = nil
    NoLanes_5 = ReactFiberLane.NoLanes
    invariant(bit32.band(u437, 48) == 0, "Cannot flush passive effects while already rendering.")
    if __DEV__ and enableDebugTracing then
        DebugTracing.logPassiveEffectsStarted(v2)
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markPassiveEffectsStarted(v2)
    end
    local v3 = u437
    u437 = bit32.bor(u437, 32)
    local v4 = u433.pushInteractions(v1)
    flushPassiveUnmountEffects(v1.current)
    u538(v1, v1.current)
    if __DEV__ and enableDebugTracing then
        DebugTracing.logPassiveEffectsStopped()
    end
    if enableSchedulingProfiler then
        SchedulingProfiler.markPassiveEffectsStopped()
    end
    if __DEV__ and enableDoubleInvokingEffects then
        commitDoubleInvokeEffectsInDEV(v1.current, true)
    end
    if ReactFeatureFlags.enableSchedulerTracing then
        u433.popInteractions(v4)
        u433.finishPendingInteractions(v1, v2)
    end
    u437 = v3
    flushSyncCallbackQueue()
    u475 = if u469 ~= nil then u475 + 1 else 0
    return true
end

function u24.isAlreadyFailedLegacyErrorBoundary(a1) -- Line: 3002 -- upvalues: u467 (ref)
    local v1 = false
    if u467 ~= nil then
        v1 = u467:has(a1)
    end
    return v1
end

function u24.markLegacyErrorBoundaryAsFailed(a1) -- Line: 3008 -- upvalues: u467 (ref), Set (val)
    if u467 == nil then
        u467 = Set.new({a1})
        return
    end
    u467:add(a1)
end

function u24.onUncaughtError(a1) -- Line: 3017 -- upvalues: u465 (ref), u466 (ref)
    if not u465 then
        u465 = true
        u466 = a1
    end
end

function u431(a1, a2, a3) -- Line: 3025
    -- upvalues: createCapturedValue (val), createRootErrorUpdate (val), SyncLane (val), u24 (val), enqueueUpdate (val)
    -- upvalues: u433 (val), markRootUpdated (val), u320 (ref)
    enqueueUpdate(a1, (createRootErrorUpdate(a1, createCapturedValue(a3, a2), SyncLane, u24.onUncaughtError)))
    local v1 = u24.requestEventTime()
    local v2 = u433.markUpdateLaneFromFiberToRoot(a1, SyncLane)
    if v2 ~= nil then
        markRootUpdated(v2, SyncLane, v1)
        u320(v2, v1)
        u433.schedulePendingInteractions(v2, SyncLane)
    end
end

function u24.captureCommitPhaseError(a1, a2, a3) -- Line: 3046
    -- upvalues: ReactWorkTags (val), u431 (ref), skipUnmountedBoundaries (val), u24 (val), createCapturedValue (val)
    -- upvalues: createClassErrorUpdate (val), SyncLane (val), enqueueUpdate (val), u433 (val), markRootUpdated (val)
    -- upvalues: u320 (ref)
    local stateNode, type, v1, v2
    if a1.tag == ReactWorkTags.HostRoot then
        u431(a1, a1, a3)
        return
    end
    local return_ = if not skipUnmountedBoundaries then a1.return_ else a2
    local v3, v4 = a1, a3
    while return_ ~= nil do
        if return_.tag == ReactWorkTags.HostRoot then
            u431(return_, v3, v4)
            return
        end
        if return_.tag == ReactWorkTags.ClassComponent then
            type = return_.type
            stateNode = return_.stateNode
            if typeof(type.getDerivedStateFromError) == "function" then
                enqueueUpdate(return_, (createClassErrorUpdate(return_, createCapturedValue(v4, v3), SyncLane)))
                v1 = u24.requestEventTime()
                v2 = u433.markUpdateLaneFromFiberToRoot(return_, SyncLane)
                if v2 ~= nil then
                    markRootUpdated(v2, SyncLane, v1)
                    u320(v2, v1)
                    u433.schedulePendingInteractions(v2, SyncLane)
                end
                return
            end
            if typeof(stateNode.componentDidCatch) == "function"
                and not u24.isAlreadyFailedLegacyErrorBoundary(stateNode) then
                enqueueUpdate(return_, (createClassErrorUpdate(return_, createCapturedValue(v4, v3), SyncLane)))
                v1 = u24.requestEventTime()
                v2 = u433.markUpdateLaneFromFiberToRoot(return_, SyncLane)
                if v2 ~= nil then
                    markRootUpdated(v2, SyncLane, v1)
                    u320(v2, v1)
                    u433.schedulePendingInteractions(v2, SyncLane)
                end
                return
            end
            return_ = return_.return_
            continue
        end
        return_ = return_.return_
    end
end

function u24.pingSuspendedRoot(a1, a2, a3) -- Line: 3095
    -- upvalues: u24 (val), markRootPinged (val), u438 (ref), isSubsetOfLanes (val), NoLanes (ref), u445 (ref)
    -- upvalues: includesOnlyRetries (val), now (val), u460 (ref), u433 (val), ReactFiberLane (val), NoLanes_4 (ref)
    -- upvalues: mergeLanes (val), u320 (ref)
    local pingCache = a1.pingCache
    if pingCache ~= nil then
        pingCache[a2] = nil
    end
    local v1 = u24.requestEventTime()
    markRootPinged(a1, a3, v1)
    if u438 == a1 and isSubsetOfLanes(NoLanes, a3) then
        if u445 == 4 then
            u433.prepareFreshStack(a1, ReactFiberLane.NoLanes)
        elseif u445 ~= 3 or not includesOnlyRetries(NoLanes) or not (now() - u460 < 500) then
            NoLanes_4 = mergeLanes(NoLanes_4, a3)
        else
            u433.prepareFreshStack(a1, ReactFiberLane.NoLanes)
        end
    end
    u320(a1, v1)
    u433.schedulePendingInteractions(a1, a3)
end

function retryTimedOutBoundary(a1, a2) -- Line: 3139
    -- upvalues: ReactFiberLane (val), u24 (val), u433 (val), markRootUpdated (val), u320 (ref)
    if a2 == ReactFiberLane.NoLane then
        a2 = requestRetryLane(a1)
    end
    local v1 = u24.requestEventTime()
    local v2 = u433.markUpdateLaneFromFiberToRoot(a1, a2)
    if v2 ~= nil then
        markRootUpdated(v2, a2, v1)
        u320(v2, v1)
        u433.schedulePendingInteractions(v2, a2)
    end
end

function u24.resolveRetryWakeable(a1, a2) -- Line: 3166 -- upvalues: ReactFiberLane (val)
    local NoLane = ReactFiberLane.NoLane
    local stateNode = a1.stateNode
    if stateNode ~= nil then
        stateNode:delete(a2)
    end
    retryTimedOutBoundary(a1, NoLane)
end

function jnd(a1) -- Line: 3210 -- types: a1: number
    if a1 < 120 then
        return 120
    end
    if a1 < 480 then
        return 480
    end
    if a1 < 1080 then
        return 1080
    end
    if a1 < 1920 then
        return 1920
    end
    if a1 < 3000 then
        return 3000
    end
    if a1 < 4320 then
        return 4320
    end
    return math.ceil(a1 / 1960) * 1960
end

function u433.checkForNestedUpdates() -- Line: 3228
    -- upvalues: u473 (ref), u474 (ref), invariant (val), __DEV__ (val), u475 (ref), console (val)
    if u473 > 50 then
        u473 = 0
        u474 = nil
        invariant(
            false,
            "Maximum update depth exceeded. This can happen when a component repeatedly calls setState inside componentWillUpdate or componentDidUpdate. React limits the number of nested updates to prevent infinite loops."
        )
    end
    if __DEV__ and u475 > 50 then
        u475 = 0
        console.error("Maximum update depth exceeded. This can happen when a component calls setState inside useEffect, but useEffect either doesn't have a dependency array, or one of the dependencies changes on every render.")
    end
end

function flushRenderPhaseStrictModeWarningsInDEV() -- Line: 3254
    -- upvalues: __DEV__ (val), u366 (val), ReactFeatureFlags (val)
    if __DEV__ then
        u366.flushLegacyContextWarning()
        if ReactFeatureFlags.warnAboutDeprecatedLifecycles then
            u366.flushPendingUnsafeLifecycleWarnings()
        end
    end
end

function commitDoubleInvokeEffectsInDEV(a1, a2) -- Line: 3264
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), setCurrentFiber (val), ReactFiberFlags (val)
    -- upvalues: invokeLayoutEffectUnmountInDEV (val), invokePassiveEffectUnmountInDEV (val)
    -- upvalues: invokeLayoutEffectMountInDEV (val), invokePassiveEffectMountInDEV (val), resetCurrentFiber (val)
    if __DEV__ and enableDoubleInvokingEffects then
        setCurrentFiber(a1)
        invokeEffectsInDev(a1, ReactFiberFlags.MountLayoutDev, invokeLayoutEffectUnmountInDEV)
        if a2 then
            invokeEffectsInDev(a1, ReactFiberFlags.MountPassiveDev, invokePassiveEffectUnmountInDEV)
        end
        invokeEffectsInDev(a1, ReactFiberFlags.MountLayoutDev, invokeLayoutEffectMountInDEV)
        if a2 then
            invokeEffectsInDev(a1, ReactFiberFlags.MountPassiveDev, invokePassiveEffectMountInDEV)
        end
        resetCurrentFiber()
    end
end

function invokeEffectsInDev(a1, a2, a3) -- Line: 3296
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), ReactFiberFlags (val)
    if __DEV__ and enableDoubleInvokingEffects then
        local sibling = a1
        local v1, v2 = a2, a3
        while sibling ~= nil do
            if sibling.child ~= nil and (bit32.band(sibling.subtreeFlags, v1)) ~= ReactFiberFlags.NoFlags then
                invokeEffectsInDev(sibling.child, v1, v2)
            end
            if (bit32.band(sibling.flags, v1)) ~= ReactFiberFlags.NoFlags then
                v2(sibling)
            end
            sibling = sibling.sibling
        end
    end
end

local u555 = nil

function u433.warnAboutUpdateOnNotYetMountedFiberInDEV(a1) -- Line: 3322
    -- upvalues: __DEV__ (val), u437 (ref), ReactTypeOfMode (val), ReactWorkTags (val), getComponentName (val)
    -- upvalues: u555 (ref), ReactCurrentFiber (val), setCurrentFiber (val), console (val), resetCurrentFiber (val)
    if __DEV__ then
        if bit32.band(u437, 16) ~= 0
            or bit32.band(a1.mode, (bit32.bor(ReactTypeOfMode.BlockingMode, ReactTypeOfMode.ConcurrentMode))) == 0 then
            return
        end
        local tag = a1.tag
        if tag ~= ReactWorkTags.IndeterminateComponent
            and tag ~= ReactWorkTags.HostRoot
            and tag ~= ReactWorkTags.ClassComponent
            and tag ~= ReactWorkTags.FunctionComponent
            and tag ~= ReactWorkTags.ForwardRef
            and tag ~= ReactWorkTags.MemoComponent
            and tag ~= ReactWorkTags.SimpleMemoComponent
            and tag ~= ReactWorkTags.Block then
            return
        end
        local v1 = getComponentName(a1.type) or "ReactComponent"
        if u555 == nil then
            u555 = {[v1] = true}
        else
            if u555[v1] then
                return
            end
            u555[v1] = true
        end
        local current = ReactCurrentFiber.current
        local success, result = pcall(function() -- Line: 3367 -- upvalues: setCurrentFiber (upval), a1 (val), console (upval)
            setCurrentFiber(a1)
            console.error("Can't perform a React state update on a component that hasn't mounted yet. This indicates that you have a side-effect in your render function that asynchronously later calls tries to update the component. Move this work to useEffect instead.")
        end)
        if not current then
            resetCurrentFiber()
        else
            setCurrentFiber(a1)
        end
        if not success then
            error(result)
        end
    end
end

if not __DEV__ or not ReactFeatureFlags.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    u433.beginWork = u322
else
    function u433.beginWork(a1, a2, a3) -- Line: 3393
        -- upvalues: u174 (val), u322 (val), describeError (val), resetContextDependencies (val), u321 (val), u324 (ref)
        -- upvalues: unwindInterruptedWork (val), ReactFeatureFlags (val), ReactTypeOfMode (val), u348 (val)
        -- upvalues: invokeGuardedCallback (val), hasCaughtError (val), clearCaughtError (val)
        local v1 = u174.assignFiberPropertiesInDEV(nil, a2)
        local success, result = xpcall(u322, describeError, a1, a2, a3)
        if not success then
            if result ~= nil and typeof(result) == "table" and typeof(result.andThen) == "function" then
                error(result)
            end
            resetContextDependencies()
            if not u321.resetHooksAfterThrowRef then
                u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
                u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
                u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
                u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
            end
            u321.resetHooksAfterThrowRef()
            unwindInterruptedWork(a2)
            u174.assignFiberPropertiesInDEV(a2, v1)
            if ReactFeatureFlags.enableProfilerTimer and bit32.band(a2.mode, ReactTypeOfMode.ProfileMode) ~= 0 then
                u348.startProfilerTimer(a2)
            end
            invokeGuardedCallback(nil, u322, nil, a1, a2, a3)
            if hasCaughtError() then
                error((clearCaughtError()))
                return result
            end
            error(result)
        end
        return result
    end
end
local u561 = false
local u565 = nil
if __DEV__ then
    u565 = {}
end

function u433.warnAboutRenderPhaseUpdatesInDEV(a1) -- Line: 3463
    -- upvalues: __DEV__ (val), ReactCurrentFiber (val), u437 (ref), u321 (val), u324 (ref), ReactWorkTags (val)
    -- upvalues: u439 (ref), getComponentName (val), u565 (ref), console (val), u561 (ref)
    if __DEV__ and ReactCurrentFiber.isRendering and bit32.band(u437, 16) ~= 0 then
        if not u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            u324 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
            u321.resetHooksAfterThrowRef = u324.resetHooksAfterThrow
            u321.ContextOnlyDispatcherRef = u324.ContextOnlyDispatcher
            u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = u324.getIsUpdatingOpaqueValueInRenderPhaseInDEV
        end
        if not u321.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if a1.tag ~= ReactWorkTags.FunctionComponent
                and a1.tag ~= ReactWorkTags.ForwardRef
                and a1.tag ~= ReactWorkTags.SimpleMemoComponent then
                if a1.tag == ReactWorkTags.ClassComponent and not u561 then
                    console.error("Cannot update during an existing state transition (such as within `render`). Render methods should be a pure function of props and state.")
                    u561 = true
                end
                return
            end
            local v1 = if u439 == nil then "Unknown" else getComponentName(u439.type)
            if u565[v1] == nil then
                u565[v1] = true
                console.error(
                    "Cannot update a component (`%s`) while rendering a different component (`%s`). To locate the bad setState() call inside `%s`, follow the stack trace as described in https://reactjs.org/link/setstate-in-render",
                    getComponentName(a1.type) or "Unknown",
                    v1,
                    v1
                )
                return
            end
        end
    end
end

u24.IsThisRendererActing = {current = false}

function u24.warnIfNotScopedWithMatchingAct(a1) -- Line: 3515
    -- upvalues: __DEV__ (val), ReactFiberHostConfig (val), IsSomeRendererActing (val), u24 (val)
    -- upvalues: ReactCurrentFiber (val), setCurrentFiber (val), console (val), resetCurrentFiber (val)
    if __DEV__
        and ReactFiberHostConfig.warnsIfNotActing == true
        and IsSomeRendererActing.current == true
        and u24.IsThisRendererActing.current ~= true then
        local current = ReactCurrentFiber.current
        local success, result = pcall(function() -- Line: 3523 -- upvalues: setCurrentFiber (upval), a1 (val), console (upval)
            setCurrentFiber(a1)
            console.error("It looks like you're using the wrong act() around your test interactions.\nBe sure to use the matching version of act() corresponding to your renderer:\n\n-- for react-roblox:\nlocal React = require(Packages.React)\n-- ...\nReact.TestUtils.act(function() ... end)\n\n-- for react-test-renderer:\nlocal TestRenderer = require(Packages.ReactTestRenderer)\n-- ...\nTestRenderer.act(function() ... end)")
        end)
        if not current then
            resetCurrentFiber()
        else
            setCurrentFiber(a1)
        end
        if not success then
            error(result)
        end
    end
end

function u24.warnIfNotCurrentlyActingEffectsInDEV(a1) -- Line: 3559
    -- upvalues: __DEV__ (val), ReactFiberHostConfig (val), ReactTypeOfMode (val), IsSomeRendererActing (val), u24 (val)
    -- upvalues: console (val), getComponentName (val)
    if __DEV__
        and ReactFiberHostConfig.warnsIfNotActing == true
        and (bit32.band(a1.mode, ReactTypeOfMode.StrictMode)) ~= ReactTypeOfMode.NoMode
        and IsSomeRendererActing.current == false
        and u24.IsThisRendererActing.current == false then
        console.error(
            "An update to %s ran an effect, but was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  \nend)\n\n\nThis ensures that you're testing the behavior the user would see in the real client. Learn more at https://reactjs.org/link/wrap-tests-with-act",
            getComponentName(a1.type)
        )
    end
end

function u24.warnIfNotCurrentlyActingUpdatesInDEV(a1) -- Line: 3585
    -- upvalues: __DEV__ (val), ReactFiberHostConfig (val), u437 (ref), IsSomeRendererActing (val), u24 (val)
    -- upvalues: current (val), setCurrentFiber (val), console (val), getComponentName (val), resetCurrentFiber (val)
    if __DEV__
        and ReactFiberHostConfig.warnsIfNotActing == true
        and u437 == 0
        and IsSomeRendererActing.current == false
        and u24.IsThisRendererActing.current == false then
        local v1 = current
        local success, result = pcall(function() -- Line: 3594 -- upvalues: setCurrentFiber (upval), a1 (val), console (upval), getComponentName (upval)
            setCurrentFiber(a1)
            console.error(
                "An update to %s inside a test was not wrapped in act(...).\n\nWhen testing, code that causes React state updates should be wrapped into act(...):\n\nact(function()\n  \nend)\n\n\nThis ensures that you're testing the behavior the user would see in the client application. Learn more at https://reactjs.org/link/wrap-tests-with-act",
                getComponentName(a1.type)
            )
        end)
        if not v1 then
            resetCurrentFiber()
        else
            setCurrentFiber(a1)
        end
        if success then
            return result
        end
    end
end

local u621 = false

function u24.warnIfUnmockedScheduler(a1) -- Line: 3635
    -- upvalues: __DEV__ (val), u621 (ref), scheduler (val), ReactTypeOfMode (val), console (val)
    -- upvalues: ReactFeatureFlags (val)
    if __DEV__ and u621 == false and scheduler.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(a1.mode, ReactTypeOfMode.BlockingMode) == 0
            and bit32.band(a1.mode, ReactTypeOfMode.ConcurrentMode) == 0 then
            if ReactFeatureFlags.warnAboutUnmockedScheduler == true then
                u621 = true
                console.error("Starting from React v18, the 'scheduler' module will need to be mocked to guarantee consistent behaviour across tests and client applications. For example, with Jest: \njest.mock('scheduler', function() return require(@pkg/scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
            end
            return
        end
        u621 = true
        console.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked to guarantee consistent behaviour across tests and client application. For example, with Jest: \njest.mock('scheduler', function() return require(@pkg/scheduler).unstable_mock end)\n\nFor more info, visit https://reactjs.org/link/mock-scheduler")
        return
    end
end

function computeThreadID(a1, a2) -- Line: 3678
    return a2 * 1000 + a1.interactionThreadID
end

function u24.markSpawnedWork(a1) -- Line: 3686 -- upvalues: ReactFeatureFlags (val), u476 (ref)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    if u476 == nil then
        u476 = {a1}
        return
    end
    table.insert(u476, a1)
end

function scheduleInteractions(a1, a2, a3) -- Line: 3698
    -- upvalues: ReactFeatureFlags (val), Set (val), __subscriberRef (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    if 0 < a3.size then
        local pendingInteractionMap = a1.pendingInteractionMap
        local u11 = pendingInteractionMap:get(a2)
        if u11 == nil then
            pendingInteractionMap:set(a2, (Set.new(a3)))
            for i, j in a3 do
                j.__count = j.__count + 1
            end
        else
            a3:forEach(function(a1) -- Line: 3711 -- upvalues: u11 (val)
                if not u11:has(a1) then
                    a1.__count = a1.__count + 1
                end
                u11:add(a1)
            end)
        end
        local current = __subscriberRef.current
        if current ~= nil then
            current.onWorkScheduled(a3, (computeThreadID(a1, a2)))
        end
    end
end

function u433.schedulePendingInteractions(a1, a2) -- Line: 3736
    -- upvalues: ReactFeatureFlags (val), __interactionsRef (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    scheduleInteractions(a1, a2, __interactionsRef.current)
end

function u433.startWorkOnPendingInteractions(a1, a2) -- Line: 3747
    -- upvalues: ReactFeatureFlags (val), Set (val), includesSomeLane (val), __subscriberRef (val), describeError (val)
    -- upvalues: scheduleCallback (val), ImmediatePriority (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    local u6 = Set.new()
    a1.pendingInteractionMap:forEach(function(a1, a2_2) -- Line: 3757 -- upvalues: includesSomeLane (upval), a2 (val), u6 (val)
        if includesSomeLane(a2, a2_2) then
            a1:forEach(function(a1) -- Line: 3759 -- upvalues: u6 (upval)
                u6:add(a1)
            end)
        end
    end)
    a1.memoizedInteractions = u6
    if 0 < u6.size then
        local current = __subscriberRef.current
        if current ~= nil then
            local success, result = xpcall(current.onWorkStarted, describeError, u6, (computeThreadID(a1, a2)))
            if not success then
                scheduleCallback(ImmediatePriority, function() -- Line: 3781 -- upvalues: result (val)
                    error(result)
                end)
            end
        end
    end
end

function u433.finishPendingInteractions(a1, a2) -- Line: 3789
    -- upvalues: ReactFeatureFlags (val), __subscriberRef (val), describeError (val), includesSomeLane (val)
    -- upvalues: scheduleCallback (val), ImmediatePriority (val)
    if not ReactFeatureFlags.enableSchedulerTracing then
        return
    end
    local pendingLanes = a1.pendingLanes
    local current = nil
    local v1 = true
    local u25 = nil
    if current ~= nil and 0 < a1.memoizedInteractions.size then
        local v2 = computeThreadID(a1, a2)
        current = __subscriberRef.current
        local success, result = xpcall(current.onWorkStopped, describeError, a1.memoizedInteractions, v2)
        v1 = success
        u25 = result
    end
    local pendingInteractionMap = a1.pendingInteractionMap
    pendingInteractionMap:forEach(function(a1, a2) -- Line: 3820
        -- upvalues: includesSomeLane (upval), pendingLanes (val), pendingInteractionMap (val), current (ref)
        -- upvalues: describeError (upval), scheduleCallback (upval), ImmediatePriority (upval)
        if not includesSomeLane(pendingLanes, a2) then
            pendingInteractionMap:delete(a2)
            a1:forEach(function(a1) -- Line: 3826
                -- upvalues: current (upval), describeError (upval), scheduleCallback (upval), ImmediatePriority (upval)
                a1.__count = a1.__count - 1
                if current ~= nil and a1.__count == 0 then
                    local success, result = xpcall(current.onInteractionScheduledWorkCompleted, describeError, a1)
                    if not success then
                        scheduleCallback(ImmediatePriority, function() -- Line: 3837 -- upvalues: result (val)
                            error(result)
                        end)
                    end
                end
            end)
        end
    end)
    if not v1 then
        scheduleCallback(ImmediatePriority, function() -- Line: 3849 -- upvalues: u25 (ref)
            error(u25)
        end)
    end
end

local u659 = false
local u660 = false
local unstable_flushAllWithoutAsserting = scheduler.unstable_flushAllWithoutAsserting
local u666 = typeof(unstable_flushAllWithoutAsserting) == "function"

local function flushActWork() -- Line: 3868
    -- upvalues: unstable_flushAllWithoutAsserting (val), u659 (ref), describeError (val), u24 (val)
    local v1
    if unstable_flushAllWithoutAsserting ~= nil then
        v1 = u659
        u659 = true
        local success, result = xpcall(unstable_flushAllWithoutAsserting, describeError)
        u659 = v1
        if success then
            return result
        end
        error(result)
        return
    end
    v1 = u659
    u659 = true
    local success_2, result_2 = xpcall(function() -- Line: 3888 -- upvalues: u24 (upval)
        local v1 = false
        while u24.flushPassiveEffects() do
            v1 = true
        end
        return v1
    end, describeError)
    u659 = v1
    if success_2 then
        return result_2
    end
    error(result_2)
end

function flushWorkAndMicroTasks(a1) -- Line: 3907
    -- upvalues: flushActWork (val), describeError (val), enqueueTask (val), flushWorkAndMicroTasks (val)
    local success, result = xpcall(flushActWork, describeError)
    if success then
        local success_2, result_2 = xpcall(enqueueTask, describeError, function() -- Line: 3911 -- upvalues: flushActWork (upval), flushWorkAndMicroTasks (upval), a1 (val)
            if flushActWork() then
                flushWorkAndMicroTasks(a1)
                return
            end
            a1()
        end)
        success = success_2
        result = result_2
    end
    if not success then
        a1(result)
    end
end

function u24.act(a1) -- Line: 3925
    -- upvalues: __DEV__ (val), u491 (ref), console (val), u490 (ref), IsSomeRendererActing (val), u24 (val), u660 (ref)
    -- upvalues: describeError (val), promise (val), u666 (val), flushWorkAndMicroTasks (val), flushActWork (val)
    if not __DEV__ and not _G.__ROACT_17_MOCK_SCHEDULER__ and u491 == false then
        u491 = true
        console.error("act(...) is not supported in production builds of React, and might not behave as expected.")
    end
    local u10 = u490
    u490 = u490 + 1
    local current = IsSomeRendererActing.current
    local current_2 = u24.IsThisRendererActing.current
    local u18 = u660
    IsSomeRendererActing.current = true
    u24.IsThisRendererActing.current = true
    u660 = true

    local function onDone() -- Line: 3950
        -- upvalues: u490 (upval), IsSomeRendererActing (upval), current (val), u24 (upval), current_2 (val)
        -- upvalues: u660 (upval), u18 (val), __DEV__ (upval), u10 (val), console (upval)
        u490 = u490 - 1
        IsSomeRendererActing.current = current
        u24.IsThisRendererActing.current = current_2
        u660 = u18
        if __DEV__ and u10 < u490 then
            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
    end

    local success, result = xpcall(u24.batchedUpdates, describeError, a1)
    if not success then
        u490 = u490 - 1
        IsSomeRendererActing.current = current
        u24.IsThisRendererActing.current = current_2
        u660 = u18
        if __DEV__ and u10 < u490 then
            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
        error(result)
    end
    if result ~= nil and typeof(result) == "table" and typeof(result.andThen) == "function" then
        local u56 = false
        if __DEV__ and typeof(promise) ~= nil then
            (promise.resolve():andThen(function() end)):andThen(function() -- Line: 3983 -- upvalues: u56 (ref), console (upval)
                if u56 == false then
                    console.error("You called act(Promise.new(function() end)) without :await() or :expect(). This could lead to unexpected testing behaviour, interleaving multiple act calls and mixing their scopes. You should - act(function() Promise.new(function() end):await() end);")
                end
            end)
        end
        return {
            andThen = function(a1, a2, a3) -- Line: 4002
                -- upvalues: u56 (ref), result (val), u490 (upval), u666 (upval), current (val)
                -- upvalues: IsSomeRendererActing (upval), u24 (upval), current_2 (val), u660 (upval), u18 (val)
                -- upvalues: __DEV__ (upval), u10 (val), console (upval), flushWorkAndMicroTasks (upval)
                u56 = true
                return result:andThen(function() -- Line: 4004
                    -- upvalues: u490 (upval), u666 (upval), current (upval), IsSomeRendererActing (upval), u24 (upval)
                    -- upvalues: current_2 (upval), u660 (upval), u18 (upval), __DEV__ (upval), u10 (upval)
                    -- upvalues: console (upval), a2 (val), flushWorkAndMicroTasks (upval), a3 (val)
                    if u490 > 1 then
                        u490 = u490 - 1
                        IsSomeRendererActing.current = current
                        u24.IsThisRendererActing.current = current_2
                        u660 = u18
                        if __DEV__ and u10 < u490 then
                            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                        end
                        a2()
                        return
                    end
                    if u666 == true and current == true then
                        u490 = u490 - 1
                        IsSomeRendererActing.current = current
                        u24.IsThisRendererActing.current = current_2
                        u660 = u18
                        if __DEV__ and u10 < u490 then
                            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                        end
                        a2()
                        return
                    end
                    flushWorkAndMicroTasks(function(a1) -- Line: 4018
                        -- upvalues: u490 (upval), IsSomeRendererActing (upval), current (upval), u24 (upval)
                        -- upvalues: current_2 (upval), u660 (upval), u18 (upval), __DEV__ (upval), u10 (upval)
                        -- upvalues: console (upval), a3 (upval), a2 (upval)
                        u490 = u490 - 1
                        IsSomeRendererActing.current = current
                        u24.IsThisRendererActing.current = current_2
                        u660 = u18
                        if __DEV__ and u10 < u490 then
                            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                        end
                        if a1 then
                            a3(a1)
                            return
                        end
                        a2()
                    end)
                end, function(a1) -- Line: 4026
                    -- upvalues: u490 (upval), IsSomeRendererActing (upval), current (upval), u24 (upval)
                    -- upvalues: current_2 (upval), u660 (upval), u18 (upval), __DEV__ (upval), u10 (upval)
                    -- upvalues: console (upval), a3 (val)
                    u490 = u490 - 1
                    IsSomeRendererActing.current = current
                    u24.IsThisRendererActing.current = current_2
                    u660 = u18
                    if __DEV__ and u10 < u490 then
                        console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
                    end
                    a3(a1)
                end)
            end,
        }
    end
    if __DEV__ and result ~= nil then
        console.error("The callback passed to act(...) function must return nil, or a Promise. You returned %s", (tostring(result)))
    end
    local success_2, result_2 = xpcall(function() -- Line: 4045
        -- upvalues: u490 (upval), u666 (upval), current (val), flushActWork (upval), IsSomeRendererActing (upval)
        -- upvalues: u24 (upval), current_2 (val), u660 (upval), u18 (val), __DEV__ (upval), u10 (val), console (upval)
        if u490 == 1 then
            if u666 == false or current == false then
                flushActWork()
            end
        end
        u490 = u490 - 1
        IsSomeRendererActing.current = current
        u24.IsThisRendererActing.current = current_2
        u660 = u18
        if __DEV__ and u10 < u490 then
            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
    end, describeError)
    if not success_2 then
        u490 = u490 - 1
        IsSomeRendererActing.current = current
        u24.IsThisRendererActing.current = current_2
        u660 = u18
        if __DEV__ and u10 < u490 then
            console.error("You seem to have overlapping act() calls, this is not supported. Be sure to await previous act() calls before making a new one. ")
        end
        error(result_2)
    end
    return {
        andThen = function(a1, a2, a3) -- Line: 4065 -- upvalues: __DEV__ (upval), console (upval)
            if __DEV__ then
                console.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.")
            end
            a2()
        end,
    }
end

function u433.detachFiberAfterEffects(a1) -- Line: 4077 -- upvalues: __DEV__ (val)
    a1.child = nil
    a1.deletions = nil
    a1.dependencies = nil
    a1.memoizedProps = nil
    a1.memoizedState = nil
    a1.pendingProps = nil
    a1.sibling = nil
    a1.stateNode = nil
    a1.updateQueue = nil
    if __DEV__ then
        a1._debugOwner = nil
    end
end

return u24