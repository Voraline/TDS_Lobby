-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberBeginWork.new
-- Decompile time: 106.62 ms

local function unimplemented(a1) -- Line: 14 -- types: a1: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(a1))
    error("FIXME (roblox): " .. a1 .. " is unimplemented", 2)
end

local __DEV__ = _G.__DEV__
local __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local __COMPAT_WARNINGS__ = _G.__COMPAT_WARNINGS__
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local inspect = v1.util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("react"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v2 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local checkPropTypes = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FunctionComponent = ReactWorkTags.FunctionComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local ForwardRef = ReactWorkTags.ForwardRef
local Fragment = ReactWorkTags.Fragment
local Mode = ReactWorkTags.Mode
local ContextProvider = ReactWorkTags.ContextProvider
local ContextConsumer = ReactWorkTags.ContextConsumer
local Profiler = ReactWorkTags.Profiler
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local LazyComponent = ReactWorkTags.LazyComponent
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
local v3 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = v3.NoFlags
local StaticMask = v3.StaticMask
local PerformedWork = v3.PerformedWork
local Placement = v3.Placement
local Hydrating = v3.Hydrating
local ContentReset = v3.ContentReset
local DidCapture = v3.DidCapture
local Ref = v3.Ref
local Deletion = v3.Deletion
local ForceUpdateForLegacySuspense = v3.ForceUpdateForLegacySuspense
local v4 = (require((script.Parent.Parent:WaitForChild("shared")))).ReactSharedInternals
local v5 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local debugRenderPhaseSideEffectsForStrictMode = v5.debugRenderPhaseSideEffectsForStrictMode
local disableLegacyContext = v5.disableLegacyContext
local disableModulePatternComponents = v5.disableModulePatternComponents
local enableProfilerTimer = v5.enableProfilerTimer
local enableSchedulerTracing = v5.enableSchedulerTracing
local enableSuspenseServerRenderer = v5.enableSuspenseServerRenderer
local warnAboutDefaultPropsOnFunctionComponents = v5.warnAboutDefaultPropsOnFunctionComponents
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local shallowEqual = require(script.Parent.Parent:WaitForChild("shared")).shallowEqual
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v6 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_LAZY_TYPE = v6.REACT_LAZY_TYPE
local v7 = v6.getIteratorFn
local u230 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local v8 = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local getCurrentFiberOwnerNameInDevOrNull = v8.getCurrentFiberOwnerNameInDevOrNull
local setIsRendering = v8.setIsRendering
local v9 = require(script.Parent:WaitForChild("ReactFiberHotReloading.new"))
local resolveFunctionForHotReloading = v9.resolveFunctionForHotReloading
local resolveForwardRefForHotReloading = v9.resolveForwardRefForHotReloading
local resolveClassForHotReloading = v9.resolveClassForHotReloading
local v10 = require(script.Parent:WaitForChild("ReactChildFiber.new"))
local mountChildFibers = v10.mountChildFibers
local reconcileChildFibers = v10.reconcileChildFibers
local cloneChildFibers = v10.cloneChildFibers
local v11 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local processUpdateQueue = v11.processUpdateQueue
local cloneUpdateQueue = v11.cloneUpdateQueue
local initializeUpdateQueue = v11.initializeUpdateQueue
local v12 = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ConcurrentMode = v12.ConcurrentMode
local NoMode = v12.NoMode
local ProfileMode = v12.ProfileMode
local StrictMode = v12.StrictMode
local BlockingMode = v12.BlockingMode
local v13 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local shouldSetTextContent = v13.shouldSetTextContent
local isSuspenseInstancePending = v13.isSuspenseInstancePending
local isSuspenseInstanceFallback = v13.isSuspenseInstanceFallback
local registerSuspenseInstanceRetry = v13.registerSuspenseInstanceRetry
local supportsHydration = v13.supportsHydration
local v14 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local pushHostContext = v14.pushHostContext
local pushHostContainer = v14.pushHostContainer
local suspenseStackCursor = v2.suspenseStackCursor
local hasSuspenseContext = v2.hasSuspenseContext
local ForceSuspenseFallback = v2.ForceSuspenseFallback
local addSubtreeSuspenseContext = v2.addSubtreeSuspenseContext
local InvisibleParentSuspenseContext = v2.InvisibleParentSuspenseContext
local pushSuspenseContext = v2.pushSuspenseContext
local setDefaultShallowSuspenseContext = v2.setDefaultShallowSuspenseContext
local v15 = require(script.Parent:WaitForChild("ReactFiberNewContext.new"))
local propagateContextChange = v15.propagateContextChange
local readContext = v15.readContext
local calculateChangedBits = v15.calculateChangedBits
local prepareToReadContext = v15.prepareToReadContext
local pushProvider = v15.pushProvider
local u330 = {}

local function shouldSuspend(a1) -- Line: 185 -- upvalues: u330 (val)
    if not u330.shouldSuspendRef then
        u330.shouldSuspendRef = require(script.Parent:WaitForChild("ReactFiberReconciler")).shouldSuspend
    end
    return u330.shouldSuspendRef(a1)
end

local function initReactFiberHooks() -- Line: 193 -- upvalues: u330 (val)
    local v1 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
    u330.renderWithHooksRef = v1.renderWithHooks
    u330.bailoutHooksRef = v1.bailoutHooks
end

local function renderWithHooks(...) -- Line: 200 -- upvalues: u330 (val)
    if not u330.renderWithHooksRef then
        local v1 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u330.renderWithHooksRef = v1.renderWithHooks
        u330.bailoutHooksRef = v1.bailoutHooks
    end
    return u330.renderWithHooksRef(...)
end

local function bailoutHooks(...) -- Line: 208 -- upvalues: u330 (val)
    if not u330.bailoutHooksRef then
        local v1 = require(script.Parent:WaitForChild("ReactFiberHooks.new"))
        u330.renderWithHooksRef = v1.renderWithHooks
        u330.bailoutHooksRef = v1.bailoutHooks
    end
    return u330.bailoutHooksRef(...)
end

local stopProfilerTimerIfRunning = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).stopProfilerTimerIfRunning
local v16 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local getMaskedContext = v16.getMaskedContext
local getUnmaskedContext = v16.getUnmaskedContext
local hasContextChanged = v16.hasContextChanged
local pushContextProvider = v16.pushContextProvider
local isContextProvider = v16.isContextProvider
local pushTopLevelContextObject = v16.pushTopLevelContextObject
local invalidateContextProvider = v16.invalidateContextProvider
local v17 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new"))
local resetHydrationState = v17.resetHydrationState
local enterHydrationState = v17.enterHydrationState
local reenterHydrationStateFromDehydratedSuspenseInstance = v17.reenterHydrationStateFromDehydratedSuspenseInstance
local tryToClaimNextHydratableInstance = v17.tryToClaimNextHydratableInstance
local warnIfHydrating = v17.warnIfHydrating
local v18 = require(script.Parent:WaitForChild("ReactFiberClassComponent.new"))
local adoptClassInstance = v18.adoptClassInstance
local applyDerivedStateFromProps = v18.applyDerivedStateFromProps
local constructClassInstance = v18.constructClassInstance
local mountClassInstance = v18.mountClassInstance
local resumeMountClassInstance = v18.resumeMountClassInstance
local updateClassInstance = v18.updateClassInstance
local resolveDefaultProps = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v19 = require(script.Parent:WaitForChild("ReactFiber.new"))
local resolveLazyComponentTag = v19.resolveLazyComponentTag
local createFiberFromFragment = v19.createFiberFromFragment
local createFiberFromOffscreen = v19.createFiberFromOffscreen
local createFiberFromTypeAndProps = v19.createFiberFromTypeAndProps
local isSimpleFunctionComponent = v19.isSimpleFunctionComponent
local createWorkInProgress = v19.createWorkInProgress
local v20 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local pushRenderLanes = v20.pushRenderLanes
local markSpawnedWork = v20.markSpawnedWork
local retryDehydratedSuspenseBoundary = v20.retryDehydratedSuspenseBoundary
local scheduleUpdateOnFiber = v20.scheduleUpdateOnFiber
local renderDidSuspendDelayIfPossible = v20.renderDidSuspendDelayIfPossible
local getWorkInProgressRoot = v20.getWorkInProgressRoot
local getExecutionContext = v20.getExecutionContext
local RetryAfterError = v20.RetryAfterError
local NoContext = v20.NoContext
local u426 = nil
local setWorkInProgressVersion = require(script.Parent:WaitForChild("ReactMutableSource.new")).setWorkInProgressVersion
local markSkippedUpdateLanes = require(script.Parent:WaitForChild("ReactFiberWorkInProgress")).markSkippedUpdateLanes
local v21 = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local disableLogs = v21.disableLogs
local reenableLogs = v21.reenableLogs
local ReactCurrentOwner = v4.ReactCurrentOwner
local u458 = {}
local bailoutOnAlreadyFinishedWork = nil
local updateFunctionComponent = nil
local u461 = false
local u462 = {
    didWarnAboutBadClass = {},
    didWarnAboutModulePatternComponent = {},
    didWarnAboutContextTypeOnFunctionComponent = {},
    didWarnAboutGetDerivedStateOnFunctionComponent = {},
    didWarnAboutFunctionRefs = {},
    didWarnAboutDefaultPropsOnFunctionComponent = {},
}
local updateSimpleMemoComponent = nil
if __DEV__ then
    u462.didWarnAboutBadClass = {}
    u462.didWarnAboutModulePatternComponent = {}
    u462.didWarnAboutContextTypeOnFunctionComponent = {}
    u462.didWarnAboutGetDerivedStateOnFunctionComponent = {}
    u462.didWarnAboutFunctionRefs = {}
    u458.didWarnAboutReassigningProps = false
    u462.didWarnAboutDefaultPropsOnFunctionComponent = {}
end

local function v22(a1, a2, a3, a4) -- Line: 307 -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    if a1 == nil then
        a2.child = mountChildFibers(a2, nil, a3, a4)
        return
    end
    a2.child = reconcileChildFibers(a2, a1.child, a3, a4)
end

local function forceUnmountCurrentAndReconcile(a1, a2, a3, a4) -- Line: 336 -- upvalues: reconcileChildFibers (val)
    a2.child = reconcileChildFibers(a2, a1.child, nil, a4)
    a2.child = reconcileChildFibers(a2, nil, a3, a4)
end

