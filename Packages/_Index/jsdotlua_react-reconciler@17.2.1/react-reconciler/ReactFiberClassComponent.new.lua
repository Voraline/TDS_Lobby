-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberClassComponent.new
-- Decompile time: 33.98 ms

local __DEV__ = _G.__DEV__
local Object = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local v1 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
local react = require(script.Parent.Parent:WaitForChild("react"))
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Update = ReactFiberFlags.Update
local Snapshot = ReactFiberFlags.Snapshot
local MountLayoutDev = ReactFiberFlags.MountLayoutDev
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local debugRenderPhaseSideEffectsForStrictMode = ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local disableLegacyContext = ReactFeatureFlags.disableLegacyContext
local enableDebugTracing = ReactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local warnAboutDeprecatedLifecycles = ReactFeatureFlags.warnAboutDeprecatedLifecycles
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local u98 = require(script.Parent:WaitForChild("ReactStrictModeWarnings.new"))
local isMounted = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).isMounted
local ReactInstanceMap = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap
local get = ReactInstanceMap.get
local set = ReactInstanceMap.set
local shallowEqual = require(script.Parent.Parent:WaitForChild("shared")).shallowEqual
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local UninitializedState = require(script.Parent.Parent:WaitForChild("shared")).UninitializedState
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local resolveDefaultProps = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local DebugTracingMode = ReactTypeOfMode.DebugTracingMode
local StrictMode = ReactTypeOfMode.StrictMode
local enqueueUpdate = v1.enqueueUpdate
local processUpdateQueue = v1.processUpdateQueue
local checkHasForceUpdateAfterProcessing = v1.checkHasForceUpdateAfterProcessing
local resetHasForceUpdateBeforeProcessing = v1.resetHasForceUpdateBeforeProcessing
local createUpdate = v1.createUpdate
local ReplaceState = v1.ReplaceState
local ForceUpdate = v1.ForceUpdate
local initializeUpdateQueue = v1.initializeUpdateQueue
local cloneUpdateQueue = v1.cloneUpdateQueue
local NoLanes = ReactFiberLane.NoLanes
local v2 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local cacheContext = v2.cacheContext
local getMaskedContext = v2.getMaskedContext
local getUnmaskedContext = v2.getUnmaskedContext
local hasContextChanged = v2.hasContextChanged
local emptyContextObject = v2.emptyContextObject
local readContext = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).readContext
local DebugTracing = require(script.Parent:WaitForChild("DebugTracing"))
local logForceUpdateScheduled = DebugTracing.logForceUpdateScheduled
local logStateUpdateScheduled = DebugTracing.logStateUpdateScheduled
local ConsolePatchingDev = require(script.Parent.Parent:WaitForChild("shared")).ConsolePatchingDev
local disableLogs = ConsolePatchingDev.disableLogs
local reenableLogs = ConsolePatchingDev.reenableLogs
local SchedulingProfiler = require(script.Parent:WaitForChild("SchedulingProfiler"))
local markForceUpdateScheduled = SchedulingProfiler.markForceUpdateScheduled
local markStateUpdateScheduled = SchedulingProfiler.markStateUpdateScheduled
local u255 = {}
local __refs = react.Component:extend("").__refs
local u272 = nil
local u273 = nil
local u274 = nil
local u275 = nil
local warnOnUndefinedDerivedState = nil
local warnOnInvalidCallback = nil
local u276 = nil
local u278 = nil
local u279 = nil
if __DEV__ then
    u272 = {}
    u273 = {}
    u274 = {}
    u275 = {}
    u276 = {}
    u278 = {}
    u279 = {}
    local u280 = {}

    function warnOnInvalidCallback(a1, a2) -- Line: 137 -- upvalues: u280 (val), console (val) -- types: a2: string
        if a1 ~= nil and type(a1) ~= "function" then
            local v1 = a2 .. "_" .. tostring(a1)
            if not u280[v1] then
                u280[v1] = true
                console.error(
                    "%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.",
                    a2,
                    (tostring(a1))
                )
            end
            return
        end
    end

    function warnOnUndefinedDerivedState(a1, a2) end
end

