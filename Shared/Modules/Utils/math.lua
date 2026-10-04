-- Script path: ReplicatedStorage.Shared.Modules.Utils.math
-- Decompile time: 4.02 ms

local round = math.round
local v1 = {__index = math}
local u5 = setmetatable({}, v1)
u5.e = 2.718281828459
u5.tau = u5.pi * 2

function u5.map(a1, a2, a3, a4, a5) -- Line: 16
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4
end

function u5.ilerp(a1, a2, a3) -- Line: 20
    return (a3 - a1) / (a2 - a1)
end

function u5.round(a1, a2) -- Line: 24 -- upvalues: round (val) -- types: a1: number, a2: number?
    local v1 = 10 ^ (a2 or 0)
    return round(a1 * v1) / v1
end

function u5.roundToNearest(a1, a2) -- Line: 29 -- upvalues: u5 (val) -- types: a1: number, a2: number
    return u5.round(a1 / a2) * a2
end

function u5.getDisplayPercentages(a1, a2) -- Line: 33 -- upvalues: u5 (val) -- types: a1: table, a2: function
    local index, v1, v2, v3
    local v4 = {}
    local v5 = {}
    local v6 = 0
    local v7 = 0
    for i, j in a1 do
        v6 = v6 + u5.max(a2(j) or 0, 0)
    end
    if v6 <= 0 then
        for i5 in a1 do
            v4[i5] = 0
        end
        return v4
    end
    for k, n in a1 do
        v1 = u5.max(a2(n) or 0, 0) / v6 * 10000
        v2 = u5.floor(v1)
        v4[k] = v2 / 100
        v7 = v7 + v2
        table.insert(v5, {index = k, remainder = v1 - v2})
    end
    table.sort(v5, function(a1, a2) -- Line: 65
        if a1.remainder == a2.remainder then
            return a1.index < a2.index
        end
        return a2.remainder < a1.remainder
    end)
    local v8 = 10000 - v7
    for m = 1, v8 do
        v3 = v5[m]
        if not v3 then
            break
        end
        index = v3.index
        v4[index] = v4[index] + 0.01
    end
    return v4
end

function u5.deltaAngle(a1, a2) -- Line: 85 -- upvalues: u5 (val) -- types: a1: number, a2: number
    local v1 = (a2 - a1) % u5.tau
    if u5.pi < v1 then
        v1 = v1 - u5.tau
    end
    return v1
end

function u5.rotate(a1, a2) -- Line: 95 -- upvalues: u5 (val) -- types: a1: vector, a2: number
    local v1 = u5.sin(a2)
    local v2 = u5.cos(a2)
    return Vector2.new(a1.X * v2 + a1.Y * v1, -a1.X * v1 + a1.Y * v2)
end

function u5.side(a1, a2, a3) -- Line: 102 -- types: a1: vector, a2: vector, a3: vector
    return -((a2.X - a1.X) * (a3.Y - a1.Y) - (a2.Y - a1.Y) * (a3.X - a1.X))
end

function u5.lerp(a1, a2, a3) -- Line: 106
    return a1 + (a2 - a1) * a3
end

function u5.format(a1) -- Line: 110 -- types: a1: number
    local v1 = tostring(a1)
    if #v1 >= 10 then
        return (v1:sub(0, #v1 - 9)) .. "." .. (v1:sub(#v1 - 7, #v1 - 7)) .. "B+"
    end
    if #v1 >= 7 then
        return (v1:sub(0, #v1 - 6)) .. "." .. (v1:sub(#v1 - 5, #v1 - 5)) .. "M+"
    end
    if #v1 >= 4 then
        return (v1:sub(0, #v1 - 3)) .. "." .. (v1:sub(#v1 - 2, #v1 - 2)) .. "K+"
    end
    return (tostring(a1))
end

function u5.sigmoidCurve(a1, a2, a3, a4) -- Line: 134 -- types: a1: number, a2: number, a3: number, a4: number
    return a2 / ((a3 / a1 - 1) ^ a4 + 1)
end

function u5.linearCurve(a1, a2, a3) -- Line: 139 -- types: a1: number, a2: number, a3: number
    return a2 / a3 * a1
end

function u5.wrap(a1, a2) -- Line: 143 -- types: a1: number, a2: number
    local v1
    while a2 < a1 do
        v1 = a1 - a2
    end
    return a1
end

function u5.hash(a1) -- Line: 153 -- upvalues: u5 (val) -- types: a1: string
    local v1 = 5381
    local v2 = #a1
    for i = 1, v2 do
        v1 = u5.fmod(v1 * 32 + v1 + string.byte(a1, i), 2147483648)
    end
    return v1
end

function u5.isNan(a1) -- Line: 163 -- types: a1: number
    return a1 ~= a1
end

function u5.isInfinity(a1) -- Line: 168 -- upvalues: u5 (val) -- types: a1: number
    local v1 = true
    if a1 ~= u5.huge then
        v1 = a1 == -u5.huge
    end
    return v1
end

function u5.isValid(...) -- Line: 173 -- upvalues: u5 (val)
    for i, v in ipairs({...}) do
        if not u5.isNan(v) and not u5.isInfinity(v) then
            continue
        end
        return false
    end
    return true
end

function u5.distribute(a1, a2, a3) -- Line: 183 -- upvalues: u5 (val) -- types: a1: number, a2: number, a3: number?
    local v1
    local v2 = {}
    local v3 = 0
    local v4 = a3
    for i = 1, a2 do
        if not v4 then
            table.insert(v2, 0)
        elseif not (u5.random() < v4) then
            v3 = v3 + 1
            table.insert(v2, -1)
        else
            table.insert(v2, 0)
        end
    end
    if v3 == 0 then
        v2[u5.random(1, a2)] = a1
        return v2
    end
    local v5 = {}
    local v6 = v3 - 1
    for j = 1, v6 do
        table.insert(v5, (u5.random(0, a1)))
    end
    table.sort(v5)
    table.insert(v5, 1, 0)
    table.insert(v5, a1)
    v6 = 1
    for k = 1, a2 do
        if v2[k] == -1 then
            v1 = v5[v6 + 1]
            v2[k] = v1 - v5[v6]
            v6 = v6 + 1
        end
    end
    return v2
end

return u5