local function updateForwardRef(a1, a2, a3, a4, a5) -- Line: 360
    -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val)
    -- upvalues: getComponentName (val), prepareToReadContext (val), u458 (val), ReactCurrentOwner (val)
    -- upvalues: setIsRendering (val), renderWithHooks (val), debugRenderPhaseSideEffectsForStrictMode (val)
    -- upvalues: StrictMode (val), disableLogs (val), describeError (val), reenableLogs (val), u461 (ref)
    -- upvalues: bailoutHooks (val), bailoutOnAlreadyFinishedWork (ref), PerformedWork (val), mountChildFibers (val)
    -- upvalues: reconcileChildFibers (val)
    local propTypes, v1, validateProps
    if __DEV__ then
        if a2.type ~= a2.elementType then
            propTypes = a3.propTypes
            validateProps = a3.validateProps
            if propTypes or validateProps then
                checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(a3))
            end
        end
    elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ and a2.type ~= a2.elementType then
        propTypes = a3.propTypes
        validateProps = a3.validateProps
        if propTypes or validateProps then
            checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(a3))
        end
    end
    local render = a3.render
    local ref = a2.ref
    prepareToReadContext(a2, a5, u458.markWorkInProgressReceivedUpdate)
    if not __DEV__ then
        v1 = renderWithHooks(a1, a2, render, a4, ref, a5)
    else
        ReactCurrentOwner.current = a2
        setIsRendering(true)
        v1 = renderWithHooks(a1, a2, render, a4, ref, a5)
        if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a2.mode, StrictMode) ~= 0 then
            disableLogs()
            local success, result = xpcall(renderWithHooks, describeError, a1, a2, render, a4, ref, a5)
            if success then
                v1 = result
            end
            reenableLogs()
            if not success then
                error(result)
            end
        end
        setIsRendering(false)
    end
    if a1 ~= nil and not u461 then
        bailoutHooks(a1, a2, a5)
        return bailoutOnAlreadyFinishedWork(a1, a2, a5)
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, v1, a5)
    else
        a2.child = mountChildFibers(a2, nil, v1, a5)
    end
    return a2.child
end

local function updateMemoComponent(a1, a2, a3, a4, a5, a6) -- Line: 447
    -- upvalues: isSimpleFunctionComponent (val), __DEV__ (val), resolveFunctionForHotReloading (val)
    -- upvalues: SimpleMemoComponent (val), updateSimpleMemoComponent (ref)
    -- upvalues: __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val)
    -- upvalues: createFiberFromTypeAndProps (val), ReactFiberLane (val), shallowEqual (val)
    -- upvalues: bailoutOnAlreadyFinishedWork (ref), PerformedWork (val), createWorkInProgress (val)
    local v1
    if a1 == nil then
        local type_2 = a3.type
        if isSimpleFunctionComponent(type_2) and a3.compare == nil and a3.defaultProps == nil then
            v1 = type_2
            if __DEV__ then
                v1 = resolveFunctionForHotReloading(type_2)
            end
            a2.tag = SimpleMemoComponent
            a2.type = v1
            if __DEV__ then
                validateFunctionComponentInDev(a2, type_2)
            end
            return updateSimpleMemoComponent(a1, a2, v1, a4, a5, a6)
        end
        if __DEV__ or __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            local propTypes = nil
            local validateProps = nil
            if type(type_2) == "table" then
                propTypes = type_2.propTypes
                validateProps = type_2.validateProps
            end
            if propTypes or validateProps then
                checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(type_2))
            end
        end
        v1 = createFiberFromTypeAndProps(a3.type, nil, a4, a2, a2.mode, a6)
        v1.ref = a2.ref
        v1.return_ = a2
        a2.child = v1
        return v1
    end
    if __DEV__ or __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        local type_3 = a3.type
        local propTypes_2 = nil
        local validateProps_2 = nil
        if type(type_3) == "table" then
            propTypes_2 = type_3.propTypes
            validateProps_2 = type_3.validateProps
        end
        if propTypes_2 or validateProps_2 then
            checkPropTypes(propTypes_2, validateProps_2, a4, "prop", getComponentName(type_3))
        end
    end
    local child = a1.child
    if not ReactFiberLane.includesSomeLane(a5, a6) then
        local memoizedProps = child.memoizedProps
        local compare = a3.compare
        if compare == nil then
            compare = shallowEqual
        end
        if compare(memoizedProps, a4) and a1.ref == a2.ref then
            return bailoutOnAlreadyFinishedWork(a1, a2, a6)
        end
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    v1 = createWorkInProgress(child, a4)
    v1.ref = a2.ref
    v1.return_ = a2
    a2.child = v1
    return v1
end

function updateSimpleMemoComponent(a1, a2, a3, a4, a5, a6) -- Line: 568
    -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), REACT_LAZY_TYPE (val)
    -- upvalues: describeError (val), checkPropTypes (val), getComponentName (val), shallowEqual (val), u461 (ref)
    -- upvalues: ReactFiberLane (val), bailoutOnAlreadyFinishedWork (ref), ForceUpdateForLegacySuspense (val)
    -- upvalues: NoFlags (val), updateFunctionComponent (ref)
    local elementType, propTypes, result, success, v1, v2, validateProps
    if __DEV__ then
        if a2.type ~= a2.elementType then
            elementType = a2.elementType
            if elementType["$$typeof"] == REACT_LAZY_TYPE then
                v2 = elementType
                success, result = xpcall(v2._init, describeError, v2._payload)
                v1 = if not success then nil else result
                propTypes = nil
                validateProps = nil
                if v1 ~= nil and type(v1) == "table" then
                    propTypes = v1.propTypes
                    validateProps = v1.validateProps
                end
                if propTypes or validateProps then
                    checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(v1))
                end
            end
        end
    elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ and a2.type ~= a2.elementType then
        elementType = a2.elementType
        if elementType["$$typeof"] == REACT_LAZY_TYPE then
            v2 = elementType
            success, result = xpcall(v2._init, describeError, v2._payload)
            v1 = if not success then nil else result
            propTypes = nil
            validateProps = nil
            if v1 ~= nil and type(v1) == "table" then
                propTypes = v1.propTypes
                validateProps = v1.validateProps
            end
            if propTypes or validateProps then
                checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(v1))
            end
        end
    end
    if a1 ~= nil then
        local memoizedProps = a1.memoizedProps
        v2 = true
        if __DEV__ then
            v2 = a2.type == a1.type
        end
        if shallowEqual(memoizedProps, a4) and a1.ref == a2.ref and v2 then
            u461 = false
            if not ReactFiberLane.includesSomeLane(a6, a5) then
                a2.lanes = a1.lanes
                return bailoutOnAlreadyFinishedWork(a1, a2, a6)
            end
            if (bit32.band(a1.flags, ForceUpdateForLegacySuspense)) ~= NoFlags then
                u461 = true
            end
        end
    end
    return updateFunctionComponent(a1, a2, a3, a4, a6)
end

local function updateOffscreenComponent(a1, a2, a3) -- Line: 670
    -- upvalues: ConcurrentMode (val), NoMode (val), ReactFiberLane (val), pushRenderLanes (val)
    -- upvalues: enableSchedulerTracing (val), markSpawnedWork (val), mountChildFibers (val), reconcileChildFibers (val)
    local v1
    local pendingProps = a2.pendingProps
    local children = pendingProps.children
    local memoizedState = nil
    if a1 ~= nil then
        memoizedState = a1.memoizedState
    end
    if pendingProps.mode ~= "hidden" and pendingProps.mode ~= "unstable-defer-without-hiding" then
        if memoizedState == nil then
            v1 = a3
        else
            v1 = ReactFiberLane.mergeLanes(memoizedState.baseLanes, a3)
            a2.memoizedState = nil
        end
        pushRenderLanes(a2, v1)
        if a1 ~= nil then
            a2.child = reconcileChildFibers(a2, a1.child, children, a3)
        else
            a2.child = mountChildFibers(a2, nil, children, a3)
        end
        return a2.child
    end
    if (bit32.band(a2.mode, ConcurrentMode)) == NoMode then
        a2.memoizedState = {baseLanes = ReactFiberLane.NoLanes}
        pushRenderLanes(a2, a3)
        if a1 ~= nil then
            a2.child = reconcileChildFibers(a2, a1.child, children, a3)
        else
            a2.child = mountChildFibers(a2, nil, children, a3)
        end
        return a2.child
    end
    if ReactFiberLane.includesSomeLane(a3, ReactFiberLane.OffscreenLane) then
        a2.memoizedState = {baseLanes = ReactFiberLane.NoLanes}
        local baseLanes_2 = a3
        if memoizedState ~= nil then
            baseLanes_2 = memoizedState.baseLanes
        end
        pushRenderLanes(a2, baseLanes_2)
        if a1 ~= nil then
            a2.child = reconcileChildFibers(a2, a1.child, children, a3)
        else
            a2.child = mountChildFibers(a2, nil, children, a3)
        end
        return a2.child
    end
    v1 = if memoizedState == nil then a3 else ReactFiberLane.mergeLanes(memoizedState.baseLanes, a3)
    if enableSchedulerTracing then
        markSpawnedWork(ReactFiberLane.OffscreenLane)
    end
    a2.childLanes = ReactFiberLane.laneToLanes(ReactFiberLane.OffscreenLane)
    a2.lanes = a2.childLanes
    a2.memoizedState = {baseLanes = v1}
    pushRenderLanes(a2, v1)
    return nil
end

function updateFragment(a1, a2, a3) -- Line: 772 -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    local pendingProps = a2.pendingProps
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, pendingProps, a3)
    else
        a2.child = mountChildFibers(a2, nil, pendingProps, a3)
    end
    return a2.child
end

function updateMode(a1, a2, a3) -- Line: 778 -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    local children = a2.pendingProps.children
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, children, a3)
    else
        a2.child = mountChildFibers(a2, nil, children, a3)
    end
    return a2.child
end

function updateProfiler(a1, a2, a3) -- Line: 784
    -- upvalues: enableProfilerTimer (val), mountChildFibers (val), reconcileChildFibers (val)
    if enableProfilerTimer then
        local stateNode = a2.stateNode
        stateNode.effectDuration = 0
        stateNode.passiveEffectDuration = 0
    end
    local children = a2.pendingProps.children
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, children, a3)
    else
        a2.child = mountChildFibers(a2, nil, children, a3)
    end
    return a2.child
end

local function v23(a1, a2) -- Line: 798 -- upvalues: Ref (val)
    local ref = a2.ref
    if a1 ~= nil then
        if a1 ~= nil and a1.ref ~= ref then
            a2.flags = bit32.bor(a2.flags, Ref)
        end
    elseif ref ~= nil or a1 ~= nil and a1.ref ~= ref then
        a2.flags = bit32.bor(a2.flags, Ref)
    end
