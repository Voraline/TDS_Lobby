-- Script path: ReplicatedStorage.Shared.Modules.Standalone.Spring
-- Decompile time: 3.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u10 = {}

function u10.new(a1, a2) -- Line: 53 -- upvalues: u10 (val)
    local v1 = a1 or 0
    local v2 = a2 or os.clock
    return (setmetatable({
        _damper = 1,
        _speed = 1,
        _clock = v2,
        _time0 = v2(),
        _position0 = v1,
        _velocity0 = 0 * v1,
        _target = v1,
    }, u10))
end

function u10.Impulse(a1, a2) -- Line: 74
    a1.Velocity = a1.Velocity + a2
end

function u10.TimeSkip(a1, a2) -- Line: 83
    local v1 = a1._clock()
    local v2, v3 = a1:_positionVelocity(v1 + a2)
    a1._position0 = v2
    a1._velocity0 = v3
    a1._time0 = v1
end

function u10.SetTarget(a1, a2, a3) -- Line: 97
    if not a3 then
        a1.Target = a2
        return
    end
    local v1 = a1._clock()
    a1._position0 = a2
    a1._velocity0 = 0 * a2
    a1._target = a2
    a1._time0 = v1
end

function u10.__index(a1, a2) -- Line: 190 -- upvalues: u10 (val)
    if u10[a2] then
        return u10[a2]
    end
    if a2 ~= "Value" and a2 ~= "Position" and a2 ~= "p" then
        local v1
        if a2 ~= "Velocity" and a2 ~= "v" then
            if a2 ~= "Target" and a2 ~= "t" then
                if a2 ~= "Damper" and a2 ~= "d" then
                    if a2 ~= "Speed" and a2 ~= "s" then
                        if a2 == "Clock" then
                            return a1._clock
                        end
                        error(string.format("%q is not a valid member of Spring", (tostring(a2))), 2)
                        return
                    end
                    return a1._speed
                end
                return a1._damper
            end
            return a1._target
        end
        _, v1 = a1:_positionVelocity((a1._clock()))
        return v1
    end
    return (a1:_positionVelocity((a1._clock())))
end

function u10.__newindex(a1, a2, a3) -- Line: 212 -- upvalues: GameState (val)
    local v1
    local v2 = a1._time0 + (a1._clock() - a1._time0) * GameState.TimeScale
    if a2 ~= "Value" and a2 ~= "Position" and a2 ~= "p" then
        if a2 ~= "Velocity" and a2 ~= "v" then
            local v3
            if a2 ~= "Target" and a2 ~= "t" then
                if a2 ~= "Damper" and a2 ~= "d" then
                    if a2 ~= "Speed" and a2 ~= "s" then
                        if a2 ~= "Clock" then
                            error(string.format("%q is not a valid member of Spring", (tostring(a2))), 2)
                            return
                        end
                        v3, v1 = a1:_positionVelocity(v2)
                        a1._position0 = v3
                        a1._velocity0 = v1
                        a1._clock = a3
                        a1._time0 = a3()
                        return
                    end
                    v3, v1 = a1:_positionVelocity(v2)
                    a1._position0 = v3
                    a1._velocity0 = v1
                    a1._speed = if not (a3 < 0) then a3 else 0
                    a1._time0 = v2
                    return
                end
                v3, v1 = a1:_positionVelocity(v2)
                a1._position0 = v3
                a1._velocity0 = v1
                a1._damper = a3
                a1._time0 = v2
                return
            end
            v3, v1 = a1:_positionVelocity(v2)
            a1._position0 = v3
            a1._velocity0 = v1
            a1._target = a3
            a1._time0 = v2
            return
        end
        a1._position0 = (a1:_positionVelocity(v2))
        a1._velocity0 = a3
        a1._time0 = v2
        return
    end
    _, v1 = a1:_positionVelocity(v2)
    a1._position0 = a3
    a1._velocity0 = v1
    a1._time0 = v2
end

function u10:_positionVelocity(a2) -- Line: 256
    local v1, v2, v3, v4, v5
    local _position0 = self._position0
    local _velocity0 = self._velocity0
    local _target = self._target
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
    return v3 * _position0 + v4 * _target + v8 * _velocity0, v9 * _position0 + v10 * _target + v11 * _velocity0
end

return u10