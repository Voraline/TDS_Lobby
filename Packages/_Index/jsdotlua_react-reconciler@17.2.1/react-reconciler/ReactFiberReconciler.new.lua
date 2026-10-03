-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberReconciler.new
-- Decompile time: 15.21 ms

local __DEV__ = _G.__DEV__
require(script.Parent.Parent:WaitForChild("shared"))
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactRootTags = require(script.Parent:WaitForChild("ReactRootTags"))
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FundamentalComponent = ReactWorkTags.FundamentalComponent
require(script.Parent.Parent:WaitForChild("shared"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local ReactFiberTreeReflection = require(script.Parent:WaitForChild("ReactFiberTreeReflection"))
local findCurrentHostFiber = ReactFiberTreeReflection.findCurrentHostFiber
local findCurrentHostFiberWithNoPortals = ReactFiberTreeReflection.findCurrentHostFiberWithNoPortals
local get = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap.get
local HostComponent = ReactWorkTags.HostComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local enableSchedulingProfiler = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSchedulingProfiler
local ReactSharedInternals = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals
local getPublicInstance = require(script.Parent:WaitForChild("ReactFiberHostConfig")).getPublicInstance
local v2 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local findCurrentUnmaskedContext = v2.findCurrentUnmaskedContext
local processChildContext = v2.processChildContext
local emptyContextObject = v2.emptyContextObject
local isContextProvider = v2.isContextProvider
local createFiberRoot = require(script.Parent:WaitForChild("ReactFiberRoot.new")).createFiberRoot
local v3 = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new"))
local injectInternals = v3.injectInternals
local onScheduleRoot = v3.onScheduleRoot
local v4 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local requestEventTime = v4.requestEventTime
local requestUpdateLane = v4.requestUpdateLane
local scheduleUpdateOnFiber = v4.scheduleUpdateOnFiber
local flushRoot = v4.flushRoot
local batchedEventUpdates = v4.batchedEventUpdates
local batchedUpdates = v4.batchedUpdates
local unbatchedUpdates = v4.unbatchedUpdates
local flushSync = v4.flushSync
local flushControlled = v4.flushControlled
local deferredUpdates = v4.deferredUpdates
local discreteUpdates = v4.discreteUpdates
local flushDiscreteUpdates = v4.flushDiscreteUpdates
local flushPassiveEffects = v4.flushPassiveEffects
local warnIfNotScopedWithMatchingAct = v4.warnIfNotScopedWithMatchingAct
local warnIfUnmockedScheduler = v4.warnIfUnmockedScheduler
local IsThisRendererActing = v4.IsThisRendererActing
local act = v4.act
local v5 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local createUpdate = v5.createUpdate
local enqueueUpdate = v5.enqueueUpdate
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local isRendering = ReactCurrentFiber.isRendering
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local StrictMode = ReactTypeOfMode.StrictMode
local SyncLane = ReactFiberLane.SyncLane
local InputDiscreteHydrationLane = ReactFiberLane.InputDiscreteHydrationLane
local SelectiveHydrationLane = ReactFiberLane.SelectiveHydrationLane
local NoTimestamp = ReactFiberLane.NoTimestamp
local getHighestPriorityPendingLanes = ReactFiberLane.getHighestPriorityPendingLanes
local higherPriorityLane = ReactFiberLane.higherPriorityLane
local getCurrentUpdateLanePriority = ReactFiberLane.getCurrentUpdateLanePriority
local setCurrentUpdateLanePriority = ReactFiberLane.setCurrentUpdateLanePriority
local markRenderScheduled = require(script.Parent:WaitForChild("SchedulingProfiler")).markRenderScheduled
local v6 = {
    ReactRootTags = ReactRootTags,
    ReactWorkTags = ReactWorkTags,
    ReactTypeOfMode = ReactTypeOfMode,
    ReactFiberFlags = ReactFiberFlags,
    getNearestMountedFiber = ReactFiberTreeReflection.getNearestMountedFiber,
    findCurrentFiberUsingSlowPath = ReactFiberTreeReflection.findCurrentFiberUsingSlowPath,
    createPortal = require(script.Parent:WaitForChild("ReactPortal")).createPortal,
}
local u300 = nil
local u301 = nil
if __DEV__ then
    u300 = false
    u301 = {}
end

local function getContextForSubtree(a1) -- Line: 176
    -- upvalues: emptyContextObject (val), get (val), findCurrentUnmaskedContext (val), ClassComponent (val)
    -- upvalues: isContextProvider (val), processChildContext (val)
    if not a1 then
        return emptyContextObject
    end
    local v1 = get(a1)
    local v2 = findCurrentUnmaskedContext(v1)
    if v1.tag == ClassComponent then
        local type = v1.type
        if isContextProvider(type) then
            return processChildContext(v1, type, v2)
        end
    end
    return v2
end

local function findHostInstance(a1) -- Line: 194
    -- upvalues: get (val), invariant (val), Object (val), findCurrentHostFiber (val)
    local v1 = get(a1)
    if v1 == nil then
        if typeof(a1.render) ~= "function" then
            invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(Object.keys(a1)))
        else
            invariant(false, "Unable to find node on an unmounted component.")
        end
    end
    local v2 = findCurrentHostFiber(v1)
    if v2 == nil then
        return nil
    end
    return v2.stateNode
end

function v6.createContainer(a1, a2, a3, a4) -- Line: 288 -- upvalues: createFiberRoot (val) -- types: a3: boolean
    return createFiberRoot(a1, a2, a3, a4)
end

function v6.updateContainer(a1, a2, a3, a4) -- Line: 297
    -- upvalues: __DEV__ (val), onScheduleRoot (val), requestEventTime (val), warnIfUnmockedScheduler (val)
    -- upvalues: warnIfNotScopedWithMatchingAct (val), requestUpdateLane (val), enableSchedulingProfiler (val)
    -- upvalues: markRenderScheduled (val), emptyContextObject (val), get (val), findCurrentUnmaskedContext (val)
    -- upvalues: ClassComponent (val), isContextProvider (val), processChildContext (val), isRendering (val)
    -- upvalues: ReactCurrentFiber (val), u300 (ref), console (val), getComponentName (val), createUpdate (val)
    -- upvalues: Object (val), enqueueUpdate (val), scheduleUpdateOnFiber (val)
    local v1, v2
    if __DEV__ then
        onScheduleRoot(a2, a1)
    end
    local current = a2.current
    local v3 = requestEventTime()
    if __DEV__ and _G.__TESTEZ_RUNNING_TEST__ then
        warnIfUnmockedScheduler(current)
        warnIfNotScopedWithMatchingAct(current)
    end
    local v4 = requestUpdateLane(current)
    if enableSchedulingProfiler then
        markRenderScheduled(v4)
    end
    if a3 then
        v2 = get(a3)
        local v5 = findCurrentUnmaskedContext(v2)
        if v2.tag ~= ClassComponent then
            v1 = v5
        else
            local type = v2.type
            v1 = if not isContextProvider(type) then v5 else processChildContext(v2, type, v5)
        end
    else
        v1 = emptyContextObject
    end
    if a2.context ~= nil then
        a2.pendingContext = v1
    else
        a2.context = v1
    end
    if __DEV__ and isRendering and ReactCurrentFiber.current ~= nil and not u300 then
        u300 = true
        console.error(
            "Render methods should be a pure function of props and state; triggering nested component updates from render is not allowed. If necessary, trigger nested updates in componentDidUpdate.\n\nCheck the render method of %s.",
            getComponentName(ReactCurrentFiber.current.type) or "Unknown"
        )
    end
    v2 = createUpdate(v3, v4)
    local None = if a1 ~= nil then a1 else Object.None
    v2.payload = {element = None}
    if a4 ~= nil then
        if __DEV__ and typeof(a4) ~= "function" then
            console.error(
                "render(...): Expected the last optional `callback` argument to be a function. Instead received: %s.",
                (tostring(a4))
            )
        end
        v2.callback = a4
    end
    enqueueUpdate(current, v2)
    scheduleUpdateOnFiber(current, v4, v3)
    return v4
end

v6.batchedEventUpdates = batchedEventUpdates
v6.batchedUpdates = batchedUpdates
v6.unbatchedUpdates = unbatchedUpdates
v6.deferredUpdates = deferredUpdates
v6.discreteUpdates = discreteUpdates
v6.flushDiscreteUpdates = flushDiscreteUpdates
v6.flushControlled = flushControlled
v6.flushSync = flushSync
v6.flushPassiveEffects = flushPassiveEffects
v6.IsThisRendererActing = IsThisRendererActing
v6.act = act

function v6.getPublicRootInstance(a1) -- Line: 393 -- upvalues: HostComponent (val), getPublicInstance (val)
    local current = a1.current
    if not current.child then
        return nil
    end
    if current.child.tag == HostComponent then
        return getPublicInstance(current.child.stateNode)
    end
    return current.child.stateNode
end

local u353 = nil

function v6.attemptSynchronousHydration(a1) -- Line: 408
    -- upvalues: HostRoot (val), getHighestPriorityPendingLanes (val), flushRoot (val), SuspenseComponent (val)
    -- upvalues: requestEventTime (val), flushSync (val), scheduleUpdateOnFiber (val), SyncLane (val)
    -- upvalues: InputDiscreteHydrationLane (val), u353 (ref)
    if a1.tag == HostRoot then
        local stateNode = a1.stateNode
        if not stateNode.hydrate then
            return
        end
        flushRoot(stateNode, (getHighestPriorityPendingLanes(stateNode)))
        return
    end
    if a1.tag == SuspenseComponent then
        local u15 = requestEventTime()
        flushSync(function() -- Line: 418 -- upvalues: scheduleUpdateOnFiber (upval), a1 (val), SyncLane (upval), u15 (val)
            return scheduleUpdateOnFiber(a1, SyncLane, u15)
        end)
        u353(a1, InputDiscreteHydrationLane)
    end
end

local function markRetryLaneImpl(a1, a2) -- Line: 429 -- upvalues: higherPriorityLane (val)
    local memoizedState = a1.memoizedState
    if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
        memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, a2)
    end
