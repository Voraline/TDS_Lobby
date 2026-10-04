-- Script path: ReplicatedStorage.Client.Controllers.Shared.LiveEventEffectsController
-- Decompile time: 8.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local LiveEventPresentation = require(ReplicatedStorage.Client.Modules.LiveEventPresentation)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)

local function finite(a1) -- Line: 8
    local v1 = false
    if type(a1) == "number" then
        v1 = false
        if a1 == a1 then
            v1 = (math.abs(a1)) < (1 / 0)
        end
    end
    return v1
end

local function isDescriptor(a1, a2) -- Line: 12
    local v1 = false
    if type(a2) == "table" then
        v1 = false
        if type(a1) == "string" then
            v1 = false
            if a2.id == a1 then
                v1 = false
                if type(a2.kind) == "string" then
                    local startsAt = a2.startsAt
                    v1 = false
                    if type(startsAt) == "number" then
                        v1 = false
                        if startsAt == startsAt then
                            v1 = (math.abs(startsAt)) < (1 / 0)
                        end
                    end
                    if v1 then
                        local expiresAt = a2.expiresAt
                        v1 = false
                        if type(expiresAt) == "number" then
                            v1 = false
                            if expiresAt == expiresAt then
                                v1 = (math.abs(expiresAt)) < (1 / 0)
                            end
                        end
                        if v1 then
                            v1 = false
                            if a2.startsAt < a2.expiresAt then
                                v1 = type(a2.data) == "table"
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end

TagReplicator.hook("LiveEventEffects", function(a1, a2) -- Line: 23 -- upvalues: Maid (val), isDescriptor (val), LiveEventPresentation (val), RunService (val)
    local v1 = {Maid = Maid.new()}
    local u6 = {}
    local u7 = {}

    local function remove(a1) -- Line: 28 -- upvalues: u6 (val)
        local v1 = u6[a1]
        if v1 then
            u6[a1] = nil
            local success, result = pcall(v1.cleanup)
            if not success then
                warn((("Live event cleanup failed: %*"):format(result)))
            end
        end
    end

    function v1.Destroy(a1) -- Line: 39 -- upvalues: u6 (val)
        local result, success, v1
        if not a1.Maid then
            return
        end
        for i in u6 do
            v1 = u6[i]
            if v1 then
                u6[i] = nil
                success, result = pcall(v1.cleanup)
                if not success then
                    warn((("Live event cleanup failed: %*"):format(result)))
                end
            end
        end
        a1.Maid:Sweep()
        a1.Maid = nil
    end

    local function reconcile(a1) -- Line: 50
        -- upvalues: u6 (val), isDescriptor (upval), u7 (val), LiveEventPresentation (upval)
        local result, result_2, success, success_2, v1, v2
        if type(a1) ~= "table" then
            a1 = {}
        end
        local ServerTimeNow = workspace:GetServerTimeNow()
        local v3 = nil
        local v4 = nil
        for i, j in u6, v3, v4 do
            v1 = a1[i]
            if not isDescriptor(i, v1)
                or v1.startsAt ~= j.descriptor.startsAt
                or v1.kind ~= j.descriptor.kind
                or v1.expiresAt ~= j.descriptor.expiresAt
                or v1.expiresAt <= ServerTimeNow then
                v2 = u6[i]
                if v2 then
                    u6[i] = nil
                    success_2, result_2 = pcall(v2.cleanup)
                    if not success_2 then
                        warn((("Live event cleanup failed: %*"):format(result_2)))
                    end
                end
            end
        end
        for k, n in a1 do
            if not u6[k] then
                if isDescriptor(k, n) then
                    if not (n.expiresAt <= ServerTimeNow) then
                        success, result = pcall(LiveEventPresentation.start, n)
                        if not success then
                            warn((("Live event presentation failed (%*): %*"):format(n.kind, result)))
                        else
                            u6[k] = {descriptor = n, cleanup = result}
                        end
                    end
                elseif not u7[k] then
                    u7[k] = true
                    warn((("Live event effect %* was ignored: its descriptor is malformed."):format((tostring(k)))))
                end
            end
        end
    end

    v1.Maid:Mark(((a2:GetStateChangedSignal("Effects")):Connect(reconcile)))
    v1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 91 -- upvalues: u6 (val)
        local result, success, v1
        local ServerTimeNow = workspace:GetServerTimeNow()
        for i, j in u6 do
            if j.descriptor.expiresAt <= ServerTimeNow then
                v1 = u6[i]
                if v1 then
                    u6[i] = nil
                    success, result = pcall(v1.cleanup)
                    if not success then
                        warn((("Live event cleanup failed: %*"):format(result)))
                    end
                end
            end
        end
    end)))
    reconcile(a2:Get("Effects"))
    return v1
end)
return {}