local function applyDerivedStateFromProps(a1, a2, a3, a4) -- Line: 196
    -- upvalues: __DEV__ (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val)
    -- upvalues: describeError (val), reenableLogs (val), warnOnUndefinedDerivedState (ref), Object (val), NoLanes (val)
    local memoizedState = a1.memoizedState
    if __DEV__ and debugRenderPhaseSideEffectsForStrictMode and bit32.band(a1.mode, StrictMode) ~= 0 then
        disableLogs()
        local success, result = xpcall(a3, describeError, a4, memoizedState)
        reenableLogs()
        if not success then
            error(result)
        end
    end
    local v1 = a3(a4, memoizedState)
    if __DEV__ then
        warnOnUndefinedDerivedState(a2, v1)
    end
    a1.memoizedState = if v1 ~= nil then Object.assign({}, memoizedState, v1) else memoizedState
    if a1.lanes == NoLanes then
        local v2
        a1.updateQueue.baseState = v2
    end
end

local u293 = nil

local function initializeClassComponentUpdater() -- Line: 244
    -- upvalues: u293 (ref), isMounted (val), get (val), createUpdate (val), __DEV__ (val), warnOnInvalidCallback (ref)
    -- upvalues: enqueueUpdate (val), enableDebugTracing (val), DebugTracingMode (val), getComponentName (val)
    -- upvalues: logStateUpdateScheduled (val), enableSchedulingProfiler (val), markStateUpdateScheduled (val)
    -- upvalues: ReplaceState (val), ForceUpdate (val), logForceUpdateScheduled (val), markForceUpdateScheduled (val)
    local v1 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    local requestEventTime = v1.requestEventTime
    local requestUpdateLane = v1.requestUpdateLane
    local scheduleUpdateOnFiber = v1.scheduleUpdateOnFiber
    u293 = {
        isMounted = isMounted,
        enqueueSetState = function(a1, a2, a3) -- Line: 252
            -- upvalues: get (upval), requestEventTime (val), requestUpdateLane (val), createUpdate (upval)
            -- upvalues: __DEV__ (upval), warnOnInvalidCallback (upval), enqueueUpdate (upval)
            -- upvalues: scheduleUpdateOnFiber (val), enableDebugTracing (upval), DebugTracingMode (upval)
            -- upvalues: getComponentName (upval), logStateUpdateScheduled (upval), enableSchedulingProfiler (upval)
            -- upvalues: markStateUpdateScheduled (upval)
            local v1 = get(a1)
            local v2 = requestEventTime()
            local v3 = requestUpdateLane(v1)
            local v4 = createUpdate(v2, v3, a2, a3)
            if a3 ~= nil and __DEV__ then
                warnOnInvalidCallback(a3, "setState")
            end
            enqueueUpdate(v1, v4)
            scheduleUpdateOnFiber(v1, v3, v2)
            if __DEV__ and enableDebugTracing and bit32.band(v1.mode, DebugTracingMode) ~= 0 then
                local v5 = getComponentName(v1.type) or "Unknown"
                logStateUpdateScheduled(v5, v3, a2)
            end
            if enableSchedulingProfiler then
                markStateUpdateScheduled(v1, v3)
            end
        end,
        enqueueReplaceState = function(a1, a2, a3) -- Line: 282
            -- upvalues: get (upval), requestEventTime (val), requestUpdateLane (val), createUpdate (upval)
            -- upvalues: ReplaceState (upval), __DEV__ (upval), warnOnInvalidCallback (upval), enqueueUpdate (upval)
            -- upvalues: scheduleUpdateOnFiber (val), enableDebugTracing (upval), DebugTracingMode (upval)
            -- upvalues: getComponentName (upval), logStateUpdateScheduled (upval), enableSchedulingProfiler (upval)
            -- upvalues: markStateUpdateScheduled (upval)
            local v1 = get(a1)
            local v2 = requestEventTime()
            local v3 = requestUpdateLane(v1)
            local v4 = createUpdate(v2, v3, a2, a3)
            v4.tag = ReplaceState
            if a3 ~= nil and __DEV__ then
                warnOnInvalidCallback(a3, "replaceState")
            end
            enqueueUpdate(v1, v4)
            scheduleUpdateOnFiber(v1, v3, v2)
            if __DEV__ and enableDebugTracing and bit32.band(v1.mode, DebugTracingMode) ~= 0 then
                local v5 = getComponentName(v1.type) or "Unknown"
                logStateUpdateScheduled(v5, v3, a2)
            end
            if enableSchedulingProfiler then
                markStateUpdateScheduled(v1, v3)
            end
        end,
        enqueueForceUpdate = function(a1, a2) -- Line: 314
            -- upvalues: get (upval), requestEventTime (val), requestUpdateLane (val), createUpdate (upval)
            -- upvalues: ForceUpdate (upval), __DEV__ (upval), warnOnInvalidCallback (upval), enqueueUpdate (upval)
            -- upvalues: scheduleUpdateOnFiber (val), enableDebugTracing (upval), DebugTracingMode (upval)
            -- upvalues: getComponentName (upval), logForceUpdateScheduled (upval), enableSchedulingProfiler (upval)
            -- upvalues: markForceUpdateScheduled (upval)
            local v1 = get(a1)
            local v2 = requestEventTime()
            local v3 = requestUpdateLane(v1)
            local v4 = createUpdate(v2, v3, nil, a2)
            v4.tag = ForceUpdate
            if a2 ~= nil and __DEV__ then
                warnOnInvalidCallback(a2, "forceUpdate")
            end
            enqueueUpdate(v1, v4)
            scheduleUpdateOnFiber(v1, v3, v2)
            if __DEV__ and enableDebugTracing and bit32.band(v1.mode, DebugTracingMode) ~= 0 then
                local v5 = getComponentName(v1.type) or "Unknown"
                logForceUpdateScheduled(v5, v3)
            end
            if enableSchedulingProfiler then
                markForceUpdateScheduled(v1, v3)
            end
        end,
    }
