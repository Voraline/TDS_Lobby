-- Script path: ReplicatedStorage.Shared.Data.SharedData.TimeScaleHelper
-- Decompile time: 0.61 ms

local u0 = {
    {value = 0, name = "paused"},
    {value = 0.5, name = "normal"},
    {value = 1, name = "normal"},
    {value = 1.5, name = "fast"},
    {value = 2, name = "fast"},
}
return {
    getTimeScaleState = function(a1, a2) -- Line: 13 -- upvalues: u0 (val) -- types: a1: boolean, a2: number
        if a1 then
            return "locked"
        end
        for i, j in u0 do
            if j.value == a2 then
                return j.name
            end
        end
        return "normal"
    end,
    getNextTimeScale = function(a1) -- Line: 30 -- upvalues: u0 (val) -- types: a1: number
        local value = u0[1].value
        for i, j in u0 do
            if a1 < j.value then
                return j.value
            end
        end
        return value
    end,
    isEnabled = function(a1, a2, a3) -- Line: 43 -- types: a1: number, a2: boolean, a3: boolean?
        local v1 = false
        if a1 == 1 then
            v1 = false
            if a2 == true then
                v1 = a3 == false
            end
        end
        return v1
    end,
}