end

function updateFunctionComponent(a1, a2, a3, a4, a5) -- Line: 809
    -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val)
    -- upvalues: getComponentName (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val)
    -- upvalues: prepareToReadContext (val), u458 (val), ReactCurrentOwner (val), setIsRendering (val)
    -- upvalues: renderWithHooks (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val)
    -- upvalues: disableLogs (val), describeError (val), reenableLogs (val), u461 (ref), bailoutHooks (val)
    -- upvalues: bailoutOnAlreadyFinishedWork (ref), PerformedWork (val), mountChildFibers (val)
    -- upvalues: reconcileChildFibers (val)
    local propTypes, v1, validateProps
    if __DEV__ then
        if type(a3) ~= "function" and a2.type ~= a2.elementType then
            propTypes = nil
            validateProps = nil
            if type(a3) == "table" then
                propTypes = a3.propTypes
                validateProps = a3.validateProps
            end
            if propTypes or validateProps then
                checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(a3))
            end
        end
    elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ and type(a3) ~= "function" and a2.type ~= a2.elementType then
        propTypes = nil
        validateProps = nil
        if type(a3) == "table" then
            propTypes = a3.propTypes
            validateProps = a3.validateProps
        end
        if propTypes or validateProps then
            checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(a3))
        end
    end
    local v2 = nil
    if not disableLegacyContext then
        v2 = getMaskedContext(a2, (getUnmaskedContext(a2, a3, true)))
    end
    prepareToReadContext(a2, a5, u458.markWorkInProgressReceivedUpdate)
    if not __DEV__ then
        v1 = renderWithHooks(a1, a2, a3, a4, v2, a5)
    else
        ReactCurrentOwner.current = a2
        setIsRendering(true)
        v1 = renderWithHooks(a1, a2, a3, a4, v2, a5)
        if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a2.mode, StrictMode) ~= 0 then
            disableLogs()
            local success, result = xpcall(renderWithHooks, describeError, a1, a2, a3, a4, v2, a5)
            reenableLogs()
            if not success then
                error(result)
            else
                v1 = result
            end
        end
        setIsRendering(false)
    end
    if a1 ~= nil and not u461 then
        bailoutHooks(a1, a2, a5)
        return bailoutOnAlreadyFinishedWork(a1, a2, a5)
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, v1, a5)
    else
        a2.child = mountChildFibers(a2, nil, v1, a5)
    end
    return a2.child
end

local function updateClassComponent(a1, a2, a3, a4, a5) -- Line: 988
    -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val)
    -- upvalues: getComponentName (val), isContextProvider (val), pushContextProvider (val), prepareToReadContext (val)
    -- upvalues: u458 (val), Placement (val), constructClassInstance (val), mountClassInstance (val)
    -- upvalues: resumeMountClassInstance (val), updateClassInstance (val), console (val)
    local propTypes, v1, v2, validateProps
    if __DEV__ then
        if a2.type ~= a2.elementType then
            propTypes = a3.propTypes
            validateProps = a3.validateProps
            if propTypes or validateProps then
                checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(a3))
            end
        end
    elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ and a2.type ~= a2.elementType then
        propTypes = a3.propTypes
        validateProps = a3.validateProps
        if propTypes or validateProps then
            checkPropTypes(propTypes, validateProps, a4, "prop", getComponentName(a3))
        end
    end
    if not isContextProvider(a3) then
        v1 = false
    else
        v1 = true
        pushContextProvider(a2)
    end
    prepareToReadContext(a2, a5, u458.markWorkInProgressReceivedUpdate)
    if a2.stateNode ~= nil then
        v2 = if a1 ~= nil then updateClassInstance(a1, a2, a3, a4, a5) else resumeMountClassInstance(a2, a3, a4, a5)
    else
        if a1 ~= nil then
            a1.alternate = nil
            a2.alternate = nil
            a2.flags = bit32.bor(a2.flags, Placement)
        end
        constructClassInstance(a2, a3, a4)
        mountClassInstance(a2, a3, a4, a5)
        v2 = true
    end
    local v3 = finishClassComponent(a1, a2, a3, v2, v1, a5)
    if __DEV__ then
        local stateNode = a2.stateNode
        if v2 and stateNode.props ~= a4 then
            if not u458.didWarnAboutReassigningProps then
                console.error(
                    "It looks like %s is reassigning its own `this.props` while rendering. This is not supported and can lead to confusing bugs.",
                    getComponentName(a2.type) or "a component"
                )
            end
            u458.didWarnAboutReassigningProps = true
        end
    end
    return v3
end

function finishClassComponent(a1, a2, a3, a4, a5, a6) -- Line: 1085
    -- upvalues: Ref (val), DidCapture (val), NoFlags (val), invalidateContextProvider (val)
    -- upvalues: bailoutOnAlreadyFinishedWork (ref), ReactCurrentOwner (val), enableProfilerTimer (val)
    -- upvalues: stopProfilerTimerIfRunning (val), __DEV__ (val), setIsRendering (val)
    -- upvalues: debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val)
    -- upvalues: describeError (val), reenableLogs (val), PerformedWork (val), reconcileChildFibers (val)
    -- upvalues: mountChildFibers (val)
    local result, success, v1
    local ref = a2.ref
    if a1 ~= nil then
        if a1 ~= nil and a1.ref ~= ref then
            a2.flags = bit32.bor(a2.flags, Ref)
        end
    elseif ref ~= nil or a1 ~= nil and a1.ref ~= ref then
        a2.flags = bit32.bor(a2.flags, Ref)
    end
    local v2 = (bit32.band(a2.flags, DidCapture)) ~= NoFlags
    if not a4 and not v2 then
        if a5 then
            invalidateContextProvider(a2, a3, false)
        end
        return bailoutOnAlreadyFinishedWork(a1, a2, a6)
    end
    local stateNode = a2.stateNode
    ReactCurrentOwner.current = a2
    if not v2 then
        if not __DEV__ then
            v1 = stateNode:render()
        else
            setIsRendering(true)
            v1 = stateNode:render()
            if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a2.mode, StrictMode) ~= 0 then
                disableLogs()
                success, result = xpcall(stateNode.render, describeError, stateNode)
                reenableLogs()
                if not success then
                    error(result)
                end
            end
            setIsRendering(false)
        end
    elseif a3.getDerivedStateFromError == nil or type(a3.getDerivedStateFromError) ~= "function" then
        v1 = nil
        if enableProfilerTimer then
            stopProfilerTimerIfRunning(a2)
        end
    elseif not __DEV__ then
        v1 = stateNode:render()
    else
        setIsRendering(true)
        v1 = stateNode:render()
        if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a2.mode, StrictMode) ~= 0 then
            disableLogs()
            success, result = xpcall(stateNode.render, describeError, stateNode)
            reenableLogs()
            if not success then
                error(result)
            end
        end
        setIsRendering(false)
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    if a1 == nil then
        if a1 ~= nil then
            a2.child = reconcileChildFibers(a2, a1.child, v1, a6)
        else
            a2.child = mountChildFibers(a2, nil, v1, a6)
        end
    elseif v2 then
        a2.child = reconcileChildFibers(a2, a1.child, nil, a6)
        a2.child = reconcileChildFibers(a2, nil, v1, a6)
    elseif a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, v1, a6)
    else
        a2.child = mountChildFibers(a2, nil, v1, a6)
    end
    a2.memoizedState = stateNode.state
    if a5 then
        invalidateContextProvider(a2, a3, true)
    end
    return a2.child
end

local function v24(a1) -- Line: 1183 -- upvalues: pushTopLevelContextObject (val), pushHostContainer (val)
    local stateNode = a1.stateNode
    if stateNode.pendingContext then
        pushTopLevelContextObject(a1, stateNode.pendingContext, stateNode.pendingContext ~= stateNode.context)
    elseif stateNode.context then
        pushTopLevelContextObject(a1, stateNode.context, false)
    end
    pushHostContainer(a1, stateNode.containerInfo)
end

local function updateHostRoot(a1, a2, a3) -- Line: 1199
    -- upvalues: pushTopLevelContextObject (val), pushHostContainer (val), invariant (val), cloneUpdateQueue (val)
    -- upvalues: processUpdateQueue (val), resetHydrationState (val), bailoutOnAlreadyFinishedWork (ref)
    -- upvalues: enterHydrationState (val), supportsHydration (val), setWorkInProgressVersion (val)
    -- upvalues: mountChildFibers (val), Placement (val), Hydrating (val), reconcileChildFibers (val)
    local stateNode = a2.stateNode
    if stateNode.pendingContext then
        pushTopLevelContextObject(a2, stateNode.pendingContext, stateNode.pendingContext ~= stateNode.context)
    elseif stateNode.context then
        pushTopLevelContextObject(a2, stateNode.context, false)
    end
    pushHostContainer(a2, stateNode.containerInfo)
    local v1 = false
    if a1 ~= nil then
        v1 = a2.updateQueue ~= nil
    end
    invariant(
        v1,
        "If the root does not have an updateQueue, we should have already bailed out. This error is likely caused by a bug in React. Please file an issue."
    )
    local pendingProps = a2.pendingProps
    local memoizedState = a2.memoizedState
    local element = nil
    if memoizedState ~= nil then
        element = memoizedState.element
    end
    cloneUpdateQueue(a1, a2)
    processUpdateQueue(a2, pendingProps, nil, a3)
    local element_2 = a2.memoizedState.element
    if element_2 == element then
        resetHydrationState()
        return bailoutOnAlreadyFinishedWork(a1, a2, a3)
    end
    local stateNode_2 = a2.stateNode
    if not stateNode_2.hydrate or not enterHydrationState(a2) then
        if a1 ~= nil then
            a2.child = reconcileChildFibers(a2, a1.child, element_2, a3)
        else
            a2.child = mountChildFibers(a2, nil, element_2, a3)
        end
        resetHydrationState()
    else
        if supportsHydration then
            local mutableSourceEagerHydrationData = stateNode_2.mutableSourceEagerHydrationData
            if mutableSourceEagerHydrationData ~= nil then
                local v2 = #mutableSourceEagerHydrationData
                for i = 1, v2, 2 do
                    setWorkInProgressVersion(mutableSourceEagerHydrationData[i], mutableSourceEagerHydrationData[i + 1])
                end
            end
        end
        local v3 = mountChildFibers(a2, nil, element_2, a3)
        a2.child = v3
        local sibling = v3
        while sibling do
            sibling.flags = bit32.bor(bit32.band(sibling.flags, (bit32.bnot(Placement))), Hydrating)
            sibling = sibling.sibling
        end
    end
    return a2.child
