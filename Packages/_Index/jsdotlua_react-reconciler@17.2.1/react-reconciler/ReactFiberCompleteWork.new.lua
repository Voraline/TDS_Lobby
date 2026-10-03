-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberCompleteWork.new
-- Decompile time: 34.83 ms

local updateHostContainer

local function unimplemented(a1) -- Line: 11 -- types: a1: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(a1))
    error("FIXME (roblox): " .. a1 .. " is unimplemented", 2)
end

require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local OffscreenLane = ReactFiberLane.OffscreenLane
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberOffscreenComponent"))
local resetWorkInProgressVersions = require(script.Parent:WaitForChild("ReactMutableSource.new")).resetWorkInProgressVersions
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local IndeterminateComponent = ReactWorkTags.IndeterminateComponent
local FunctionComponent = ReactWorkTags.FunctionComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local ContextProvider = ReactWorkTags.ContextProvider
local ContextConsumer = ReactWorkTags.ContextConsumer
local ForwardRef = ReactWorkTags.ForwardRef
local Fragment = ReactWorkTags.Fragment
local Mode = ReactWorkTags.Mode
local Profiler = ReactWorkTags.Profiler
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local MemoComponent = ReactWorkTags.MemoComponent
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local LazyComponent = ReactWorkTags.LazyComponent
local IncompleteClassComponent = ReactWorkTags.IncompleteClassComponent
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local ScopeComponent = ReactWorkTags.ScopeComponent
local Block = ReactWorkTags.Block
local OffscreenComponent = ReactWorkTags.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTags.LegacyHiddenComponent
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local NoMode = ReactTypeOfMode.NoMode
local ConcurrentMode = ReactTypeOfMode.ConcurrentMode
local BlockingMode = ReactTypeOfMode.BlockingMode
local ProfileMode = ReactTypeOfMode.ProfileMode
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Ref = ReactFiberFlags.Ref
local Update = ReactFiberFlags.Update
local Callback = ReactFiberFlags.Callback
local Passive = ReactFiberFlags.Passive
local Deletion = ReactFiberFlags.Deletion
local NoFlags = ReactFiberFlags.NoFlags
local DidCapture = ReactFiberFlags.DidCapture
local Snapshot = ReactFiberFlags.Snapshot
local MutationMask = ReactFiberFlags.MutationMask
local LayoutMask = ReactFiberFlags.LayoutMask
local PassiveMask = ReactFiberFlags.PassiveMask
local StaticMask = ReactFiberFlags.StaticMask
local PerformedWork = ReactFiberFlags.PerformedWork
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local createInstance = ReactFiberHostConfig.createInstance
local createTextInstance = ReactFiberHostConfig.createTextInstance
local appendInitialChild = ReactFiberHostConfig.appendInitialChild
local finalizeInitialChildren = ReactFiberHostConfig.finalizeInitialChildren
local prepareUpdate = ReactFiberHostConfig.prepareUpdate
local supportsMutation = ReactFiberHostConfig.supportsMutation
local supportsPersistence = ReactFiberHostConfig.supportsPersistence
local createContainerChildSet = ReactFiberHostConfig.createContainerChildSet
local finalizeContainerChildren = ReactFiberHostConfig.finalizeContainerChildren
local preparePortalMount = ReactFiberHostConfig.preparePortalMount
local v1 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local getRootHostContainer = v1.getRootHostContainer
local popHostContext = v1.popHostContext
local getHostContext = v1.getHostContext
local popHostContainer = v1.popHostContainer
local v2 = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new"))
local popSuspenseContext = v2.popSuspenseContext
local suspenseStackCursor = v2.suspenseStackCursor
local InvisibleParentSuspenseContext = v2.InvisibleParentSuspenseContext
local hasSuspenseContext = v2.hasSuspenseContext
local v3 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local isContextProvider = v3.isContextProvider
local popContext = v3.popContext
local popTopLevelContextObject = v3.popTopLevelContextObject
local popProvider = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).popProvider
local v4 = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new"))
local prepareToHydrateHostSuspenseInstance = v4.prepareToHydrateHostSuspenseInstance
local popHydrationState = v4.popHydrationState
local resetHydrationState = v4.resetHydrationState
local prepareToHydrateHostInstance = v4.prepareToHydrateHostInstance
local prepareToHydrateHostTextInstance = v4.prepareToHydrateHostTextInstance
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSchedulerTracing = ReactFeatureFlags.enableSchedulerTracing
local enableSuspenseCallback = ReactFeatureFlags.enableSuspenseCallback
local enableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local enableFundamentalAPI = ReactFeatureFlags.enableFundamentalAPI
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local u215 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new"))
local popRenderLanes = u215.popRenderLanes
local markSpawnedWork = u215.markSpawnedWork
local renderDidSuspend = u215.renderDidSuspend
local renderDidSuspendDelayIfPossible = u215.renderDidSuspendDelayIfPossible
local NoLanes = ReactFiberLane.NoLanes
local includesSomeLane = ReactFiberLane.includesSomeLane
local mergeLanes = ReactFiberLane.mergeLanes
local transferActualDuration = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).transferActualDuration

