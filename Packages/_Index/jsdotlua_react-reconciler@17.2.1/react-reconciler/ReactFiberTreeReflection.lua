-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberTreeReflection
-- Decompile time: 6.64 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local get = require(script.Parent.Parent:WaitForChild("shared")).ReactInstanceMap.get
local ReactSharedInternals = (require((script.Parent.Parent:WaitForChild("shared")))).ReactSharedInternals
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ClassComponent = ReactWorkTags.ClassComponent
local HostComponent = ReactWorkTags.HostComponent
local HostRoot = ReactWorkTags.HostRoot
local HostPortal = ReactWorkTags.HostPortal
local HostText = ReactWorkTags.HostText
local FundamentalComponent = ReactWorkTags.FundamentalComponent
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local Placement = ReactFiberFlags.Placement
local Hydrating = ReactFiberFlags.Hydrating
local enableFundamentalAPI = (require((script.Parent.Parent:WaitForChild("shared")))).ReactFeatureFlags.enableFundamentalAPI
local ReactCurrentOwner = ReactSharedInternals.ReactCurrentOwner
local v1 = {}

local function getNearestMountedFiber(a1) -- Line: 47
    -- upvalues: Placement (val), Hydrating (val), NoFlags (val), HostRoot (val)
    local return__3 = a1
    local return_ = a1
    if a1.alternate then
        while return__3.return_ do
            return__3 = return__3.return_
        end
    else
        local return__2 = return__3
        repeat
            return__3 = return__2
            if (bit32.band(return__3.flags, (bit32.bor(Placement, Hydrating)))) ~= NoFlags then
                return_ = return__3.return_
            end
            return__2 = return__3.return_
        until not return__2
    end
    if return__3.tag == HostRoot then
        return return_
    end
    return nil
end

v1.getNearestMountedFiber = getNearestMountedFiber

function v1.getSuspenseInstanceFromFiber(a1) -- Line: 81 -- upvalues: SuspenseComponent (val)
    if a1.tag == SuspenseComponent then
        local memoizedState = a1.memoizedState
        if memoizedState == nil then
            local alternate = a1.alternate
            if alternate ~= nil then
                memoizedState = alternate.memoizedState
            end
        end
        if memoizedState then
            return memoizedState.dehydrated
        end
    end
    return nil
end

function v1.getContainerFromFiber(a1) -- Line: 97 -- upvalues: HostRoot (val)
    if a1.tag == HostRoot then
        return a1.stateNode.containerInfo
    end
    return nil
end

function v1.isFiberMounted(a1) -- Line: 101 -- upvalues: getNearestMountedFiber (val)
    return getNearestMountedFiber(a1) == a1
end

function v1.isMounted(a1) -- Line: 107
    -- upvalues: ReactCurrentOwner (val), ClassComponent (val), console (val), getComponentName (val), get (val)
    -- upvalues: getNearestMountedFiber (val)
    if _G.__DEV__ then
        local current = ReactCurrentOwner.current
        if current ~= nil and current.tag == ClassComponent then
            local stateNode = current.stateNode
            if not stateNode._warnedAboutRefsInRender then
                console.error(
                    "%s is accessing isMounted inside its render() function. render() should be a pure function of props and state. It should never access something that requires stale data from the previous render, such as refs. Move this logic to componentDidMount and componentDidUpdate instead.",
                    getComponentName(current.type) or "A component"
                )
            end
            stateNode._warnedAboutRefsInRender = true
        end
    end
    local v1 = get(a1)
    if not v1 then
        return false
    end
    return getNearestMountedFiber(v1) == v1
end

local function assertIsMounted(a1) -- Line: 137 -- upvalues: invariant (val), getNearestMountedFiber (val)
    invariant(getNearestMountedFiber(a1) == a1, "Unable to find node on an unmounted component.")
end

