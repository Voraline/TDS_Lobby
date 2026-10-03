-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxComponentTree
-- Decompile time: 2.04 ms

require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
local shared = require(script.Parent.Parent.Parent:WaitForChild("shared"))
local u28 = nil
local u29 = nil
local u30 = nil
local u31 = nil
local u32 = nil
local u33 = nil
local invariant = shared.invariant
local v1 = {}
local u36 = {}
local u37 = {}
local u38 = {}
local v2 = string.sub(tostring((math.random())), 3)
local u48 = "__reactFiber$" .. v2
local u51 = "__reactContainer$" .. v2

function v1.precacheFiberNode(a1, a2) -- Line: 65 -- upvalues: u37 (val)
    u37[a2] = a1
end

function v1.uncacheFiberNode(a1) -- Line: 70 -- upvalues: u37 (val), u38 (val)
    u37[a1] = nil
    u38[a1] = nil
end

function v1.markContainerAsRoot(a1, a2) -- Line: 75 -- upvalues: u36 (val)
    u36[a2] = a1
end

function v1.unmarkContainerAsRoot(a1) -- Line: 81 -- upvalues: u36 (val)
    u36[a1] = nil
end

function v1.isContainerMarkedAsRoot(a1) -- Line: 87 -- upvalues: u36 (val)
    return not not u36[a1]
end

function v1.getClosestInstanceFromNode(a1) -- Line: 101 -- upvalues: u37 (val), u33 (ref) -- types: a1: userdata
    local alternate, v1, v2
    local v3 = u37[a1]
    if v3 then
        return v3
    end
    local Parent = a1.Parent
    local v4 = a1
    while Parent do
        v3 = u37[Parent]
        if v3 then
            alternate = v3.alternate
            if v3.child ~= nil then
                if u33 == nil then
                    u33 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
                end
                v1 = u33(v4)
                while v1 ~= nil do
                    v2 = u37[v1]
                    if v2 then
                        return v2
                    end
                    v1 = u33(v1)
                end
                return v3
            end
            if alternate ~= nil and alternate.child ~= nil then
                if u33 == nil then
                    u33 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
                end
                v1 = u33(v4)
                while v1 ~= nil do
                    v2 = u37[v1]
                    if v2 then
                        return v2
                    end
                    v1 = u33(v1)
                end
            end
            return v3
        end
        Parent = Parent.Parent
    end
    return nil
end

function v1.getInstanceFromNode(a1) -- Line: 185
    -- upvalues: u28 (ref), u29 (ref), u30 (ref), u31 (ref), u32 (ref), u48 (val), u51 (val)
    if u28 == nil then
        u28 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox")).ReactWorkTags
        u29 = u28.HostComponent
        u30 = u28.HostComponent
        u31 = u28.HostComponent
        u32 = u28.HostComponent
    end
    local v1 = a1[u48] or a1[u51]
    if not v1 then
        return nil
    end
    if v1.tag ~= u29 and v1.tag ~= u30 and v1.tag ~= u32 and v1.tag ~= u31 then
        return nil
    end
    return v1
end

function v1.getNodeFromInstance(a1) -- Line: 218 -- upvalues: u29 (ref), u30 (ref), invariant (val)
    if a1.tag ~= u29 and a1.tag ~= u30 then
        invariant(false, "getNodeFromInstance: Invalid argument.")
        error("getNodeFromInstance: Invalid argument.")
        return
    end
    return a1.stateNode
end

function v1.getFiberCurrentPropsFromNode(a1) -- Line: 233 -- upvalues: u38 (val)
    return u38[a1]
end

function v1.updateFiberProps(a1, a2) -- Line: 237 -- upvalues: u38 (val)
    u38[a1] = a2
end

return v1