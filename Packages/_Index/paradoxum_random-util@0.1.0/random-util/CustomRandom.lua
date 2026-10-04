-- Script path: ReplicatedStorage.Packages._Index.paradoxum_random-util@0.1.0.random-util.CustomRandom
-- Decompile time: 7.57 ms

local function isFinite(a1) -- Line: 9 -- types: a1: number
    local v1 = false
    if a1 == a1 then
        v1 = false
        if a1 ~= (1 / 0) then
            v1 = a1 ~= (-1 / 0)
        end
    end
    return v1
end

local function validatePosition(a1, a2) -- Line: 13 -- types: a2: string
    if type(a1) ~= "number" then
        error(("%* must be a nonnegative integer"):format(a2), 3)
    else
        local v1 = false
        if a1 == a1 then
            v1 = false
            if a1 ~= (1 / 0) then
                v1 = a1 ~= (-1 / 0)
            end
        end
        if not v1 or a1 < 0 or a1 % 1 ~= 0 then
            error(("%* must be a nonnegative integer"):format(a2), 3)
        end
    end
    if a1 > 9007199254740991 then
        error(("%* must not exceed %*"):format(a2, 9007199254740991), 3)
    end
    return a1
end

local function normalizeSeed(a1) -- Line: 24
    if type(a1) ~= "number" then
        error("seed must be a finite number", 3)
    else
        local v1 = false
        if a1 == a1 then
            v1 = false
            if a1 ~= (1 / 0) then
                v1 = a1 ~= (-1 / 0)
            end
        end
        if not v1 then
            error("seed must be a finite number", 3)
        end
    end
    return math.floor(a1) % 4294967296
end

local function add32(a1, a2) -- Line: 32 -- types: a1: number, a2: number
    return (a1 + a2) % 4294967296
end

local function multiply32(a1, a2) -- Line: 36 -- types: a1: number, a2: number
    local v1 = a1 % 65536
    local v2 = (a1 - v1) / 65536
    local v3 = a2 % 65536
    local v4 = (a2 - v3) / 65536
    return (v1 * v3 + (v2 * v3 + v1 * v4) * 65536) % 4294967296
end

local function multiplyHigh32(a1, a2) -- Line: 47 -- types: a1: number, a2: number
    local v1 = a1 % 65536
    local v2 = (a1 - v1) / 65536
    local v3 = a2 % 65536
    local v4 = (a2 - v3) / 65536
    local v5 = v1 * v3
    local v6 = v2 * v3 + v1 * v4 + math.floor(v5 / 65536)
    return v2 * v4 + math.floor(v6 / 65536)
end

local function stepState(a1) -- Line: 58 -- types: a1: number
    local v1 = a1 % 65536
    local v2 = (a1 - v1) / 65536
    return ((v1 * 30645 + (v2 * 30645 + v1 * 11410) * 65536) % 4294967296 + 2891336453) % 4294967296
end

local function outputState(a1) -- Line: 62 -- types: a1: number
    local v1 = bit32.bxor(bit32.rshift(a1, (bit32.rshift(a1, 28)) + 4), a1)
    local v2 = v1 % 65536
    local v3 = (v1 - v2) / 65536
    local v4 = (v2 * 62169 + (v3 * 62169 + v2 * 4238) * 65536) % 4294967296
    return (bit32.bxor(bit32.rshift(v4, 22), v4))
end