local function markUpdate(a1) -- Line: 185 -- upvalues: Update (val)
    a1.flags = bit32.bor(a1.flags, Update)
end

local function markRef(a1) -- Line: 191 -- upvalues: Ref (val)
    a1.flags = bit32.bor(a1.flags, Ref)
end

local function hadNoMutationsEffects(a1, a2) -- Line: 197 -- upvalues: MutationMask (val), NoFlags (val)
    local v1 = false
    if a1 ~= nil then
        v1 = a1.child == a2.child
    end
    if v1 then
        return true
    end
    local child = a2.child
    while child ~= nil do
        if (bit32.band(child.flags, MutationMask)) ~= NoFlags
            or (bit32.band(child.subtreeFlags, MutationMask)) ~= NoFlags then
            return false
        end
        child = child.sibling
    end
    return true
end

local u235 = nil
local updateHostComponent = nil
local updateHostText = nil
if supportsMutation then
    function u235(a1, a2, a3, a4) -- Line: 223
        -- upvalues: HostComponent (val), HostText (val), appendInitialChild (val), enableFundamentalAPI (val)
        -- upvalues: FundamentalComponent (val), HostPortal (val)
        local child = a2.child
        local v1, v2 = a1, a2
        while child ~= nil do
            if child.tag ~= HostComponent and child.tag ~= HostText then
                if enableFundamentalAPI and child.tag == FundamentalComponent then
                    appendInitialChild(v1, child.stateNode.instance)
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
                    continue
                end
                if child.tag == HostPortal then
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
                    continue
                end
                if child.child ~= nil then
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
                continue
            end
            appendInitialChild(v1, child.stateNode)
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

    function updateHostContainer(a1, a2) end

    function updateHostComponent(a1, a2, a3, a4, a5) -- Line: 264
        -- upvalues: getHostContext (val), prepareUpdate (val), Update (val)
        local memoizedProps = a1.memoizedProps
        if memoizedProps == a4 then
            return
        end
        local v1 = prepareUpdate(a2.stateNode, a3, memoizedProps, a4, a5, (getHostContext()))
        a2.updateQueue = v1
        if v1 then
            a2.flags = bit32.bor(a2.flags, Update)
        end
    end

    function updateHostText(a1, a2, a3, a4) -- Line: 305 -- upvalues: Update (val) -- types: a3: string, a4: string
        if a3 ~= a4 then
            a2.flags = bit32.bor(a2.flags, Update)
        end
    end
elseif not supportsPersistence then
    function updateHostContainer(a1, a2) end
else
    function u235(a1, a2, a3, a4) -- Line: 318 -- types: a3: boolean, a4: boolean
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildren"))
        error("FIXME (roblox): appendAllChildren is unimplemented", 2)
    end

    local function appendAllChildrenToContainer(a1, a2, a3, a4) -- Line: 413 -- types: a3: boolean, a4: boolean
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
        error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
    end

    function updateHostContainer(a1, a2) -- Line: 507
        -- upvalues: hadNoMutationsEffects (val), createContainerChildSet (val), Update (val)
        -- upvalues: finalizeContainerChildren (val)
        local stateNode = a2.stateNode
        if hadNoMutationsEffects(a1, a2) then
            return
        end
        local containerInfo = stateNode.containerInfo
        local v1 = createContainerChildSet(containerInfo)
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("appendAllChildrenToContainer"))
        error("FIXME (roblox): appendAllChildrenToContainer is unimplemented", 2)
        stateNode.pendingChildren = v1
        a2.flags = bit32.bor(a2.flags, Update)
        finalizeContainerChildren(containerInfo, v1)
    end
