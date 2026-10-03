-- Script path: ReplicatedStorage.Shared.Modules.Timezone
-- Decompile time: 0.37 ms

local u0 = {UTC = 1, EST = -4, CST = -5, PST = -7}
return function(a1) -- Line: 15 -- upvalues: u0 (val) -- types: a1: string
    return function(a1_2) -- Line: 16 -- upvalues: u0 (upval), a1 (val) -- types: a1_2: userdata
        local v1 = u0[a1]
        if v1 then
            return DateTime.fromUnixTimestamp(a1_2.UnixTimestamp - v1 * 3600)
        end
        warn("bad timezone:", a1)
        return a1_2
    end
end