-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_timers@1.2.7.timers.makeTimerImpl
-- Decompile time: 0.53 ms

local u2 = newproxy(false)
return function(a1) -- Line: 10 -- upvalues: u2 (val)
    return {
        setTimeout = function(a1_2, a2, ...) -- Line: 11 -- upvalues: u2 (upval), a1 (val) -- types: a2: number?
            local u2_2 = {}
            u2_2[1] = ...
            local u4 = {[u2] = 1}
            if a2 == nil then
                a2 = 0
            end
            a1(a2 / 1000, function() -- Line: 24 -- upvalues: u4 (val), u2 (upval), a1_2 (val), u2_2 (val)
                if u4[u2] == 1 then
                    a1_2(unpack(u2_2))
                    u4[u2] = 2
                end
            end)
            return u4
        end,
        clearTimeout = function(a1) -- Line: 34 -- upvalues: u2 (upval) -- types: a1: table
            if a1 == nil then
                return
            end
            if a1[u2] == 1 then
                a1[u2] = 3
            end
        end,
    }
end