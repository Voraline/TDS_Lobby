-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.Utility.SpringValue
-- Decompile time: 5.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local LinearValue = require(script.Parent.LinearValue)
local u16 = {}

function u16.new(a1, a2, a3) -- Line: 12
    -- upvalues: LinearValue (val), table (val), u16 (val)
    local v1 = LinearValue.fromValue(a1)
    return table.merge(u16, {
        _current = v1,
        _goal = v1,
        _velocities = {},
        _speed = a2 or 1,
        _damper = a3 or 1,
    })
end

function u16.Destroy(a1) -- Line: 24
    setmetatable(a1, nil)
end

function u16.Impulse(a1, a2) -- Line: 28 -- upvalues: LinearValue (val)
    local _velocities, v1
    local _value = LinearValue.fromValue(a2)._value
    local v2 = #_value
    for i = 1, v2 do
        _velocities = a1._velocities
        v1 = a1._velocities[i] or 0
        _velocities[i] = v1 + _value[i]
    end
end

function u16.SetGoal(a1, a2) -- Line: 35 -- upvalues: LinearValue (val)
    a1._goal = LinearValue.fromValue(a2)
end

function u16.SetSpeed(a1, a2) -- Line: 39 -- types: a1: table, a2: number
    a1._speed = a2
end

function u16.SetDamper(a1, a2) -- Line: 43 -- types: a1: table, a2: number
    a1._damper = a2
end

function u16.GetGoal(a1) -- Line: 47
    return a1._goal:ToValue()
end

function u16.SetValue(a1, a2) -- Line: 51 -- upvalues: LinearValue (val)
    a1._current = LinearValue.fromValue(a2)
end

function u16.GetValue(a1) -- Line: 55
    return a1._current:ToValue()
end

function u16.Update(a1, a2) -- Line: 59 -- upvalues: LinearValue (val) -- types: a1: table, a2: number
    local v1, v2, v3
    local _value = a1._current._value
    local _value_2 = a1._goal._value
    local _velocities = a1._velocities
    local v4 = {}
    local v5 = false
    local v6 = #_value
    for i = 1, v6 do
        v1 = _value_2[i]
        v2, v3 = a1:getPositionVelocity(a2, _value[i], _velocities[i] or 0, v1)
        v4[i] = v2
        _velocities[i] = v3
        if 0.01 < (math.abs(v2 - v1)) or 0.01 < (math.abs(v3)) then
            v5 = true
        end
    end
    if v5 then
        a1._current = LinearValue.new(a1._current._ccstr, unpack(v4))
        return v5
    end
    a1._current = a1._goal
    return v5
end

function u16:getPositionVelocity(a2, a3, a4, a5) -- Line: 92
    -- upvalues: 
    local v1, v2, v3, v4, v5
    local _damper = self._damper
    local _speed = self._speed
    local v6 = _speed * a2
    local v7 = _damper * _damper
    if v7 < 1 then
        v5 = math.sqrt(1 - v7)
        v3 = math.exp(-_damper * v6) / v5
        v2 = v3 * math.cos(v5 * v6)
        v1 = v3 * math.sin(v5 * v6)
    elseif v7 ~= 1 then
        v5 = math.sqrt(v7 - 1)
        v3 = (math.exp((-_damper + v5) * v6)) / (2 * v5)
        v4 = (math.exp((-_damper - v5) * v6)) / (2 * v5)
        v2 = v3 + v4
        v1 = v3 - v4
    else
        v3 = math.exp(-_damper * v6) / 1
        v2 = v3
        v1 = v3 * v6
    end
    v3 = v5 * v2 + _damper * v1
    v4 = 1 - (v5 * v2 + _damper * v1)
    local v8 = v1 / _speed
    local v9 = -_speed * v1
    local v10 = _speed * v1
    local v11 = v5 * v2 - _damper * v1
    return v3 * a3 + v4 * a5 + v8 * a4, v9 * a3 + v10 * a5 + v11 * a4
end

return u16