end

local function getClassComponentUpdater() -- Line: 348 -- upvalues: u293 (ref), initializeClassComponentUpdater (val)
    if u293 == nil then
        initializeClassComponentUpdater()
    end
    return u293
end

function checkShouldComponentUpdate(a1, a2, a3, a4, a5, a6, a7) -- Line: 355
    -- upvalues: __DEV__ (val), debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val)
    -- upvalues: describeError (val), reenableLogs (val), console (val), getComponentName (val), shallowEqual (val)
    local stateNode = a1.stateNode
    if stateNode.shouldComponentUpdate ~= nil and type(stateNode.shouldComponentUpdate) == "function" then
        if __DEV__ and debugRenderPhaseSideEffectsForStrictMode and bit32.band(a1.mode, StrictMode) ~= 0 then
            disableLogs()
            local success, result = xpcall(stateNode.shouldComponentUpdate, describeError, stateNode, a4, a6, a7)
            reenableLogs()
            if not success then
                error(result)
            end
        end
        local v1 = stateNode:shouldComponentUpdate(a4, a6, a7)
        if __DEV__ and v1 == nil then
            console.error(
                "%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.",
                getComponentName(a2) or "Component"
            )
        end
        return v1
    end
    if type(a2) == "table" and a2.isPureReactComponent then
        return not shallowEqual(a3, a4) or not shallowEqual(a5, a6)
    end
    return true
end

local function checkClassInstance(a1, a2, a3) -- Line: 420
    -- upvalues: __DEV__ (val), getComponentName (val), console (val), disableLegacyContext (val), u278 (ref)
    -- upvalues: u274 (ref)
    local stateNode = a1.stateNode
    if __DEV__ then
        local v1 = getComponentName(a2) or "Component"
        if not stateNode.render then
            if type(a2.render) ~= "function" then
                console.error(
                    "%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.",
                    v1
                )
            else
                console.error(
                    "%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?",
                    v1
                )
            end
        end
        if stateNode.getInitialState
            and not stateNode.getInitialState.isReactClassApproved
            and not stateNode.state then
            console.error(
                "getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?",
                v1
            )
        end
        if stateNode.getDefaultProps and not stateNode.getDefaultProps.isReactClassApproved then
            console.error(
                "getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.",
                v1
            )
        end
        if stateNode.propTypes and not a2.propTypes then
            console.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", v1)
        end
        if stateNode.contextType and not a2.contextType then
            console.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", v1)
        end
        if not disableLegacyContext then
            if stateNode.contextTypes and not a2.contextTypes then
                console.error(
                    "contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.",
                    v1
                )
            end
            if type(a2) == "table" and a2.contextType and a2.contextTypes and not u278[a2] then
                u278[a2] = true
                console.error(
                    "%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.",
                    v1
                )
            end
        else
            if a2.childContextTypes then
                console.error(
                    "%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.",
                    v1
                )
            end
            if a2.contextTypes then
                console.error(
                    "%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.",
                    v1
                )
            end
        end
        if type(stateNode.componentShouldUpdate) == "function" then
            console.error(
                "%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.",
                v1
            )
        end
        if type(a2) == "table" and a2.isPureReactComponent and stateNode.shouldComponentUpdate ~= nil then
            console.error(
                "%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.",
                getComponentName(a2) or "A pure component"
            )
        end
        if type(stateNode.componentDidUnmount) == "function" then
            console.error(
                "%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?",
                v1
            )
        end
        if type(stateNode.componentDidReceiveProps) == "function" then
            console.error(
                "%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().",
                v1
            )
        end
        if type(stateNode.componentWillRecieveProps) == "function" then
            console.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v1)
        end
        if type(stateNode.UNSAFE_componentWillRecieveProps) == "function" then
            console.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v1)
        end
        local v2 = stateNode.props ~= a3
        if stateNode.props ~= nil and v2 then
            console.error(
                "%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.",
                v1,
                v1
            )
        end
        if rawget(stateNode, "defaultProps") then
            console.error(
                "Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.",
                v1,
                v1
            )
        end
        if type(stateNode.getSnapshotBeforeUpdate) == "function"
            and type(stateNode.componentDidUpdate) ~= "function"
            and not u274[a2] then
            u274[a2] = true
            console.error(
                "%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.",
                getComponentName(a2)
            )
        end
        local state = stateNode.state
        if state ~= nil and type(state) ~= "table" then
            console.error("%s.state: must be set to an object or nil", v1)
        end
        if type(a2) == "table"
            and type(stateNode.getChildContext) == "function"
            and type(a2.childContextTypes) ~= "table" then
            console.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", v1)
        end
    end
