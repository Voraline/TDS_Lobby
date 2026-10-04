-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberCommitWork.new
-- Decompile time: 58.04 ms

local recursivelyCommitLayoutEffects

local function unimplemented(a1) -- Line: 11 -- types: a1: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(a1))
    error("FIXME (roblox): " .. a1 .. " is unimplemented", 2)
end

local __DEV__ = _G.__DEV__
local __YOLO__ = _G.__YOLO__
local u5 = 0

local function isCallable(a1) -- Line: 27
    if typeof(a1) == "function" then
        return true
    end
    if typeof(a1) == "table" then
        local v1 = getmetatable(a1)
        if v1 and rawget(v1, "__call") then
            return true
        end
        if a1._isMockFunction then
            return true
        end
    end
    return false
end

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local Set = v1.Set
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local v2 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local ReactHookEffectTags = require(script.Parent:WaitForChild("ReactHookEffectTags"))
local unstable_wrap = require(script.Parent.Parent:WaitForChild("scheduler")).tracing.unstable_wrap
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local enableProfilerCommitHooks = ReactFeatureFlags.enableProfilerCommitHooks
local enableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local enableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FunctionComponent = ReactWorkTags.FunctionComponent
local ForwardRef = ReactWorkTags.ForwardRef
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local Profiler = ReactWorkTags.Profiler
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local DehydratedFragment = ReactWorkTags.DehydratedFragment
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local ScopeComponent = ReactWorkTags.ScopeComponent
local Block = ReactWorkTags.Block
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
local ReactErrorUtils = require(script.Parent.Parent:WaitForChild("shared")).ReactErrorUtils
local invokeGuardedCallback = ReactErrorUtils.invokeGuardedCallback
local hasCaughtError = ReactErrorUtils.hasCaughtError
local clearCaughtError = ReactErrorUtils.clearCaughtError
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local ContentReset = ReactFiberFlags.ContentReset
local Placement = ReactFiberFlags.Placement
local Snapshot = ReactFiberFlags.Snapshot
local Update = ReactFiberFlags.Update
local Callback = ReactFiberFlags.Callback
local LayoutMask = ReactFiberFlags.LayoutMask
local PassiveMask = ReactFiberFlags.PassiveMask
local Ref = ReactFiberFlags.Ref
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local current = ReactCurrentFiber.current
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local onCommitUnmount = require(script.Parent:WaitForChild("ReactFiberDevToolsHook.new")).onCommitUnmount
local resolveDefaultProps = require(script.Parent:WaitForChild("ReactFiberLazyComponent.new")).resolveDefaultProps
local v3 = require(script.Parent:WaitForChild("ReactProfilerTimer.new"))
local startLayoutEffectTimer = v3.startLayoutEffectTimer
local recordPassiveEffectDuration = v3.recordPassiveEffectDuration
local recordLayoutEffectDuration = v3.recordLayoutEffectDuration
local startPassiveEffectTimer = v3.startPassiveEffectTimer
local getCommitTime = v3.getCommitTime
local ProfileMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).ProfileMode
local commitUpdateQueue = v2.commitUpdateQueue
local getPublicInstance = ReactFiberHostConfig.getPublicInstance
local supportsMutation = ReactFiberHostConfig.supportsMutation
local supportsPersistence = ReactFiberHostConfig.supportsPersistence
local supportsHydration = ReactFiberHostConfig.supportsHydration
local commitMount = ReactFiberHostConfig.commitMount
local commitUpdate = ReactFiberHostConfig.commitUpdate
local resetTextContent = ReactFiberHostConfig.resetTextContent
local commitTextUpdate = ReactFiberHostConfig.commitTextUpdate
local appendChild = ReactFiberHostConfig.appendChild
local appendChildToContainer = ReactFiberHostConfig.appendChildToContainer
local insertBefore = ReactFiberHostConfig.insertBefore
local insertInContainerBefore = ReactFiberHostConfig.insertInContainerBefore
local removeChild = ReactFiberHostConfig.removeChild
local removeChildFromContainer = ReactFiberHostConfig.removeChildFromContainer
local hideInstance = ReactFiberHostConfig.hideInstance
local hideTextInstance = ReactFiberHostConfig.hideTextInstance
local unhideInstance = ReactFiberHostConfig.unhideInstance
local unhideTextInstance = ReactFiberHostConfig.unhideTextInstance
local commitHydratedSuspenseInstance = ReactFiberHostConfig.commitHydratedSuspenseInstance
local clearContainer = ReactFiberHostConfig.clearContainer
local u270 = nil

local function resolveRetryWakeable(a1, a2) -- Line: 190 -- upvalues: u270 (ref)
    if not u270 then
        u270 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u270.resolveRetryWakeable(a1, a2)
end

local function markCommitTimeOfFallback() -- Line: 197 -- upvalues: u270 (ref)
    if not u270 then
        u270 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
    end
    u270.markCommitTimeOfFallback()
end

local function schedulePassiveEffectCallback() -- Line: 205 -- upvalues: console (val)
    console.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback())
end

local function captureCommitPhaseError(a1, a2, a3) -- Line: 213 -- upvalues: console (val)
    console.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle")
    error(a3)
end

local NoFlags_2 = ReactHookEffectTags.NoFlags
local HasEffect = ReactHookEffectTags.HasEffect
local Layout = ReactHookEffectTags.Layout
local Passive = ReactHookEffectTags.Passive
local u279 = nil

local function u280() -- Line: 231 -- upvalues: u279 (ref)
    if not u279 then
        u279 = require(script.Parent:WaitForChild("ReactFiberBeginWork.new")).didWarnAboutReassigningProps
    end
    return u279
end

local isHostParent = nil
local insertOrAppendPlacementNode = nil
local insertOrAppendPlacementNodeIntoContainer = nil
local commitLayoutEffectsForHostRoot = nil
local commitLayoutEffectsForHostComponent = nil
local commitLayoutEffectsForClassComponent = nil
local unmountHostComponents = nil
local u291 = nil

local function callComponentWillUnmountWithTimer(a1, a2) -- Line: 256
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val)
    -- upvalues: startLayoutEffectTimer (val), describeError (val), recordLayoutEffectDuration (val)
    a2.props = a1.memoizedProps
    a2.state = a1.memoizedState
    if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(a1.mode, ProfileMode) ~= 0 then
        local success, result = xpcall(function() -- Line: 265 -- upvalues: startLayoutEffectTimer (upval), a2 (val)
            startLayoutEffectTimer()
            a2:componentWillUnmount()
        end, describeError)
        recordLayoutEffectDuration(a1)
        if success then
            return
        end
        error(result)
        return
    end
    a2:componentWillUnmount()
end

function safelyCallComponentWillUnmount(a1, a2, a3) -- Line: 283
    -- upvalues: callComponentWillUnmountWithTimer (val), describeError (val), captureCommitPhaseError (ref)
    local success, result = xpcall(callComponentWillUnmountWithTimer, describeError, a1, a2)
    if not success then
        captureCommitPhaseError(a1, a3, result)
    end
end

local function safelyDetachRef(a1, a2) -- Line: 297 -- upvalues: describeError (val), captureCommitPhaseError (ref)
    local ref = a1.ref
    if ref ~= nil then
        if typeof(ref) ~= "function" then
            ref.current = nil
        else
            local success, result = xpcall(ref, describeError)
            if not success then
                captureCommitPhaseError(a1, a2, result)
                return
            end
        end
    end
