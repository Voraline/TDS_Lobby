-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.RobloxReactProfiling
-- Decompile time: 2.20 ms

local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = _G.__REACT_MICROPROFILER_LEVEL or 0
local u29 = false
local u30 = nil

function startTimerSampling(a1) -- Line: 42 -- upvalues: u29 (ref), u30 (ref) -- types: a1: function
    if u29 then
        warn("RobloxReactProfiling Timer Sampling already running.")
    end
    u29 = true
    u30 = a1
end

function endTimerSampling() -- Line: 50 -- upvalues: u29 (ref), u30 (ref)
    u29 = false
    u30 = nil
end

function getFirstStringKey(a1) -- Line: 55 -- types: a1: table
    for i, j in a1 do
        if type(i) == "string" then
            return i
        end
    end
    return nil
end

function startTimer(a1) -- Line: 64 -- upvalues: u29 (ref) -- types: a1: table
    if u29 then
        a1.startTime = os.clock()
    end
end

function endTimer(a1) -- Line: 69 -- upvalues: u29 (ref), u30 (ref) -- types: a1: table
    if u29 then
        a1.endTime = os.clock()
        if u30 then
            u30(a1)
        end
    end
end

function profileRootBeforeUnitOfWork(a1) -- Line: 78
    local current = a1.current
    local Name = nil
    if current then
        if current.memoizedProps then
            Name = getFirstStringKey(current.memoizedProps)
        end
        if Name == nil and current.stateNode and current.stateNode.containerInfo then
            Name = current.stateNode.containerInfo.Name
        end
    end
    if Name == "Folder" and current.child then
        local child = current.child
        local Name_2 = nil
        if child.memoizedProps then
            Name_2 = getFirstStringKey(child.memoizedProps)
        end
        if Name_2 == nil and child.stateNode and child.stateNode.containerInfo then
            Name_2 = child.stateNode.containerInfo.Name
        end
        if Name_2 ~= nil then
            Name = Name_2
        end
    end
    if Name == nil then
        return nil
    end
    local v1 = {startTime = 0, endTime = 0, id = Name}
    startTimer(v1)
    debug.profilebegin(Name)
    return v1
end

function profileRootAfterYielding(a1) -- Line: 132 -- types: a1: table?
    if a1 then
        endTimer(a1)
        debug.profileend()
    end
end

function profileUnitOfWorkBefore(a1) -- Line: 139 -- upvalues: getComponentName (val), ReactWorkTags (val)
    local v1 = getComponentName(a1.type)
    if a1.key then
        v1 = (tostring(a1.key)) .. "=" .. (v1 or "?")
    end
    local v2 = nil
    if a1.stateNode then
        if a1.tag == ReactWorkTags.HostComponent or a1.tag == ReactWorkTags.HostText then
            local v3 = a1.stateNode:FindFirstAncestorWhichIsA("LayerCollector")
            if v3 then
                v2 = "[" .. (v3:GetFullName()) .. "] "
            end
        end
    end
    if v2 then
        v1 = v2 .. " : " .. (v1 or "?")
    end
    if v1 == nil then
        return false
    end
    debug.profilebegin(v1)
    return true
end

function profileUnitOfWorkAfter(a1) -- Line: 172 -- types: a1: boolean
    if a1 then
        debug.profileend()
    end
end

function profileCommitBefore() -- Line: 178
    debug.profilebegin("Commit")
end

function profileCommitAfter() -- Line: 181
    debug.profileend()
end

function noop(...) end

return {
    startTimerSampling = startTimerSampling,
    endTimerSampling = endTimerSampling,
    profileRootBeforeUnitOfWork = if not (v1 >= 1) then noop else profileRootBeforeUnitOfWork,
    profileRootAfterYielding = if not (v1 >= 1) then noop else profileRootAfterYielding,
    profileUnitOfWorkBefore = if not (v1 >= 10) then noop else profileUnitOfWorkBefore,
    profileUnitOfWorkAfter = if not (v1 >= 10) then noop else profileUnitOfWorkAfter,
    profileCommitBefore = if not (v1 >= 1) then noop else profileCommitBefore,
    profileCommitAfter = if not (v1 >= 1) then noop else profileCommitAfter,
}