end

local function callComponentWillMount(a1, a2) -- Line: 880
    -- upvalues: __DEV__ (val), console (val), getComponentName (val), u293 (ref), initializeClassComponentUpdater (val)
    local state = a2.state
    if a2.componentWillMount ~= nil and type(a2.componentWillMount) == "function" then
        a2:componentWillMount()
    end
    if a2.UNSAFE_componentWillMount ~= nil and type(a2.UNSAFE_componentWillMount) == "function" then
        a2:UNSAFE_componentWillMount()
    end
    if state ~= a2.state then
        if __DEV__ then
            console.error(
                "%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.",
                getComponentName(a1.type) or "Component"
            )
        end
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        u293.enqueueReplaceState(a2, a2.state)
    end
end

function callComponentWillReceiveProps(a1, a2, a3, a4) -- Line: 910
    -- upvalues: __DEV__ (val), getComponentName (val), u272 (ref), console (val), u293 (ref)
    -- upvalues: initializeClassComponentUpdater (val)
    local state = a2.state
    if a2.componentWillReceiveProps ~= nil and type(a2.componentWillReceiveProps) == "function" then
        a2:componentWillReceiveProps(a3, a4)
    end
    if a2.UNSAFE_componentWillReceiveProps ~= nil and type(a2.UNSAFE_componentWillReceiveProps) == "function" then
        a2:UNSAFE_componentWillReceiveProps(a3, a4)
    end
    if a2.state ~= state then
        if __DEV__ then
            local v1 = getComponentName(a1.type) or "Component"
            if not u272[v1] then
                u272[v1] = true
                console.error(
                    "%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.",
                    v1
                )
            end
        end
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        u293.enqueueReplaceState(a2, a2.state)
    end
end

