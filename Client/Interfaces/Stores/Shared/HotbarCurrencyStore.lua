-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.HotbarCurrencyStore
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u11, u12 = require(ReplicatedStorage.Packages.Charm).signal({spinWheelShown = false})

local function setStateKey(a1, a2) -- Line: 15 -- upvalues: u11 (val), u12 (val) -- types: a1: string
    local v1 = u11()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u12(v2)
end

return {
    getState = u11,
    getBatteries = function() -- Line: 30 -- upvalues: u11 (val)
        return u11().batteries
    end,
    getSpinWheelShown = function() -- Line: 34 -- upvalues: u11 (val)
        return u11().spinWheelShown
    end,
    setBatteries = function(a1) -- Line: 38 -- upvalues: u11 (val), u12 (val) -- types: a1: number?
        local v1 = u11()
        if v1.batteries == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.batteries = a1
        u12(v2)
    end,
    setSpinWheelShown = function(a1) -- Line: 42 -- upvalues: u11 (val), u12 (val) -- types: a1: boolean
        local v1 = u11()
        if v1.spinWheelShown == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.spinWheelShown = a1
        u12(v2)
    end,
}