end

function u353(a1, a2) -- Line: 440 -- upvalues: higherPriorityLane (val)
    local memoizedState = a1.memoizedState
    if memoizedState and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
        memoizedState.retryLane = higherPriorityLane(memoizedState.retryLane, a2)
    end
    local alternate = a1.alternate
    if alternate then
        local memoizedState_2 = alternate.memoizedState
        if memoizedState_2 and memoizedState_2 ~= nil and memoizedState_2.dehydrated ~= nil then
            memoizedState_2.retryLane = higherPriorityLane(memoizedState_2.retryLane, a2)
        end
    end
end

function v6.attemptUserBlockingHydration(a1) -- Line: 449
    -- upvalues: SuspenseComponent (val), requestEventTime (val), InputDiscreteHydrationLane (val)
    -- upvalues: scheduleUpdateOnFiber (val), u353 (ref)
    if a1.tag ~= SuspenseComponent then
        return
    end
    local v1 = InputDiscreteHydrationLane
    scheduleUpdateOnFiber(a1, v1, (requestEventTime()))
    u353(a1, v1)
end

function v6.attemptContinuousHydration(a1) -- Line: 463
    -- upvalues: SuspenseComponent (val), requestEventTime (val), SelectiveHydrationLane (val)
    -- upvalues: scheduleUpdateOnFiber (val), u353 (ref)
    if a1.tag ~= SuspenseComponent then
        return
    end
    local v1 = SelectiveHydrationLane
    scheduleUpdateOnFiber(a1, v1, (requestEventTime()))
    u353(a1, v1)
