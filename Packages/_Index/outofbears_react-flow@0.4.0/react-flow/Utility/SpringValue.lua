-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Utility.SpringValue
-- Decompile time: 3.97 ms

local RunService = game:GetService("RunService")
local LinearValue = require(script.Parent.LinearValue)
local Promise = require(script.Parent.Parent.Promise)
local u16 = {}
local u17 = {}
u16.__index = u16

function u16.new(a1, a2, a3) -- Line: 12 -- upvalues: LinearValue (val), u16 (val) -- types: a2: number?, a3: number?
    local v1 = LinearValue.fromValue(a1)
    local v2 = {}
    local v3 = #v1._value
    for i = 1, v3 do
        v2[i] = 0
    end
    return (setmetatable({
        _immediate = false,
        _current = v1,
        _goal = v1,
        _velocities = v2,
        _speed = a2 or 1,
        _damper = a3 or 1,
    }, u16))
end

function u16.Destroy(a1) -- Line: 32 -- upvalues: u17 (val)
    u17[a1] = nil
    setmetatable(a1, nil)
end

function u16.Impulse(a1, a2) -- Line: 37 -- upvalues: LinearValue (val)
    local _velocities, v1
    local _value = LinearValue.fromValue(a2)._value
    local v2 = #_value
    for i = 1, v2 do
        _velocities = a1._velocities
        v1 = a1._velocities[i] or 0
        _velocities[i] = v1 + _value[i]
    end
end

function u16.GetVelocity(a1) -- Line: 44 -- upvalues: LinearValue (val)
    local new = LinearValue.new
    local _ccstr = a1._current._ccstr
    local _velocities = a1._velocities
    return new(_ccstr, unpack(_velocities)):ToValue()
end

function u16.SetGoal(a1, a2) -- Line: 48 -- upvalues: LinearValue (val)
    a1._goal = LinearValue.fromValue(a2)
end

function u16.SetSpeed(a1, a2) -- Line: 52 -- types: a1: table, a2: number
    a1._speed = a2
end

function u16.SetDamper(a1, a2) -- Line: 56 -- types: a1: table, a2: number
    a1._damper = a2
end

function u16.SetImmediate(a1, a2) -- Line: 60 -- types: a1: table, a2: boolean
    a1._immediate = a2
end

function u16.SetDelay(a1, a2) -- Line: 64 -- types: a1: table, a2: number?
    if a2 then
        assert(a2 >= 0, "Delay must be a non-negative number")
    end
    a1._delay = a2
end

function u16.SetUpdater(a1, a2) -- Line: 72 -- types: a1: table, a2: function
    a1._updater = a2
    if a1:Playing() and a2 then
        a2(a1:GetValue())
    end
end

function u16.GetGoal(a1) -- Line: 80
    return a1._goal:ToValue()
end

function u16.SetValue(a1, a2) -- Line: 84 -- upvalues: LinearValue (val)
    a1._current = LinearValue.fromValue(a2)
end

function u16:GetValue() -- Line: 88
    return self._current:ToValue()
end

function u16:Update(a2) -- Line: 92 -- upvalues: LinearValue (val) -- types: self: table, a2: number
    local v1, v2, v3
    local _value = self._current._value
    local _value_2 = self._goal._value
    local _velocities = self._velocities
    local v4 = {}
    local v5 = false
    local v6 = #_value
    for i = 1, v6 do
        v1 = _value_2[i]
        v2, v3 = self:getPositionVelocity(a2, _value[i], _velocities[i] or 0, v1)
        v4[i] = v2
        _velocities[i] = v3
        if 0.01 < (math.abs(v2 - v1)) or 0.01 < (math.abs(v3)) then
            v5 = true
        end
    end
    self._current = LinearValue.new(self._current._ccstr, unpack(v4))
    return v5
end

function u16.Playing(a1) -- Line: 118 -- upvalues: u17 (val)
    return u17[a1] ~= nil
end

function u16.Stop(a1) -- Line: 122 -- upvalues: u17 (val)
    local v1 = u17[a1]
    if v1 then
        u17[a1] = nil
        v1()
    end
end

function u16.Run(a1, a2) -- Line: 130 -- upvalues: Promise (val), u17 (val) -- types: a1: table, a2: function?
    if a2 then
        a1._updater = a2
    end
    if not a1._immediate then
        return Promise.new(function(a1_2, a2_2, a3) -- Line: 145 -- upvalues: a1 (val), a2 (val), u17 (upval)
            local u3 = false
            a3(function() -- Line: 147 -- upvalues: u3 (ref), a1 (upval)
                u3 = true
                a1:Stop()
            end)
            if a1._delay then
                task.wait(a1._delay)
                if u3 then
                    return
                end
            end
            if a2 then
                a2(a1:GetValue())
            end
            u17[a1] = a1_2
        end)
    end
    a1._current = a1._goal
    if a1._updater then
        a1._updater(a1:GetValue())
    end
    return Promise.resolve()
end

function u16:getPositionVelocity(a2, a3, a4, a5) -- Line: 170
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

RunService:UnbindFromRenderStep("UPDATE_SPRING_VALUES")
RunService:BindToRenderStep("UPDATE_SPRING_VALUES", Enum.RenderPriority.First.Value, function(a1) -- Line: 208 -- upvalues: u17 (val) -- types: a1: number
    local Value, v1
    for k, v in pairs(u17) do
        v1 = k:Update(a1)
        Value = k:GetValue()
        if k._updater then
            k._updater(Value)
        end
        if not v1 then
            u17[k] = nil
            v()
        end
    end
end)
return u16