local function advanceState(a1, a2) -- Line: 68 -- types: a1: number, a2: number
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = 1
    local v9 = 0
    local v10 = 747796405
    local v11 = 2891336453
    local v12 = a2
    local v13 = a1
    while v12 > 0 do
        if v12 % 2 == 1 then
            v5 = v8
            v7 = v5 % 65536
            v1 = (v5 - v7) / 65536
            v2 = v10 % 65536
            v3 = (v10 - v2) / 65536
            v8 = (v7 * v2 + (v1 * v2 + v7 * v3) * 65536) % 4294967296
            v1 = v9 % 65536
            v2 = (v9 - v1) / 65536
            v3 = v10 % 65536
            v4 = (v10 - v3) / 65536
            v9 = ((v1 * v3 + (v2 * v3 + v1 * v4) * 65536) % 4294967296 + v11) % 4294967296
        end
        v5 = (v10 + 1) % 4294967296
        v6 = v11
        v7 = v5 % 65536
        v1 = (v5 - v7) / 65536
        v2 = v6 % 65536
        v3 = (v6 - v2) / 65536
        v11 = (v7 * v2 + (v1 * v2 + v7 * v3) * 65536) % 4294967296
        v5 = v10
        v6 = v10
        v7 = v5 % 65536
        v1 = (v5 - v7) / 65536
        v2 = v6 % 65536
        v3 = (v6 - v2) / 65536
        v10 = (v7 * v2 + (v1 * v2 + v7 * v3) * 65536) % 4294967296
        v12 = math.floor(v12 / 2)
    end
    v1 = v8 % 65536
    v2 = (v8 - v1) / 65536
    v3 = v13 % 65536
    v4 = (v13 - v3) / 65536
    return ((v1 * v3 + (v2 * v3 + v1 * v4) * 65536) % 4294967296 + v9) % 4294967296
end

local u9 = {}
u9.__index = u9

function u9.new(a1, a2) -- Line: 102
    -- upvalues: validatePosition (val), advanceState (val), u9 (val)
    local v1
    if type(a1) ~= "number" then
        error("seed must be a finite number", 3)
    else
        v1 = false
        if a1 == a1 then
            v1 = false
            if a1 ~= (1 / 0) then
                v1 = a1 ~= (-1 / 0)
            end
        end
        if not v1 then
            error("seed must be a finite number", 3)
        end
    end
    local v2 = math.floor(a1) % 4294967296
    local v3 = (2891336453 + v2) % 4294967296
    local v4 = v3 % 65536
    local v5 = (v3 - v4) / 65536
    v1 = ((v4 * 30645 + (v5 * 30645 + v4 * 11410) * 65536) % 4294967296 + 2891336453) % 4294967296
    v3 = if a2 ~= nil then validatePosition(a2, "position") else 0
    return (setmetatable({_initialState = v1, _position = v3, _seed = v2, _state = advanceState(v1, v3)}, u9))
end

function u9.Advance(a1, a2) -- Line: 114 -- upvalues: validatePosition (val), advanceState (val) -- types: a2: number
    local v1 = validatePosition(a2, "distance")
    local v2 = a1._position + v1
    if v2 > 9007199254740991 then
        error(("position must not exceed %*"):format(9007199254740991), 2)
    end
    a1._state = advanceState(a1._state, v1)
    a1._position = v2
    return a1
end

function u9.At(a1, a2) -- Line: 126
    -- upvalues: validatePosition (val), advanceState (val), u9 (val)
    local v1 = validatePosition(a2, "position")
    return (setmetatable({
        _initialState = a1._initialState,
        _position = v1,
        _seed = a1._seed,
        _state = advanceState(a1._initialState, v1),
    }, u9))
end

function u9.Clone(a1) -- Line: 136 -- upvalues: u9 (val)
    return (setmetatable({
        _initialState = a1._initialState,
        _position = a1._position,
        _seed = a1._seed,
        _state = a1._state,
    }, u9))
end

function u9.GetPosition(a1) -- Line: 145
    return a1._position
end

function u9.GetSeed(a1) -- Line: 149
    return a1._seed
end

function u9.NextUInt32(a1) -- Line: 153
    if a1._position == 9007199254740991 then
        error(("position must not exceed %*"):format(9007199254740991), 2)
    end
    local _state = a1._state
    local v1 = bit32.bxor(bit32.rshift(_state, (bit32.rshift(_state, 28)) + 4), _state)
    local v2 = v1 % 65536
    local v3 = (v1 - v2) / 65536
    local v4 = (v2 * 62169 + (v3 * 62169 + v2 * 4238) * 65536) % 4294967296
    local v5 = bit32.bxor(bit32.rshift(v4, 22), v4)
    local _state_2 = a1._state
    v1 = _state_2 % 65536
    v2 = (_state_2 - v1) / 65536
    a1._state = ((v1 * 30645 + (v2 * 30645 + v1 * 11410) * 65536) % 4294967296 + 2891336453) % 4294967296
    a1._position = a1._position + 1
    return v5
