-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Libraries.FractalitySpring.Primitives.LinearSpring
-- Decompile time: 4.20 ms

local exp = math.exp
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt
local u4 = {}
u4.__index = u4
u4.ClassName = "LinearSpring"

function u4.new(a1, a2, a3, a4) -- Line: 28 -- upvalues: u4 (val) -- types: a1: number, a2: number, a3: table, a4: table
    local v1 = setmetatable({}, u4)
    v1.dampingRatio = a1
    v1.frequency = a2
    v1.goal = a4
    v1.position = a3
    v1.velocity = table.create(#a3, 0)
    return v1
end

local function magnitudeSq(a1) -- Line: 41 -- types: a1: table
    local v1 = 0
    for i, j in a1 do
        v1 = v1 + j ^ 2
    end
    return v1
end

local function distanceSq(a1, a2) -- Line: 49 -- types: a1: table, a2: table
    local v1 = 0
    for i, j in a1 do
        v1 = v1 + (a2[i] - j) ^ 2
    end
    return v1
end

function u4.getDampingRatio(a1) -- Line: 57
    return a1.dampingRatio
end

function u4.getFrequency(a1) -- Line: 61
    return a1.frequency
end

function u4.getPosition(a1) -- Line: 65
    return a1.position
end

function u4.getVelocity(a1) -- Line: 69
    return a1.velocity
end

function u4.getGoal(a1) -- Line: 73
    return a1.goal
end

function u4.setDampingRatio(a1, a2) -- Line: 77 -- types: a2: number
    a1.dampingRatio = a2
end

function u4.setFrequency(a1, a2) -- Line: 81 -- types: a2: number
    a1.frequency = a2
end

function u4.setPosition(a1, a2) -- Line: 85 -- types: a2: table
    a1.position = a2
end

function u4.setVelocity(a1, a2) -- Line: 89 -- types: a2: table
    a1.velocity = a2
end

function u4.setGoal(a1, a2) -- Line: 93 -- types: a2: table
    a1.goal = a2
end

function u4.canSleep(a1) -- Line: 97
    local v1 = 0
    for i, j in a1.velocity do
        v1 = v1 + j ^ 2
    end
    if v1 > 0.0001 then
        return false
    end
    v1 = 0
    for k, n in a1.position do
        v1 = v1 + (a1.goal[k] - n) ^ 2
    end
    if v1 > 6.781684027777778e-08 then
        return false
    end
    return true
end

function u4.step(a1, a2) -- Line: 109 -- upvalues: exp (val), sqrt (val), cos (val), sin (val) -- types: a2: number
    local v1, v2, v3, v4, v5, v6, v7, v8
    local dampingRatio = a1.dampingRatio
    local v9 = a1.frequency * 6.283185307179586
    local goal = a1.goal
    local position = a1.position
    local velocity = a1.velocity
    if dampingRatio == 1 then
        v6 = exp(-v9 * a2)
        v7 = a2 * v6
        v8 = v6 + v7 * v9
        v1 = v6 - v7 * v9
        v2 = v7 * v9 * v9
        v3 = #position
        for k = 1, v3 do
            v4 = position[k] - goal[k]
            v5 = v4 * v8 + velocity[k] * v7
            position[k] = v5 + goal[k]
            v5 = velocity[k] * v1
            velocity[k] = v5 - v4 * v2
        end
    else
        local v10, v11
        if not (dampingRatio < 1) then
            v6 = sqrt(dampingRatio * dampingRatio - 1)
            v7 = -v9 * (dampingRatio + v6)
            v8 = -v9 * (dampingRatio - v6)
            v1 = exp(v7 * a2)
            v2 = exp(v8 * a2)
            v3 = #position
            for i = 1, v3 do
                v4 = position[i] - goal[i]
                v10 = (velocity[i] - v4 * v7) / (2 * v9 * v6)
                v5 = v1 * (v4 - v10)
                v11 = v5 + v10 * v2
                position[i] = v11 + goal[i]
                velocity[i] = v5 * v7 + v10 * v2 * v8
            end
        else
            local v12, v13
            v6 = exp(-dampingRatio * v9 * a2)
            v7 = sqrt(1 - dampingRatio * dampingRatio)
            v8 = cos(a2 * v9 * v7)
            v1 = sin(a2 * v9 * v7)
            if not (v7 > 1e-05) then
                v3 = a2 * v9
                v2 = v3 + (v3 * v3 * (v7 * v7) * (v7 * v7) / 20 - v7 * v7) * (v3 * v3 * v3) / 6
            else
                v2 = v1 / v7
            end
            if not (1e-05 < v9 * v7) then
                v12 = v9 * v7
                v3 = a2 + (a2 * a2 * (v12 * v12) * (v12 * v12) / 20 - v12 * v12) * (a2 * a2 * a2) / 6
            else
                v3 = v1 / (v9 * v7)
            end
            v12 = #position
            for j = 1, v12 do
                v10 = position[j] - goal[j]
                v13 = (v10 * (v8 + v2 * dampingRatio) + velocity[j] * v3) * v6
                position[j] = v13 + goal[j]
                v11 = velocity[j] * (v8 - v2 * dampingRatio)
                velocity[j] = (v11 - v10 * (v2 * v9)) * v6
            end
        end
    end
    return a1.position
end

return u4