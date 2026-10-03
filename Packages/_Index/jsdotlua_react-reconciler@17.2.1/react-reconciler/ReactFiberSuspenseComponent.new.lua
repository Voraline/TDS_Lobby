-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberSuspenseComponent.new
-- Decompile time: 2.38 ms

require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberLane"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local NoFlags = ReactFiberFlags.NoFlags
local DidCapture = ReactFiberFlags.DidCapture
local isSuspenseInstancePending = ReactFiberHostConfig.isSuspenseInstancePending
local isSuspenseInstanceFallback = ReactFiberHostConfig.isSuspenseInstanceFallback
return {
    shouldCaptureSuspense = function(a1, a2) -- Line: 83 -- types: a2: boolean
        local memoizedState = a1.memoizedState
        if memoizedState then
            if memoizedState.dehydrated ~= nil then
                return true
            end
            return false
        end
        local memoizedProps = a1.memoizedProps
        if memoizedProps.fallback == nil then
            return false
        end
        if memoizedProps.unstable_avoidThisFallback ~= true then
            return true
        end
        if a2 then
            return false
        end
        return true
    end,
    findFirstSuspended = function(a1) -- Line: 112
        -- upvalues: SuspenseComponent (val), isSuspenseInstancePending (val), isSuspenseInstanceFallback (val)
        -- upvalues: SuspenseListComponent (val), DidCapture (val), NoFlags (val)
        local dehydrated, memoizedState
        local child = a1
        local v1 = a1
        while child ~= nil do
            if child.tag ~= SuspenseComponent then
                if child.tag == SuspenseListComponent and child.memoizedProps.revealOrder ~= nil then
                    if (bit32.band(child.flags, DidCapture)) ~= NoFlags then
                        return child
                    end
                    if child == v1 then
                        return nil
                    end
                    while child.sibling == nil do
                        if child.return_ ~= nil and child.return_ ~= v1 then
                            child = child.return_
                            continue
                        end
                        return nil
                    end
                    child.sibling.return_ = child.return_
                    child = child.sibling
                    continue
                end
                if child.child == nil then
                    if child == v1 then
                        return nil
                    end
                    while child.sibling == nil do
                        if child.return_ ~= nil and child.return_ ~= v1 then
                            child = child.return_
                            continue
                        end
                        return nil
                    end
                    child.sibling.return_ = child.return_
                    child = child.sibling
                else
                    child.child.return_ = child
                    child = child.child
                end
            else
                memoizedState = child.memoizedState
                if memoizedState then
                    dehydrated = memoizedState.dehydrated
                    if dehydrated ~= nil
                        and not isSuspenseInstancePending(dehydrated)
                        and not isSuspenseInstanceFallback(dehydrated) then
                        if child == v1 then
                            return nil
                        end
                        while child.sibling == nil do
                            if child.return_ ~= nil and child.return_ ~= v1 then
                                child = child.return_
                                continue
                            end
                            return nil
                        end
                        child.sibling.return_ = child.return_
                        child = child.sibling
                        continue
                    end
                    return child
                end
                if child == v1 then
                    return nil
                end
                while child.sibling == nil do
                    if child.return_ ~= nil and child.return_ ~= v1 then
                        child = child.return_
                        continue
                    end
                    return nil
                end
                child.sibling.return_ = child.return_
                child = child.sibling
            end
        end
        return nil
    end,
}