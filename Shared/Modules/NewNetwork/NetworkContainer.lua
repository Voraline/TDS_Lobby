-- Script path: ReplicatedStorage.Shared.Modules.NewNetwork.NetworkContainer
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.NewNetwork.Types)
local u24 = RunService:IsServer()
local u27 = RunService:IsRunning()
local u28 = {UnreliableRemoteEvent = "URE", RemoteEvent = "RE", RemoteFunction = "RF"}
local u32 = {}

local function getEventName(a1, a2) -- Line: 17 -- upvalues: u28 (val) -- types: a1: string
    local v1 = u28[a2]
    if v1 then
        return (("%*:%*"):format(v1, a1))
    end
    return a1
end

local function getChildOrCreate(a1, a2, a3) -- Line: 22
    -- upvalues: u27 (val), u24 (val), Create (val)
    if not u27 then
        return nil
    end
    if not u24 then
        return a1:WaitForChild(a2)
    end
    local v1 = a1:FindFirstChild(a2) or Create(a3, {Name = a2, Parent = a1})
    if v1 then
        assert(v1:IsA(a3), (("%* is not of type %* (got %*), are you sure the remote is correct?"):format(a2, a3, v1.ClassName)))
    end
    return v1
end

u32.Folder = getChildOrCreate(ReplicatedStorage, "Network", "Folder")

function u32.getNamespace(a1) -- Line: 49 -- upvalues: getChildOrCreate (val), u32 (val) -- types: a1: string
    return getChildOrCreate(u32.Folder, a1, "Folder")
end

function u32.getOrCreateEvent(a1, a2, a3) -- Line: 53
    -- upvalues: u28 (val), getChildOrCreate (val), u32 (val)
    local v1 = a3 or "RemoteEvent"
    local v2 = u28[v1]
    return getChildOrCreate(u32.getNamespace(a1), if not v2 then a2 else ("%*:%*"):format(v2, a2), v1)
end

function u32.getEvent(a1, a2, a3) -- Line: 63
    -- upvalues: u28 (val), u32 (val), u24 (val)
    local v1 = a2
    local v2 = u28[a3 or "RemoteEvent"]
    local v3 = if not v2 then v1 else ("%*:%*"):format(v2, v1)
    v1 = u32.getNamespace(a1)
    local v4 = u24 and v1:FindFirstChild(v3) or v1:WaitForChild(v3)
    if a3 and v4 and not v4:IsA(a3) then
        error((("%*:%* is not of event type: %*"):format(a1, v3, a3)))
    end
    return v4
end

return u32