end

local function updateHostComponent(a1, a2, a3) -- Line: 1276
    -- upvalues: pushHostContext (val), tryToClaimNextHydratableInstance (val), shouldSetTextContent (val)
    -- upvalues: ContentReset (val), PerformedWork (val), Ref (val), mountChildFibers (val), reconcileChildFibers (val)
    pushHostContext(a2)
    if a1 == nil then
        tryToClaimNextHydratableInstance(a2)
    end
    local type = a2.type
    local pendingProps = a2.pendingProps
    local memoizedProps = nil
    if a1 ~= nil then
        memoizedProps = a1.memoizedProps
    end
    local children = pendingProps.children
    if shouldSetTextContent(type, pendingProps) then
        children = nil
    elseif memoizedProps ~= nil and shouldSetTextContent(type, memoizedProps) then
        a2.flags = bit32.bor(a2.flags, ContentReset)
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    local ref = a2.ref
    if a1 ~= nil then
        if a1 ~= nil and a1.ref ~= ref then
            a2.flags = bit32.bor(a2.flags, Ref)
        end
    elseif ref ~= nil or a1 ~= nil and a1.ref ~= ref then
        a2.flags = bit32.bor(a2.flags, Ref)
    end
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, children, a3)
    else
        a2.child = mountChildFibers(a2, nil, children, a3)
    end
    return a2.child
end

local function updateHostText(a1, a2) -- Line: 1317 -- upvalues: tryToClaimNextHydratableInstance (val)
    if a1 == nil then
        tryToClaimNextHydratableInstance(a2)
    end
    return nil
end

local function mountLazyComponent(a1, a2, a3, a4, a5) -- Line: 1326
    -- upvalues: Placement (val), resolveLazyComponentTag (val), resolveDefaultProps (val), FunctionComponent (val)
    -- upvalues: __DEV__ (val), resolveFunctionForHotReloading (val), updateFunctionComponent (ref)
    -- upvalues: ClassComponent (val), resolveClassForHotReloading (val), updateClassComponent (val), ForwardRef (val)
    -- upvalues: resolveForwardRefForHotReloading (val), updateForwardRef (val), MemoComponent (val)
    -- upvalues: __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), getComponentName (val)
    -- upvalues: updateMemoComponent (val), REACT_LAZY_TYPE (val), inspect (val), invariant (val)
    if a1 ~= nil then
        a1.alternate = nil
        a2.alternate = nil
        a2.flags = bit32.bor(a2.flags, Placement)
    end
    local pendingProps = a2.pendingProps
    local v1 = a3._init(a3._payload)
    a2.type = v1
    a2.tag = resolveLazyComponentTag(v1)
    local tag = a2.tag
    local v2 = resolveDefaultProps(v1, pendingProps)
    if tag == FunctionComponent then
        if __DEV__ then
            validateFunctionComponentInDev(a2, v1)
            v1 = resolveFunctionForHotReloading(v1)
            a2.type = v1
        end
        return (updateFunctionComponent(nil, a2, v1, v2, a5))
    end
    if tag == ClassComponent then
        if __DEV__ then
            v1 = resolveClassForHotReloading(v1)
            a2.type = v1
        end
        return (updateClassComponent(nil, a2, v1, v2, a5))
    end
    if tag == ForwardRef then
        if __DEV__ then
            v1 = resolveForwardRefForHotReloading(v1)
            a2.type = v1
        end
        return (updateForwardRef(nil, a2, v1, v2, a5))
    end
    if tag == MemoComponent then
        local propTypes, validateProps
        if __DEV__ then
            if a2.type ~= a2.elementType then
                propTypes = v1.propTypes
                validateProps = v1.validateProps
                if propTypes or validateProps then
                    checkPropTypes(propTypes, validateProps, v2, "prop", getComponentName(v1))
                end
            end
        elseif __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ and a2.type ~= a2.elementType then
            propTypes = v1.propTypes
            validateProps = v1.validateProps
            if propTypes or validateProps then
                checkPropTypes(propTypes, validateProps, v2, "prop", getComponentName(v1))
            end
        end
        return (updateMemoComponent(nil, a2, v1, resolveDefaultProps(v1.type, v2), a4, a5))
    end
    local v3 = ""
    if __DEV__ then
        if v1 == nil or type(v1) ~= "table" then
            if type(v1) == "table" and v1["$$typeof"] == nil then
                v3 = "\n" .. inspect(v1)
            end
        elseif v1["$$typeof"] == REACT_LAZY_TYPE then
            v3 = " Did you wrap a component in React.lazy() more than once?"
        elseif type(v1) == "table" and v1["$$typeof"] == nil then
            v3 = "\n" .. inspect(v1)
        end
    end
    invariant(
        false,
        "Element type is invalid. Received a promise that resolves to: %s. Lazy element type must resolve to a class or function.%s",
        tostring(v1),
        v3
    )
    return nil
end

function mountIncompleteClassComponent(a1, a2, a3, a4, a5) -- Line: 1457
    -- upvalues: Placement (val), ClassComponent (val), isContextProvider (val), pushContextProvider (val)
    -- upvalues: prepareToReadContext (val), u458 (val), constructClassInstance (val), mountClassInstance (val)
    local v1
    if a1 ~= nil then
        a1.alternate = nil
        a2.alternate = nil
        a2.flags = bit32.bor(a2.flags, Placement)
    end
    a2.tag = ClassComponent
    if not isContextProvider(a3) then
        v1 = false
    else
        v1 = true
        pushContextProvider(a2)
    end
    prepareToReadContext(a2, a5, u458.markWorkInProgressReceivedUpdate)
    constructClassInstance(a2, a3, a4)
    mountClassInstance(a2, a3, a4, a5)
    return finishClassComponent(nil, a2, a3, true, v1, a5)
end

local function mountIndeterminateComponent(a1, a2, a3, a4) -- Line: 1509
    -- upvalues: Placement (val), disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val)
    -- upvalues: prepareToReadContext (val), u458 (val), __DEV__ (val), getComponentName (val), u462 (val)
    -- upvalues: console (val), StrictMode (val), u230 (val), setIsRendering (val), ReactCurrentOwner (val)
    -- upvalues: renderWithHooks (val), PerformedWork (val), disableModulePatternComponents (val), ClassComponent (val)
    -- upvalues: isContextProvider (val), pushContextProvider (val), initializeUpdateQueue (val)
    -- upvalues: applyDerivedStateFromProps (val), adoptClassInstance (val), mountClassInstance (val)
    -- upvalues: FunctionComponent (val), debugRenderPhaseSideEffectsForStrictMode (val), disableLogs (val)
    -- upvalues: describeError (val), reenableLogs (val), mountChildFibers (val)
    local v1, v2, v3
    if a1 ~= nil then
        a1.alternate = nil
        a2.alternate = nil
        a2.flags = bit32.bor(a2.flags, Placement)
    end
    local pendingProps = a2.pendingProps
    local v4 = nil
    if not disableLegacyContext then
        v4 = getMaskedContext(a2, (getUnmaskedContext(a2, a3, false)))
    end
    prepareToReadContext(a2, a4, u458.markWorkInProgressReceivedUpdate)
    if not __DEV__ then
        v1 = renderWithHooks(nil, a2, a3, pendingProps, v4, a4)
    else
        if type(a3) == "table" and type(a3.render) == "function" then
            v2 = getComponentName(a3) or "Unknown"
            if not u462.didWarnAboutBadClass[v2] then
                console.error(
                    "The <%s /> component appears to have a render method, but doesn't extend React.Component. This is likely to cause errors. Change %s to extend React.Component instead.",
                    v2,
                    v2
                )
                u462.didWarnAboutBadClass[v2] = true
            end
        end
        if bit32.band(a2.mode, StrictMode) ~= 0 then
            u230.recordLegacyContextWarning(a2)
        end
        setIsRendering(true)
        ReactCurrentOwner.current = a2
        v1 = renderWithHooks(nil, a2, a3, pendingProps, v4, a4)
        setIsRendering(false)
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    v2 = type(v1)
    if __DEV__ and v1 ~= nil and v2 == "table" and type(v1.render) == "function" and v1["$$typeof"] == nil then
        v3 = getComponentName(a3) or "Unknown"
        if not u462.didWarnAboutModulePatternComponent[v3] then
            console.error(
                "The <%s /> component appears to be a function component that returns a class instance. Change %s to a class that extends React.Component instead. ",
                v3,
                v3
            )
            u462.didWarnAboutModulePatternComponent[v3] = true
        end
    end
    if not disableModulePatternComponents
        and v1 ~= nil
        and v2 == "table"
        and type(v1.render) == "function"
        and v1["$$typeof"] == nil then
        if __DEV__ then
            v3 = getComponentName(a3) or "Unknown"
            if not u462.didWarnAboutModulePatternComponent[v3] then
                console.error(
                    "The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v3,
                    v3
                )
                u462.didWarnAboutModulePatternComponent[v3] = true
            end
        end
        a2.tag = ClassComponent
        a2.memoizedState = nil
        a2.updateQueue = nil
        if not isContextProvider(a3) then
            v3 = false
        else
            v3 = true
            pushContextProvider(a2)
        end
        a2.memoizedState = v1.state
        initializeUpdateQueue(a2)
        local getDerivedStateFromProps = nil
        if type(a3) ~= "function" then
            getDerivedStateFromProps = a3.getDerivedStateFromProps
        end
        if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
            applyDerivedStateFromProps(a2, a3, getDerivedStateFromProps, pendingProps)
        end
        adoptClassInstance(a2, v1)
        mountClassInstance(a2, a3, pendingProps, a4)
        return finishClassComponent(nil, a2, a3, true, v3, a4)
    end
    a2.tag = FunctionComponent
    if __DEV__ then
        if disableLegacyContext and a3.contextTypes then
            console.error(
                "%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with React.useContext() instead.",
                getComponentName(a3) or "Unknown"
            )
        end
        if debugRenderPhaseSideEffectsForStrictMode and bit32.band(a2.mode, StrictMode) ~= 0 then
            disableLogs()
            local success, result = xpcall(renderWithHooks, describeError, nil, a2, a3, pendingProps, v4, a4)
            reenableLogs()
            if not success then
                error(result)
            else
                v1 = result
            end
        end
    end
    a2.child = mountChildFibers(a2, nil, v1, a4)
    if __DEV__ then
        validateFunctionComponentInDev(a2, a3)
    end
    return a2.child