end

function v6.attemptHydrationAtCurrentPriority(a1) -- Line: 477
    -- upvalues: SuspenseComponent (val), requestEventTime (val), requestUpdateLane (val), scheduleUpdateOnFiber (val)
    -- upvalues: u353 (ref)
    if a1.tag ~= SuspenseComponent then
        return
    end
    local v1 = requestEventTime()
    local v2 = requestUpdateLane(a1)
    scheduleUpdateOnFiber(a1, v2, v1)
    u353(a1, v2)
end

function v6.runWithPriority(a1, a2) -- Line: 489
    -- upvalues: getCurrentUpdateLanePriority (val), setCurrentUpdateLanePriority (val), describeError (val)
    local v1 = getCurrentUpdateLanePriority()
    setCurrentUpdateLanePriority(a1)
    local success, result = xpcall(a2, describeError)
    setCurrentUpdateLanePriority(v1)
    if not success then
        error(result)
    end
    return result
end

v6.getCurrentUpdateLanePriority = getCurrentUpdateLanePriority
v6.findHostInstance = findHostInstance

function v6.findHostInstanceWithWarning(a1, a2) -- Line: 215
    -- upvalues: __DEV__ (val), get (val), invariant (val), Object (val), findCurrentHostFiber (val), StrictMode (val)
    -- upvalues: getComponentName (val), u301 (ref), ReactCurrentFiber (val), setCurrentFiber (val), console (val)
    -- upvalues: describeError (val), resetCurrentFiber (val), findHostInstance (val)
    if not __DEV__ then
        return (findHostInstance(a1))
    end
    local u5 = get(a1)
    if u5 == nil then
        if typeof(a1.render) ~= "function" then
            invariant(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(Object.keys(a1)))
        else
            invariant(false, "Unable to find node on an unmounted component.")
        end
    end
    local u26 = findCurrentHostFiber(u5)
    if u26 == nil then
        return nil
    end
    if bit32.band(u26.mode, StrictMode) ~= 0 then
        local u35 = getComponentName(u5.type) or "Component"
        if not u301[u35] then
            u301[u35] = true
            local current = ReactCurrentFiber.current
            local success, result = xpcall(function() -- Line: 243
                -- upvalues: setCurrentFiber (upval), u26 (val), u5 (val), StrictMode (upval), console (upval), a2 (val)
                -- upvalues: u35 (val)
                setCurrentFiber(u26)
                if bit32.band(u5.mode, StrictMode) ~= 0 then
                    console.error(
                        "%s is deprecated in StrictMode. %s was passed an instance of %s which is inside StrictMode. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node",
                        a2,
                        a2,
                        u35
                    )
                    return
                end
                console.error(
                    "%s is deprecated in StrictMode. %s was passed an instance of %s which renders StrictMode children. Instead, add a ref directly to the element you want to reference. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-find-node",
                    a2,
                    a2,
                    u35
                )
            end, describeError)
            if not current then
                resetCurrentFiber()
            else
                setCurrentFiber(current)
            end
            if not success then
                error(result)
            end
        end
    end
    return u26.stateNode
