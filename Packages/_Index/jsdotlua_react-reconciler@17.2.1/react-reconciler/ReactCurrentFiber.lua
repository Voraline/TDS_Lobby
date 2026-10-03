-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactCurrentFiber
-- Decompile time: 1.19 ms

local __DEV__ = _G.__DEV__
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactSharedInternals = (require((script.Parent.Parent:WaitForChild("shared")))).ReactSharedInternals
local getStackByFiberInDevAndProd = (require((script.Parent:WaitForChild("ReactFiberComponentStack")))).getStackByFiberInDevAndProd
local getComponentName = (require((script.Parent.Parent:WaitForChild("shared")))).getComponentName
local ReactDebugCurrentFrame = ReactSharedInternals.ReactDebugCurrentFrame
local u40 = {isRendering = false}

function u40.getCurrentFiberOwnerNameInDevOrNull() -- Line: 36
    -- upvalues: __DEV__ (val), u40 (val), getComponentName (val)
    if __DEV__ then
        if u40.current == nil then
            return nil
        end
        local _debugOwner = u40.current._debugOwner
        if _debugOwner then
            return getComponentName(_debugOwner.type)
        end
    end
    return nil
end

local function getCurrentFiberStackInDev() -- Line: 50
    -- upvalues: __DEV__ (val), u40 (val), getStackByFiberInDevAndProd (val)
    if not __DEV__ or u40.current == nil then
        return ""
    end
    return getStackByFiberInDevAndProd(u40.current)
end

function u40.resetCurrentFiber() -- Line: 63 -- upvalues: __DEV__ (val), ReactDebugCurrentFrame (val), u40 (val)
    if __DEV__ then
        ReactDebugCurrentFrame.getCurrentStack = nil
        u40.current = nil
        u40.isRendering = false
    end
end

function u40.setCurrentFiber(a1) -- Line: 72
    -- upvalues: __DEV__ (val), ReactDebugCurrentFrame (val), getCurrentFiberStackInDev (val), u40 (val)
    if __DEV__ then
        ReactDebugCurrentFrame.getCurrentStack = getCurrentFiberStackInDev
        u40.current = a1
        u40.isRendering = false
    end
end

function u40.setIsRendering(a1) -- Line: 81 -- upvalues: __DEV__ (val), u40 (val) -- types: a1: boolean
    if __DEV__ then
        u40.isRendering = a1
    end
end

function u40.getIsRendering() -- Line: 87 -- upvalues: __DEV__ (val), u40 (val)
    if __DEV__ then
        return u40.isRendering
    end
    return false
end

return u40