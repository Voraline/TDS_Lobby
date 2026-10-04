-- Script path: ReplicatedStorage.Shared.Modules.GuiLib.Utilities.Spring
-- Decompile time: 1.88 ms

local function getAbsDist(a1, a2) -- Line: 5
    local v1 = a2 - a1
    if type(v1) == "number" then
        return (math.abs(v1))
    end
    return v1.Magnitude
end

local u1 = {}
u1.__index = u1
u1.__type = "Spring"

function u1.__tostring(a1) -- Line: 19 -- upvalues: u1 (val)
    return u1.__type
end

function u1.new(a1, a2, a3, a4) -- Line: 25 -- upvalues: u1 (val)
    local v1 = setmetatable({}, u1)
    v1.instant = false
    v1.marginOfError = 1e-06
    local v2 = a3 or 1
    local v3 = a2 * a2 / (4 * a1 * v2 * v2)
    v1.k = a1 / v3
    v1.d = -a2 / v3
    v1.x = a4
    v1.t = a4
    v1.v = a4 * 0
    return v1
end

function u1.Update(a1, a2) -- Line: 44
    if not a1.instant then
        local t = a1.t
        local k = a1.k
        local d = a1.d
        local x = a1.x
        local v = a1.v
        local v1 = k * (t - x) + v * d
        local v2 = v + v1 * (a2 / 2)
        local v3 = k * (t - (x + v * (a2 / 2))) + v2 * d
        local v4 = v + v3 * (a2 / 2)
        local v5 = k * (t - (x + v2 * (a2 / 2))) + v4 * d
        local v6 = v + v5 * a2
        local v7 = x + (v + 2 * (v2 + v4) + v6) * (a2 / 6)
        local v8 = v + (v1 + 2 * (v3 + v5) + k * (t - (x + v4 * a2)) + v6 * d) * (a2 / 6)
        a1.x = v7
        a1.v = v8
        local v9 = a1.t - v7
        if a1.marginOfError < (if type(v9) ~= "number" then v9.Magnitude else math.abs(v9)) then
            return v7
        end
    end
    local t_2 = a1.t
    local v10 = a1.v * 0
    a1.x = t_2
    a1.v = v10
    return a1.x
end

return u1