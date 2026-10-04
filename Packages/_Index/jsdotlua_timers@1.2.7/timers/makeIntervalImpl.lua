-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_timers@1.2.7.timers.makeIntervalImpl
-- Decompile time: 0.85 ms

local u2 = newproxy(false)
return function(a1) -- Line: 9 -- upvalues: u2 (val)
    return {
        setInterval = function(a1_2, a2, ...) -- Line: 10 -- upvalues: u2 (upval), a1 (val) -- types: a2: number
            local u11
            local u2_2 = {}
            u2_2[1] = ...
            local u4 = {[u2] = 1}
            if a2 == nil then
                a2 = 0
            end
            local u9 = a2 / 1000

            function u11() -- Line: 24
                -- upvalues: a1 (upval), u9 (val), u4 (val), u2 (upval), a1_2 (val), u2_2 (val), u11 (ref)
                a1(u9, function() -- Line: 25 -- upvalues: u4 (upval), u2 (upval), a1_2 (upval), u2_2 (upval), u11 (upval)
                    if u4[u2] == 1 then
                        local v1 = u2_2
                        a1_2(unpack(v1))
                        u11()
                    end
                end)
            end

            u11()
            return u4
        end,
        clearInterval = function(a1) -- Line: 38 -- upvalues: u2 (upval) -- types: a1: table
            if a1 == nil then
                return
            end
            if a1[u2] == 1 then
                a1[u2] = 3
            end
        end,
    }
end