end

function validateFunctionComponentInDev(a1, a2) -- Line: 1726
    -- upvalues: __DEV__ (val), getCurrentFiberOwnerNameInDevOrNull (val), u462 (val), console (val)
    -- upvalues: warnAboutDefaultPropsOnFunctionComponents (val), getComponentName (val)
    if __DEV__ then
        local v1
        if a1.ref ~= nil then
            v1 = ""
            local v2 = getCurrentFiberOwnerNameInDevOrNull()
            if v2 then
                v1 = v1 .. "\n\nCheck the render method of `" .. v2 .. "`."
            end
            local _debugID = v2 or a1._debugID or ""
            local _debugSource = a1._debugSource
            if _debugSource then
                _debugID = _debugSource.fileName .. ":" .. _debugSource.lineNumber
            end
            if not u462.didWarnAboutFunctionRefs[_debugID] then
                u462.didWarnAboutFunctionRefs[_debugID] = true
                console.error(
                    "Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?%s",
                    v1
                )
            end
        end
        if warnAboutDefaultPropsOnFunctionComponents and type(a2) ~= "function" and a2.defaultProps ~= nil then
            v1 = getComponentName(a2) or "Unknown"
            if not u462.didWarnAboutDefaultPropsOnFunctionComponent[v1] then
                console.error("%s: Support for defaultProps will be removed from function components in a future major release.", v1)
                u462.didWarnAboutDefaultPropsOnFunctionComponent[v1] = true
            end
        end
        if type(a2) ~= "function"
            and a2.getDerivedStateFromProps ~= nil
            and type(a2.getDerivedStateFromProps) == "function" then
            v1 = getComponentName(a2) or "Unknown"
            if not u462.didWarnAboutGetDerivedStateOnFunctionComponent[v1] then
                console.error("%s: Function components do not support getDerivedStateFromProps.", v1)
                u462.didWarnAboutGetDerivedStateOnFunctionComponent[v1] = true
            end
        end
        if type(a2) ~= "function" and a2.contextType ~= nil and type(a2.contextType) == "table" then
            v1 = getComponentName(a2) or "Unknown"
            if not u462.didWarnAboutContextTypeOnFunctionComponent[v1] then
                console.error("%s: Function components do not support contextType.", v1)
                u462.didWarnAboutContextTypeOnFunctionComponent[v1] = true
            end
        end
    end
end

local u582 = {retryLane = ReactFiberLane.NoLane}

local function v25(a1) -- Line: 1823
    return {baseLanes = a1}
end

local function updateSuspenseOffscreenState(a1, a2) -- Line: 1829 -- upvalues: ReactFiberLane (val)
    return {baseLanes = ReactFiberLane.mergeLanes(a1.baseLanes, a2)}
end

local function shouldRemainOnFallback(a1, a2, a3, a4) -- Line: 1839
    -- upvalues: hasSuspenseContext (val), ForceSuspenseFallback (val)
    if a2 ~= nil and a2.memoizedState == nil then
        return false
    end
    return hasSuspenseContext(a1, ForceSuspenseFallback)
end

local function getRemainingWorkInPrimaryTree(a1, a2) -- Line: 1863 -- upvalues: ReactFiberLane (val)
    return ReactFiberLane.removeLanes(a1.childLanes, a2)
end

local updateSuspensePrimaryChildren = nil
local mountDehydratedSuspenseComponent = nil
local mountSuspensePrimaryChildren = nil
local updateSuspenseFallbackChildren = nil
local updateDehydratedSuspenseComponent = nil

local function updateSuspenseComponent(a1, a2, a3) -- Line: 1875
    -- upvalues: __DEV__ (val), u330 (val), DidCapture (val), suspenseStackCursor (val), NoFlags (val)
    -- upvalues: hasSuspenseContext (val), ForceSuspenseFallback (val), addSubtreeSuspenseContext (val)
    -- upvalues: InvisibleParentSuspenseContext (val), setDefaultShallowSuspenseContext (val), pushSuspenseContext (val)
    -- upvalues: tryToClaimNextHydratableInstance (val), enableSuspenseServerRenderer (val)
    -- upvalues: mountDehydratedSuspenseComponent (ref), u582 (val), ReactFiberLane (val), enableSchedulerTracing (val)
    -- upvalues: markSpawnedWork (val), mountSuspensePrimaryChildren (ref), updateDehydratedSuspenseComponent (ref)
    -- upvalues: updateSuspenseFallbackChildren (ref), updateSuspensePrimaryChildren (ref)
    local v1, v2
    local pendingProps = a2.pendingProps
    if __DEV__ then
        if not u330.shouldSuspendRef then
            u330.shouldSuspendRef = require(script.Parent:WaitForChild("ReactFiberReconciler")).shouldSuspend
        end
        if u330.shouldSuspendRef(a2) then
            a2.flags = bit32.bor(a2.flags, DidCapture)
        end
    end
    local current = suspenseStackCursor.current
    local v3 = false
    if (bit32.band(a2.flags, DidCapture)) ~= NoFlags
        or (if a1 == nil then hasSuspenseContext(current, ForceSuspenseFallback) else if a1.memoizedState ~= nil then hasSuspenseContext(current, ForceSuspenseFallback) else false) then
        v3 = true
        a2.flags = bit32.band(a2.flags, (bit32.bnot(DidCapture)))
    elseif a1 == nil then
        if pendingProps.fallback ~= nil and pendingProps.unstable_avoidThisFallback ~= true then
            current = addSubtreeSuspenseContext(current, InvisibleParentSuspenseContext)
        end
    elseif a1.memoizedState ~= nil
        and pendingProps.fallback ~= nil
        and pendingProps.unstable_avoidThisFallback ~= true then
        current = addSubtreeSuspenseContext(current, InvisibleParentSuspenseContext)
    end
    pushSuspenseContext(a2, (setDefaultShallowSuspenseContext(current)))
    if a1 == nil then
        if pendingProps.fallback ~= nil then
            tryToClaimNextHydratableInstance(a2)
            if enableSuspenseServerRenderer then
                local memoizedState = a2.memoizedState
                if memoizedState ~= nil then
                    local dehydrated = memoizedState.dehydrated
                    if dehydrated ~= nil then
                        return mountDehydratedSuspenseComponent(a2, dehydrated, a3)
                    end
                end
            end
        end
        local children = pendingProps.children
        local fallback = pendingProps.fallback
        if v3 then
            v2 = mountSuspenseFallbackChildren(a2, children, fallback, a3)
            a2.child.memoizedState = {baseLanes = a3}
            a2.memoizedState = u582
            return v2
        end
        if pendingProps.unstable_expectedLoadTime ~= nil
            and type(pendingProps.unstable_expectedLoadTime) == "number" then
            v2 = mountSuspenseFallbackChildren(a2, children, fallback, a3)
            a2.child.memoizedState = {baseLanes = a3}
            a2.memoizedState = u582
            a2.lanes = ReactFiberLane.SomeRetryLane
            if enableSchedulerTracing then
                markSpawnedWork(ReactFiberLane.SomeRetryLane)
            end
            return v2
        end
        return mountSuspensePrimaryChildren(a2, children, a3)
    end
    local memoizedState_2 = a1.memoizedState
    if memoizedState_2 == nil then
        if v3 then
            local fallback_4 = pendingProps.fallback
            local children_5 = pendingProps.children
            v1 = updateSuspenseFallbackChildren(a1, a2, children_5, fallback_4, a3)
            local child_5 = a2.child
            local memoizedState_4 = a1.child.memoizedState
            if memoizedState_4 ~= nil then
                child_5.memoizedState = {baseLanes = ReactFiberLane.mergeLanes(memoizedState_4.baseLanes, a3)}
            else
                child_5.memoizedState = {baseLanes = a3}
            end
            child_5.childLanes = ReactFiberLane.removeLanes(a1.childLanes, a3)
            a2.memoizedState = u582
            return v1
        end
        local children_6 = pendingProps.children
        v2 = updateSuspensePrimaryChildren(a1, a2, children_6, a3)
        a2.memoizedState = nil
        return v2
    end
    if enableSuspenseServerRenderer then
        local dehydrated_2 = memoizedState_2.dehydrated
        if dehydrated_2 ~= nil then
            local v4
            if not v4 then
                return updateDehydratedSuspenseComponent(a1, a2, dehydrated_2, memoizedState_2, a3)
            end
            if a2.memoizedState ~= nil then
                a2.child = a1.child
                a2.flags = bit32.bor(a2.flags, DidCapture)
                return nil
            end
            local children_2 = pendingProps.children
            local fallback_2 = pendingProps.fallback
            local v5 = mountSuspenseFallbackAfterRetryWithoutHydrating(a1, a2, children_2, fallback_2, a3)
            a2.child.memoizedState = {baseLanes = a3}
            a2.memoizedState = u582
            return v5
        end
    end
    if not v3 then
        local children_4 = pendingProps.children
        v2 = updateSuspensePrimaryChildren(a1, a2, children_4, a3)
        a2.memoizedState = nil
        return v2
    end
    local fallback_3 = pendingProps.fallback
    local children_3 = pendingProps.children
    v1 = updateSuspenseFallbackChildren(a1, a2, children_3, fallback_3, a3)
    local child_4 = a2.child
    local memoizedState_3 = a1.child.memoizedState
    if memoizedState_3 ~= nil then
        child_4.memoizedState = {baseLanes = ReactFiberLane.mergeLanes(memoizedState_3.baseLanes, a3)}
    else
        child_4.memoizedState = {baseLanes = a3}
    end
    child_4.childLanes = ReactFiberLane.removeLanes(a1.childLanes, a3)
    a2.memoizedState = u582
    return v1
end

function mountSuspensePrimaryChildren(a1, a2, a3) -- Line: 2160 -- upvalues: createFiberFromOffscreen (val)
    local v1 = createFiberFromOffscreen({mode = "visible", children = a2}, a1.mode, a3, nil)
    v1.return_ = a1
    a1.child = v1
    return v1
end

