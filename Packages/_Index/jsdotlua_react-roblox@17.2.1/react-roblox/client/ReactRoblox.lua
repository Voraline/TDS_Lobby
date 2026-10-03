-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRoblox
-- Decompile time: 1.94 ms

require(script.Parent.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local v1 = require(script.Parent:WaitForChild("ReactRobloxRoot"))
local createRoot = v1.createRoot
local createBlockingRoot = v1.createBlockingRoot
local createLegacyRoot = v1.createLegacyRoot
local isValidContainer = v1.isValidContainer
local v2 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox"))
local batchedUpdates = v2.batchedUpdates
local flushSync = v2.flushSync
local injectIntoDevTools = v2.injectIntoDevTools
local flushPassiveEffects = v2.flushPassiveEffects
local IsThisRendererActing = v2.IsThisRendererActing
local createPortal = v2.createPortal
local ReactVersion = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactVersion
local invariant = require(script.Parent.Parent.Parent:WaitForChild("shared")).invariant
local enableNewReconciler = (require((script.Parent.Parent.Parent:WaitForChild("shared")))).ReactFeatureFlags.enableNewReconciler
local ReactRobloxComponentTree = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local getInstanceFromNode = ReactRobloxComponentTree.getInstanceFromNode
local getNodeFromInstance = ReactRobloxComponentTree.getNodeFromInstance
local getFiberCurrentPropsFromNode = ReactRobloxComponentTree.getFiberCurrentPropsFromNode
local getClosestInstanceFromNode = ReactRobloxComponentTree.getClosestInstanceFromNode
local Event = (require((script.Parent.Parent.Parent:WaitForChild("shared")))).Event
local Change = (require((script.Parent.Parent.Parent:WaitForChild("shared")))).Change
local Tag = (require((script.Parent.Parent.Parent:WaitForChild("shared")))).Tag
local v3 = {
    createPortal = function(a1, a2, a3) -- Line: 122
        -- upvalues: invariant (val), isValidContainer (val), createPortal (val)
        invariant(isValidContainer(a2), "Target container is not a Roblox Instance.")
        return createPortal(a1, a2, nil, a3)
    end,
    unstable_batchedUpdates = batchedUpdates,
    flushSync = flushSync,
    __SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = {
        Events = {
            getInstanceFromNode = getInstanceFromNode,
            getNodeFromInstance = getNodeFromInstance,
            getFiberCurrentPropsFromNode = getFiberCurrentPropsFromNode,
            flushPassiveEffects = flushPassiveEffects,
            IsThisRendererActing = IsThisRendererActing,
        },
    },
    version = ReactVersion,
    createRoot = createRoot,
    createBlockingRoot = createBlockingRoot,
    createLegacyRoot = createLegacyRoot,
    Event = Event,
    Change = Change,
    Tag = Tag,
    unstable_isNewReconciler = enableNewReconciler,
    act = function(a1) -- Line: 255 -- types: a1: function
        error("ReactRoblox.act is only available in testing environments, not production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your test configuration in order to use `act`.")
    end,
}
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    v3.act = v2.act
end
injectIntoDevTools({
    rendererPackageName = "ReactRoblox",
    findFiberByHostInstance = getClosestInstanceFromNode,
    bundleType = if not _G.__DEV__ then 0 else 1,
    version = ReactVersion,
})
v3.robloxReactProfiling = v2.robloxReactProfiling
return v3