end

local function commitHookEffectListUnmount(a1, a2, a3) -- Line: 418
    -- upvalues: describeError (val), captureCommitPhaseError (ref)
    local updateQueue = a2.updateQueue
    local lastEffect = nil
    if updateQueue ~= nil then
        lastEffect = updateQueue.lastEffect
    end
    if lastEffect ~= nil then
        local destroy, result, success
        local next = lastEffect.next
        local next_2 = next
        local v1, v2, v3 = a1, a2, a3
        repeat
            if bit32.band(next_2.tag, v1) == v1 then
                destroy = next_2.destroy
                next_2.destroy = nil
                if destroy ~= nil then
                    success, result = xpcall(destroy, describeError)
                    if not success then
                        captureCommitPhaseError(v2, v3, result)
                    end
                end
            end
            next_2 = next_2.next
        until next_2 == next
    end
end

local function commitHookEffectListMount(a1, a2) -- Line: 446 -- upvalues: __DEV__ (val), console (val)
    local updateQueue = a2.updateQueue
    local lastEffect = if updateQueue == nil then nil else updateQueue.lastEffect
    if lastEffect ~= nil then
        local destroy
        local next = lastEffect.next
        local next_2 = next
        local v1 = a1
        repeat
            if bit32.band(next_2.tag, v1) == v1 then
                next_2.destroy = next_2.create()
                if __DEV__ then
                    destroy = next_2.destroy
                    if destroy ~= nil and typeof(destroy) ~= "function" then
                        console.error(
                            "An effect function must not return anything besides a function, which is used for clean-up.%s",
                            if destroy ~= nil then if typeof(destroy.andThen) ~= "function" then " You returned: " .. destroy else "\n\nIt looks like you wrote useEffect(Promise.new(function() end) or returned a Promise. Instead, write the async function inside your effect and call it immediately:\n\nuseEffect(function()\n  function fetchData()\n    -- You can await here\n    local response = MyAPI.getData(someId):await()\n    -- ...\n  end\n  fetchData()\nend, {someId}) -- Or {} if effect doesn't need props or state\n\nLearn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned nil. If your effect does not require clean up, return nil (or nothing)."
                        )
                    end
                end
            end
            next_2 = next_2.next
        until next_2 == next
    end
end

function commitProfilerPassiveEffect(a1, a2) -- Line: 497
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), Profiler (val), getCommitTime (val)
    -- upvalues: enableSchedulerTracing (val)
    if enableProfilerTimer and enableProfilerCommitHooks and a2.tag == Profiler then
        local passiveEffectDuration = a2.stateNode.passiveEffectDuration
        local id = a2.memoizedProps.id
        local onPostCommit = a2.memoizedProps.onPostCommit
        local v1 = getCommitTime()
        if typeof(onPostCommit) == "function" then
            if enableSchedulerTracing then
                onPostCommit(id, if a2.alternate ~= nil then "update" else "mount", passiveEffectDuration, v1, a1.memoizedInteractions)
                return
            end
            onPostCommit(id, if a2.alternate ~= nil then "update" else "mount", passiveEffectDuration, v1)
        end
    end
end