function mountSuspenseFallbackChildren(a1, a2, a3, a4) -- Line: 2173
    -- upvalues: BlockingMode (val), NoMode (val), ReactFiberLane (val), enableProfilerTimer (val), ProfileMode (val)
    -- upvalues: createFiberFromFragment (val), createFiberFromOffscreen (val)
    local v1
    local mode = a1.mode
    local child = a1.child
    local v2 = {mode = "hidden", children = a2}
    if (bit32.band(mode, BlockingMode)) ~= NoMode or child == nil then
        v1 = createFiberFromOffscreen(v2, mode, ReactFiberLane.NoLanes, nil)
    else
        v1 = child
        v1.childLanes = ReactFiberLane.NoLanes
        v1.pendingProps = v2
        if enableProfilerTimer and bit32.band(a1.mode, ProfileMode) ~= 0 then
            v1.actualDuration = 0
            v1.actualStartTime = -1
            v1.selfBaseDuration = 0
            v1.treeBaseDuration = 0
        end
    end
    local v3 = createFiberFromFragment(a3, mode, a4, nil)
    v1.return_ = a1
    v3.return_ = a1
    v1.sibling = v3
    a1.child = v1
    return v3
end

local function v26(a1, a2) -- Line: 2223 -- upvalues: createWorkInProgress (val)
    return createWorkInProgress(a1, a2)
end

function updateSuspensePrimaryChildren(a1, a2, a3, a4) -- Line: 2232
    -- upvalues: createWorkInProgress (val), BlockingMode (val), NoMode (val), Deletion (val)
    local child = a1.child
    local sibling = child.sibling
    local v1 = createWorkInProgress(child, {mode = "visible", children = a3})
    if (bit32.band(a2.mode, BlockingMode)) == NoMode then
        v1.lanes = a4
    end
    v1.return_ = a2
    v1.sibling = nil
    if sibling ~= nil then
        local deletions = a2.deletions
        if deletions ~= nil then
            table.insert(deletions, sibling)
        else
            a2.deletions = {sibling}
            a2.flags = bit32.bor(a2.flags, Deletion)
        end
    end
    a2.child = v1
    return v1
end

function updateSuspenseFallbackChildren(a1, a2, a3, a4, a5) -- Line: 2267
    -- upvalues: BlockingMode (val), NoMode (val), ReactFiberLane (val), enableProfilerTimer (val), ProfileMode (val)
    -- upvalues: createWorkInProgress (val), StaticMask (val), createFiberFromFragment (val), Placement (val)
    local v1, v2
    local mode = a2.mode
    local child = a1.child
    local sibling = child.sibling
    local v3 = {mode = "hidden", children = a3}
    if (bit32.band(mode, BlockingMode)) ~= NoMode or a2.child == child then
        v2 = createWorkInProgress(child, v3)
        v2.subtreeFlags = bit32.band(child.subtreeFlags, StaticMask)
    else
        v2 = a2.child
        v2.childLanes = ReactFiberLane.NoLanes
        v2.pendingProps = v3
        if enableProfilerTimer and bit32.band(a2.mode, ProfileMode) ~= 0 then
            v2.actualDuration = 0
            v2.actualStartTime = -1
            v2.selfBaseDuration = child.selfBaseDuration
            v2.treeBaseDuration = child.treeBaseDuration
        end
        a2.deletions = nil
    end
    if sibling == nil then
        v1 = createFiberFromFragment(a4, mode, a5, nil)
        v1.flags = bit32.bor(v1.flags, Placement)
    else
        v1 = createWorkInProgress(sibling, a4)
    end
    v1.return_ = a2
    v2.return_ = a2
    v2.sibling = v1
    a2.child = v2
    return v1
end

local function retrySuspenseComponentWithoutHydrating(a1, a2, a3) -- Line: 2350
    -- upvalues: reconcileChildFibers (val), mountSuspensePrimaryChildren (ref), Placement (val)
    reconcileChildFibers(a2, a1.child, nil, a3)
    local children = a2.pendingProps.children
    local v1 = mountSuspensePrimaryChildren(a2, children, a3)
    v1.flags = bit32.bor(v1.flags, Placement)
    a2.memoizedState = nil
    return v1
end

function mountSuspenseFallbackAfterRetryWithoutHydrating(a1, a2, a3, a4, a5) -- Line: 2371
    -- upvalues: createFiberFromOffscreen (val), ReactFiberLane (val), createFiberFromFragment (val), Placement (val)
    -- upvalues: BlockingMode (val), NoMode (val), reconcileChildFibers (val)
    local mode = a2.mode
    local v1 = createFiberFromOffscreen(a3, mode, ReactFiberLane.NoLanes, nil)
    local v2 = createFiberFromFragment(a4, mode, a5, nil)
    v2.flags = bit32.bor(v2.flags, Placement)
    v1.return_ = a2
    v2.return_ = a2
    v1.sibling = v2
    a2.child = v1
    if (bit32.band(a2.mode, BlockingMode)) ~= NoMode then
        reconcileChildFibers(a2, a1.child, nil, a5)
    end
    return v2
end

function mountDehydratedSuspenseComponent(a1, a2, a3) -- Line: 2401
    -- upvalues: BlockingMode (val), NoMode (val), __DEV__ (val), console (val), ReactFiberLane (val)
    -- upvalues: isSuspenseInstanceFallback (val), enableSchedulerTracing (val), markSpawnedWork (val)
    if (bit32.band(a1.mode, BlockingMode)) == NoMode then
        if __DEV__ then
            console.error("Cannot hydrate Suspense in legacy mode. Switch fromReactDOM.hydrate(element, container) to ReactDOM.createBlockingRoot(container, { hydrate: true }).render(element) or remove the Suspense componentsthe server rendered components.")
        end
        a1.lanes = ReactFiberLane.laneToLanes(ReactFiberLane.SyncLane)
    elseif not isSuspenseInstanceFallback(a2) then
        a1.lanes = ReactFiberLane.laneToLanes(ReactFiberLane.OffscreenLane)
        if enableSchedulerTracing then
            markSpawnedWork(ReactFiberLane.OffscreenLane)
        end
    else
        if enableSchedulerTracing then
            markSpawnedWork(ReactFiberLane.DefaultHydrationLane)
        end
        a1.lanes = ReactFiberLane.laneToLanes(ReactFiberLane.DefaultHydrationLane)
    end
    return nil
end

function updateDehydratedSuspenseComponent(a1, a2, a3, a4, a5) -- Line: 2448
    -- upvalues: warnIfHydrating (val), getExecutionContext (val), RetryAfterError (val), NoContext (val)
    -- upvalues: reconcileChildFibers (val), mountSuspensePrimaryChildren (ref), Placement (val), BlockingMode (val)
    -- upvalues: NoMode (val), isSuspenseInstanceFallback (val), ReactFiberLane (val), u461 (ref)
    -- upvalues: getWorkInProgressRoot (val), scheduleUpdateOnFiber (val), renderDidSuspendDelayIfPossible (val)
    -- upvalues: isSuspenseInstancePending (val), DidCapture (val), retryDehydratedSuspenseBoundary (val)
    -- upvalues: enableSchedulerTracing (val), u426 (ref), registerSuspenseInstanceRetry (val)
    -- upvalues: reenterHydrationStateFromDehydratedSuspenseInstance (val), Hydrating (val)
    local v1, v2
    warnIfHydrating()
    local v3 = bit32.band(getExecutionContext(), RetryAfterError)
    if v3 ~= NoContext then
        reconcileChildFibers(a2, a1.child, nil, a5)
        local children = a2.pendingProps.children
        v3 = mountSuspensePrimaryChildren(a2, children, a5)
        v3.flags = bit32.bor(v3.flags, Placement)
        a2.memoizedState = nil
        return v3
    end
    v3 = bit32.band(a2.mode, BlockingMode)
    if v3 == NoMode then
        reconcileChildFibers(a2, a1.child, nil, a5)
        local children_2 = a2.pendingProps.children
        v3 = mountSuspensePrimaryChildren(a2, children_2, a5)
        v3.flags = bit32.bor(v3.flags, Placement)
        a2.memoizedState = nil
        return v3
    end
    if isSuspenseInstanceFallback(a3) then
        reconcileChildFibers(a2, a1.child, nil, a5)
        local children_3 = a2.pendingProps.children
        v3 = mountSuspensePrimaryChildren(a2, children_3, a5)
        v3.flags = bit32.bor(v3.flags, Placement)
        a2.memoizedState = nil
        return v3
    end
    v3 = ReactFiberLane.includesSomeLane(a5, a1.childLanes)
    if not u461 and not v3 then
        if not isSuspenseInstancePending(a3) then
            reenterHydrationStateFromDehydratedSuspenseInstance(a2, a3)
            local children_4 = a2.pendingProps.children
            local v4 = mountSuspensePrimaryChildren(a2, children_4, a5)
            v4.flags = bit32.bor(v4.flags, Hydrating)
            return v4
        end
        a2.flags = bit32.bor(a2.flags, DidCapture)
        a2.child = a1.child

        function v1() -- Line: 2544 -- upvalues: retryDehydratedSuspenseBoundary (upval), a1 (val)
            return retryDehydratedSuspenseBoundary(a1)
        end

        if enableSchedulerTracing then
            if u426 == nil then
                u426 = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_wrap
            end
            v1 = u426(v1)
        end
        registerSuspenseInstanceRetry(a3, v1)
        return nil
    end
    v1 = getWorkInProgressRoot()
    if v1 ~= nil then
        v2 = ReactFiberLane.getBumpedLaneForHydration(v1, a5)
        if v2 ~= ReactFiberLane.NoLane and v2 ~= a4.retryLane then
            a4.retryLane = v2
            scheduleUpdateOnFiber(a1, v2, ReactFiberLane.NoTimestamp)
        end
    end
    renderDidSuspendDelayIfPossible()
    reconcileChildFibers(a2, a1.child, nil, a5)
    local children_5 = a2.pendingProps.children
    v2 = mountSuspensePrimaryChildren(a2, children_5, a5)
    v2.flags = bit32.bor(v2.flags, Placement)
    a2.memoizedState = nil
    return v2
end

function updatePortalComponent(a1, a2, a3) -- Line: 2958
    -- upvalues: pushHostContainer (val), reconcileChildFibers (val), mountChildFibers (val)
    pushHostContainer(a2, a2.stateNode.containerInfo)
    local pendingProps = a2.pendingProps
    if a1 == nil then
        a2.child = reconcileChildFibers(a2, nil, pendingProps, a3)
    elseif a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, pendingProps, a3)
    else
        a2.child = mountChildFibers(a2, nil, pendingProps, a3)
    end
    return a2.child
end

local u632 = false

