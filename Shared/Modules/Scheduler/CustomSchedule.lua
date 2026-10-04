-- Script path: ReplicatedStorage.Shared.Modules.Scheduler.CustomSchedule
-- Decompile time: 0.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u10 = {}

local function bindUpdateRateToSignal(a1, a2) -- Line: 7 -- upvalues: Signal (val) -- types: a1: string, a2: function
    local u4 = Signal.new()
    local u5 = nil
    local v1 = getmetatable(u4)

    function v1.__tostring() -- Line: 11 -- upvalues: a1 (val)
        return (("Signal %*"):format(a1))
    end

    task.spawn(function() -- Line: 15 -- upvalues: u5 (ref), a2 (val), u4 (val)
        u5 = a2(u4)
    end)
    return u4, function() -- Line: 20 -- upvalues: u5 (ref), u4 (val)
        local v1 = u5
        u5 = nil
        if v1 then
            v1()
        end
        u4:Destroy()
    end
end

return {
    createFromHz = function(a1) -- Line: 32 -- upvalues: u10 (val), bindUpdateRateToSignal (val) -- types: a1: number
        if u10[a1] then
            return u10[a1]
        end
        local v1 = bindUpdateRateToSignal(("%*hz"):format(a1), function(a1_2) -- Line: 37 -- upvalues: a1 (val)
            local u1 = true
            local u4 = task.spawn(function() -- Line: 39 -- upvalues: u1 (ref), a1 (upval), a1_2 (val)
                while u1 do
                    task.wait(1 / a1)
                    a1_2:Fire()
                end
            end)
            return function() -- Line: 46 -- upvalues: u1 (ref), u4 (val)
                u1 = false
                u4.cancel(u4)
            end
        end)
        u10[a1] = v1
        return v1
    end,
    createFromRunEvent = function(a1) -- Line: 56 -- types: a1: userdata
        return a1
    end,
}