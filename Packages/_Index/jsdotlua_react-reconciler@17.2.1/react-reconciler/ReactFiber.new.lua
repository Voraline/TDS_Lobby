-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiber.new
-- Decompile time: 16.60 ms

local __DEV__ = _G.__DEV__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local Array = v1.Array
local inspect = v1.util.inspect
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactRootTags = require(script.Parent:WaitForChild("ReactRootTags"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local enableProfilerTimer = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableProfilerTimer
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local Placement = ReactFiberFlags.Placement
local StaticMask = ReactFiberFlags.StaticMask
local ConcurrentRoot = ReactRootTags.ConcurrentRoot
local BlockingRoot = ReactRootTags.BlockingRoot
local IndeterminateComponent = ReactWorkTags.IndeterminateComponent
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
local DehydratedFragment = ReactWorkTags.DehydratedFragment
local FunctionComponent = ReactWorkTags.FunctionComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local LazyComponent = ReactWorkTags.LazyComponent
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local ScopeComponent = ReactWorkTags.ScopeComponent
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local isDevToolsPresent = (require((script.Parent:WaitForChild("ReactFiberDevToolsHook.new")))).isDevToolsPresent
local v2 = require(script.Parent:WaitForChild("ReactFiberHotReloading.new"))
local resolveClassForHotReloading = v2.resolveClassForHotReloading
local resolveFunctionForHotReloading = v2.resolveFunctionForHotReloading
local resolveForwardRefForHotReloading = v2.resolveForwardRefForHotReloading
local NoLanes = ReactFiberLane.NoLanes
local NoMode = ReactTypeOfMode.NoMode
local ConcurrentMode = ReactTypeOfMode.ConcurrentMode
local DebugTracingMode = ReactTypeOfMode.DebugTracingMode
local ProfileMode = ReactTypeOfMode.ProfileMode
local StrictMode = ReactTypeOfMode.StrictMode
local BlockingMode = ReactTypeOfMode.BlockingMode
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_DEBUG_TRACING_MODE_TYPE = ReactSymbols.REACT_DEBUG_TRACING_MODE_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_OFFSCREEN_TYPE = ReactSymbols.REACT_OFFSCREEN_TYPE
local REACT_LEGACY_HIDDEN_TYPE = ReactSymbols.REACT_LEGACY_HIDDEN_TYPE
local createFiberFromProfiler = nil
local createFiberFromFragment = nil
local createFiberFromSuspense = nil
local createFiberFromOffscreen = nil
local createFiberFromLegacyHidden = nil
local u216 = 1

local function createFiber(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 164
    -- upvalues: NoFlags (val), NoLanes (val), enableProfilerTimer (val), __DEV__ (val), u216 (ref)
    local v1 = {
        index = 1,
        tag = a1,
        key = a3,
        elementType = a5,
        type = a6,
        stateNode = a7,
        pendingProps = a2,
        mode = a4,
        flags = NoFlags,
        subtreeFlags = NoFlags,
        lanes = if not a8 then NoLanes else a8,
        childLanes = NoLanes,
    }
    if enableProfilerTimer then
        v1.actualDuration = 0
        v1.actualStartTime = -1
        v1.selfBaseDuration = 0
        v1.treeBaseDuration = 0
    end
    if __DEV__ then
        v1._debugID = u216
        u216 = u216 + 1
        v1._debugSource = nil
        v1._debugOwner = nil
        v1._debugNeedsRemount = false
        v1._debugHookTypes = nil
    end
    return v1
end

function _shouldConstruct(a1) -- Line: 264
    local v1 = false
    if type(a1) ~= "function" then
        v1 = not not a1.isReactComponent
    end
    return v1
end

local function createFiberFromTypeAndProps(a1, a2, a3, a4, a5, a6) -- Line: 502
    -- upvalues: IndeterminateComponent (val), __DEV__ (val), resolveFunctionForHotReloading (val), ClassComponent (val)
    -- upvalues: resolveClassForHotReloading (val), HostComponent (val), REACT_FRAGMENT_TYPE (val)
    -- upvalues: createFiberFromFragment (ref), REACT_DEBUG_TRACING_MODE_TYPE (val), Mode (val), DebugTracingMode (val)
    -- upvalues: REACT_STRICT_MODE_TYPE (val), StrictMode (val), REACT_PROFILER_TYPE (val)
    -- upvalues: createFiberFromProfiler (ref), REACT_SUSPENSE_TYPE (val), createFiberFromSuspense (ref)
    -- upvalues: REACT_OFFSCREEN_TYPE (val), createFiberFromOffscreen (ref), REACT_LEGACY_HIDDEN_TYPE (val)
    -- upvalues: createFiberFromLegacyHidden (ref), REACT_PROVIDER_TYPE (val), ContextProvider (val)
    -- upvalues: REACT_CONTEXT_TYPE (val), ContextConsumer (val), REACT_FORWARD_REF_TYPE (val), ForwardRef (val)
    -- upvalues: resolveForwardRefForHotReloading (val), REACT_MEMO_TYPE (val), MemoComponent (val)
    -- upvalues: REACT_LAZY_TYPE (val), LazyComponent (val), Object (val), inspect (val), getComponentName (val)
    -- upvalues: Array (val), REACT_ELEMENT_TYPE (val), invariant (val), createFiber (val)
    local v1
    local v2 = IndeterminateComponent
    local v3 = a1
    local v4 = type(a1)
    if v4 == "function" then
        if __DEV__ then
            v3 = resolveFunctionForHotReloading(v3)
        end
        v1 = createFiber(v2, a3, a2, a5, a1, v3, nil, a6)
        if __DEV__ then
            v1._debugOwner = a4
        end
        return v1
    end
    if v4 == "table" and a1.isReactComponent then
        if __DEV__ then
            v3 = resolveClassForHotReloading(v3)
        end
        v1 = createFiber(ClassComponent, a3, a2, a5, a1, v3, nil, a6)
        if __DEV__ then
            v1._debugOwner = a4
        end
        return v1
    end
    if v4 == "string" then
        v1 = createFiber(HostComponent, a3, a2, a5, a1, v3, nil, a6)
        if __DEV__ then
            v1._debugOwner = a4
        end
        return v1
    end
    if a1 == REACT_FRAGMENT_TYPE then
        return createFiberFromFragment(a3.children, a5, a6, a2)
    end
    if a1 == REACT_DEBUG_TRACING_MODE_TYPE then
        a5 = bit32.bor(a5, DebugTracingMode)
        v1 = createFiber(Mode, a3, a2, a5, a1, v3, nil, a6)
        if __DEV__ then
            v1._debugOwner = a4
        end
        return v1
    end
    if a1 == REACT_STRICT_MODE_TYPE then
        a5 = bit32.bor(a5, StrictMode)
        v1 = createFiber(Mode, a3, a2, a5, a1, v3, nil, a6)
        if __DEV__ then
            v1._debugOwner = a4
        end
        return v1
    end
    if a1 == REACT_PROFILER_TYPE then
        return createFiberFromProfiler(a3, a5, a6, a2)
    end
    if a1 == REACT_SUSPENSE_TYPE then
        return createFiberFromSuspense(a3, a5, a6, a2)
    end
    if a1 == REACT_OFFSCREEN_TYPE then
        return createFiberFromOffscreen(a3, a5, a6, a2)
    end
    if a1 == REACT_LEGACY_HIDDEN_TYPE then
        return createFiberFromLegacyHidden(a3, a5, a6, a2)
    end
    v1 = false
    local v5 = nil
    if v4 == "table" then
        v5 = a1["$$typeof"]
        if v5 == REACT_PROVIDER_TYPE then
            v2 = ContextProvider
            v1 = true
        elseif v5 == REACT_CONTEXT_TYPE then
            v2 = ContextConsumer
            v1 = true
        elseif v5 == REACT_FORWARD_REF_TYPE then
            v2 = ForwardRef
            if __DEV__ then
                v3 = resolveForwardRefForHotReloading(v3)
            end
            v1 = true
        elseif v5 == REACT_MEMO_TYPE then
            v2 = MemoComponent
            v1 = true
        elseif v5 == REACT_LAZY_TYPE then
            v2 = LazyComponent
            v3 = nil
            v1 = true
        end
    end
    if not v1 then
        local v6
        local v7 = ""
        if __DEV__ then
            if a1 == nil then
                v7 = v7 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
            elseif v4 ~= "table" then
                if a1 ~= nil and v4 == "table" then
                    v7 = v7 .. "\n" .. inspect(a1)
                end
            elseif #Object.keys(a1) == 0 then
                v7 = v7 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
            elseif a1 ~= nil and v4 == "table" then
                v7 = v7 .. "\n" .. inspect(a1)
            end
            v6 = nil
            if a4 then
                v6 = getComponentName(a4.type)
            end
            if v6 == nil then
                if a4 then
                    v7 = v7 .. "\n" .. inspect(a4)
                end
            elseif v6 ~= "" then
                v7 = v7 .. "\n\nCheck the render method of `" .. v6 .. "`."
            elseif a4 then
                v7 = v7 .. "\n" .. inspect(a4)
            end
        end
        if a1 == nil then
            v6 = "nil"
        elseif Array.isArray(a1) then
            v6 = "array"
        elseif v4 ~= "table" or v5 ~= REACT_ELEMENT_TYPE then
            v6 = v4
        else
            v6 = string.format("<%s />", getComponentName(a1.type) or "Unknown")
            v7 = " Did you accidentally export a JSX literal or Element instead of a component?"
        end
        invariant(
            false,
            "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s",
            v6,
            v7
        )
    end
    v1 = createFiber(v2, a3, a2, a5, a1, v3, nil, a6)
    if __DEV__ then
        v1._debugOwner = a4
    end
    return v1
end

function createFiberFromFragment(a1, a2, a3, a4) -- Line: 684
    -- upvalues: createFiber (val), Fragment (val)
    return (createFiber(Fragment, a1, a4, a2, nil, nil, nil, a3))
end

local function createFiberFromScope(a1, a2, a3, a4, a5) -- Line: 722
    -- upvalues: createFiber (val), ScopeComponent (val)
    return (createFiber(ScopeComponent, a2, a5, a3, a1, a1, nil, a4))
end

function createFiberFromProfiler(a1, a2, a3, a4) -- Line: 739
    -- upvalues: __DEV__ (val), console (val), createFiber (val), Profiler (val), ProfileMode (val)
    -- upvalues: REACT_PROFILER_TYPE (val), enableProfilerTimer (val)
    if __DEV__ and typeof(a1.id) ~= "string" then
        console.error("Profiler must specify an \"id\" as a prop")
    end
    return (createFiber(
        Profiler,
        a1,
        a4,
        bit32.bor(a2, ProfileMode),
        REACT_PROFILER_TYPE,
        REACT_PROFILER_TYPE,
        if not enableProfilerTimer then nil else {effectDuration = 0, passiveEffectDuration = 0},
        a3
    ))
end

function createFiberFromSuspense(a1, a2, a3, a4) -- Line: 783
    -- upvalues: createFiber (val), SuspenseComponent (val), REACT_SUSPENSE_TYPE (val)
    return (createFiber(SuspenseComponent, a1, a4, a2, REACT_SUSPENSE_TYPE, REACT_SUSPENSE_TYPE, nil, a3))
end

function createFiberFromOffscreen(a1, a2, a3, a4) -- Line: 841
    -- upvalues: createFiber (val), OffscreenComponent (val), REACT_OFFSCREEN_TYPE (val), __DEV__ (val)
    return (createFiber(OffscreenComponent, a1, a4, a2, REACT_OFFSCREEN_TYPE, if not __DEV__ then nil else REACT_OFFSCREEN_TYPE, nil, a3))
end

function createFiberFromLegacyHidden(a1, a2, a3, a4) -- Line: 870
    -- upvalues: createFiber (val), LegacyHiddenComponent (val), REACT_LEGACY_HIDDEN_TYPE (val), __DEV__ (val)
    return (createFiber(LegacyHiddenComponent, a1, a4, a2, REACT_LEGACY_HIDDEN_TYPE, if not __DEV__ then nil else REACT_LEGACY_HIDDEN_TYPE, nil, a3))
end

return {
    isSimpleFunctionComponent = function(a1) -- Line: 271
        return type(a1) == "function"
    end,
    resolveLazyComponentTag = function(a1) -- Line: 279
        -- upvalues: FunctionComponent (val), ClassComponent (val), REACT_FORWARD_REF_TYPE (val), ForwardRef (val)
        -- upvalues: REACT_MEMO_TYPE (val), MemoComponent (val), IndeterminateComponent (val)
        local v1 = typeof(a1)
        if v1 == "function" then
            return FunctionComponent
        end
        if v1 == "table" then
            if a1.isReactComponent then
                return ClassComponent
            end
            local v2 = a1["$$typeof"]
            if v2 == REACT_FORWARD_REF_TYPE then
                return ForwardRef
            end
            if v2 == REACT_MEMO_TYPE then
                return MemoComponent
            end
        end
        return IndeterminateComponent
    end,
    createWorkInProgress = function(a1, a2) -- Line: 302
        -- upvalues: createFiber (val), __DEV__ (val), NoFlags (val), enableProfilerTimer (val), StaticMask (val)
        -- upvalues: IndeterminateComponent (val), FunctionComponent (val), SimpleMemoComponent (val)
        -- upvalues: resolveFunctionForHotReloading (val), ClassComponent (val), resolveClassForHotReloading (val)
        -- upvalues: ForwardRef (val), resolveForwardRefForHotReloading (val)
        local alternate = a1.alternate
        if alternate ~= nil then
            alternate.pendingProps = a2
            alternate.type = a1.type
            alternate.flags = NoFlags
            alternate.subtreeFlags = NoFlags
            alternate.deletions = nil
            if enableProfilerTimer then
                alternate.actualDuration = 0
                alternate.actualStartTime = -1
            end
        else
            alternate = createFiber(a1.tag, a2, a1.key, a1.mode, a1.elementType, a1.type, a1.stateNode)
            if __DEV__ then
                alternate._debugID = a1._debugID
                alternate._debugSource = a1._debugSource
                alternate._debugOwner = a1._debugOwner
                alternate._debugHookTypes = a1._debugHookTypes
            end
            alternate.alternate = a1
            a1.alternate = alternate
        end
        alternate.flags = bit32.band(a1.flags, StaticMask)
        alternate.childLanes = a1.childLanes
        alternate.lanes = a1.lanes
        alternate.child = a1.child
        alternate.memoizedProps = a1.memoizedProps
        alternate.memoizedState = a1.memoizedState
        alternate.updateQueue = a1.updateQueue
        local dependencies = a1.dependencies
        if dependencies ~= nil then
            alternate.dependencies = {lanes = dependencies.lanes, firstContext = dependencies.firstContext}
        else
            alternate.dependencies = nil
        end
        alternate.sibling = a1.sibling
        alternate.index = a1.index
        alternate.ref = a1.ref
        if enableProfilerTimer then
            alternate.selfBaseDuration = a1.selfBaseDuration
            alternate.treeBaseDuration = a1.treeBaseDuration
        end
        if not __DEV__ then
            return alternate
        end
        alternate._debugNeedsRemount = a1._debugNeedsRemount
        if alternate.tag ~= IndeterminateComponent
            and alternate.tag ~= FunctionComponent
            and alternate.tag ~= SimpleMemoComponent then
            if alternate.tag == ClassComponent then
                alternate.type = resolveClassForHotReloading(a1.type)
                return alternate
            end
            if alternate.tag == ForwardRef then
                alternate.type = resolveForwardRefForHotReloading(a1.type)
            end
            return alternate
        end
        alternate.type = resolveFunctionForHotReloading(a1.type)
        return alternate
    end,
    resetWorkInProgress = function(a1, a2) -- Line: 406
        -- upvalues: StaticMask (val), Placement (val), NoLanes (val), NoFlags (val), enableProfilerTimer (val)
        a1.flags = bit32.band(a1.flags, (bit32.bor(StaticMask, Placement)))
        local alternate = a1.alternate
        if alternate == nil then
            a1.childLanes = NoLanes
            a1.lanes = a2
            a1.child = nil
            a1.subtreeFlags = NoFlags
            a1.memoizedProps = nil
            a1.memoizedState = nil
            a1.updateQueue = nil
            a1.dependencies = nil
            a1.stateNode = nil
            if not enableProfilerTimer then
                return a1
            end
            a1.selfBaseDuration = 0
            a1.treeBaseDuration = 0
            return a1
        end
        a1.childLanes = alternate.childLanes
        a1.lanes = alternate.lanes
        a1.child = alternate.child
        a1.subtreeFlags = alternate.subtreeFlags
        a1.deletions = nil
        a1.memoizedProps = alternate.memoizedProps
        a1.memoizedState = alternate.memoizedState
        a1.updateQueue = alternate.updateQueue
        a1.type = alternate.type
        local dependencies = alternate.dependencies
        if dependencies ~= nil then
            a1.dependencies = {lanes = dependencies.lanes, firstContext = dependencies.firstContext}
        else
            a1.dependencies = nil
        end
        if enableProfilerTimer then
            a1.selfBaseDuration = alternate.selfBaseDuration
            a1.treeBaseDuration = alternate.treeBaseDuration
        end
        return a1
    end,
    createHostRootFiber = function(a1) -- Line: 481
        -- upvalues: ConcurrentRoot (val), ConcurrentMode (val), BlockingMode (val), StrictMode (val)
        -- upvalues: BlockingRoot (val), NoMode (val), enableProfilerTimer (val), isDevToolsPresent (val)
        -- upvalues: ProfileMode (val), createFiber (val), HostRoot (val)
        local v1 = if a1 == ConcurrentRoot then bit32.bor(ConcurrentMode, BlockingMode, StrictMode) else if a1 ~= BlockingRoot then NoMode else bit32.bor(BlockingMode, StrictMode)
        if enableProfilerTimer and isDevToolsPresent() then
            v1 = bit32.bor(v1, ProfileMode)
        end
        return (createFiber(HostRoot, nil, nil, v1))
    end,
    createFiberFromTypeAndProps = createFiberFromTypeAndProps,
    createFiberFromElement = function(a1, a2, a3) -- Line: 656 -- upvalues: __DEV__ (val), createFiberFromTypeAndProps (val)
        local _owner = nil
        if __DEV__ then
            _owner = a1._owner
        end
        local v1 = createFiberFromTypeAndProps(a1.type, a1.key, a1.props, _owner, a2, a3)
        if __DEV__ then
            v1._debugSource = a1._source
            v1._debugOwner = a1._owner
        end
        return v1
    end,
    createFiberFromFragment = createFiberFromFragment,
    createFiberFromFundamental = function(a1, a2, a3, a4, a5) -- Line: 697
        -- upvalues: createFiber (val), FundamentalComponent (val)
        return (createFiber(FundamentalComponent, a2, a5, a3, a1, a1, nil, a4))
    end,
    createFiberFromSuspense = createFiberFromSuspense,
    createFiberFromSuspenseList = function(a1, a2, a3, a4) -- Line: 812
        -- upvalues: createFiber (val), SuspenseListComponent (val), REACT_SUSPENSE_LIST_TYPE (val), __DEV__ (val)
        return (createFiber(
            SuspenseListComponent,
            a1,
            a4,
            a2,
            REACT_SUSPENSE_LIST_TYPE,
            if not __DEV__ then nil else REACT_SUSPENSE_LIST_TYPE,
            nil,
            a3
        ))
    end,
    createFiberFromOffscreen = createFiberFromOffscreen,
    createFiberFromLegacyHidden = createFiberFromLegacyHidden,
    createFiberFromText = function(a1, a2, a3) -- Line: 899 -- upvalues: createFiber (val), HostText (val) -- types: a1: string
        return (createFiber(HostText, a1, nil, a2, nil, nil, nil, a3))
    end,
    createFiberFromHostInstanceForDeletion = function() -- Line: 907 -- upvalues: createFiber (val), HostComponent (val), NoMode (val)
        return (createFiber(HostComponent, nil, nil, NoMode, "DELETED", "DELETED"))
    end,
    createFiberFromDehydratedFragment = function(a1) -- Line: 917 -- upvalues: createFiber (val), DehydratedFragment (val), NoMode (val)
        return (createFiber(DehydratedFragment, nil, nil, NoMode, nil, nil, a1))
    end,
    createFiberFromPortal = function(a1, a2, a3) -- Line: 926 -- upvalues: createFiber (val), HostPortal (val)
        return (createFiber(
            HostPortal,
            if a1.children == nil then {} else a1.children,
            a1.key,
            a2,
            nil,
            nil,
            {containerInfo = a1.containerInfo, implementation = a1.implementation},
            a3
        ))
    end,
    assignFiberPropertiesInDEV = function(a1, a2) -- Line: 950
        -- upvalues: createFiber (val), IndeterminateComponent (val), NoMode (val), enableProfilerTimer (val)
        if a1 == nil then
            a1 = createFiber(IndeterminateComponent, nil, nil, NoMode)
        end
        a1.tag = a2.tag
        a1.key = a2.key
        a1.elementType = a2.elementType
        a1.type = a2.type
        a1.stateNode = a2.stateNode
        a1.return_ = a2.return_
        a1.child = a2.child
        a1.sibling = a2.sibling
        a1.index = a2.index
        a1.ref = a2.ref
        a1.pendingProps = a2.pendingProps
        a1.memoizedProps = a2.memoizedProps
        a1.updateQueue = a2.updateQueue
        a1.memoizedState = a2.memoizedState
        a1.dependencies = a2.dependencies
        a1.mode = a2.mode
        a1.flags = a2.flags
        a1.subtreeFlags = a2.subtreeFlags
        a1.deletions = a2.deletions
        a1.lanes = a2.lanes
        a1.childLanes = a2.childLanes
        a1.alternate = a2.alternate
        if enableProfilerTimer then
            a1.actualDuration = a2.actualDuration
            a1.actualStartTime = a2.actualStartTime
            a1.selfBaseDuration = a2.selfBaseDuration
            a1.treeBaseDuration = a2.treeBaseDuration
        end
        a1._debugID = a2._debugID
        a1._debugSource = a2._debugSource
        a1._debugOwner = a2._debugOwner
        a1._debugNeedsRemount = a2._debugNeedsRemount
        a1._debugHookTypes = a2._debugHookTypes
        return a1
    end,
}