local function updateContextProvider(a1, a2, a3) -- Line: 2981
    -- upvalues: __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), Array (val), Object (val)
    -- upvalues: u632 (ref), console (val), checkPropTypes (val), pushProvider (val), calculateChangedBits (val)
    -- upvalues: hasContextChanged (val), bailoutOnAlreadyFinishedWork (ref), propagateContextChange (val)
    -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    local _context = a2.type._context
    local pendingProps = a2.pendingProps
    local memoizedProps = a2.memoizedProps
    local value = pendingProps.value
    if __DEV__ or __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if (Array.indexOf(Object.keys(pendingProps), "value")) < 1 and not u632 then
            u632 = true
            console.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?")
        end
        local propTypes = a2.type.propTypes
        local validateProps = a2.type.validateProps
        if propTypes or validateProps then
            checkPropTypes(propTypes, validateProps, pendingProps, "prop", "Context.Provider")
        end
    end
    pushProvider(a2, value)
    if memoizedProps ~= nil then
        local v1 = calculateChangedBits(_context, value, memoizedProps.value)
        if v1 ~= 0 then
            propagateContextChange(a2, _context, v1, a3)
        elseif memoizedProps.children == pendingProps.children and not hasContextChanged() then
            return bailoutOnAlreadyFinishedWork(a1, a2, a3)
        end
    end
    local children = pendingProps.children
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, children, a3)
    else
        a2.child = mountChildFibers(a2, nil, children, a3)
    end
    return a2.child
end

local u640 = {usingContextAsConsumer = false, usingLegacyConsumer = false}

function updateContextConsumer(a1, a2, a3) -- Line: 3049
    -- upvalues: __DEV__ (val), u640 (val), console (val), __COMPAT_WARNINGS__ (val), prepareToReadContext (val)
    -- upvalues: u458 (val), readContext (val), ReactCurrentOwner (val), setIsRendering (val), PerformedWork (val)
    -- upvalues: mountChildFibers (val), reconcileChildFibers (val)
    local render, v1
    local type_2 = a2.type
    if __DEV__ then
        if type_2._context ~= nil then
            type_2 = type_2._context
        elseif type_2 ~= type_2.Consumer and not u640.usingContextAsConsumer then
            u640.usingContextAsConsumer = true
            console.error("Rendering <Context> directly is not supported and will be removed in a future major release. Did you mean to render <Context.Consumer> instead?")
        end
    end
    local pendingProps = a2.pendingProps
    if not pendingProps.render then
        render = pendingProps.children
    else
        if __DEV__ and __COMPAT_WARNINGS__ and not u640.usingLegacyConsumer then
            u640.usingLegacyConsumer = true
            console.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \nPlease provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n       createElement(ContextConsumer, {render = function(...) end})\nbecomes:\n       createElement(ContextConsumer, nil, function(...) end)\nFor more info, reference the React documentation here: \nhttps://reactjs.org/docs/context.html#contextconsumer")
        end
        render = pendingProps.render
    end
    if __DEV__ and type(render) ~= "function" then
        console.error("A context consumer was rendered with multiple children, or a child that isn't a function. A context consumer expects a single child that is a function. If you did pass a function, make sure there is no trailing or leading whitespace around it.")
    end
    prepareToReadContext(a2, a3, u458.markWorkInProgressReceivedUpdate)
    local v2 = readContext(type_2, pendingProps.unstable_observedBits)
    if not __DEV__ then
        v1 = render(v2)
    else
        ReactCurrentOwner.current = a2
        setIsRendering(true)
        v1 = render(v2)
        setIsRendering(false)
    end
    a2.flags = bit32.bor(a2.flags, PerformedWork)
    if a1 ~= nil then
        a2.child = reconcileChildFibers(a2, a1.child, v1, a3)
    else
        a2.child = mountChildFibers(a2, nil, v1, a3)
    end
    return a2.child
end

function u458.markWorkInProgressReceivedUpdate() -- Line: 3159 -- upvalues: u461 (ref)
    u461 = true
end

function bailoutOnAlreadyFinishedWork(a1, a2, a3) -- Line: 3163
    -- upvalues: enableProfilerTimer (val), stopProfilerTimerIfRunning (val), markSkippedUpdateLanes (val)
    -- upvalues: ReactFiberLane (val), cloneChildFibers (val)
    if a1 then
        a2.dependencies = a1.dependencies
    end
    if enableProfilerTimer then
        stopProfilerTimerIfRunning(a2)
    end
    markSkippedUpdateLanes(a2.lanes)
    if not ReactFiberLane.includesSomeLane(a3, a2.childLanes) then
        return nil
    end
    cloneChildFibers(a1, a2)
    return a2.child
end

function remountFiber(a1, a2, a3) -- Line: 3194 -- upvalues: __DEV__ (val), Deletion (val), Placement (val)
    local v1, v2
    if not __DEV__ then
        error("Did not expect this call in production. This is a bug in React. Please file an issue.")
        return
    end
    local return_ = a2.return_
    if return_ == nil then
        error("Cannot swap the root fiber.")
    end
    assert(return_ ~= nil, "returnFiber was nil in remountFiber")
    a1.alternate = nil
    a2.alternate = nil
    a3.index = a2.index
    a3.sibling = a2.sibling
    a3.return_ = a2.return_
    a3.ref = a2.ref
    if a2 ~= return_.child then
        local v3
        local child = return_.child
        if child == nil then
            error("Expected parent to have a child.")
        end
        assert(child ~= nil, "prevSibling was nil in remountFiber")
        v3, v2, v1 = a2, a3, a1
        while child.sibling ~= v3 do
            child = child.sibling
            if child == nil then
                error("Expected to find the previous sibling.")
            end
        end
        child.sibling = v2
    else
        return_.child = a3
        v1 = a1
    end
    local deletions = return_.deletions
    if deletions ~= nil then
        table.insert(deletions, v1)
    else
        return_.deletions = {v1}
        return_.flags = bit32.bor(return_.flags, Deletion)
    end
    v2.flags = bit32.bor(v2.flags, Placement)
    return v2
end