function recursivelyCommitLayoutEffects(a1, a2, a3, a4) -- Line: 530
    -- upvalues: captureCommitPhaseError (ref), schedulePassiveEffectCallback (ref), Profiler (val)
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), u291 (ref), LayoutMask (val), NoFlags (val)
    -- upvalues: __DEV__ (val), current (val), setCurrentFiber (val), invokeGuardedCallback (val)
    -- upvalues: recursivelyCommitLayoutEffects (val), hasCaughtError (val), clearCaughtError (val)
    -- upvalues: resetCurrentFiber (val), describeError (val), Update (val), Callback (val), ReactCurrentFiber (val)
    -- upvalues: u5 (ref), __YOLO__ (val), FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val)
    -- upvalues: Block (val), ProfileMode (val), startLayoutEffectTimer (val), commitHookEffectListMount (val)
    -- upvalues: Layout (val), HasEffect (val), recordLayoutEffectDuration (val), PassiveMask (val)
    -- upvalues: ClassComponent (val), commitLayoutEffectsForClassComponent (ref), HostRoot (val)
    -- upvalues: commitLayoutEffectsForHostRoot (ref), HostComponent (val), commitLayoutEffectsForHostComponent (ref)
    -- upvalues: SuspenseComponent (val), FundamentalComponent (val), HostPortal (val), HostText (val)
    -- upvalues: IncompleteClassComponent (val), LegacyHiddenComponent (val), OffscreenComponent (val)
    -- upvalues: ScopeComponent (val), SuspenseListComponent (val), invariant (val), Ref (val)
    local current_2, result_3, success_3, v1, v2, v3
    if a3 ~= nil then
        captureCommitPhaseError = a3
    end
    if a4 ~= nil then
        schedulePassiveEffectCallback = a4
    end
    local flags = a1.flags
    local tag = a1.tag
    if tag == Profiler then
        local result, success, v4
        local v5 = nil
        if enableProfilerTimer and enableProfilerCommitHooks then
            v5 = u291
            u291 = a1
        end
        local child = a1.child
        v1 = a2
        while child ~= nil do
            v4 = LayoutMask
            if (bit32.band(a1.subtreeFlags, v4)) ~= NoFlags then
                if not __DEV__ then
                    success, result = xpcall(recursivelyCommitLayoutEffects, describeError, child, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                    if not success then
                        captureCommitPhaseError(child, a1, result)
                    end
                else
                    v3 = current
                    setCurrentFiber(child)
                    invokeGuardedCallback(
                        nil,
                        recursivelyCommitLayoutEffects,
                        nil,
                        child,
                        v1,
                        captureCommitPhaseError,
                        schedulePassiveEffectCallback
                    )
                    if hasCaughtError() then
                        v4 = clearCaughtError()
                        captureCommitPhaseError(child, a1, v4)
                    end
                    if v3 == nil then
                        resetCurrentFiber()
                    else
                        setCurrentFiber(v3)
                    end
                end
            end
            child = child.sibling
        end
        if (bit32.band(flags, (bit32.bor(Update, Callback)))) ~= NoFlags and enableProfilerTimer then
            if not __DEV__ then
                local success_2, result_2 = xpcall(commitLayoutEffectsForProfiler, describeError, a1, v1)
                if not success_2 then
                    captureCommitPhaseError(a1, a1.return_, result_2)
                end
            else
                v3 = current
                setCurrentFiber(a1)
                invokeGuardedCallback(nil, commitLayoutEffectsForProfiler, nil, a1, v1)
                if hasCaughtError() then
                    v4 = clearCaughtError()
                    captureCommitPhaseError(a1, a1.return_, v4)
                end
                if v3 == nil then
                    resetCurrentFiber()
                else
                    setCurrentFiber(v3)
                end
            end
        end
        if enableProfilerTimer and enableProfilerCommitHooks then
            if v5 ~= nil then
                local stateNode = v5.stateNode
                stateNode.effectDuration = stateNode.effectDuration + a1.stateNode.effectDuration
            end
            u291 = v5
            return
        end
        return
    end
    local child_2 = a1.child
    v1 = a2
    while child_2 ~= nil do
        v3 = LayoutMask
        if (bit32.band(a1.subtreeFlags, v3)) ~= NoFlags then
            if not __DEV__ then
                v3 = nil
                if __YOLO__ or not (u5 < 20) then
                    v2 = true
                    recursivelyCommitLayoutEffects(child_2, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                else
                    u5 = u5 + 1
                    success_3, result_3 = xpcall(
                        recursivelyCommitLayoutEffects,
                        describeError,
                        child_2,
                        v1,
                        captureCommitPhaseError,
                        schedulePassiveEffectCallback
                    )
                    v2 = success_3
                    v3 = result_3
                    u5 = u5 - 1
                end
                if not v2 then
                    captureCommitPhaseError(child_2, a1, v3)
                end
            else
                current_2 = ReactCurrentFiber.current
                setCurrentFiber(child_2)
                if not (u5 < 20) then
                    recursivelyCommitLayoutEffects(child_2, v1, captureCommitPhaseError, schedulePassiveEffectCallback)
                else
                    u5 = u5 + 1
                    invokeGuardedCallback(
                        nil,
                        recursivelyCommitLayoutEffects,
                        nil,
                        child_2,
                        v1,
                        captureCommitPhaseError,
                        schedulePassiveEffectCallback
                    )
                    u5 = u5 - 1
                    if hasCaughtError() then
                        v3 = clearCaughtError()
                        captureCommitPhaseError(child_2, a1, v3)
                    end
                end
                if current_2 == nil then
                    resetCurrentFiber()
                else
                    setCurrentFiber(current_2)
                end
            end
        end
        child_2 = child_2.sibling
    end
    if (bit32.band(flags, (bit32.bor(Update, Callback)))) ~= NoFlags then
        if tag == FunctionComponent or tag == ForwardRef or tag == SimpleMemoComponent or tag == Block then
            if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(a1.mode, ProfileMode) == 0 then
                commitHookEffectListMount(bit32.bor(Layout, HasEffect), a1)
            else
                local success_4, result_4 = xpcall(function() -- Line: 751
                    -- upvalues: startLayoutEffectTimer (upval), commitHookEffectListMount (upval), Layout (upval)
                    -- upvalues: HasEffect (upval), a1 (val)
                    startLayoutEffectTimer()
                    commitHookEffectListMount(bit32.bor(Layout, HasEffect), a1)
                end, describeError)
                recordLayoutEffectDuration(a1)
                if not success_4 then
                    error(result_4)
                end
            end
            if (bit32.band(a1.subtreeFlags, PassiveMask)) ~= NoFlags then
                schedulePassiveEffectCallback()
            end
        elseif tag == ClassComponent then
            commitLayoutEffectsForClassComponent(a1)
        elseif tag == HostRoot then
            commitLayoutEffectsForHostRoot(a1)
        elseif tag == HostComponent then
            commitLayoutEffectsForHostComponent(a1)
        elseif tag == SuspenseComponent then
            commitSuspenseHydrationCallbacks(v1, a1)
        elseif tag ~= FundamentalComponent
            and tag ~= HostPortal
            and tag ~= HostText
            and tag ~= IncompleteClassComponent
            and tag ~= LegacyHiddenComponent
            and tag ~= OffscreenComponent
            and tag ~= ScopeComponent
            and tag ~= SuspenseListComponent then
            invariant(
                false,
                "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue."
            )
        end
    end
    if bit32.band(flags, Ref) ~= 0 then
        commitAttachRef(a1)
    end
end

function commitLayoutEffectsForProfiler(a1, a2) -- Line: 814
    -- upvalues: enableProfilerTimer (val), getCommitTime (val), Update (val), Callback (val), NoFlags (val)
    -- upvalues: enableSchedulerTracing (val), enableProfilerCommitHooks (val)
    if enableProfilerTimer then
        local v1
        local flags = a1.flags
        local alternate = a1.alternate
        local onCommit = a1.memoizedProps.onCommit
        local onRender = a1.memoizedProps.onRender
        local effectDuration = a1.stateNode.effectDuration
        local v2 = getCommitTime()
        local v3 = bit32.band(flags, Update)
        if v3 ~= NoFlags then
            if typeof(onRender) == "function" then
                v3 = true
            elseif typeof(onRender) ~= "table" then
                v3 = false
            else
                v1 = getmetatable(onRender)
                v3 = if not v1 then not not onRender._isMockFunction else if not rawget(v1, "__call") then not not onRender._isMockFunction else true
            end
            if v3 then
                if not enableSchedulerTracing then
                    onRender(
                        a1.memoizedProps.id,
                        if alternate ~= nil then "update" else "mount",
                        a1.actualDuration,
                        a1.treeBaseDuration,
                        a1.actualStartTime,
                        v2
                    )
                else
                    onRender(
                        a1.memoizedProps.id,
                        if alternate ~= nil then "update" else "mount",
                        a1.actualDuration,
                        a1.treeBaseDuration,
                        a1.actualStartTime,
                        v2,
                        a2.memoizedInteractions
                    )
                end
            end
        end
        if enableProfilerCommitHooks then
            v3 = bit32.band(flags, Callback)
            if v3 ~= NoFlags then
                if typeof(onCommit) == "function" then
                    v3 = true
                elseif typeof(onCommit) ~= "table" then
                    v3 = false
                else
                    v1 = getmetatable(onCommit)
                    v3 = if not v1 then not not onCommit._isMockFunction else if not rawget(v1, "__call") then not not onCommit._isMockFunction else true
                end
                if v3 then
                    if enableSchedulerTracing then
                        onCommit(
                            a1.memoizedProps.id,
                            if alternate ~= nil then "update" else "mount",
                            effectDuration,
                            v2,
                            a2.memoizedInteractions
                        )
                        return
                    end
                    onCommit(a1.memoizedProps.id, if alternate ~= nil then "update" else "mount", effectDuration, v2)
                end
            end
        end
    end
end

function commitLayoutEffectsForClassComponent(a1) -- Line: 882
    -- upvalues: Update (val), __DEV__ (val), u280 (val), console (val), getComponentName (val)
    -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val)
    -- upvalues: startLayoutEffectTimer (val), describeError (val), recordLayoutEffectDuration (val)
    -- upvalues: resolveDefaultProps (val), commitUpdateQueue (val)
    local stateNode = a1.stateNode
    local alternate = a1.alternate
    if bit32.band(a1.flags, Update) ~= 0 then
        if alternate ~= nil then
            local memoizedProps
            if a1.elementType ~= a1.type then
                memoizedProps = resolveDefaultProps(a1.type, alternate.memoizedProps)
            else
                memoizedProps = alternate.memoizedProps
                if not memoizedProps then
                    memoizedProps = resolveDefaultProps(a1.type, alternate.memoizedProps)
                end
            end
            local memoizedState = alternate.memoizedState
            if __DEV__ and a1.type == a1.elementType and not u280 then
                if stateNode.props ~= a1.memoizedProps then
                    console.error(
                        "Expected %s props to match memoized props before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.",
                        getComponentName(a1.type) or "instance"
                    )
                end
                if stateNode.state ~= a1.memoizedState then
                    console.error(
                        "Expected %s state to match memoized state before componentDidUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.",
                        getComponentName(a1.type) or "instance"
                    )
                end
            end
            if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(a1.mode, ProfileMode) == 0 then
                stateNode:componentDidUpdate(memoizedProps, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
            else
                local success_2, result_2 = xpcall(function() -- Line: 968
                    -- upvalues: startLayoutEffectTimer (upval), stateNode (val), memoizedProps (val)
                    -- upvalues: memoizedState (val)
                    startLayoutEffectTimer()
                    stateNode:componentDidUpdate(memoizedProps, memoizedState, stateNode.__reactInternalSnapshotBeforeUpdate)
                end, describeError)
                recordLayoutEffectDuration(a1)
                if not success_2 then
                    error(result_2)
                end
            end
        else
            if __DEV__ and a1.type == a1.elementType and not u280 then
                if stateNode.props ~= a1.memoizedProps then
                    console.error(
                        "Expected %s props to match memoized props before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.",
                        getComponentName(a1.type) or "instance"
                    )
                end
                if stateNode.state ~= a1.memoizedState then
                    console.error(
                        "Expected %s state to match memoized state before componentDidMount. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.",
                        getComponentName(a1.type) or "instance"
                    )
                end
            end
            if not enableProfilerTimer or not enableProfilerCommitHooks or bit32.band(a1.mode, ProfileMode) == 0 then
                stateNode:componentDidMount()
            else
                local success, result = xpcall(function() -- Line: 914 -- upvalues: startLayoutEffectTimer (upval), stateNode (val)
                    startLayoutEffectTimer()
                    stateNode:componentDidMount()
                end, describeError)
                recordLayoutEffectDuration(a1)
                if not success then
                    error(result)
                end
            end
        end
    end
    local updateQueue = a1.updateQueue
    if updateQueue ~= nil then
        if __DEV__ and a1.type == a1.elementType and not u280 then
            if stateNode.props ~= a1.memoizedProps then
                console.error(
                    "Expected %s props to match memoized props before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.",
                    getComponentName(a1.type) or "instance"
                )
            end
            if stateNode.state ~= a1.memoizedState then
                console.error(
                    "Expected %s state to match memoized state before processing the update queue. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.",
                    getComponentName(a1.type) or "instance"
                )
            end
        end
        commitUpdateQueue(a1, updateQueue, stateNode)
    end
end

function commitLayoutEffectsForHostRoot(a1) -- Line: 1031
    -- upvalues: HostComponent (val), getPublicInstance (val), ClassComponent (val), commitUpdateQueue (val)
    local updateQueue = a1.updateQueue
    if updateQueue ~= nil then
        local stateNode = nil
        if a1.child ~= nil then
            local child = a1.child
            if child.tag == HostComponent then
                stateNode = getPublicInstance(child.stateNode)
            elseif child.tag == ClassComponent then
                stateNode = child.stateNode
            end
        end
        commitUpdateQueue(a1, updateQueue, stateNode)
    end
end

function commitLayoutEffectsForHostComponent(a1) -- Line: 1050 -- upvalues: Update (val), commitMount (val)
    local stateNode = a1.stateNode
    if a1.alternate == nil and bit32.band(a1.flags, Update) ~= 0 then
        commitMount(stateNode, a1.type, a1.memoizedProps, a1)
    end
end

local function hideOrUnhideAllChildren(a1, a2) -- Line: 1065
    -- upvalues: supportsMutation (val), HostComponent (val), hideInstance (val), unhideInstance (val), HostText (val)
    -- upvalues: hideTextInstance (val), unhideTextInstance (val), OffscreenComponent (val), LegacyHiddenComponent (val)
    if not supportsMutation then
        return
    else
        local stateNode, stateNode_2
        local child = a1
        local v1, v2 = a2, a1
        while true do
            if child.tag == HostComponent then
                stateNode = child.stateNode
                if not v1 then
                    unhideInstance(child.stateNode, child.memoizedProps)
                else
                    hideInstance(stateNode)
                end
            elseif child.tag == HostText then
                stateNode_2 = child.stateNode
                if not v1 then
                    unhideTextInstance(stateNode_2, child.memoizedProps)
                else
                    hideTextInstance(stateNode_2)
                end
            elseif child.tag == OffscreenComponent then
                if child.memoizedState == nil then
                    if child.child ~= nil then
                        child.child.return_ = child
                        child = child.child
                        continue
                    end
                elseif child == v2 and child.child ~= nil then
                    child.child.return_ = child
                    child = child.child
                    continue
                end
            elseif child.tag ~= LegacyHiddenComponent or child.memoizedState == nil then
                if child.child ~= nil then
                    child.child.return_ = child
                    child = child.child
                    continue
                end
            elseif child == v2 and child.child ~= nil then
                child.child.return_ = child
                child = child.child
                continue
            end
            if child == v2 then
                return
            end
            while child.sibling == nil do
                if child.return_ ~= nil and child.return_ ~= v2 then
                    child = child.return_
                    continue
                end
                return
            end
            child.sibling.return_ = child.return_
            child = child.sibling
        end
    end
end

function commitAttachRef(a1) -- Line: 1115
    -- upvalues: HostComponent (val), getPublicInstance (val), __DEV__ (val), console (val), getComponentName (val)
    local ref = a1.ref
    if ref ~= nil then
        local stateNode = a1.stateNode
        local v1 = if a1.tag ~= HostComponent then stateNode else getPublicInstance(stateNode)
        if typeof(ref) == "function" then
            ref(v1)
            return
        end
        if __DEV__ and typeof(ref) ~= "table" then
            console.error(
                "Unexpected ref object provided for %s. Use either a ref-setter function or React.createRef().",
                getComponentName(a1.type) or "instance"
            )
            return
        end
        ref.current = v1
    end
end

function commitDetachRef(a1) -- Line: 1154
    local ref = a1.ref
    if ref ~= nil then
        if typeof(ref) == "function" then
            ref(nil)
            return
        end
        ref.current = nil
    end
end

local function commitUnmount(a1, a2, a3, a4) -- Line: 1168
    -- upvalues: onCommitUnmount (val), FunctionComponent (val), ForwardRef (val), MemoComponent (val)
    -- upvalues: SimpleMemoComponent (val), Block (val), Layout (val), NoFlags_2 (val), enableProfilerTimer (val)
    -- upvalues: enableProfilerCommitHooks (val), ProfileMode (val), startLayoutEffectTimer (val), describeError (val)
    -- upvalues: captureCommitPhaseError (ref), recordLayoutEffectDuration (val), ClassComponent (val)
    -- upvalues: HostComponent (val), HostPortal (val), supportsMutation (val), unmountHostComponents (ref)
    -- upvalues: supportsPersistence (val), unimplemented (val)
    onCommitUnmount(a2)
    if a2.tag ~= FunctionComponent
        and a2.tag ~= ForwardRef
        and a2.tag ~= MemoComponent
        and a2.tag ~= SimpleMemoComponent
        and a2.tag ~= Block then
        if a2.tag == ClassComponent then
            local ref = a2.ref
            if ref ~= nil then
                if typeof(ref) ~= "function" then
                    ref.current = nil
                else
                    local success, result = xpcall(ref, describeError)
                    if not success then
                        captureCommitPhaseError(a2, a3, result)
                    end
                end
            end
            local stateNode = a2.stateNode
            if typeof(stateNode.componentWillUnmount) == "function" then
                safelyCallComponentWillUnmount(a2, stateNode, a3)
            end
            return
        end
        if a2.tag ~= HostComponent then
            if a2.tag == HostPortal then
                if supportsMutation then
                    unmountHostComponents(a1, a2, a3, a4)
                    return
                end
                if supportsPersistence then
                    unimplemented("emptyPortalContainer")
                end
                return
            end
            return
        end
        local ref_2 = a2.ref
        if ref_2 ~= nil then
            if typeof(ref_2) ~= "function" then
                ref_2.current = nil
            else
                local success_2, result_2 = xpcall(ref_2, describeError)
                if not success_2 then
                    captureCommitPhaseError(a2, a3, result_2)
                    return
                end
            end
        end
        return
    end
    local updateQueue = a2.updateQueue
    if updateQueue ~= nil then
        local lastEffect = updateQueue.lastEffect
        if lastEffect ~= nil then
            local result_3, result_4, success_3, success_4
            local next = lastEffect.next
            local next_2 = next
            local v1, v2 = a2, a3
            repeat
                if next_2.destroy ~= nil and (bit32.band(next_2.tag, Layout)) ~= NoFlags_2 then
                    if not enableProfilerTimer
                        or not enableProfilerCommitHooks
                        or bit32.band(v1.mode, ProfileMode) == 0 then
                        success_4, result_4 = xpcall(next_2.destroy, describeError)
                        if not success_4 then
                            captureCommitPhaseError(v1, v2, result_4)
                        end
                    else
                        startLayoutEffectTimer()
                        success_3, result_3 = xpcall(next_2.destroy, describeError)
                        if not success_3 then
                            captureCommitPhaseError(v1, v2, result_3)
                        end
                        recordLayoutEffectDuration(v1)
                    end
                end
                next_2 = next_2.next
            until next_2 == next
        end
    end
end

local function commitNestedUnmounts(a1, a2, a3, a4) -- Line: 1275
    -- upvalues: commitUnmount (ref), supportsMutation (val), HostPortal (val)
    local v1
    local child = a2
    local v2, v3, v4 = a1, a3, a4
    while true do
        commitUnmount(v2, child, v3, v4)
        if child.child ~= nil then
            if not supportsMutation or child.tag ~= HostPortal then
                child.child.return_ = child
                child = child.child
                continue
            end
        end
        if child == v1 then
            return
        end
        while child.sibling == nil do
            if child.return_ ~= nil and child.return_ ~= v1 then
                child = child.return_
                continue
            end
            return
        end
        child.sibling.return_ = child.return_
        child = child.sibling
    end
end

local function detachFiberMutation(a1) -- Line: 1315
    local alternate = a1.alternate
    if alternate ~= nil then
        alternate.return_ = nil
        a1.alternate = nil
    end
    a1.return_ = nil
end

local function getHostParentFiber(a1) -- Line: 1382 -- upvalues: isHostParent (ref), Error (val)
    local return_ = a1.return_
    while return_ ~= nil do
        if isHostParent(return_) then
            return return_
        end
        return_ = return_.return_
    end
    error(Error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
end

function isHostParent(a1) -- Line: 1400 -- upvalues: HostComponent (val), HostRoot (val), HostPortal (val)
    local v1 = true
    if a1.tag ~= HostComponent then
        v1 = true
        if a1.tag ~= HostRoot then
            v1 = a1.tag == HostPortal
        end
    end
    return v1
end

local function getHostSibling(a1) -- Line: 1404
    -- upvalues: isHostParent (ref), HostComponent (val), HostText (val), DehydratedFragment (val), Placement (val)
    -- upvalues: HostPortal (val)
    local v1
    local return_ = a1
    while true do
        v1 = false
        while return_.sibling == nil do
            if return_.return_ ~= nil and not isHostParent(return_.return_) then
                return_ = return_.return_
                continue
            end
            return nil
        end
        return_.sibling.return_ = return_.return_
        return_ = return_.sibling
        while return_.tag ~= HostComponent do
            if return_.tag == HostText or return_.tag == DehydratedFragment then
                break
            end
            if bit32.band(return_.flags, Placement) ~= 0 then
                v1 = true
                break
            end
            if return_.child ~= nil and return_.tag ~= HostPortal then
                return_.child.return_ = return_
                return_ = return_.child
                continue
            end
            v1 = true
            break
        end
        if not v1 and bit32.band(return_.flags, Placement) == 0 then
            return return_.stateNode
        end
    end
end

function insertOrAppendPlacementNodeIntoContainer(a1, a2, a3) -- Line: 1509
    -- upvalues: HostComponent (val), HostText (val), insertInContainerBefore (val), appendChildToContainer (val)
    -- upvalues: HostPortal (val), insertOrAppendPlacementNodeIntoContainer (ref)
    local tag = a1.tag
    local v1 = true
    if tag ~= HostComponent then
        v1 = tag == HostText
    end
    if v1 then
        local stateNode = a1.stateNode
        if a2 then
            insertInContainerBefore(a3, stateNode, a2)
            return
        end
        appendChildToContainer(a3, stateNode)
        return
    end
    if tag == HostPortal then
        return
    end
    local child = a1.child
    if child ~= nil then
        insertOrAppendPlacementNodeIntoContainer(child, a2, a3)
        local sibling = child.sibling
        while sibling ~= nil do
            insertOrAppendPlacementNodeIntoContainer(sibling, a2, a3)
            sibling = sibling.sibling
        end
    end
end

function insertOrAppendPlacementNode(a1, a2, a3) -- Line: 1541
    -- upvalues: HostComponent (val), HostText (val), insertBefore (val), appendChild (val), HostPortal (val)
    -- upvalues: insertOrAppendPlacementNode (ref)
    local tag = a1.tag
    local v1 = true
    if tag ~= HostComponent then
        v1 = tag == HostText
    end
    if v1 then
        local stateNode = a1.stateNode
        if a2 then
            insertBefore(a3, stateNode, a2)
            return
        end
        appendChild(a3, stateNode)
        return
    end
    if tag == HostPortal then
        return
    end
    local child = a1.child
    if child ~= nil then
        insertOrAppendPlacementNode(child, a2, a3)
        local sibling = child.sibling
        while sibling ~= nil do
            insertOrAppendPlacementNode(sibling, a2, a3)
            sibling = sibling.sibling
        end
    end
end

function unmountHostComponents(a1, a2, a3, a4) -- Line: 1569
    -- upvalues: Error (val), HostComponent (val), HostRoot (val), HostPortal (val), HostText (val)
    -- upvalues: commitNestedUnmounts (ref), removeChildFromContainer (val), removeChild (val), commitUnmount (ref)
    local return_, stateNode
    local child = a2
    local v1 = false
    local containerInfo = nil
    local v2 = nil
    local v3, v4, v5, v6 = a1, a3, a4, a2
    while true do
        if not v1 then
            return_ = child.return_
            while true do
                if return_ == nil then
                    error(Error.new("Expected to find a host parent. This error is likely caused by a bug in React. Please file an issue."))
                end
                stateNode = return_.stateNode
                if return_.tag == HostComponent then
                    containerInfo = stateNode
                    v2 = false
                elseif return_.tag == HostRoot then
                    containerInfo = stateNode.containerInfo
                    v2 = true
                elseif return_.tag ~= HostPortal then
                    return_ = return_.return_
                    continue
                else
                    containerInfo = stateNode.containerInfo
                    v2 = true
                end
                if child.tag == HostComponent or child.tag == HostText then
                    commitNestedUnmounts(v3, child, v4, v5)
                    if not v2 then
                        removeChild(containerInfo, child.stateNode)
                    else
                        removeChildFromContainer(containerInfo, child.stateNode)
                    end
                elseif child.tag ~= HostPortal then
                    commitUnmount(v3, child, v4, v5)
                    if child.child ~= nil then
                        child.child.return_ = child
                        child = child.child
                        break
                    end
                elseif child.child ~= nil then
                    containerInfo = child.stateNode.containerInfo
                    v2 = true
                    child.child.return_ = child
                    child = child.child
                    break
                end
                if child == v6 then
                    return
                end
                while child.sibling == nil do
                    if child.return_ ~= nil and child.return_ ~= v6 then
                        child = child.return_
                        if child.tag == HostPortal then end
                        continue
                    end
                    return
                end
                child.sibling.return_ = child.return_
                child = child.sibling
                break
            end
        end
        if child.tag == HostComponent or child.tag == HostText then
            commitNestedUnmounts(v3, child, v4, v5)
            if not v2 then
                removeChild(containerInfo, child.stateNode)
            else
                removeChildFromContainer(containerInfo, child.stateNode)
            end
        elseif child.tag ~= HostPortal then
            commitUnmount(v3, child, v4, v5)
            if child.child ~= nil then
                child.child.return_ = child
                child = child.child
                continue
            end
        elseif child.child ~= nil then
            containerInfo = child.stateNode.containerInfo
            child.child.return_ = child
            child = child.child
            continue
        end
        if child == v6 then
            return
        end
        while child.sibling == nil do
            if child.return_ ~= nil and child.return_ ~= v6 then
                child = child.return_
                if child.tag == HostPortal then end
                continue
            end
            return
        end
        child.sibling.return_ = child.return_
        child = child.sibling
    end
end

function commitSuspenseComponent(a1) -- Line: 1994
    -- upvalues: u270 (ref), supportsMutation (val), hideOrUnhideAllChildren (val), enableSuspenseCallback (val)
    -- upvalues: __DEV__ (val), console (val)
    local memoizedState = a1.memoizedState
    if memoizedState ~= nil then
        if not u270 then
            u270 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
        end
        u270.markCommitTimeOfFallback()
        if supportsMutation then
            hideOrUnhideAllChildren(a1.child, true)
        end
    end
    if enableSuspenseCallback and memoizedState ~= nil then
        local suspenseCallback = a1.memoizedProps.suspenseCallback
        if typeof(suspenseCallback) == "function" then
            local updateQueue = a1.updateQueue
            if updateQueue ~= nil then
                suspenseCallback(table.clone(updateQueue))
                return
            end
        elseif __DEV__ and suspenseCallback ~= nil then
            console.error("Unexpected type for suspenseCallback: %s", (tostring(suspenseCallback)))
        end
    end
end

function commitSuspenseHydrationCallbacks(a1, a2) -- Line: 2033
    -- upvalues: supportsHydration (val), commitHydratedSuspenseInstance (val), enableSuspenseCallback (val)
    if not supportsHydration then
        return
    end
    if a2.memoizedState == nil then
        local alternate = a2.alternate
        if alternate ~= nil then
            local memoizedState = alternate.memoizedState
            if memoizedState ~= nil then
                local dehydrated = memoizedState.dehydrated
                if dehydrated ~= nil then
                    commitHydratedSuspenseInstance(dehydrated)
                    if enableSuspenseCallback then
                        local hydrationCallbacks = a1.hydrationCallbacks
                        if hydrationCallbacks ~= nil then
                            local onHydrated = hydrationCallbacks.onHydrated
                            if onHydrated then
                                onHydrated(dehydrated)
                            end
                        end
                    end
                end
            end
        end
    end
end

function attachSuspenseRetryListeners(a1) -- Line: 2061
    -- upvalues: Set (val), resolveRetryWakeable (val), enableSchedulerTracing (val), unstable_wrap (val)
    local updateQueue = a1.updateQueue
    if updateQueue ~= nil then
        a1.updateQueue = nil
        local stateNode = a1.stateNode
        if stateNode == nil then
            a1.stateNode = Set.new()
            stateNode = a1.stateNode
        end
        local v1 = nil
        local v2 = nil
        for i, j in updateQueue, v1, v2 do
            local function u31() -- Line: 2075 -- upvalues: resolveRetryWakeable (upval), a1 (val), i (val)
                return resolveRetryWakeable(a1, i)
            end

            if not stateNode:has(i) then
                if enableSchedulerTracing and i.__reactDoNotTraceInteractions ~= true then
                    u31 = unstable_wrap(u31)
                end
                stateNode:add(i)
                i:andThen(function() -- Line: 2086 -- upvalues: u31 (ref)
                    return u31()
                end, function() -- Line: 2088 -- upvalues: u31 (ref)
                    return u31()
                end)
            end
        end
    end
end

function isSuspenseBoundaryBeingHidden(a1, a2) -- Line: 2099
    if a1 == nil then
        return false
    end
    local memoizedState = a1.memoizedState
    if memoizedState ~= nil and memoizedState.dehydrated == nil then
        return false
    end
    local memoizedState_2 = a2.memoizedState
    local v1 = false
    if memoizedState_2 ~= nil then
        v1 = memoizedState_2.dehydrated == nil
    end
    return v1
end

function commitResetTextContent(a1) -- Line: 2111 -- upvalues: supportsMutation (val), resetTextContent (val)
    if not supportsMutation then
        return
    end
    resetTextContent(a1.stateNode)
end

function invokeLayoutEffectMountInDEV(a1) -- Line: 2204
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val)
    -- upvalues: SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListMount (val)
    -- upvalues: Layout (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val)
    -- upvalues: captureCommitPhaseError (ref), ClassComponent (val)
    if __DEV__ and enableDoubleInvokingEffects then
        if a1.tag ~= FunctionComponent
            and a1.tag ~= ForwardRef
            and a1.tag ~= SimpleMemoComponent
            and a1.tag ~= Block then
            return
        end
        invokeGuardedCallback(nil, commitHookEffectListMount, nil, bit32.bor(Layout, HasEffect), a1)
        if hasCaughtError() then
            local v1 = clearCaughtError()
            captureCommitPhaseError(a1, a1.return_, v1)
        end
        return
    end
    if a1.tag ~= ClassComponent then
        return
    end
    local stateNode = a1.stateNode
    invokeGuardedCallback(nil, stateNode.componentDidMount, stateNode)
    if hasCaughtError() then
        local v2 = clearCaughtError()
        captureCommitPhaseError(a1, a1.return_, v2)
    end
end

function invokePassiveEffectMountInDEV(a1) -- Line: 2236
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val)
    -- upvalues: SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListMount (val)
    -- upvalues: Passive (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val)
    -- upvalues: captureCommitPhaseError (ref)
    if __DEV__ and enableDoubleInvokingEffects then
        if a1.tag ~= FunctionComponent
            and a1.tag ~= ForwardRef
            and a1.tag ~= SimpleMemoComponent
            and a1.tag ~= Block then
            return
        end
        invokeGuardedCallback(nil, commitHookEffectListMount, nil, bit32.bor(Passive, HasEffect), a1)
        if hasCaughtError() then
            local v1 = clearCaughtError()
            captureCommitPhaseError(a1, a1.return_, v1)
        end
        return
    end
end

function invokeLayoutEffectUnmountInDEV(a1) -- Line: 2260
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val)
    -- upvalues: SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListUnmount (val)
    -- upvalues: Layout (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val)
    -- upvalues: captureCommitPhaseError (ref), ClassComponent (val)
    if __DEV__ and enableDoubleInvokingEffects then
        if a1.tag ~= FunctionComponent
            and a1.tag ~= ForwardRef
            and a1.tag ~= SimpleMemoComponent
            and a1.tag ~= Block then
            return
        end
        invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, bit32.bor(Layout, HasEffect), a1, a1.return_)
        if hasCaughtError() then
            local v1 = clearCaughtError()
            captureCommitPhaseError(a1, a1.return_, v1)
        end
        return
    end
    if a1.tag ~= ClassComponent then
        return
    end
    local stateNode = a1.stateNode
    if typeof(stateNode.componentWillUnmount) == "function" then
        safelyCallComponentWillUnmount(a1, stateNode, a1.return_)
    end
