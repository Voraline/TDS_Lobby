-- Script path: ReplicatedStorage.Shared.Modules.SpatialAudio
-- Decompile time: 2.02 ms

local u0 = {}

function u0.linear(a1, a2, a3, a4) -- Line: 11 -- types: a1: number, a2: number, a3: number?, a4: number?
    return {[a1] = a4 or 1, [a2] = a3 or 0}
end

function u0.realistic(a1, a2) -- Line: 26 -- types: a1: number?, a2: number?
    local v1
    local v2 = a1 or 10
    local v3 = {}
    for i = v2, v2 * 20, (math.max(1, v2 / 4)) do
        v1 = math.min(1, (a2 or 1) * (v2 / i) ^ 2)
        v3[i] = (math.max(0, v1))
    end
    return v3
end

function u0.smooth(a1, a2, a3) -- Line: 41 -- types: a1: number, a2: number, a3: number?
    local v1
    local v2 = {}
    local v3 = a2 - a1
    for i = 0, 20 do
        v1 = a1 + v3 * i / 20
        v2[v1] = 1 / (1 + (i / 20 * (a3 or 2)) ^ 2)
    end
    return v2
end

function u0.zones(a1) -- Line: 57 -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        v1[j.distance] = j.volume
    end
    return v1
end

function u0.directional(a1, a2, a3) -- Line: 65 -- types: a1: number?, a2: number?, a3: number?
    local v1 = a1 or 1
    local v2 = a2 or 0.7
    local v3 = a3 or 0.3
    return {
        [0] = v1,
        [45] = (v1 + v2) / 2,
        [90] = v2,
        [135] = (v2 + v3) / 2,
        [180] = v3,
    }
end

function u0.cone(a1, a2, a3) -- Line: 79 -- types: a1: number?, a2: number?, a3: number?
    local v1
    local v2 = a2 or 1
    local v3 = a3 or 0.2
    local v4 = {}
    local v5 = (a1 or 60) / 2
    for i = 0, 180, 15 do
        if not (i <= v5) then
            v1 = (i - v5) / (180 - v5)
            v4[i] = v2 + (v3 - v2) * v1
        else
            v4[i] = v2
        end
    end
    return v4
end

function u0.omnidirectional(a1) -- Line: 99 -- types: a1: number?
    local v1 = a1 or 1
    return {[0] = v1, [180] = v1}
end

function u0.ambient(a1, a2) -- Line: 107 -- upvalues: u0 (val) -- types: a1: number?, a2: number?
    return {
        distanceAttenuation = u0.linear(0, a1 or 100, a2 or 0, 1),
        angleAttenuation = u0.omnidirectional(1),
    }
end

function u0.speaker(a1, a2) -- Line: 117 -- upvalues: u0 (val) -- types: a1: number?, a2: number?
    return {
        distanceAttenuation = u0.smooth(10, a1 or 200, 1.5),
        angleAttenuation = u0.cone(a2 or 90, 1, 0.1),
    }
end

function u0.voice(a1, a2) -- Line: 127 -- upvalues: u0 (val) -- types: a1: number?, a2: number?
    local v1 = a1 or 7
    local v2 = a2 or 80
    local v3 = {}
    for i = v1, v2, 2 do
        v3[i] = (1 - (i - v1) / (v2 - v1)) ^ 2
    end
    v3[v2] = 0
    return {distanceAttenuation = v3, angleAttenuation = u0.omnidirectional(1)}
end

function u0.music(a1, a2) -- Line: 144 -- upvalues: u0 (val) -- types: a1: number?, a2: number?
    return {
        distanceAttenuation = {[0] = 1, [a2 or 50] = 1, [a1 or 150] = 0},
        angleAttenuation = u0.omnidirectional(1),
    }
end

return u0