end

local function bubbleProperties(a1) -- Line: 716
    -- upvalues: NoLanes (val), NoFlags (val), enableProfilerTimer (val), ProfileMode (val), NoMode (val)
    -- upvalues: mergeLanes (val), StaticMask (val)
    local v1 = false
    if a1.alternate ~= nil then
        v1 = a1.alternate.child == a1.child
    end
    local v2 = NoLanes
    local v3 = NoFlags
    if v1 then
        if not enableProfilerTimer or (bit32.band(a1.mode, ProfileMode)) == NoMode then
            local child_4 = a1.child
            while child_4 ~= nil do
                v2 = bit32.bor(v2, (bit32.bor(child_4.lanes, child_4.childLanes)))
                v3 = bit32.bor(bit32.bor(v3, (bit32.band(child_4.subtreeFlags, StaticMask))), (bit32.band(child_4.flags, StaticMask)))
                child_4.return_ = a1
                child_4 = child_4.sibling
            end
        else
            local selfBaseDuration_2 = a1.selfBaseDuration
            local child_3 = a1.child
            while child_3 ~= nil do
                v2 = mergeLanes(v2, mergeLanes(child_3.lanes, child_3.childLanes))
                v3 = bit32.bor(bit32.bor(v3, (bit32.band(child_3.subtreeFlags, StaticMask))), (bit32.band(child_3.flags, StaticMask)))
                selfBaseDuration_2 = selfBaseDuration_2 + child_3.treeBaseDuration
                child_3 = child_3.sibling
            end
            a1.treeBaseDuration = selfBaseDuration_2
        end
    elseif not enableProfilerTimer or (bit32.band(a1.mode, ProfileMode)) == NoMode then
        local child_2 = a1.child
        while child_2 ~= nil do
            v2 = bit32.bor(v2, (bit32.bor(child_2.lanes, child_2.childLanes)))
            v3 = bit32.bor(bit32.bor(v3, child_2.subtreeFlags), child_2.flags)
            child_2.return_ = a1
            child_2 = child_2.sibling
        end
    else
        local actualDuration = a1.actualDuration
        local selfBaseDuration = a1.selfBaseDuration
        local child = a1.child
        while child ~= nil do
            v2 = mergeLanes(v2, mergeLanes(child.lanes, child.childLanes))
            v3 = bit32.bor(bit32.bor(v3, child.subtreeFlags), child.flags)
            actualDuration = actualDuration + child.actualDuration
            selfBaseDuration = selfBaseDuration + child.treeBaseDuration
            child = child.sibling
        end
        a1.actualDuration = actualDuration
        a1.treeBaseDuration = selfBaseDuration
    end
    a1.subtreeFlags = bit32.bor(a1.subtreeFlags, v3)
    a1.childLanes = v2
    return v1
end

