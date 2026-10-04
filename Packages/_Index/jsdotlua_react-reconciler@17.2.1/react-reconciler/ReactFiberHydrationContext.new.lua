-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHydrationContext.new
-- Decompile time: 5.15 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console

local function unimplemented(a1) -- Line: 16 -- types: a1: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. a1)
    error("FIXME (roblox): " .. a1 .. " is unimplemented", 2)
end

require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local HostComponent = ReactWorkTags.HostComponent
local HostText = ReactWorkTags.HostText
local HostRoot = ReactWorkTags.HostRoot
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Placement = ReactFiberFlags.Placement
local Hydrating = ReactFiberFlags.Hydrating
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local createFiberFromDehydratedFragment = (require((script.Parent:WaitForChild("ReactFiber.new")))).createFiberFromDehydratedFragment
local supportsHydration = ReactFiberHostConfig.supportsHydration
local getNextHydratableSibling = ReactFiberHostConfig.getNextHydratableSibling
local getFirstHydratableChild = ReactFiberHostConfig.getFirstHydratableChild
local canHydrateInstance = ReactFiberHostConfig.canHydrateInstance
local canHydrateTextInstance = ReactFiberHostConfig.canHydrateTextInstance
local canHydrateSuspenseInstance = ReactFiberHostConfig.canHydrateSuspenseInstance
local hydrateInstance = ReactFiberHostConfig.hydrateInstance
local hydrateTextInstance = ReactFiberHostConfig.hydrateTextInstance
local hydrateSuspenseInstance = ReactFiberHostConfig.hydrateSuspenseInstance
local getNextHydratableInstanceAfterSuspenseInstance = ReactFiberHostConfig.getNextHydratableInstanceAfterSuspenseInstance
local didNotMatchHydratedContainerTextInstance = ReactFiberHostConfig.didNotMatchHydratedContainerTextInstance
local didNotMatchHydratedTextInstance = ReactFiberHostConfig.didNotMatchHydratedTextInstance
local shouldSetTextContent = ReactFiberHostConfig.shouldSetTextContent
local enableSuspenseServerRenderer = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableSuspenseServerRenderer
local OffscreenLane = (require((script.Parent:WaitForChild("ReactFiberLane")))).OffscreenLane
local u109 = nil
local u110 = nil
local u111 = false

function warnIfHydrating() -- Line: 89 -- upvalues: u111 (ref), console (val)
    if _G.__DEV__ and u111 then
        console.error("We should not be hydrating here. This is a bug in React. Please file a bug.")
    end
end

function enterHydrationState(a1) -- Line: 99
    -- upvalues: supportsHydration (val), u110 (ref), getFirstHydratableChild (val), u109 (ref), u111 (ref)
    if not supportsHydration then
        return false
    end
    u110 = getFirstHydratableChild(a1.stateNode.containerInfo)
    u109 = a1
    u111 = true
    return true
end

function reenterHydrationStateFromDehydratedSuspenseInstance(a1, a2) -- Line: 111
    -- upvalues: supportsHydration (val), u110 (ref), getNextHydratableSibling (val), u111 (ref)
    if not supportsHydration then
        return false
    end
    u110 = getNextHydratableSibling(a2)
    popToNextHostParent(a1)
    u111 = true
    return true
end

function deleteHydratableInstance(a1, a2) -- Line: 125
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: deleteHydratableInstance")
    error("FIXME (roblox): deleteHydratableInstance is unimplemented", 2)
end

function insertNonHydratedInstance(a1, a2) -- Line: 160 -- upvalues: Hydrating (val), Placement (val)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: insertNonHydratedInstance")
    error("FIXME (roblox): insertNonHydratedInstance is unimplemented", 2)
    a2.flags = bit32.bor(bit32.band(a2.flags, (bit32.bnot(Hydrating))), Placement)
end

function tryHydrate(a1, a2) -- Line: 224
    -- upvalues: HostComponent (val), canHydrateInstance (val), HostText (val), canHydrateTextInstance (val)
    -- upvalues: SuspenseComponent (val), enableSuspenseServerRenderer (val), canHydrateSuspenseInstance (val)
    -- upvalues: OffscreenLane (val), createFiberFromDehydratedFragment (val)
    local v1
    if a1.tag == HostComponent then
        v1 = canHydrateInstance(a2, a1.type, a1.pendingProps)
        if v1 == nil then
            return false
        end
        a1.stateNode = v1
        return true
    end
    if a1.tag == HostText then
        local v2 = canHydrateTextInstance(a2, a1.pendingProps)
        if v2 == nil then
            return false
        end
        a1.stateNode = v2
        return true
    end
    if a1.tag ~= SuspenseComponent then
        return false
    end
    if enableSuspenseServerRenderer then
        local v3 = canHydrateSuspenseInstance(a2)
        if v3 ~= nil then
            a1.memoizedState = {dehydrated = v3, retryLane = OffscreenLane}
            v1 = createFiberFromDehydratedFragment(v3)
            v1.return_ = a1
            a1.child = v1
            return true
        end
    end
    return false
end

function tryToClaimNextHydratableInstance(a1) -- Line: 269
    -- upvalues: u111 (ref), u110 (ref), u109 (ref), getNextHydratableSibling (val), getFirstHydratableChild (val)
    if not u111 then
        return
    end
    local v1 = u110
    if not v1 then
        insertNonHydratedInstance(u109, a1)
        u111 = false
        u109 = a1
        return
    end
    local v2 = v1
    if tryHydrate(a1, v1) then
        u109 = a1
        u110 = getFirstHydratableChild(v1)
        return
    end
    v1 = getNextHydratableSibling(v2)
    if v1 and tryHydrate(a1, v1) then
        deleteHydratableInstance(u109, v2)
        u109 = a1
        u110 = getFirstHydratableChild(v1)
        return
    end
    insertNonHydratedInstance(u109, a1)
    u111 = false
    u109 = a1
