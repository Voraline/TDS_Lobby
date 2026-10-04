-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactMutableSource.new
-- Decompile time: 1.31 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = {}
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local isPrimaryRenderer = require(script.Parent:WaitForChild("ReactFiberHostConfig")).isPrimaryRenderer
local u37 = {}
local u41 = nil
if _G.__DEV__ then
    u41 = {}
end

function v1.markSourceAsDirty(a1) -- Line: 37 -- upvalues: u37 (val)
    table.insert(u37, a1)
end

function v1.resetWorkInProgressVersions() -- Line: 41 -- upvalues: u37 (val), isPrimaryRenderer (val)
    for i, j in u37 do
        if not isPrimaryRenderer then
            j._workInProgressVersionSecondary = nil
        else
            j._workInProgressVersionPrimary = nil
        end
    end
    table.clear(u37)
end

function v1.getWorkInProgressVersion(a1) -- Line: 53 -- upvalues: isPrimaryRenderer (val)
    if isPrimaryRenderer then
        return a1._workInProgressVersionPrimary
    end
    return a1._workInProgressVersionSecondary
end

function v1.setWorkInProgressVersion(a1, a2) -- Line: 62 -- upvalues: isPrimaryRenderer (val), u37 (val)
    if not isPrimaryRenderer then
        a1._workInProgressVersionSecondary = a2
    else
        a1._workInProgressVersionPrimary = a2
    end
    table.insert(u37, a1)
end

function v1.warnAboutMultipleRenderersDEV(a1) -- Line: 71 -- upvalues: isPrimaryRenderer (val), u41 (ref), console (val)
    if _G.__DEV__ then
        if not isPrimaryRenderer then
            if a1._currentSecondaryRenderer == nil then
                a1._currentSecondaryRenderer = u41
                return
            end
            if a1._currentSecondaryRenderer ~= u41 then
                console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
            end
        else
            if a1._currentPrimaryRenderer == nil then
                a1._currentPrimaryRenderer = u41
                return
            end
            if a1._currentPrimaryRenderer ~= u41 then
                console.error("Detected multiple renderers concurrently rendering the same mutable source. This is currently unsupported.")
                return
            end
        end
    end
end

function v1.registerMutableSourceForHydration(a1, a2) -- Line: 100
    local v1 = a2._getVersion(a2._source)
    if a1.mutableSourceEagerHydrationData == nil then
        a1.mutableSourceEagerHydrationData = {a2, v1}
    end
end

return v1