end

function v6.findHostInstanceWithNoPortals(a1) -- Line: 507
    -- upvalues: findCurrentHostFiberWithNoPortals (val), FundamentalComponent (val)
    local v1 = findCurrentHostFiberWithNoPortals(a1)
    if v1 == nil then
        return nil
    end
    if v1.tag == FundamentalComponent then
        return v1.stateNode.instance
    end
    return v1.stateNode
end

local function shouldSuspendImpl(a1) -- Line: 518
    return false
end

function v6.shouldSuspend(a1) -- Line: 522 -- upvalues: shouldSuspendImpl (ref)
    return shouldSuspendImpl(a1)
end

local u392 = nil
local u394 = nil
local u395 = nil
local u396 = nil
local u397 = nil
local u398 = nil
local u399 = nil
local u400 = nil
if __DEV__ then
    local copyWithDeleteImpl, copyWithRenameImpl, copyWithSetImpl

    function copyWithDeleteImpl(a1, a2, a3) -- Line: 537
        -- upvalues: Array (val), copyWithDeleteImpl (val)
        local v1 = a2[a3]
        local v2 = if not Array.isArray(a1) then table.clone(a1) else Array.slice(a1)
        if a3 + 1 ~= #a2 then
            v2[v1] = (copyWithDeleteImpl(a1[v1], a2, a3 + 1))
            return v2
        end
        if Array.isArray(v2) then
            Array.splice(v2, v1, 1)
            return v2
        end
        v2[v1] = nil
        return v2
    end

    local function copyWithDelete(a1, a2) -- Line: 565
        -- upvalues: copyWithDeleteImpl (val)
        return (copyWithDeleteImpl(a1, a2, 0))
    end

    function copyWithRenameImpl(a1, a2, a3, a4) -- Line: 573
        -- upvalues: Array (val), copyWithRenameImpl (val)
        local v1 = a2[a4]
        local v2 = if not Array.isArray(a1) then table.clone(a1) else Array.slice(a1)
        if a4 + 1 ~= #a2 then
            v2[v1] = (copyWithRenameImpl(a1[v1], a2, a3, a4 + 1))
            return v2
        end
        v2[a3[a4]] = v2[v1]
        if Array.isArray(v2) then
            Array.splice(v2, v1, 1)
            return v2
        end
        v2[v1] = nil
        return v2
    end

    local function copyWithRename(a1, a2, a3) -- Line: 609
        -- upvalues: console (val), copyWithRenameImpl (val)
        if #a2 ~= #a3 then
            console.warn("copyWithRename() expects paths of the same length")
            return nil
        end
        local v1 = #a3
        for i = 1, v1 do
            if a2[i] ~= a3[i] then
                console.warn("copyWithRename() expects paths to be the same except for the deepest key")
                return nil
            end
        end
        return (copyWithRenameImpl(a1, a2, a3, 0))
    end

    function copyWithSetImpl(a1, a2, a3, a4) -- Line: 631
        -- upvalues: Array (val), copyWithSetImpl (val)
        if #a2 + 1 <= a3 then
            return a4
        end
        local v1 = a2[a3]
        local v2 = if not Array.isArray(a1) then table.clone(a1) else Array.slice(a1)
        v2[v1] = (copyWithSetImpl(a1[v1], a2, a3 + 2, a4))
        return v2
    end

    local function copyWithSet(a1, a2, a3) -- Line: 653
        -- upvalues: copyWithSetImpl (val)
        return (copyWithSetImpl(a1, a2, 1, a3))
    end

    local function findHook(a1, a2) -- Line: 661 -- types: a2: number
        local memoizedState = a1.memoizedState
        local v1 = a2
        while memoizedState ~= nil do
            if not (v1 > 1) then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        return memoizedState
    end

    function u392(a1, a2, a3, a4) -- Line: 674
        -- upvalues: copyWithSetImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        local v1 = a2
        local memoizedState = a1.memoizedState
        while memoizedState ~= nil do
            if not (v1 > 1) then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        if memoizedState ~= nil then
            v1 = copyWithSetImpl(memoizedState.memoizedState, a3, 1, a4)
            memoizedState.memoizedState = v1
            memoizedState.baseState = v1
            a1.memoizedProps = table.clone(a1.memoizedProps)
            scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
        end
    end

    function u394(a1, a2, a3) -- Line: 692
        -- upvalues: copyWithDeleteImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        local v1 = a2
        local memoizedState = a1.memoizedState
        while memoizedState ~= nil do
            if not (v1 > 1) then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        if memoizedState ~= nil then
            v1 = copyWithDeleteImpl(memoizedState.memoizedState, a3, 0)
            memoizedState.memoizedState = v1
            memoizedState.baseState = v1
            a1.memoizedProps = table.clone(a1.memoizedProps)
            scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
        end
    end

    function u395(a1, a2, a3, a4) -- Line: 709
        -- upvalues: copyWithRename (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        local v1 = a2
        local memoizedState = a1.memoizedState
        while memoizedState ~= nil do
            if not (v1 > 1) then
                break
            end
            memoizedState = memoizedState.next
            v1 = v1 - 1
        end
        if memoizedState ~= nil then
            v1 = copyWithRename(memoizedState.memoizedState, a3, a4)
            memoizedState.memoizedState = v1
            memoizedState.baseState = v1
            a1.memoizedProps = table.clone(a1.memoizedProps)
            scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
        end
    end

    function u396(a1, a2, a3) -- Line: 733
        -- upvalues: copyWithSetImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        a1.pendingProps = copyWithSetImpl(a1.memoizedProps, a2, 1, a3)
        local alternate = a1.alternate
        if alternate then
            alternate.pendingProps = a1.pendingProps
        end
        scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
    end

    function u397(a1, a2) -- Line: 742
        -- upvalues: copyWithDeleteImpl (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        a1.pendingProps = copyWithDeleteImpl(a1.memoizedProps, a2, 0)
        local alternate = a1.alternate
        if alternate then
            alternate.pendingProps = a1.pendingProps
        end
        scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
    end

    function u398(a1, a2, a3) -- Line: 751
        -- upvalues: copyWithRename (val), scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        a1.pendingProps = copyWithRename(a1.memoizedProps, a2, a3)
        local alternate = a1.alternate
        if alternate then
            alternate.pendingProps = a1.pendingProps
        end
        scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
    end

    function u399(a1) -- Line: 765 -- upvalues: scheduleUpdateOnFiber (val), SyncLane (val), NoTimestamp (val)
        scheduleUpdateOnFiber(a1, SyncLane, NoTimestamp)
    end

    function u400(a1) -- Line: 769 -- upvalues: shouldSuspendImpl (ref) -- types: a1: function
        shouldSuspendImpl = a1
    end
end

function findHostInstanceByFiber(a1) -- Line: 774 -- upvalues: findCurrentHostFiber (val)
    local v1 = findCurrentHostFiber(a1)
    if v1 == nil then
        return nil
    end
    return v1.stateNode
end

function emptyFindFiberByHostInstance(a1) -- Line: 782
    return nil
end

function getCurrentFiberForDevTools() -- Line: 786 -- upvalues: ReactCurrentFiber (val)
    return ReactCurrentFiber.current
end

function v6.injectIntoDevTools(a1) -- Line: 790
    -- upvalues: ReactSharedInternals (val), __DEV__ (val), injectInternals (val), u392 (ref), u394 (ref), u395 (ref)
    -- upvalues: u396 (ref), u397 (ref), u398 (ref), u400 (ref), u399 (ref)
    local findFiberByHostInstance = a1.findFiberByHostInstance
    local ReactCurrentDispatcher = ReactSharedInternals.ReactCurrentDispatcher
    local v1 = nil
    if __DEV__ then
        v1 = getCurrentFiberForDevTools
    end
    return injectInternals({
        bundleType = a1.bundleType,
        version = a1.version,
        rendererPackageName = a1.rendererPackageName,
        rendererConfig = a1.rendererConfig,
        overrideHookState = u392,
        overrideHookStateDeletePath = u394,
        overrideHookStateRenamePath = u395,
        overrideProps = u396,
        overridePropsDeletePath = u397,
        overridePropsRenamePath = u398,
        setSuspenseHandler = u400,
        scheduleUpdate = u399,
        currentDispatcherRef = ReactCurrentDispatcher,
        findHostInstanceByFiber = findHostInstanceByFiber,
        findFiberByHostInstance = findFiberByHostInstance or emptyFindFiberByHostInstance,
        getCurrentFiber = v1,
    })
end

v6.robloxReactProfiling = require(script.Parent.RobloxReactProfiling)
return v6