return {
    completeWork = function(a1, a2, a3) -- Line: 855
        -- upvalues: IndeterminateComponent (val), LazyComponent (val), SimpleMemoComponent (val)
        -- upvalues: FunctionComponent (val), ForwardRef (val), Fragment (val), Mode (val), ContextConsumer (val)
        -- upvalues: MemoComponent (val), bubbleProperties (val), ClassComponent (val), isContextProvider (val)
        -- upvalues: popContext (val), HostRoot (val), popHostContainer (val), popTopLevelContextObject (val)
        -- upvalues: resetWorkInProgressVersions (val), popHydrationState (val), Update (val), Snapshot (val)
        -- upvalues: updateHostContainer (ref), HostComponent (val), popHostContext (val), getRootHostContainer (val)
        -- upvalues: updateHostComponent (ref), Ref (val), invariant (val), getHostContext (val)
        -- upvalues: prepareToHydrateHostInstance (val), createInstance (val), u235 (ref), finalizeInitialChildren (val)
        -- upvalues: HostText (val), updateHostText (ref), prepareToHydrateHostTextInstance (val)
        -- upvalues: createTextInstance (val), Profiler (val), Callback (val), Passive (val), PerformedWork (val)
        -- upvalues: NoFlags (val), LayoutMask (val), Deletion (val), PassiveMask (val), SuspenseComponent (val)
        -- upvalues: popSuspenseContext (val), enableSuspenseServerRenderer (val)
        -- upvalues: prepareToHydrateHostSuspenseInstance (val), enableSchedulerTracing (val), markSpawnedWork (val)
        -- upvalues: OffscreenLane (val), enableProfilerTimer (val), ProfileMode (val), NoMode (val)
        -- upvalues: resetHydrationState (val), DidCapture (val), transferActualDuration (val), BlockingMode (val)
        -- upvalues: hasSuspenseContext (val), suspenseStackCursor (val), InvisibleParentSuspenseContext (val)
        -- upvalues: renderDidSuspend (val), renderDidSuspendDelayIfPossible (val), supportsPersistence (val)
        -- upvalues: supportsMutation (val), enableSuspenseCallback (val), HostPortal (val), preparePortalMount (val)
        -- upvalues: ContextProvider (val), popProvider (val), IncompleteClassComponent (val)
        -- upvalues: SuspenseListComponent (val), FundamentalComponent (val), ScopeComponent (val), Block (val)
        -- upvalues: OffscreenComponent (val), LegacyHiddenComponent (val), popRenderLanes (val), includesSomeLane (val)
        -- upvalues: u215 (val), ConcurrentMode (val)
        local pendingProps = a2.pendingProps
        if a2.tag ~= IndeterminateComponent
            and a2.tag ~= LazyComponent
            and a2.tag ~= SimpleMemoComponent
            and a2.tag ~= FunctionComponent
            and a2.tag ~= ForwardRef
            and a2.tag ~= Fragment
            and a2.tag ~= Mode
            and a2.tag ~= ContextConsumer
            and a2.tag ~= MemoComponent then
            local v1, v2, v3
            if a2.tag == ClassComponent then
                if isContextProvider(a2.type) then
                    popContext(a2)
                end
                bubbleProperties(a2)
                return nil
            end
            if a2.tag == HostRoot then
                popHostContainer(a2)
                popTopLevelContextObject(a2)
                resetWorkInProgressVersions()
                local stateNode = a2.stateNode
                if stateNode.pendingContext then
                    stateNode.context = stateNode.pendingContext
                    stateNode.pendingContext = nil
                end
                if a1 == nil or a1.child == nil then
                    if popHydrationState(a2) then
                        a2.flags = bit32.bor(a2.flags, Update)
                    elseif not stateNode.hydrate then
                        a2.flags = bit32.bor(a2.flags, Snapshot)
                    end
                end
                updateHostContainer(a1, a2)
                bubbleProperties(a2)
                return nil
            end
            if a2.tag == HostComponent then
                popHostContext(a2)
                v1 = getRootHostContainer()
                local type_2 = a2.type
                if a1 ~= nil and a2.stateNode ~= nil then
                    updateHostComponent(a1, a2, type_2, pendingProps, v1)
                    if a1.ref ~= a2.ref then
                        a2.flags = bit32.bor(a2.flags, Ref)
                    end
                    bubbleProperties(a2)
                    return nil
                end
                if not pendingProps then
                    invariant(
                        a2.stateNode ~= nil,
                        "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue."
                    )
                    bubbleProperties(a2)
                    return nil
                end
                v3 = getHostContext()
                if not popHydrationState(a2) then
                    local v4 = createInstance(type_2, pendingProps, v1, v3, a2)
                    u235(v4, a2, false, false)
                    a2.stateNode = v4
                    if finalizeInitialChildren(v4, type_2, pendingProps, v1, v3) then
                        a2.flags = bit32.bor(a2.flags, Update)
                    end
                elseif prepareToHydrateHostInstance(a2, v1, v3) then
                    a2.flags = bit32.bor(a2.flags, Update)
                end
                if a2.ref ~= nil then
                    a2.flags = bit32.bor(a2.flags, Ref)
                end
                bubbleProperties(a2)
                return nil
            end
            if a2.tag == HostText then
                if not a1 or a2.stateNode == nil then
                    if typeof(pendingProps) ~= "string" then
                        invariant(
                            a2.stateNode ~= nil,
                            "We must have new props for new mounts. This error is likely caused by a bug in React. Please file an issue."
                        )
                    end
                    v1 = getRootHostContainer()
                    v2 = getHostContext()
                    if not popHydrationState(a2) then
                        a2.stateNode = createTextInstance(pendingProps, v1, v2, a2)
                    elseif prepareToHydrateHostTextInstance(a2) then
                        a2.flags = bit32.bor(a2.flags, Update)
                    end
                else
                    local memoizedProps = a1.memoizedProps
                    updateHostText(a1, a2, memoizedProps, pendingProps)
                end
                bubbleProperties(a2)
                return nil
            end
            if a2.tag == Profiler then
                if not bubbleProperties(a2) then
                    local subtreeFlags = a2.subtreeFlags
                    local flags_8 = a2.flags
                    local v5 = flags_8
                    if (bit32.band(flags_8, PerformedWork)) ~= NoFlags
                        or (bit32.band(subtreeFlags, PerformedWork)) ~= NoFlags then
                        v5 = bit32.bor(v5, Update)
                    end
                    if (bit32.band(flags_8, (bit32.bor(LayoutMask, Deletion)))) ~= NoFlags
                        or (bit32.band(subtreeFlags, (bit32.bor(LayoutMask, Deletion)))) ~= NoFlags then
                        v5 = bit32.bor(v5, Callback)
                    end
                    if (bit32.band(flags_8, PassiveMask)) ~= NoFlags
                        or (bit32.band(subtreeFlags, PassiveMask)) ~= NoFlags then
                        v5 = bit32.bor(v5, Passive)
                    end
                    a2.flags = v5
                end
                return nil
            end
            if a2.tag ~= SuspenseComponent then
                if a2.tag == HostPortal then
                    popHostContainer(a2)
                    updateHostContainer(a1, a2)
                    if a1 == nil then
                        preparePortalMount(a2.stateNode.containerInfo)
                    end
                    bubbleProperties(a2)
                    return nil
                end
                if a2.tag == ContextProvider then
                    popProvider(a2)
                    bubbleProperties(a2)
                    return nil
                end
                if a2.tag == IncompleteClassComponent then
                    if isContextProvider(a2.type) then
                        popContext(a2)
                    end
                    bubbleProperties(a2)
                    return nil
                end
                if a2.tag == SuspenseListComponent then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("UNIMPLEMENTED ERROR: " .. tostring("SuspenseListComponent"))
                    error("FIXME (roblox): SuspenseListComponent is unimplemented", 2)
                    invariant(
                        false,
                        "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.",
                        (tostring(a2.tag))
                    )
                    return nil
                end
                if a2.tag == FundamentalComponent then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("UNIMPLEMENTED ERROR: " .. tostring("FundamentalComponent"))
                    error("FIXME (roblox): FundamentalComponent is unimplemented", 2)
                    invariant(
                        false,
                        "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.",
                        (tostring(a2.tag))
                    )
                    return nil
                end
                if a2.tag == ScopeComponent then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("UNIMPLEMENTED ERROR: " .. tostring("ScopeComponent"))
                    error("FIXME (roblox): ScopeComponent is unimplemented", 2)
                    invariant(
                        false,
                        "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.",
                        (tostring(a2.tag))
                    )
                    return nil
                end
                if a2.tag == Block then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("UNIMPLEMENTED ERROR: " .. tostring("Block"))
                    error("FIXME (roblox): Block is unimplemented", 2)
                    invariant(
                        false,
                        "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.",
                        (tostring(a2.tag))
                    )
                    return nil
                end
                if a2.tag ~= OffscreenComponent and a2.tag ~= LegacyHiddenComponent then
                    invariant(
                        false,
                        "Unknown unit of work tag (%s). This error is likely caused by a bug in React. Please file an issue.",
                        (tostring(a2.tag))
                    )
                    return nil
                end
                popRenderLanes(a2)
                v2 = a2.memoizedState ~= nil
                if a1 ~= nil
                    and a1.memoizedState ~= nil ~= v2
                    and pendingProps.mode ~= "unstable-defer-without-hiding" then
                    a2.flags = bit32.bor(a2.flags, Update)
                end
                if not v2
                    or includesSomeLane(u215.subtreeRenderLanes, OffscreenLane)
                    or (bit32.band(a2.mode, ConcurrentMode)) == NoMode then
                    bubbleProperties(a2)
                end
                return nil
            end
            popSuspenseContext(a2)
            local memoizedState = a2.memoizedState
            if enableSuspenseServerRenderer and memoizedState ~= nil and memoizedState.dehydrated ~= nil then
                if a1 == nil then
                    invariant(
                        popHydrationState(a2),
                        "A dehydrated suspense component was completed without a hydrated node. This is probably a bug in React."
                    )
                    prepareToHydrateHostSuspenseInstance(a2)
                    if enableSchedulerTracing then
                        markSpawnedWork(OffscreenLane)
                    end
                    bubbleProperties(a2)
                    if enableProfilerTimer
                        and (bit32.band(a2.mode, ProfileMode)) ~= NoMode
                        and memoizedState ~= nil then
                        local child = a2.child
                        if child ~= nil then
                            a2.treeBaseDuration = child.treeBaseDuration
                        end
                    end
                    return nil
                end
                resetHydrationState()
                if (bit32.band(a2.flags, DidCapture)) == NoFlags then
                    a2.memoizedState = nil
                end
                a2.flags = bit32.bor(a2.flags, Update)
                bubbleProperties(a2)
                if enableProfilerTimer and (bit32.band(a2.mode, ProfileMode)) ~= NoMode and memoizedState ~= nil then
                    local child_2 = a2.child
                    if child_2 ~= nil then
                        a2.treeBaseDuration = a2.treeBaseDuration - child_2.treeBaseDuration
                    end
                end
                return nil
            end
            if (bit32.band(a2.flags, DidCapture)) ~= NoFlags then
                a2.lanes = a3
                if enableProfilerTimer and (bit32.band(a2.mode, ProfileMode)) ~= NoMode then
                    transferActualDuration(a2)
                end
                return a2
            end
            v2 = memoizedState ~= nil
            v3 = false
            if a1 ~= nil then
                v3 = a1.memoizedState ~= nil
            elseif a2.memoizedProps.fallback ~= nil then
                popHydrationState(a2)
            end
            if v2 and not v3 then
                local v6 = bit32.band(a2.mode, BlockingMode)
                if v6 ~= NoMode then
                    v6 = false
                    if a1 == nil then
                        v6 = a2.memoizedProps.unstable_avoidThisFallback ~= true
                    end
                    if v6 then
                        renderDidSuspend()
                    elseif not hasSuspenseContext(suspenseStackCursor.current, InvisibleParentSuspenseContext) then
                        renderDidSuspendDelayIfPossible()
                    else
                        renderDidSuspend()
                    end
                end
            end
            if supportsPersistence and v2 then
                a2.flags = bit32.bor(a2.flags, Update)
            end
            if supportsMutation then
                if v2 or v3 then
                    a2.flags = bit32.bor(a2.flags, Update)
                end
            end
            if enableSuspenseCallback and a2.updateQueue ~= nil and a2.memoizedProps.suspenseCallback ~= nil then
                a2.flags = bit32.bor(a2.flags, Update)
            end
            bubbleProperties(a2)
            if enableProfilerTimer and (bit32.band(a2.mode, ProfileMode)) ~= NoMode and v2 then
                local child_3 = a2.child
                if child_3 ~= nil then
                    a2.treeBaseDuration = a2.treeBaseDuration - child_3.treeBaseDuration
                end
            end
            return nil
        end
        bubbleProperties(a2)
        return nil
    end,
}