end

function u9.NextNumber(a1, a2, a3) -- Line: 164 -- upvalues: u9 (val) -- types: a2: number?, a3: number?
    local v1
    if a2 == nil and a3 == nil then
        return u9.NextUInt32(a1) / 4294967296
    end
    if a2 == nil or a3 == nil then
        error("NextNumber requires both minimum and maximum, or neither", 2)
    end
    if type(a2) ~= "number" then
        error("minimum must be a finite number", 2)
    else
        v1 = false
        if a2 == a2 then
            v1 = false
            if a2 ~= (1 / 0) then
                v1 = a2 ~= (-1 / 0)
            end
        end
        if not v1 then
            error("minimum must be a finite number", 2)
        end
    end
    if type(a3) ~= "number" then
        error("maximum must be a finite number", 2)
    else
        v1 = false
        if a3 == a3 then
            v1 = false
            if a3 ~= (1 / 0) then
                v1 = a3 ~= (-1 / 0)
            end
        end
        if not v1 then
            error("maximum must be a finite number", 2)
        end
    end
    if a3 < a2 then
        error("maximum must be greater than or equal to minimum", 2)
    end
    v1 = a3 - a2
    local v2 = false
    if v1 == v1 then
        v2 = false
        if v1 ~= (1 / 0) then
            v2 = v1 ~= (-1 / 0)
        end
    end
    if not v2 then
        error("number range must be finite", 2)
    end
    return a2 + v1 * (u9.NextUInt32(a1) / 4294967296)
end

function u9.NextInteger(a1, a2, a3) -- Line: 189 -- upvalues: u9 (val) -- types: a2: number, a3: number
    local v1, v2
    if type(a2) ~= "number" then
        error("minimum must be a finite integer", 2)
    else
        v1 = false
        if a2 == a2 then
            v1 = false
            if a2 ~= (1 / 0) then
                v1 = a2 ~= (-1 / 0)
            end
        end
        if not v1 or a2 % 1 ~= 0 then
            error("minimum must be a finite integer", 2)
        end
    end
    if type(a3) ~= "number" then
        error("maximum must be a finite integer", 2)
    else
        v1 = false
        if a3 == a3 then
            v1 = false
            if a3 ~= (1 / 0) then
                v1 = a3 ~= (-1 / 0)
            end
        end
        if not v1 or a3 % 1 ~= 0 then
            error("maximum must be a finite integer", 2)
        end
    end
    if 9007199254740991 < (math.abs(a2)) or 9007199254740991 < (math.abs(a3)) then
        error(("integer bounds must not exceed %* in magnitude"):format(9007199254740991), 2)
    end
    if a3 < a2 then
        error("maximum must be greater than or equal to minimum", 2)
    end
    v1 = a3 - a2 + 1
    if v1 > 4294967296 then
        error(("integer range must contain at most %* values"):format(4294967296), 2)
    end
    local v3 = u9.NextUInt32(a1)
    if v1 ~= 4294967296 then
        local v4 = v3 % 65536
        local v5 = (v3 - v4) / 65536
        local v6 = v1 % 65536
        local v7 = (v1 - v6) / 65536
        local v8 = v4 * v6
        local v9 = v5 * v6 + v4 * v7 + math.floor(v8 / 65536)
        v2 = v5 * v7 + math.floor(v9 / 65536)
    else
        v2 = v3
    end
    return a2 + v2
end

function u9.Shuffle(a1, a2) -- Line: 213 -- upvalues: u9 (val) -- types: a2: table
    local v1, v2, v3
    for i = #a2, 2, -1 do
        v1 = u9.NextInteger(a1, 1, i)
        v2 = a2[v1]
        v3 = a2[i]
        a2[i] = v2
        a2[v1] = v3
    end
end

return table.freeze(u9)