function resumeMountClassInstance(a1, a2, a3, a4) -- Line: 1056
    -- upvalues: emptyContextObject (val), readContext (val), disableLegacyContext (val), getUnmaskedContext (val)
    -- upvalues: getMaskedContext (val), resetHasForceUpdateBeforeProcessing (val), processUpdateQueue (val)
    -- upvalues: hasContextChanged (val), checkHasForceUpdateAfterProcessing (val), __DEV__ (val)
    -- upvalues: enableDoubleInvokingEffects (val), MountLayoutDev (val), Update (val), applyDerivedStateFromProps (val)
    local stateNode = a1.stateNode
    local memoizedProps = a1.memoizedProps
    stateNode.props = memoizedProps
    local context = stateNode.context
    local contextType = a2.contextType
    local v1 = emptyContextObject
    if contextType == nil then
        if not disableLegacyContext then
            v1 = getMaskedContext(a1, (getUnmaskedContext(a1, a2, true)))
        end
    elseif type(contextType) == "table" then
        v1 = readContext(contextType)
    elseif not disableLegacyContext then
        v1 = getMaskedContext(a1, (getUnmaskedContext(a1, a2, true)))
    end
    local getDerivedStateFromProps = a2.getDerivedStateFromProps
    local v2 = true
    if type(getDerivedStateFromProps) ~= "function" then
        v2 = type(stateNode.getSnapshotBeforeUpdate) == "function"
    end
    if not v2 then
        if type(stateNode.UNSAFE_componentWillReceiveProps) == "function"
            or type(stateNode.componentWillReceiveProps) == "function" then
            if memoizedProps ~= a3 or context ~= v1 then
                callComponentWillReceiveProps(a1, stateNode, a3, v1)
            end
        end
    end
    resetHasForceUpdateBeforeProcessing()
    local memoizedState = a1.memoizedState
    stateNode.state = memoizedState
    processUpdateQueue(a1, a3, stateNode, a4)
    local memoizedState_2 = a1.memoizedState
    if memoizedProps == a3
        and memoizedState == memoizedState_2
        and not hasContextChanged()
        and not checkHasForceUpdateAfterProcessing() then
        if type(stateNode.componentDidMount) == "function" then
            if not __DEV__ or not enableDoubleInvokingEffects then
                a1.flags = bit32.bor(a1.flags, Update)
            else
                a1.flags = bit32.bor(a1.flags, MountLayoutDev, Update)
            end
        end
        return false
    end
    if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
        applyDerivedStateFromProps(a1, a2, getDerivedStateFromProps, a3)
        memoizedState_2 = a1.memoizedState
    end
    local v3 = checkHasForceUpdateAfterProcessing() or checkShouldComponentUpdate(a1, a2, memoizedProps, a3, memoizedState, memoizedState_2, v1)
    if not v3 then
        if type(stateNode.componentDidMount) == "function" then
            if not __DEV__ or not enableDoubleInvokingEffects then
                a1.flags = bit32.bor(a1.flags, Update)
            else
                a1.flags = bit32.bor(a1.flags, MountLayoutDev, Update)
            end
        end
        a1.memoizedProps = a3
        a1.memoizedState = memoizedState_2
    else
        if not v2 then
            if type(stateNode.UNSAFE_componentWillMount) == "function"
                or type(stateNode.componentWillMount) == "function" then
                if type(stateNode.componentWillMount) == "function" then
                    stateNode:componentWillMount()
                end
                if type(stateNode.UNSAFE_componentWillMount) == "function" then
                    stateNode:UNSAFE_componentWillMount()
                end
            end
        end
        if type(stateNode.componentDidMount) == "function" then
            if not __DEV__ or not enableDoubleInvokingEffects then
                a1.flags = bit32.bor(a1.flags, Update)
            else
                a1.flags = bit32.bor(a1.flags, MountLayoutDev, Update)
            end
        end
    end
    stateNode.props = a3
    stateNode.state = memoizedState_2
    stateNode.context = v1
    return v3
end

