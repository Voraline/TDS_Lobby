-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSpring
-- Decompile time: 4.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SpringValue = require(ReplicatedStorage.Client.Interfaces.Hooks.Utility.SpringValue)
local useMemo = React.useMemo
local useEffect = React.useEffect
local u29 = {}
Scheduler.add("UpdateSprings", RunService.RenderStepped, function(a1) -- Line: 17 -- upvalues: u29 (val) -- types: a1: number
    local v1
    debug.profilebegin("updateReactSpring")
    for k, v in pairs(u29) do
        if v.updateState then
            debug.profilebegin("springUpdate")
            v1 = k:Update(a1)
            v.updateState(k:GetValue())
            debug.profileend()
            if not v1 then
                u29[k] = nil
            end
        end
    end
    debug.profileend()
end)

local function createSpring(a1, a2, a3, a4) -- Line: 36
    -- upvalues: SpringValue (val), u29 (val)
    local u9 = SpringValue.new(a2, a4, a3)
    local u12 = typeof(a2)
    local v1 = u12 == "number"
    rawset(u9, "isNumber", v1)
    v1 = tick()
    rawset(u9, "lastUpdated", v1)
    local u28 = {updateState = a1}

    function u28.setSpeed(a1) -- Line: 51 -- upvalues: u9 (val) -- types: a1: number
        u9:SetSpeed(a1)
    end

    function u28.setTarget(a1) -- Line: 55
        -- upvalues: u12 (val), u9 (val), u29 (upval), u28 (val)
        assert((typeof(a1)) == u12, "Spring 'Target' must be of the same type as the base value")
        if a1 == u9:GetGoal() then
            return
        end
        u9:SetGoal(a1)
        u29[u9] = u28
    end

    function u28.setValue(a1) -- Line: 68
        -- upvalues: u12 (val), u9 (val), u29 (upval), u28 (val)
        assert((typeof(a1)) == u12, "Spring 'Value' must be of the same type as the base value")
        if a1 == u9:GetValue() then
            return
        end
        u9:SetValue(a1)
        u29[u9] = u28
    end

    function u28.impulse(a1) -- Line: 81 -- upvalues: u12 (val), u9 (val), u29 (upval), u28 (val) -- types: a1: userdata
        assert((typeof(a1)) == u12, "Spring 'Impulse' must be of the same type as the base value")
        u9:Impulse(a1)
        u29[u9] = u28
    end

    return u28, u9
end

return function(a1, a2, a3, a4) -- Line: 93
    -- upvalues: React (val), useMemo (val), createSpring (val), useEffect (val), u29 (val)
    local u38, v1
    local u6 = typeof(a1)
    local u8 = u6 == "number"
    local v2 = nil
    local u10 = nil
    if not a4 then
        assert(false, "useSpring must be used with a binding")
    else
        local v3
        v1, v3 = React.useBinding(a1)
        v2 = v1
        u10 = v3
    end
    v1, u38 = useMemo(function() -- Line: 105 -- upvalues: u8 (val), u6 (val), createSpring (upval), u10 (ref), a1 (val), a2 (val), a3 (val)
        local v1 = u8
        if not v1 then
            v1 = true
            if u6 ~= "Vector2" then
                v1 = true
                if u6 ~= "Vector3" then
                    v1 = true
                    if u6 ~= "UDim" then
                        v1 = true
                        if u6 ~= "UDim2" then
                            v1 = u6 == "Color3"
                        end
                    end
                end
            end
        end
        assert(v1, "Spring base value must be a number | Vector2 | Vector3 | UDim | UDim2 | Color3")
        return createSpring(u10, a1, a2 or 1, a3 or 1)
    end, {})
    useEffect(function() -- Line: 119 -- upvalues: u29 (upval), u38 (val)
        return function() -- Line: 120 -- upvalues: u29 (upval), u38 (upval)
            u29[u38] = nil
        end
    end, {})
    v1.updateState = u10
    return v2, v1.setTarget, v1.setValue, v1.impulse, v1.setSpeed
end