local function findCurrentFiberUsingSlowPath(a1) -- Line: 144
    -- upvalues: getNearestMountedFiber (val), invariant (val), HostRoot (val)
    local alternate_2, child, child_2, child_3, return_, return__2, v1, v2
    local alternate = a1.alternate
    if not alternate then
        v1 = getNearestMountedFiber(a1)
        invariant(v1 ~= nil, "Unable to find node on an unmounted component.")
        if v1 ~= a1 then
            return nil
        end
        return a1
    end
    v1 = a1
    local v3 = alternate
    local v4 = a1
    while true do
        return_ = v1.return_
        if return_ == nil then
            break
        end
        alternate_2 = return_.alternate
        if alternate_2 ~= nil then
            if return_.child == alternate_2.child then
                child = return_.child
                while child do
                    if child == v1 then
                        invariant(getNearestMountedFiber(return_) == return_, "Unable to find node on an unmounted component.")
                        return v4
                    end
                    if child == v3 then
                        invariant(getNearestMountedFiber(return_) == return_, "Unable to find node on an unmounted component.")
                        return alternate
                    end
                    child = child.sibling
                end
                invariant(false, "Unable to find node on an unmounted component.")
            end
            if v1.return_ == v3.return_ then
                v2 = false
                child_2 = return_.child
                while child_2 do
                    if child_2 == v1 then
                        v2 = true
                        v1 = return_
                        v3 = alternate_2
                        break
                    end
                    if child_2 == v3 then
                        v2 = true
                        v3 = return_
                        v1 = alternate_2
                        break
                    end
                    child_2 = child_2.sibling
                end
                if not v2 then
                    child_3 = alternate_2.child
                    while child_3 do
                        if child_3 == v1 then
                            v2 = true
                            v1 = alternate_2
                            v3 = return_
                            break
                        end
                        if child_3 == v3 then
                            v2 = true
                            v3 = alternate_2
                            v1 = return_
                            break
                        end
                        child_3 = child_3.sibling
                    end
                    invariant(
                        v2,
                        "Child was not found in either parent set. This indicates a bug in React related to the return pointer. Please file an issue."
                    )
                end
            else
                v1 = return_
                v3 = alternate_2
            end
            invariant(
                v1.alternate == v3,
                "Return fibers should always be each others' alternates. This error is likely caused by a bug in React. Please file an issue."
            )
        else
            return__2 = return_.return_
            if return__2 == nil then
                break
            end
            v1 = return__2
        end
    end
    invariant(v1.tag == HostRoot, "Unable to find node on an unmounted component.")
    if v1.stateNode.current == v1 then
        return v4
    end
    return alternate
end

v1.findCurrentFiberUsingSlowPath = findCurrentFiberUsingSlowPath

function v1.findCurrentHostFiber(a1) -- Line: 279
    -- upvalues: findCurrentFiberUsingSlowPath (val), HostComponent (val), HostText (val)
    local child, return_, sibling
    local v1 = findCurrentFiberUsingSlowPath(a1)
    if not v1 then
        return nil
    end
    local v2 = v1
    while true do
        child = v2.child
        if v2.tag == HostComponent or v2.tag == HostText then
            break
        end
        if not child then
            if v2 == v1 then
                return nil
            end
            return_ = v2.return_
            sibling = v2.sibling
            while not sibling do
                if return_ and return_ ~= v1 then
                    continue
                end
                return nil
            end
            sibling.return_ = return_
            v2 = sibling
        else
            child.return_ = v2
            v2 = child
        end
    end
    return v2
end

function v1.findCurrentHostFiberWithNoPortals(a1) -- Line: 318
    -- upvalues: findCurrentFiberUsingSlowPath (val), HostComponent (val), HostText (val), enableFundamentalAPI (val)
    -- upvalues: FundamentalComponent (val), HostPortal (val)
    local child, return_, sibling
    local v1 = findCurrentFiberUsingSlowPath(a1)
    if not v1 then
        return nil
    end
    local v2 = v1
    while true do
        child = v2.child
        if v2.tag == HostComponent or v2.tag == HostText then
            break
        end
        if enableFundamentalAPI and v2.tag == FundamentalComponent then
            break
        end
        if child and v2.tag ~= HostPortal then
            child.return_ = v2
            v2 = child
            continue
        end
        if v2 == v1 then
            return nil
        end
        return_ = v2.return_
        sibling = v2.sibling
        while not sibling do
            if return_ and return_ ~= v1 then
                continue
            end
            return nil
        end
        sibling.return_ = return_
        v2 = sibling
    end
    return v2
end

function v1.isFiberSuspenseAndTimedOut(a1) -- Line: 360 -- upvalues: SuspenseComponent (val)
    local memoizedState = a1.memoizedState
    local v1 = false
    if a1.tag == SuspenseComponent then
        v1 = false
        if memoizedState ~= nil then
            v1 = memoizedState.dehydrated == nil
        end
    end
    return v1
end

function v1.doesFiberContain(a1, a2) -- Line: 367
    local return_ = a2
    local alternate = a1.alternate
    while return_ ~= nil do
        if return_ ~= a1 and return_ ~= alternate then
            return_ = return_.return_
            continue
        end
        return true
    end
    return false
end

return v1