return {
    adoptClassInstance = function(a1, a2) -- Line: 654
        -- upvalues: u293 (ref), initializeClassComponentUpdater (val), set (val), __DEV__ (val), u255 (val)
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        a2.__updater = u293
        a1.stateNode = a2
        set(a2, a1)
        if __DEV__ then
            a2._reactInternalInstance = u255
        end
    end,
    constructClassInstance = function(a1, a2, a3) -- Line: 665
        -- upvalues: emptyContextObject (val), __DEV__ (val), REACT_CONTEXT_TYPE (val), u279 (ref)
        -- upvalues: REACT_PROVIDER_TYPE (val), console (val), getComponentName (val), readContext (val)
        -- upvalues: disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val)
        -- upvalues: debugRenderPhaseSideEffectsForStrictMode (val), StrictMode (val), disableLogs (val)
        -- upvalues: describeError (val), reenableLogs (val), u293 (ref), initializeClassComponentUpdater (val)
        -- upvalues: set (val), u255 (val), UninitializedState (val), u273 (ref), u275 (ref), cacheContext (val)
        local v1
        local v2 = emptyContextObject
        local v3 = emptyContextObject
        local contextType = a2.contextType
        if __DEV__ and a2.contextType ~= nil then
            v1 = true
            if contextType ~= nil then
                v1 = false
                if contextType["$$typeof"] == REACT_CONTEXT_TYPE then
                    v1 = contextType._context == nil
                end
            end
            if not v1 and not u279[a2] then
                local v4
                u279[a2] = true
                if contextType == nil then
                    v4 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
                elseif type(contextType) ~= "table" then
                    v4 = " However, it is set to a " .. (type(contextType)) .. "."
                elseif contextType["$$typeof"] == REACT_PROVIDER_TYPE then
                    v4 = " Did you accidentally pass the Context.Provider instead?"
                elseif contextType._context == nil then
                    v4 = " However, it is set to an object with keys {"
                    for i, j in contextType do
                        v4 = v4 .. i .. ", "
                    end
                    v4 = v4 .. "}."
                else
                    v4 = " Did you accidentally pass the Context.Consumer instead?"
                end
                console.error(
                    "%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s",
                    getComponentName(a2) or "Component",
                    v4
                )
            end
        end
        if contextType == nil then
            if not disableLegacyContext then
                v2 = getUnmaskedContext(a1, a2, true)
                v3 = a2.contextTypes ~= nil and getMaskedContext(a1, v2) or emptyContextObject
            end
        elseif type(contextType) == "table" then
            v3 = readContext(contextType)
        elseif not disableLegacyContext then
            v2 = getUnmaskedContext(a1, a2, true)
            v3 = a2.contextTypes ~= nil and getMaskedContext(a1, v2) or emptyContextObject
        end
        if __DEV__ and debugRenderPhaseSideEffectsForStrictMode and bit32.band(a1.mode, StrictMode) ~= 0 then
            disableLogs()
            local success, result = xpcall(a2.__ctor, describeError, a3, v3)
            reenableLogs()
            if not success then
                error(result)
            end
        end
        v1 = a2.__ctor(a3, v3)
        a1.memoizedState = v1.state
        local memoizedState = a1.memoizedState
        if u293 == nil then
            initializeClassComponentUpdater()
        end
        v1.__updater = u293
        a1.stateNode = v1
        set(v1, a1)
        if __DEV__ then
            v1._reactInternalInstance = u255
        end
        if __DEV__ then
            local v5
            if type(a2.getDerivedStateFromProps) == "function" and memoizedState == UninitializedState then
                v5 = getComponentName(a2) or "Component"
                if not u273[v5] then
                    u273[v5] = true
                    console.error(
                        "`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.",
                        v5,
                        v5
                    )
                end
            end
            if type(a2.getDerivedStateFromProps) == "function" or type(v1.getSnapshotBeforeUpdate) == "function" then
                v5 = nil
                local v6 = nil
                local v7 = nil
                if type(v1.componentWillMount) == "function" then
                    v5 = "componentWillMount"
                elseif type(v1.UNSAFE_componentWillMount) == "function" then
                    v5 = "UNSAFE_componentWillMount"
                end
                if type(v1.componentWillReceiveProps) == "function" then
                    v6 = "componentWillReceiveProps"
                elseif type(v1.UNSAFE_componentWillReceiveProps) == "function" then
                    v6 = "UNSAFE_componentWillReceiveProps"
                end
                if type(v1.componentWillUpdate) == "function" then
                    v7 = "componentWillUpdate"
                elseif type(v1.UNSAFE_componentWillUpdate) == "function" then
                    v7 = "UNSAFE_componentWillUpdate"
                end
                if v5 ~= nil or v6 ~= nil or v7 ~= nil then
                    local v8 = getComponentName(a2) or "Component"
                    local v9 = if type(a2.getDerivedStateFromProps) ~= "function" then "getSnapshotBeforeUpdate()" else "getDerivedStateFromProps()"
                    local v10 = if v5 == nil then "" else "\n  " .. tostring(v5)
                    local v11 = if v6 == nil then "" else "\n  " .. tostring(v6)
                    local v12 = if v7 == nil then "" else "\n  " .. tostring(v7)
                    if not u275[v8] then
                        u275[v8] = true
                        console.error(
                            "Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles",
                            v8,
                            v9,
                            v10,
                            v11,
                            v12
                        )
                    end
                end
            end
        end
        if false then
            cacheContext(a1, v2, v3)
        end
        return v1
    end,
    mountClassInstance = function(a1, a2, a3, a4) -- Line: 945
        -- upvalues: __DEV__ (val), checkClassInstance (val), __refs (val), initializeUpdateQueue (val)
        -- upvalues: readContext (val), disableLegacyContext (val), emptyContextObject (val), getUnmaskedContext (val)
        -- upvalues: getMaskedContext (val), getComponentName (val), u276 (ref), console (val), StrictMode (val)
        -- upvalues: u98 (val), warnAboutDeprecatedLifecycles (val), processUpdateQueue (val)
        -- upvalues: applyDerivedStateFromProps (val), callComponentWillMount (val), enableDoubleInvokingEffects (val)
        -- upvalues: MountLayoutDev (val), Update (val)
        local v1
        if __DEV__ then
            checkClassInstance(a1, a2, a3)
        end
        local stateNode = a1.stateNode
        stateNode.props = a3
        stateNode.state = a1.memoizedState
        stateNode.__refs = __refs
        initializeUpdateQueue(a1)
        local contextType = nil
        if type(a2) == "table" then
            contextType = a2.contextType
        end
        if contextType == nil then
            if not disableLegacyContext then
                stateNode.context = getMaskedContext(a1, (getUnmaskedContext(a1, a2, true)))
            else
                stateNode.context = emptyContextObject
            end
        elseif type(contextType) == "table" then
            stateNode.context = readContext(contextType)
        elseif not disableLegacyContext then
            stateNode.context = getMaskedContext(a1, (getUnmaskedContext(a1, a2, true)))
        else
            stateNode.context = emptyContextObject
        end
        if __DEV__ then
            if stateNode.state == a3 then
                v1 = getComponentName(a2) or "Component"
                if not u276[v1] then
                    u276[v1] = true
                    console.error(
                        "%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.",
                        v1
                    )
                end
            end
            if bit32.band(a1.mode, StrictMode) ~= 0 then
                u98.recordLegacyContextWarning(a1, stateNode)
            end
            if warnAboutDeprecatedLifecycles then
                u98.recordUnsafeLifecycleWarnings(a1, stateNode)
            end
        end
        processUpdateQueue(a1, a3, stateNode, a4)
        stateNode.state = a1.memoizedState
        v1 = type(a2)
        local getDerivedStateFromProps = nil
        if type(a2) == "table" then
            getDerivedStateFromProps = a2.getDerivedStateFromProps
        end
        if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
            applyDerivedStateFromProps(a1, a2, getDerivedStateFromProps, a3)
            stateNode.state = a1.memoizedState
        end
        if v1 == "table"
            and type(a2.getDerivedStateFromProps) ~= "function"
            and type(stateNode.getSnapshotBeforeUpdate) ~= "function" then
            if type(stateNode.UNSAFE_componentWillMount) == "function"
                or type(stateNode.componentWillMount) == "function" then
                callComponentWillMount(a1, stateNode)
                processUpdateQueue(a1, a3, stateNode, a4)
                stateNode.state = a1.memoizedState
            end
        end
        if type(stateNode.componentDidMount) == "function" then
            if __DEV__ and enableDoubleInvokingEffects then
                a1.flags = bit32.bor(a1.flags, (bit32.bor(MountLayoutDev, Update)))
                return
            end
            a1.flags = bit32.bor(a1.flags, Update)
        end
    end,
    resumeMountClassInstance = resumeMountClassInstance,
    updateClassInstance = function(a1, a2, a3, a4, a5) -- Line: 1204
        -- upvalues: cloneUpdateQueue (val), resolveDefaultProps (val), emptyContextObject (val), readContext (val)
        -- upvalues: disableLegacyContext (val), getUnmaskedContext (val), getMaskedContext (val)
        -- upvalues: resetHasForceUpdateBeforeProcessing (val), processUpdateQueue (val), hasContextChanged (val)
        -- upvalues: checkHasForceUpdateAfterProcessing (val), Update (val), Snapshot (val)
        -- upvalues: applyDerivedStateFromProps (val)
        local v1, v2
        local stateNode = a2.stateNode
        cloneUpdateQueue(a1, a2)
        local memoizedProps = a2.memoizedProps
        stateNode.props = if a2.type ~= a2.elementType then resolveDefaultProps(a2.type, memoizedProps) else memoizedProps
        local pendingProps = a2.pendingProps
        local context = stateNode.context
        local contextType = nil
        local getDerivedStateFromProps = nil
        if type(a3) == "table" then
            contextType = a3.contextType
            getDerivedStateFromProps = a3.getDerivedStateFromProps
        end
        local v3 = emptyContextObject
        if type(contextType) == "table" then
            v3 = readContext(contextType)
        elseif not disableLegacyContext then
            v3 = getMaskedContext(a2, (getUnmaskedContext(a2, a3, true)))
        end
        if getDerivedStateFromProps == nil then
            v1 = false
            if stateNode.getSnapshotBeforeUpdate ~= nil then
                v1 = type(stateNode.getSnapshotBeforeUpdate) == "function"
            end
        else
            v1 = true
            if type(getDerivedStateFromProps) ~= "function" then
                v1 = false
                if stateNode.getSnapshotBeforeUpdate ~= nil then
                    v1 = type(stateNode.getSnapshotBeforeUpdate) == "function"
                end
            end
        end
        if not v1 then
            if stateNode.UNSAFE_componentWillReceiveProps == nil then
                if stateNode.componentWillReceiveProps ~= nil
                    and type(stateNode.componentWillReceiveProps) == "function" then
                    if memoizedProps ~= pendingProps or context ~= v3 then
                        callComponentWillReceiveProps(a2, stateNode, a4, v3)
                    end
                end
            elseif type(stateNode.UNSAFE_componentWillReceiveProps) == "function"
                or stateNode.componentWillReceiveProps ~= nil and type(stateNode.componentWillReceiveProps) == "function" then
                if memoizedProps ~= pendingProps or context ~= v3 then
                    callComponentWillReceiveProps(a2, stateNode, a4, v3)
                end
            end
        end
        resetHasForceUpdateBeforeProcessing()
        local memoizedState = a2.memoizedState
        stateNode.state = memoizedState
        local state = stateNode.state
        processUpdateQueue(a2, a4, stateNode, a5)
        local memoizedState_2 = a2.memoizedState
        if memoizedProps == pendingProps
            and memoizedState == memoizedState_2
            and not hasContextChanged()
            and not checkHasForceUpdateAfterProcessing() then
            if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
                if memoizedProps ~= a1.memoizedProps or memoizedState ~= a1.memoizedState then
                    a2.flags = bit32.bor(a2.flags, Update)
                end
            end
            if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
                if memoizedProps ~= a1.memoizedProps or memoizedState ~= a1.memoizedState then
                    a2.flags = bit32.bor(a2.flags, Snapshot)
                end
            end
            return false
        end
        if getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
            applyDerivedStateFromProps(a2, a3, getDerivedStateFromProps, a4)
            memoizedState_2 = a2.memoizedState
        end
        local v4 = checkHasForceUpdateAfterProcessing() or checkShouldComponentUpdate(a2, a3, v2, a4, memoizedState, memoizedState_2, v3)
        if not v4 then
            if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
                if memoizedProps ~= a1.memoizedProps or memoizedState ~= a1.memoizedState then
                    a2.flags = bit32.bor(a2.flags, Update)
                end
            end
            if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
                if memoizedProps ~= a1.memoizedProps or memoizedState ~= a1.memoizedState then
                    a2.flags = bit32.bor(a2.flags, Snapshot)
                end
            end
            a2.memoizedProps = a4
            a2.memoizedState = memoizedState_2
        else
            if not v1 then
                if stateNode.UNSAFE_componentWillUpdate == nil then
                    if stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
                        if stateNode.componentWillUpdate ~= nil
                            and type(stateNode.componentWillUpdate) == "function" then
                            stateNode:componentWillUpdate(a4, memoizedState_2, v3)
                        end
                        if stateNode.UNSAFE_componentWillUpdate ~= nil
                            and type(stateNode.UNSAFE_componentWillUpdate) == "function" then
                            stateNode:UNSAFE_componentWillUpdate(a4, memoizedState_2, v3)
                        end
                    end
                elseif type(stateNode.UNSAFE_componentWillUpdate) == "function"
                    or stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
                    if stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
                        stateNode:componentWillUpdate(a4, memoizedState_2, v3)
                    end
                    if stateNode.UNSAFE_componentWillUpdate ~= nil
                        and type(stateNode.UNSAFE_componentWillUpdate) == "function" then
                        stateNode:UNSAFE_componentWillUpdate(a4, memoizedState_2, v3)
                    end
                end
            end
            if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
                a2.flags = bit32.bor(a2.flags, Update)
            end
            if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
                a2.flags = bit32.bor(a2.flags, Snapshot)
            end
        end
        stateNode.props = a4
        stateNode.state = memoizedState_2
        stateNode.context = v3
        return v4
    end,
    applyDerivedStateFromProps = applyDerivedStateFromProps,
    emptyRefsObject = __refs,
}