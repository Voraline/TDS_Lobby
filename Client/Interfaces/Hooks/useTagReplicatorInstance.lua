-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance
-- Decompile time: 2.46 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local useEvent = require(script.Parent.useEvent)
return function(a1, a2, a3) -- Line: 8
    -- upvalues: React (val), CollectionService (val), TagReplicator (val), useEvent (val)
    local u6, u7 = React.useState(nil)
    local u11 = React.useRef({})

    local function destroyFallback(a1) -- Line: 12 -- upvalues: u11 (val) -- types: a1: userdata?
        if not a1 then
            return
        end
        local v1 = u11.current[a1]
        if v1 then
            v1.release()
            u11.current[a1] = nil
        end
    end

    local function getReplicator(a1) -- Line: 24
        -- upvalues: CollectionService (upval), a3 (val), TagReplicator (upval), u11 (val)
        if a1 and a1:IsA("Folder") then
            local v1 = CollectionService
            local v2 = a3
            if v1:HasTag(a1, v2) then
                local v3
                v1 = TagReplicator.getTrackedReplicator(a1)
                if not v1 then
                    v3 = u11.current[a1]
                    if not v3 then
                        local v4
                        v4, v2 = TagReplicator.acquireReplicatorEntityFromFolder(a1)
                        v3 = {replicator = v4, release = v2}
                        u11.current[a1] = v3
                    end
                    return v3.replicator
                end
                if not a1 then
                    return v1
                end
                v3 = u11.current[a1]
                if v3 then
                    v3.release()
                    u11.current[a1] = nil
                end
                return v1
            end
        end
        return nil
    end

    local v1 = {a1, a2, a3}
    useEvent(a1 and a1.ChildAdded, function(a1) -- Line: 53 -- upvalues: a2 (val), getReplicator (val), u7 (val) -- types: a1: userdata
        if a1.Name ~= a2 then
            return
        end
        local v1 = getReplicator(a1)
        if v1 then
            u7(v1)
        end
    end, v1)
    local v2 = {a1, a2, a3}
    React.useEffect(function() -- Line: 64 -- upvalues: a1 (val), u7 (val), a2 (val), getReplicator (val), TagReplicator (upval), u11 (val)
        if not a1 then
            u7(nil)
            return
        end
        local u8 = a1:FindFirstChild(a2)
        u7((getReplicator(u8)))
        local u20 = if not u8 then nil else TagReplicator.watchTrackedReplicator(u8, function(a1) -- Line: 73 -- upvalues: u8 (val), u11 (upval), u7 (upval)
            local v1 = u8
            if v1 then
                local v2 = u11.current[v1]
                if v2 then
                    v2.release()
                    u11.current[v1] = nil
                end
            end
            u7(a1)
        end, function() -- Line: 76 -- upvalues: u7 (upval), getReplicator (upval), u8 (val)
            u7((getReplicator(u8)))
        end)
        return function() -- Line: 81 -- upvalues: u20 (val), u8 (val), u11 (upval)
            if u20 then
                u20()
            end
            local v1 = u8
            if not v1 then
                return
            end
            local v2 = u11.current[v1]
            if v2 then
                v2.release()
                u11.current[v1] = nil
            end
        end
    end, v2)
    v1 = {u6, a1}
    useEvent(a1 and a1.ChildRemoved, function(a1) -- Line: 90 -- upvalues: u6 (val), u11 (val), u7 (val) -- types: a1: userdata
        if u6 and a1 == u6.Folder then
            if a1 then
                local v1 = u11.current[a1]
                if v1 then
                    v1.release()
                    u11.current[a1] = nil
                end
            end
            u7(nil)
        end
    end, v1)
    React.useEffect(function() -- Line: 97 -- upvalues: u11 (val)
        return function() -- Line: 98 -- upvalues: u11 (upval)
            local v1
            for i in u11.current do
                if i then
                    v1 = u11.current[i]
                    if v1 then
                        v1.release()
                        u11.current[i] = nil
                    end
                end
            end
        end
    end, {})
    return u6
end