end

function invokePassiveEffectUnmountInDEV(a1) -- Line: 2291
    -- upvalues: __DEV__ (val), enableDoubleInvokingEffects (val), FunctionComponent (val), ForwardRef (val)
    -- upvalues: SimpleMemoComponent (val), Block (val), invokeGuardedCallback (val), commitHookEffectListUnmount (val)
    -- upvalues: Passive (val), HasEffect (val), hasCaughtError (val), clearCaughtError (val)
    -- upvalues: captureCommitPhaseError (ref)
    if __DEV__ and enableDoubleInvokingEffects then
        if a1.tag ~= FunctionComponent
            and a1.tag ~= ForwardRef
            and a1.tag ~= SimpleMemoComponent
            and a1.tag ~= Block then
            return
        end
        invokeGuardedCallback(nil, commitHookEffectListUnmount, nil, bit32.bor(Passive, HasEffect), a1, a1.return_)
        if hasCaughtError() then
            local v1 = clearCaughtError()
            captureCommitPhaseError(a1, a1.return_, v1)
        end
        return
    end
end

return {
    safelyCallDestroy = function(a1, a2, a3) -- Line: 313 -- upvalues: describeError (val), captureCommitPhaseError (ref) -- types: a3: function
        local success, result = xpcall(a3, describeError)
        if not success then
            captureCommitPhaseError(a1, a2, result)
        end
    end,
    commitBeforeMutationLifeCycles = function(a1, a2) -- Line: 325
        -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val)
        -- upvalues: ClassComponent (val), Snapshot (val), __DEV__ (val), u280 (val), console (val)
        -- upvalues: getComponentName (val), resolveDefaultProps (val), HostRoot (val), supportsMutation (val)
        -- upvalues: clearContainer (val), HostComponent (val), HostText (val), HostPortal (val)
        -- upvalues: IncompleteClassComponent (val), invariant (val)
        if a2.tag ~= FunctionComponent
            and a2.tag ~= ForwardRef
            and a2.tag ~= SimpleMemoComponent
            and a2.tag ~= Block then
            if a2.tag ~= ClassComponent then
                if a2.tag == HostRoot then
                    if supportsMutation and bit32.band(a2.flags, Snapshot) ~= 0 then
                        clearContainer(a2.stateNode.containerInfo)
                    end
                    return
                end
                if a2.tag ~= HostComponent
                    and a2.tag ~= HostText
                    and a2.tag ~= HostPortal
                    and a2.tag ~= IncompleteClassComponent then
                    invariant(
                        false,
                        "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue."
                    )
                    return
                end
                return
            end
            if bit32.band(a2.flags, Snapshot) ~= 0 and a1 ~= nil then
                local memoizedProps = a1.memoizedProps
                local memoizedState = a1.memoizedState
                local stateNode = a2.stateNode
                if __DEV__ and a2.type == a2.elementType and not u280 then
                    if stateNode.props ~= a2.memoizedProps then
                        console.error(
                            "Expected %s props to match memoized props before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.props`. Please file an issue.",
                            getComponentName(a2.type) or "instance"
                        )
                    end
                    if stateNode.state ~= a2.memoizedState then
                        console.error(
                            "Expected %s state to match memoized state before getSnapshotBeforeUpdate. This might either be because of a bug in React, or because a component reassigns its own `this.state`. Please file an issue.",
                            getComponentName(a2.type) or "instance"
                        )
                    end
                end
                stateNode.__reactInternalSnapshotBeforeUpdate = (stateNode:getSnapshotBeforeUpdate(
                    not (a2.elementType ~= a2.type) and memoizedProps or resolveDefaultProps(a2.type, memoizedProps),
                    memoizedState
                ))
            end
            return
        end
    end,
    commitResetTextContent = commitResetTextContent,
    commitPlacement = function(a1) -- Line: 1458
        -- upvalues: supportsMutation (val), getHostParentFiber (val), HostComponent (val), HostRoot (val)
        -- upvalues: HostPortal (val), invariant (val), ContentReset (val), resetTextContent (val), getHostSibling (ref)
        -- upvalues: insertOrAppendPlacementNodeIntoContainer (ref), insertOrAppendPlacementNode (ref)
        if not supportsMutation then
            return
        end
        local v1 = getHostParentFiber(a1)
        local containerInfo = nil
        local v2 = nil
        local stateNode = v1.stateNode
        if v1.tag == HostComponent then
            containerInfo = stateNode
            v2 = false
        elseif v1.tag == HostRoot then
            containerInfo = stateNode.containerInfo
            v2 = true
        elseif v1.tag ~= HostPortal then
            invariant(false, "Invalid host parent fiber. This error is likely caused by a bug in React. Please file an issue.")
        else
            containerInfo = stateNode.containerInfo
            v2 = true
        end
        if bit32.band(v1.flags, ContentReset) ~= 0 then
            resetTextContent(containerInfo)
            v1.flags = bit32.band(v1.flags, (bit32.bnot(ContentReset)))
        end
        local v3 = getHostSibling(a1)
        if v2 then
            insertOrAppendPlacementNodeIntoContainer(a1, v3, containerInfo)
            return
        end
        insertOrAppendPlacementNode(a1, v3, containerInfo)
    end,
    commitDeletion = function(a1, a2, a3, a4) -- Line: 1747 -- upvalues: unmountHostComponents (ref)
        unmountHostComponents(a1, a2, a3, a4)
        local alternate = a2.alternate
        local alternate_2 = a2.alternate
        if alternate_2 ~= nil then
            alternate_2.return_ = nil
            a2.alternate = nil
        end
        a2.return_ = nil
        if alternate ~= nil then
            local alternate_3 = alternate.alternate
            if alternate_3 ~= nil then
                alternate_3.return_ = nil
                alternate.alternate = nil
            end
            alternate.return_ = nil
        end
    end,
    commitWork = function(a1, a2) -- Line: 1779
        -- upvalues: FunctionComponent (val), ForwardRef (val), MemoComponent (val), SimpleMemoComponent (val)
        -- upvalues: Block (val), enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val)
        -- upvalues: startLayoutEffectTimer (val), commitHookEffectListUnmount (val), Layout (val), HasEffect (val)
        -- upvalues: describeError (val), recordLayoutEffectDuration (val), ClassComponent (val), HostComponent (val)
        -- upvalues: commitUpdate (val), HostText (val), invariant (val), commitTextUpdate (val), HostRoot (val)
        -- upvalues: supportsHydration (val), unimplemented (val), Profiler (val), SuspenseComponent (val)
        -- upvalues: SuspenseListComponent (val), IncompleteClassComponent (val), OffscreenComponent (val)
        -- upvalues: LegacyHiddenComponent (val), hideOrUnhideAllChildren (val)
        if a2.tag ~= FunctionComponent
            and a2.tag ~= ForwardRef
            and a2.tag ~= MemoComponent
            and a2.tag ~= SimpleMemoComponent
            and a2.tag ~= Block then
            if a2.tag == ClassComponent then
                return
            end
            if a2.tag == HostComponent then
                local stateNode = a2.stateNode
                if stateNode ~= nil then
                    local memoizedProps = a2.memoizedProps
                    local memoizedProps_2 = if not a1 then memoizedProps else a1.memoizedProps
                    local type = a2.type
                    local updateQueue = a2.updateQueue
                    a2.updateQueue = nil
                    if updateQueue ~= nil then
                        commitUpdate(stateNode, updateQueue, type, memoizedProps_2, memoizedProps, a2)
                    end
                end
                return
            end
            if a2.tag == HostText then
                invariant(
                    a2.stateNode ~= nil,
                    "This should have a text node initialized. This error is likely caused by a bug in React. Please file an issue."
                )
                local stateNode_2 = a2.stateNode
                local memoizedProps_3 = a2.memoizedProps
                local v1 = nil
                if a1 ~= nil then
                    local memoizedProps_4 = a1.memoizedProps
                    v1 = memoizedProps_3
                end
                commitTextUpdate(stateNode_2, v1, memoizedProps_3)
                return
            end
            if a2.tag == HostRoot then
                if supportsHydration then
                    local stateNode_3 = a2.stateNode
                    if stateNode_3.hydrate then
                        stateNode_3.hydrate = false
                        unimplemented("commitWork: HostRoot: commitHydratedContainer")
                    end
                end
                return
            end
            if a2.tag == Profiler then
                return
            end
            if a2.tag == SuspenseComponent then
                commitSuspenseComponent(a2)
                attachSuspenseRetryListeners(a2)
                return
            end
            if a2.tag == SuspenseListComponent then
                unimplemented("commitWork: SuspenseListComponent")
                invariant(
                    false,
                    "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue."
                )
                return
            end
            if a2.tag == IncompleteClassComponent then
                return
            end
            if a2.tag ~= OffscreenComponent and a2.tag ~= LegacyHiddenComponent then
                invariant(
                    false,
                    "This unit of work tag should not have side-effects. This error is likely caused by a bug in React. Please file an issue."
                )
                return
            end
            hideOrUnhideAllChildren(a2, a2.memoizedState ~= nil)
            return
        end
        if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(a2.mode, ProfileMode) ~= 0 then
            local success, result = xpcall(function() -- Line: 1868
                -- upvalues: startLayoutEffectTimer (upval), commitHookEffectListUnmount (upval), Layout (upval)
                -- upvalues: HasEffect (upval), a2 (val)
                startLayoutEffectTimer()
                commitHookEffectListUnmount(bit32.bor(Layout, HasEffect), a2, a2.return_)
            end, describeError)
            recordLayoutEffectDuration(a2)
            if success then
                return
            end
            error(result)
            return
        end
        commitHookEffectListUnmount(bit32.bor(Layout, HasEffect), a2, a2.return_)
    end,
    commitAttachRef = commitAttachRef,
    commitDetachRef = commitDetachRef,
    commitPassiveUnmount = function(a1) -- Line: 2118
        -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val)
        -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val)
        -- upvalues: startPassiveEffectTimer (val), commitHookEffectListUnmount (val), Passive (val), HasEffect (val)
        -- upvalues: recordPassiveEffectDuration (val)
        if a1.tag ~= FunctionComponent
            and a1.tag ~= ForwardRef
            and a1.tag ~= SimpleMemoComponent
            and a1.tag ~= Block then
            return
        end
        if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(a1.mode, ProfileMode) ~= 0 then
            startPassiveEffectTimer()
            commitHookEffectListUnmount(bit32.bor(Passive, HasEffect), a1, a1.return_)
            recordPassiveEffectDuration(a1)
            return
        end
        commitHookEffectListUnmount(bit32.bor(Passive, HasEffect), a1, a1.return_)
    end,
    commitPassiveUnmountInsideDeletedTree = function(a1, a2) -- Line: 2147
        -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val)
        -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val)
        -- upvalues: startPassiveEffectTimer (val), commitHookEffectListUnmount (val), Passive (val)
        -- upvalues: recordPassiveEffectDuration (val)
        if a1.tag ~= FunctionComponent
            and a1.tag ~= ForwardRef
            and a1.tag ~= SimpleMemoComponent
            and a1.tag ~= Block then
            return
        end
        if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(a1.mode, ProfileMode) ~= 0 then
            startPassiveEffectTimer()
            commitHookEffectListUnmount(Passive, a1, a2)
            recordPassiveEffectDuration(a1)
            return
        end
        commitHookEffectListUnmount(Passive, a1, a2)
    end,
    commitPassiveMount = function(a1, a2) -- Line: 2171
        -- upvalues: FunctionComponent (val), ForwardRef (val), SimpleMemoComponent (val), Block (val)
        -- upvalues: enableProfilerTimer (val), enableProfilerCommitHooks (val), ProfileMode (val)
        -- upvalues: startPassiveEffectTimer (val), commitHookEffectListMount (val), describeError (val), Passive (val)
        -- upvalues: HasEffect (val), recordPassiveEffectDuration (val), Profiler (val)
        if a2.tag ~= FunctionComponent
            and a2.tag ~= ForwardRef
            and a2.tag ~= SimpleMemoComponent
            and a2.tag ~= Block then
            if a2.tag == Profiler then
                commitProfilerPassiveEffect(a1, a2)
            end
            return
        end
        if enableProfilerTimer and enableProfilerCommitHooks and bit32.band(a2.mode, ProfileMode) ~= 0 then
            startPassiveEffectTimer()
            local success, result = xpcall(commitHookEffectListMount, describeError, bit32.bor(Passive, HasEffect), a2)
            recordPassiveEffectDuration(a2)
            if success then
                return
            end
            error(result)
            return
        end
        commitHookEffectListMount(bit32.bor(Passive, HasEffect), a2)
    end,
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV,
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV,
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV,
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV,
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden,
    recursivelyCommitLayoutEffects = recursivelyCommitLayoutEffects,
}