-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberUnwindWork.new
-- Decompile time: 4.27 ms

require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberLane"))
require(script.Parent:WaitForChild("ReactFiberSuspenseComponent.new"))
local resetWorkInProgressVersions = require(script.Parent:WaitForChild("ReactMutableSource.new")).resetWorkInProgressVersions
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local ReactTypeOfMode = require(script.Parent:WaitForChild("ReactTypeOfMode"))
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local enableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local v1 = require(script.Parent:WaitForChild("ReactFiberHostContext.new"))
local popHostContainer = v1.popHostContainer
local popHostContext = v1.popHostContext
local popSuspenseContext = require(script.Parent:WaitForChild("ReactFiberSuspenseContext.new")).popSuspenseContext
local resetHydrationState = require(script.Parent:WaitForChild("ReactFiberHydrationContext.new")).resetHydrationState
local v2 = require(script.Parent:WaitForChild("ReactFiberContext.new"))
local isContextProvider = v2.isContextProvider
local popContext = v2.popContext
local popTopLevelContextObject = v2.popTopLevelContextObject
local popProvider = require(script.Parent:WaitForChild("ReactFiberNewContext.new")).popProvider
local u117 = nil

local function u118(...) -- Line: 44 -- upvalues: u117 (ref)
    if not u117 then
        u117 = require(script.Parent:WaitForChild("ReactFiberWorkLoop.new")).popRenderLanes
    end
    return u117(...)
end

local transferActualDuration = require(script.Parent:WaitForChild("ReactProfilerTimer.new")).transferActualDuration
local invariant = (require((script.Parent.Parent:WaitForChild("shared")))).invariant

function unwindInterruptedWork(a1) -- Line: 150
    -- upvalues: ReactWorkTags (val), popContext (val), popHostContainer (val), popTopLevelContextObject (val)
    -- upvalues: resetWorkInProgressVersions (val), popHostContext (val), popSuspenseContext (val), popProvider (val)
    -- upvalues: u118 (val)
    if a1.tag == ReactWorkTags.ClassComponent then
        local childContextTypes = nil
        if typeof(a1.type) == "table" then
            childContextTypes = a1.type.childContextTypes
        end
        if childContextTypes == nil then
            return
        end
        popContext(a1)
        return
    end
    if a1.tag == ReactWorkTags.HostRoot then
        popHostContainer(a1)
        popTopLevelContextObject(a1)
        resetWorkInProgressVersions()
        return
    end
    if a1.tag == ReactWorkTags.HostComponent then
        popHostContext(a1)
        return
    end
    if a1.tag == ReactWorkTags.HostPortal then
        popHostContainer(a1)
        return
    end
    if a1.tag == ReactWorkTags.SuspenseComponent or a1.tag == ReactWorkTags.SuspenseListComponent then
        popSuspenseContext(a1)
        return
    end
    if a1.tag == ReactWorkTags.ContextProvider then
        popProvider(a1)
        return
    end
    if a1.tag ~= ReactWorkTags.OffscreenComponent and a1.tag ~= ReactWorkTags.LegacyHiddenComponent then
        return
    end
    u118(a1)
end

return {
    unwindWork = function(a1, a2) -- Line: 55
        -- upvalues: ReactWorkTags (val), isContextProvider (val), popContext (val), ReactFiberFlags (val)
        -- upvalues: enableProfilerTimer (val), ReactTypeOfMode (val), transferActualDuration (val)
        -- upvalues: popHostContainer (val), popTopLevelContextObject (val), resetWorkInProgressVersions (val)
        -- upvalues: invariant (val), popHostContext (val), popSuspenseContext (val), enableSuspenseServerRenderer (val)
        -- upvalues: resetHydrationState (val), popProvider (val), u118 (val)
        if a1.tag == ReactWorkTags.ClassComponent then
            if isContextProvider(a1.type) then
                popContext(a1)
            end
            local flags = a1.flags
            if bit32.band(flags, ReactFiberFlags.ShouldCapture) == 0 then
                return nil
            end
            a1.flags = bit32.bor(bit32.band(flags, (bit32.bnot(ReactFiberFlags.ShouldCapture))), ReactFiberFlags.DidCapture)
            if enableProfilerTimer
                and (bit32.band(a1.mode, ReactTypeOfMode.ProfileMode)) ~= ReactTypeOfMode.NoMode then
                transferActualDuration(a1)
            end
            return a1
        end
        if a1.tag == ReactWorkTags.HostRoot then
            popHostContainer(a1)
            popTopLevelContextObject(a1)
            resetWorkInProgressVersions()
            local flags_2 = a1.flags
            invariant(
                (bit32.band(flags_2, ReactFiberFlags.DidCapture)) == ReactFiberFlags.NoFlags,
                "The root failed to unmount after an error. This is likely a bug in React. Please file an issue."
            )
            a1.flags = bit32.bor(bit32.band(flags_2, (bit32.bnot(ReactFiberFlags.ShouldCapture))), ReactFiberFlags.DidCapture)
            return a1
        end
        if a1.tag == ReactWorkTags.HostComponent then
            popHostContext(a1)
            return nil
        end
        if a1.tag ~= ReactWorkTags.SuspenseComponent then
            if a1.tag == ReactWorkTags.SuspenseListComponent then
                popSuspenseContext(a1)
                return nil
            end
            if a1.tag == ReactWorkTags.HostPortal then
                popHostContainer(a1)
                return nil
            end
            if a1.tag == ReactWorkTags.ContextProvider then
                popProvider(a1)
                return nil
            end
            if a1.tag ~= ReactWorkTags.OffscreenComponent and a1.tag ~= ReactWorkTags.LegacyHiddenComponent then
                return nil
            end
            u118(a1)
            return nil
        end
        popSuspenseContext(a1)
        if enableSuspenseServerRenderer then
            local memoizedState = a1.memoizedState
            if memoizedState ~= nil and memoizedState.dehydrated ~= nil then
                invariant(
                    a1.alternate ~= nil,
                    "Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue."
                )
                resetHydrationState()
            end
        end
        local flags_3 = a1.flags
        if bit32.band(flags_3, ReactFiberFlags.ShouldCapture) == 0 then
            return nil
        end
        a1.flags = bit32.bor(bit32.band(flags_3, (bit32.bnot(ReactFiberFlags.ShouldCapture))), ReactFiberFlags.DidCapture)
        if enableProfilerTimer and (bit32.band(a1.mode, ReactTypeOfMode.ProfileMode)) ~= ReactTypeOfMode.NoMode then
            transferActualDuration(a1)
        end
        return a1
    end,
    unwindInterruptedWork = unwindInterruptedWork,
}