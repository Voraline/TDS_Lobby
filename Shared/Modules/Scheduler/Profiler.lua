-- Script path: ReplicatedStorage.Shared.Modules.Scheduler.Profiler
-- Decompile time: 0.61 ms

local u0 = {}
return {
    profiles = u0,
    getProfile = function(a1, a2) -- Line: 17 -- upvalues: u0 (val) -- types: a1: string, a2: string
        return u0[a2] and u0[a2][a1]
    end,
    updateProfile = function(a1, a2, a3) -- Line: 21 -- upvalues: u0 (val) -- types: a1: string, a2: string, a3: number
        local v1 = u0[a2]
        if not v1 then
            u0[a2] = {}
        end
        local v2 = v1[a1]
        if not v2 then
            v1[a1] = {
                average = 0,
                count = 0,
                index = 1,
                sum = 0,
                deltas = {},
            }
        end
        local index = v2.index
        local v3 = v2.deltas[index]
        if not v3 then
            v2.count = v2.count + 1
        else
            v2.sum = v2.sum - v3
        end
        v2.deltas[index] = a3
        v2.sum = v2.sum + a3
        v2.index = index % 10 + 1
        v2.average = v2.sum / v2.count
        return v2
    end,
    removeProfile = function(a1, a2) -- Line: 56 -- upvalues: u0 (val) -- types: a1: string, a2: string
        local v1 = u0[a2]
        if not v1 then
            return
        end
        v1[a1] = nil
    end,
}