-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxRoot
-- Decompile time: 2.32 ms

require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
require(script.Parent.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
local ReactRobloxComponentTree = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local markContainerAsRoot = ReactRobloxComponentTree.markContainerAsRoot
local unmarkContainerAsRoot = ReactRobloxComponentTree.unmarkContainerAsRoot
local v1 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox"))
local createContainer = v1.createContainer
local updateContainer = v1.updateContainer
local invariant = require(script.Parent.Parent.Parent:WaitForChild("shared")).invariant
local enableEagerRootListeners = (require((script.Parent.Parent.Parent:WaitForChild("shared")))).ReactFeatureFlags.enableEagerRootListeners
local flushSync = v1.flushSync
local flushPassiveEffects = v1.flushPassiveEffects
local BlockingRoot = v1.ReactRootTags.BlockingRoot
local ConcurrentRoot = v1.ReactRootTags.ConcurrentRoot
local LegacyRoot = v1.ReactRootTags.LegacyRoot
local u90 = nil
local u91 = {}
u91.__index = u91

function u91.new(a1, a2) -- Line: 63 -- upvalues: u91 (val), u90 (ref), ConcurrentRoot (val)
    local v1 = setmetatable({}, u91)
    v1._internalRoot = u90(a1, ConcurrentRoot, a2)
    return v1
end

local function createBlockingRoot(a1, a2, a3) -- Line: 70 -- upvalues: u91 (val), u90 (ref)
    local v1 = setmetatable({}, u91)
    v1._internalRoot = u90(a1, a2, a3)
    return v1
end

function u91.render(a1, a2) -- Line: 82 -- upvalues: updateContainer (val)
    updateContainer(a2, a1._internalRoot, nil)
end

function u91.unmount(a1) -- Line: 110
    -- upvalues: flushSync (val), updateContainer (val), unmarkContainerAsRoot (val), flushPassiveEffects (val)
    local _internalRoot = a1._internalRoot
    local containerInfo = _internalRoot.containerInfo
    flushSync(function() -- Line: 123
        -- upvalues: updateContainer (upval), _internalRoot (val), unmarkContainerAsRoot (upval), containerInfo (val)
        updateContainer(nil, _internalRoot, nil, function() -- Line: 124 -- upvalues: unmarkContainerAsRoot (upval), containerInfo (upval)
            unmarkContainerAsRoot(containerInfo)
        end)
    end)
    flushPassiveEffects()
end

function u90(a1, a2, a3) -- Line: 138
    -- upvalues: createContainer (val), markContainerAsRoot (val), enableEagerRootListeners (val)
    local v1 = false
    if a3 ~= nil then
        v1 = a3.hydrate == true
    end
    local hydrationOptions = if a3 == nil then nil else a3.hydrationOptions
    local mutableSources = not (a3 == nil) and not (a3.hydrationOptions == nil) and a3.hydrationOptions.mutableSources or nil
    local v2 = createContainer(a1, a2, v1, hydrationOptions)
    markContainerAsRoot(v2.current, a1)
    return v2
end

local v2 = {
    isValidContainer = function(a1) -- Line: 186
        return typeof(a1) == "Instance"
    end,
    createRoot = function(a1, a2) -- Line: 203 -- upvalues: invariant (val), u91 (val)
        invariant(typeof(a1) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
        warnIfReactDOMContainerInDEV(a1)
        return u91.new(a1, a2)
    end,
    createBlockingRoot = function(a1, a2) -- Line: 214 -- upvalues: invariant (val), BlockingRoot (val), u91 (val), u90 (ref)
        invariant(typeof(a1) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
        warnIfReactDOMContainerInDEV(a1)
        local v1 = BlockingRoot
        local v2 = setmetatable({}, u91)
        v2._internalRoot = u90(a1, v1, a2)
        return v2
    end,
    createLegacyRoot = function(a1, a2) -- Line: 224 -- upvalues: LegacyRoot (val), u91 (val), u90 (ref)
        local v1 = LegacyRoot
        local v2 = setmetatable({}, u91)
        v2._internalRoot = u90(a1, v1, a2)
        return v2
    end,
}

function warnIfReactDOMContainerInDEV(a1) end

return v2