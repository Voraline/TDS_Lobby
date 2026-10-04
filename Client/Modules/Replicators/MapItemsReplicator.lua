-- Script path: ReplicatedStorage.Client.Modules.Replicators.MapItemsReplicator
-- Decompile time: 4.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local NPCReplicator = require(script.Parent.NPCReplicator)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local UnitReplicator = require(script.Parent.UnitReplicator)
local u40 = {}
local MapItemsReplicate = NewNetwork.Channel("MapItemsReplicate")

local function cleanupMapItem(a1) -- Line: 15 -- upvalues: u40 (val) -- types: a1: userdata
    local v1 = u40[a1]
    if v1 then
        if v1.Destroy then
            v1:Destroy()
        end
        u40[a1] = nil
    end
end

local function newMapItem(a1, a2) -- Line: 26
    -- upvalues: Asset (val), u40 (val), NPCReplicator (val), UnitReplicator (val), MapItemsReplicate (val)
    local v1 = Asset("MapItem", a2:Get("Name") or a1.Name)
    local u19 = v1.animator.new(a1, v1.stats, a2)

    function u19.CleanUp(a1_2) -- Line: 32 -- upvalues: u40 (upval), a1 (val)
        u40.cleanupMapItem(a1)
    end

    function u19.FindTarget(a1) -- Line: 36 -- upvalues: a2 (val), NPCReplicator (upval), UnitReplicator (upval)
        local v1 = a2:Get("Target")
        if v1 then
            return NPCReplicator.GetNPCFromFolder(v1) or UnitReplicator.GetNPCFromFolder(v1)
        end
        return nil
    end

    function u19.ReplicateAction(a1_2, a2, ...) -- Line: 48
        -- upvalues: MapItemsReplicate (upval), a1 (val)
        MapItemsReplicate:fireServer("MapItemAction", a1, a2, ...)
    end

    function u19.ReplicateUnreliableAction(a1_2, a2, ...) -- Line: 52
        -- upvalues: MapItemsReplicate (upval), a1 (val)
        MapItemsReplicate:fireUnreliableServer("MapItemActionUnreliable", a1, a2, ...)
    end

    u40[a1] = u19
    if u19.Initialize then
        task.spawn(function() -- Line: 59 -- upvalues: u19 (val)
            u19:Initialize()
        end)
    end
    return {
        Destroy = function() -- Line: 65 -- upvalues: a1 (val), u40 (upval)
            local v1 = a1
            local v2 = u40[v1]
            if v2 then
                if v2.Destroy then
                    v2:Destroy()
                end
                u40[v1] = nil
            end
        end,
    }
end

TagReplicator.hook("MapItem", function(a1, a2) -- Line: 71 -- upvalues: newMapItem (val)
    return (newMapItem(a1.Parent, a2))
end)
Scheduler.add("MapItemsLoop", RunService.Heartbeat, function(a1) -- Line: 75 -- upvalues: u40 (val)
    for i, j in u40 do
        if j.Step and not j.runningThread then
            task.spawn(function() -- Line: 78 -- upvalues: j (val), a1 (val)
                j.runningThread = true
                j:Step(a1)
                j.runningThread = false
            end)
        end
    end
end)
MapItemsReplicate:onEvent("MapItemAction", function(a1, a2, ...) -- Line: 87 -- upvalues: u40 (val)
    local v1 = u40[a1]
    if v1 and v1.Executables then
        v1.Executables[a2](...)
    end
end)
MapItemsReplicate:onUnreliableEvent("MapItemActionUnreliable", function(a1, a2, ...) -- Line: 94 -- upvalues: u40 (val)
    local v1 = u40[a1]
    if v1 and v1.Executables then
        v1.Executables[a2](...)
    end
end)
return {items = u40}