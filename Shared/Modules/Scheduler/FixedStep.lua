-- Script path: ReplicatedStorage.Shared.Modules.Scheduler.FixedStep
-- Decompile time: 0.46 ms

return function(a1, a2) -- Line: 5 -- types: a1: number, a2: function
    local u2 = 0
    local u3 = true
    local u4 = a1 * 1e-09
    return function(a1_2) -- Line: 10 -- upvalues: u3 (ref), u2 (ref), u4 (val), a1 (val), a2 (val) -- types: a1_2: number
        if not u3 then
            return
        end
        u2 = u2 + a1_2
        local v1 = 8
        while u3 do
            if not (v1 > 0) or not (a1 <= u2 + u4) then
                break
            end
            u2 = math.max(0, u2 - a1)
            v1 = v1 - 1
            a2(a1)
        end
    end, function() -- Line: 26 -- upvalues: u3 (ref)
        u3 = false
    end
end