end

function prepareToHydrateHostInstance(a1, a2, a3) -- Line: 305
    -- upvalues: supportsHydration (val), invariant (val), hydrateInstance (val)
    if not supportsHydration then
        invariant(
            false,
            "Expected prepareToHydrateHostInstance() to never be called. This error is likely caused by a bug in React. Please file an issue."
        )
    end
    local v1 = hydrateInstance(a1.stateNode, a1.type, a1.memoizedProps, a2, a3, a1)
    a1.updateQueue = v1
    if v1 ~= nil then
        return true
    end
    return false
end

function prepareToHydrateHostTextInstance(a1) -- Line: 337
    -- upvalues: supportsHydration (val), invariant (val), hydrateTextInstance (val), u109 (ref), HostRoot (val)
    -- upvalues: didNotMatchHydratedContainerTextInstance (val), HostComponent (val)
    -- upvalues: didNotMatchHydratedTextInstance (val)
    if not supportsHydration then
        invariant(
            false,
            "Expected prepareToHydrateHostTextInstance() to never be called. This error is likely caused by a bug in React. Please file an issue."
        )
    end
    local stateNode = a1.stateNode
    local memoizedProps = a1.memoizedProps
    local v1 = hydrateTextInstance(stateNode, memoizedProps, a1)
    if _G.__DEV__ and v1 then
        local v2 = u109
        if v2 ~= nil then
            if v2.tag == HostRoot then
                didNotMatchHydratedContainerTextInstance(v2.stateNode.containerInfo, stateNode, memoizedProps)
                return v1
            end
            if v2.tag == HostComponent then
                didNotMatchHydratedTextInstance(v2.type, v2.memoizedProps, v2.stateNode, stateNode, memoizedProps)
            end
        end
    end
    return v1
end

function prepareToHydrateHostSuspenseInstance(a1) -- Line: 380
    -- upvalues: supportsHydration (val), invariant (val), hydrateSuspenseInstance (val)
    local dehydrated
    if not supportsHydration then
        invariant(
            false,
            "Expected prepareToHydrateHostSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue."
        )
    end
    local memoizedState = a1.memoizedState
    invariant(
        if memoizedState == nil then nil else memoizedState.dehydrated,
        "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue."
    )
    hydrateSuspenseInstance(dehydrated, a1)
end

function skipPastDehydratedSuspenseInstance(a1) -- Line: 405
    -- upvalues: supportsHydration (val), invariant (val), getNextHydratableInstanceAfterSuspenseInstance (val)
    local dehydrated
    if not supportsHydration then
        invariant(
            false,
            "Expected skipPastDehydratedSuspenseInstance() to never be called. This error is likely caused by a bug in React. Please file an issue."
        )
    end
    local memoizedState = a1.memoizedState
    invariant(
        if memoizedState == nil then nil else memoizedState.dehydrated,
        "Expected to have a hydrated suspense instance. This error is likely caused by a bug in React. Please file an issue."
    )
    return getNextHydratableInstanceAfterSuspenseInstance(dehydrated)
end

function popToNextHostParent(a1) -- Line: 428
    -- upvalues: HostComponent (val), HostRoot (val), SuspenseComponent (val), u109 (ref)
    local return_ = a1.return_
    while return_ ~= nil do
        if return_.tag == HostComponent or return_.tag == HostRoot or return_.tag == SuspenseComponent then
            break
        end
        return_ = return_.return_
    end
    u109 = return_
end

function popHydrationState(a1) -- Line: 441
    -- upvalues: supportsHydration (val), u109 (ref), u111 (ref), HostComponent (val), shouldSetTextContent (val)
    -- upvalues: u110 (ref), getNextHydratableSibling (val), SuspenseComponent (val)
    if not supportsHydration or a1 ~= u109 then
        return false
    end
    if not u111 then
        popToNextHostParent(a1)
        u111 = true
        return false
    end
    local type = a1.type
    if a1.tag ~= HostComponent
        or type ~= "head" and type ~= "body" and not shouldSetTextContent(type, a1.memoizedProps) then
        local v1 = u110
        while v1 do
            deleteHydratableInstance(a1, v1)
            v1 = getNextHydratableSibling(v1)
        end
    end
    popToNextHostParent(a1)
    u110 = if a1.tag ~= SuspenseComponent then if not u109 then nil else getNextHydratableSibling(a1.stateNode) else skipPastDehydratedSuspenseInstance(a1)
    return true
end

function resetHydrationState() -- Line: 494 -- upvalues: supportsHydration (val), u109 (ref), u110 (ref), u111 (ref)
    if not supportsHydration then
        return
    end
    u109 = nil
    u110 = nil
    u111 = false
end

function getIsHydrating() -- Line: 504 -- upvalues: u111 (ref)
    return u111
end

return {
    warnIfHydrating = warnIfHydrating,
    enterHydrationState = enterHydrationState,
    getIsHydrating = getIsHydrating,
    reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance,
    resetHydrationState = resetHydrationState,
    tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance,
    prepareToHydrateHostInstance = prepareToHydrateHostInstance,
    prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance,
    prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance,
    popHydrationState = popHydrationState,
}