function u458.beginWork(a1, a2, a3) -- Line: 3263
    -- upvalues: __DEV__ (val), createFiberFromTypeAndProps (val), hasContextChanged (val), u461 (ref)
    -- upvalues: ReactFiberLane (val), HostRoot (val), pushTopLevelContextObject (val), pushHostContainer (val)
    -- upvalues: resetHydrationState (val), HostComponent (val), pushHostContext (val), ClassComponent (val)
    -- upvalues: isContextProvider (val), pushContextProvider (val), HostPortal (val), ContextProvider (val)
    -- upvalues: pushProvider (val), Profiler (val), enableProfilerTimer (val), SuspenseComponent (val)
    -- upvalues: enableSuspenseServerRenderer (val), pushSuspenseContext (val), setDefaultShallowSuspenseContext (val)
    -- upvalues: suspenseStackCursor (val), DidCapture (val), updateSuspenseComponent (val)
    -- upvalues: bailoutOnAlreadyFinishedWork (ref), SuspenseListComponent (val), OffscreenComponent (val)
    -- upvalues: LegacyHiddenComponent (val), updateOffscreenComponent (val), ForceUpdateForLegacySuspense (val)
    -- upvalues: NoFlags (val), ReactWorkTags (val), mountIndeterminateComponent (val), LazyComponent (val)
    -- upvalues: mountLazyComponent (val), FunctionComponent (val), resolveDefaultProps (val)
    -- upvalues: updateFunctionComponent (ref), updateClassComponent (val), updateHostRoot (val)
    -- upvalues: updateHostComponent (val), HostText (val), tryToClaimNextHydratableInstance (val), ForwardRef (val)
    -- upvalues: updateForwardRef (val), Fragment (val), Mode (val), updateContextProvider (val), ContextConsumer (val)
    -- upvalues: MemoComponent (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val)
    -- upvalues: getComponentName (val), updateMemoComponent (val), SimpleMemoComponent (val)
    -- upvalues: updateSimpleMemoComponent (ref), IncompleteClassComponent (val), updateOffscreenComponent (val)
    -- upvalues: invariant (val)
    local lanes, memoizedState, pendingContext, pendingProps_2, pendingProps_3, pendingProps_4, pendingProps_6, propTypes, stateNode, stateNode_2, type_4, type_5, type_6, type_7, type_8, v1, v2, v3, v4, validateProps
    local dispatch = 0
    while true do
        if dispatch < 60 then
            if dispatch < 30 then
                if dispatch < 15 then
                    if dispatch < 7 then
                        if dispatch < 3 then
                            if dispatch < 1 then
                                lanes = a2.lanes
                            else
                                dispatch = if dispatch < 2 then if not a2._debugNeedsRemount then 4 else 2 else if a1 == nil then 4 else 3
                            end
                        elseif not (dispatch < 5) then
                            dispatch = if dispatch < 6 then if a1.memoizedProps ~= a2.pendingProps then 14 else 6 else if hasContextChanged() then 14 else 7
                        elseif dispatch < 4 then
                            return remountFiber(
                                a1,
                                a2,
                                createFiberFromTypeAndProps(a2.type, a2.key, a2.pendingProps, a2._debugOwner or nil, a2.mode, a2.lanes)
                            )
                        else
                            dispatch = if a1 == nil then 57 else 5
                        end
                    elseif dispatch < 11 then
                        if dispatch < 9 then
                            dispatch = if dispatch < 8 then if not __DEV__ then 12 else 8 else if a2.type ~= a1.type then 10 else 9
                        else
                            v2 = not (dispatch < 10)
                        end
                    elseif dispatch < 13 then
                        if not (dispatch < 12) then end
                    elseif not (dispatch < 14) then
                        u461 = true
                    end
                elseif dispatch < 22 then
                    if dispatch < 18 then
                        if dispatch < 16 then
                            dispatch = if ReactFiberLane.includesSomeLane(a3, lanes) then 54 else 16
                        elseif dispatch < 17 then
                            u461 = false
                            dispatch = if a2.tag ~= HostRoot then 25 else 17
                        else
                            stateNode = a2.stateNode
                            dispatch = if not stateNode.pendingContext then 22 else 18
                        end
                    elseif dispatch < 20 then
                        if dispatch < 19 then
                            pendingContext = stateNode.pendingContext
                            dispatch = if stateNode.pendingContext ~= stateNode.context then 20 else 19
                        end
                    elseif not (dispatch < 21) then
                        v3(a2, pendingContext, v1)
                    end
                elseif dispatch < 26 then
                    if dispatch < 24 then
                        if dispatch < 23 then
                            dispatch = if not stateNode.context then 24 else 23
                        else
                            pushTopLevelContextObject(a2, stateNode.context, false)
                        end
                    elseif dispatch < 25 then
                        pushHostContainer(a2, stateNode.containerInfo)
                        resetHydrationState()
                    else
                        dispatch = if a2.tag ~= HostComponent then 27 else 26
                    end
                elseif dispatch < 28 then
                    if dispatch < 27 then
                        pushHostContext(a2)
                    else
                        dispatch = if a2.tag ~= ClassComponent then 30 else 28
                    end
                elseif dispatch < 29 then
                    dispatch = if not isContextProvider(a2.type) then 53 else 29
                else
                    pushContextProvider(a2)
                end
            elseif dispatch < 45 then
                if dispatch < 37 then
                    if dispatch < 33 then
                        if dispatch < 31 then
                            dispatch = if a2.tag ~= HostPortal then 32 else 31
                        elseif dispatch < 32 then
                            pushHostContainer(a2, a2.stateNode.containerInfo)
                        else
                            dispatch = if a2.tag ~= ContextProvider then 34 else 33
                        end
                    elseif dispatch < 35 then
                        if dispatch < 34 then
                            pushProvider(a2, a2.memoizedProps.value)
                        else
                            dispatch = if a2.tag ~= Profiler then 37 else 35
                        end
                    elseif not (dispatch < 36) then
                        stateNode_2 = a2.stateNode
                        stateNode_2.effectDuration = 0
                        stateNode_2.passiveEffectDuration = 0
                    end
                elseif dispatch < 41 then
                    if not (dispatch < 39) then
                        dispatch = if dispatch < 40 then if not enableSuspenseServerRenderer then 42 else 40 else if memoizedState.dehydrated == nil then 42 else 41
                    elseif dispatch < 38 then
                        dispatch = if a2.tag ~= SuspenseComponent then 48 else 38
                    else
                        memoizedState = a2.memoizedState
                        dispatch = if memoizedState == nil then 47 else 39
                    end
                elseif dispatch < 43 then
                    if dispatch < 42 then
                        pushSuspenseContext(a2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                        a2.flags = bit32.bor(a2.flags, DidCapture)
                        return nil
                    else
                        dispatch = if not ReactFiberLane.includesSomeLane(a3, a2.child.childLanes) then 44 else 43
                    end
                elseif dispatch < 44 then
                    return updateSuspenseComponent(a1, a2, a3)
                else
                    pushSuspenseContext(a2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                    v4 = bailoutOnAlreadyFinishedWork(a1, a2, a3)
                    dispatch = if v4 == nil then 46 else 45
                end
            elseif dispatch < 52 then
                if dispatch < 48 then
                    if dispatch < 46 then
                        return v4.sibling
                    elseif dispatch < 47 then
                        return nil
                    else
                        pushSuspenseContext(a2, setDefaultShallowSuspenseContext(suspenseStackCursor.current))
                    end
                elseif not (dispatch < 50) then
                    dispatch = if dispatch < 51 then if a2.tag == OffscreenComponent then 52 else 51 else if a2.tag ~= LegacyHiddenComponent then 53 else 52
                elseif dispatch < 49 then
                    dispatch = if a2.tag ~= SuspenseListComponent then 50 else 49
                else
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"))
                    error("FIXME (roblox): beginWork: SuspenseListComponent is unimplemented", 2)
                end
            elseif dispatch < 56 then
                if dispatch < 54 then
                    if not (dispatch < 53) then
                        return bailoutOnAlreadyFinishedWork(a1, a2, a3)
                    end
                    a2.lanes = ReactFiberLane.NoLanes
                    return (updateOffscreenComponent(a1, a2, a3))
                elseif dispatch < 55 then
                    dispatch = if (bit32.band(a1.flags, ForceUpdateForLegacySuspense)) == NoFlags then 56 else 55
                else
                    u461 = true
                end
            elseif not (dispatch < 58) then
                if not (dispatch < 59) then
                    return mountIndeterminateComponent(a1, a2, a2.type, a3)
                end
                a2.lanes = ReactFiberLane.NoLanes
                dispatch = if a2.tag ~= ReactWorkTags.IndeterminateComponent then 60 else 59
            else
                if dispatch < 57 then end
                u461 = false
            end
        elseif dispatch < 90 then
            if dispatch < 75 then
                if dispatch < 67 then
                    if dispatch < 63 then
                        if dispatch < 61 then
                            dispatch = if a2.tag ~= LazyComponent then 62 else 61
                        elseif dispatch < 62 then
                            return (mountLazyComponent(a1, a2, a2.elementType, lanes, a3))
                        else
                            dispatch = if a2.tag ~= FunctionComponent then 67 else 63
                        end
                    elseif not (dispatch < 65) then
                        if not (dispatch < 66) then
                            return updateFunctionComponent(a1, a2, type_4, v2, a3)
                        end
                        v2 = resolveDefaultProps(type_4, pendingProps_2)
                    elseif dispatch < 64 then
                        type_4 = a2.type
                        pendingProps_2 = a2.pendingProps
                        dispatch = if a2.elementType ~= type_4 then 65 else 64
                    end
                elseif dispatch < 71 then
                    if dispatch < 69 then
                        if dispatch < 68 then
                            dispatch = if a2.tag ~= ClassComponent then 72 else 68
                        else
                            type_5 = a2.type
                            pendingProps_3 = a2.pendingProps
                            dispatch = if a2.elementType ~= type_5 then 70 else 69
                        end
                    elseif not (dispatch < 70) then
                        v2 = resolveDefaultProps(type_5, pendingProps_3)
                    end
                elseif dispatch < 73 then
                    if dispatch < 72 then
                        return (updateClassComponent(a1, a2, type_5, v2, a3))
                    else
                        dispatch = if a2.tag ~= HostRoot then 74 else 73
                    end
                elseif dispatch < 74 then
                    return updateHostRoot(a1, a2, a3)
                else
                    dispatch = if a2.tag ~= HostComponent then 76 else 75
                end
            elseif dispatch < 82 then
                if dispatch < 78 then
                    if dispatch < 76 then
                        return (updateHostComponent(a1, a2, a3))
                    else
                        dispatch = if dispatch < 77 then if a2.tag ~= HostText then 80 else 77 else if a1 ~= nil then 79 else 78
                    end
                elseif dispatch < 80 then
                    if not (dispatch < 79) then
                        return nil
                    end
                    tryToClaimNextHydratableInstance(a2)
                else
                    if not (dispatch < 81) then
                        return updateSuspenseComponent(a1, a2, a3)
                    end
                    dispatch = if a2.tag ~= SuspenseComponent then 82 else 81
                end
            elseif dispatch < 86 then
                if dispatch < 84 then
                    if not (dispatch < 83) then
                        return updatePortalComponent(a1, a2, a3)
                    end
                    dispatch = if a2.tag ~= HostPortal then 84 else 83
                elseif dispatch < 85 then
                    dispatch = if a2.tag ~= ForwardRef then 88 else 85
                else
                    type_6 = a2.type
                    v2 = a2.pendingProps
                    dispatch = if a2.elementType == type_6 then 87 else 86
                end
            elseif dispatch < 88 then
                if not (dispatch < 87) then
                    return updateForwardRef(a1, a2, type_6, v2, a3)
                end
                v2 = resolveDefaultProps(type_6, pendingProps_4)
            else
                if not (dispatch < 89) then
                    return updateFragment(a1, a2, a3)
                end
                dispatch = if a2.tag ~= Fragment then 90 else 89
            end
        elseif dispatch < 105 then
            if dispatch < 97 then
                if dispatch < 93 then
                    if dispatch < 91 then
                        dispatch = if a2.tag ~= Mode then 92 else 91
                    elseif dispatch < 92 then
                        return updateMode(a1, a2, a3)
                    else
                        dispatch = if a2.tag ~= Profiler then 94 else 93
                    end
                elseif dispatch < 95 then
                    if dispatch < 94 then
                        return updateProfiler(a1, a2, a3)
                    else
                        dispatch = if a2.tag ~= ContextProvider then 96 else 95
                    end
                elseif dispatch < 96 then
                    return updateContextProvider(a1, a2, a3)
                else
                    dispatch = if a2.tag ~= ContextConsumer then 98 else 97
                end
            elseif dispatch < 101 then
                if dispatch < 99 then
                    if dispatch < 98 then
                        return updateContextConsumer(a1, a2, a3)
                    else
                        dispatch = if a2.tag ~= MemoComponent then 108 else 99
                    end
                elseif dispatch < 100 then
                    v2 = resolveDefaultProps(a2.type, a2.pendingProps)
                end
            elseif dispatch < 103 then
                dispatch = if dispatch < 102 then if a2.type == a2.elementType then 107 else 102 else if type(type_7) ~= "table" then 104 else 103
            elseif dispatch < 104 then
                propTypes = type_7.propTypes
                validateProps = type_7.validateProps
            end
        elseif dispatch < 112 then
            if dispatch < 108 then
                if not (dispatch < 106) then
                    if not (dispatch < 107) then
                        v2 = resolveDefaultProps(type_7.type, v2)
                        return updateMemoComponent(a1, a2, type_7, v2, lanes, a3)
                    end
                    checkPropTypes(propTypes, validateProps, v2, "prop", getComponentName(type_7))
                end
            elseif dispatch < 110 then
                if not (dispatch < 109) then
                    return updateSimpleMemoComponent(a1, a2, a2.type, a2.pendingProps, lanes, a3)
                end
                dispatch = if a2.tag ~= SimpleMemoComponent then 110 else 109
            elseif dispatch < 111 then
                dispatch = if a2.tag ~= IncompleteClassComponent then 115 else 111
            else
                type_8 = a2.type
                pendingProps_6 = a2.pendingProps
                dispatch = if a2.elementType ~= type_8 then 113 else 112
            end
        elseif not (dispatch < 116) then
            if not (dispatch < 118) then
                if dispatch < 119 then
                    return (updateOffscreenComponent(a1, a2, a3))
                end
                invariant(
                    false,
                    "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.",
                    (tostring(a2.tag))
                )
                return nil
            end
            if dispatch < 117 then
                return (updateOffscreenComponent(a1, a2, a3))
            else
                dispatch = if a2.tag ~= LegacyHiddenComponent then 119 else 118
            end
        elseif dispatch < 114 then
            if not (dispatch < 113) then
                v2 = resolveDefaultProps(type_8, pendingProps_6)
            end
        elseif dispatch < 115 then
            return mountIncompleteClassComponent(a1, a2, type_8, v2, a3)
        else
            dispatch = if a2.tag ~= OffscreenComponent then 117 else 116
        end
    end
end

return u458