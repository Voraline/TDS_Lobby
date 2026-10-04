-- Script path: ReplicatedStorage.Shared.Modules.Standalone.SpringClass
-- Decompile time: 2.26 ms

local v1 = {}
local u1 = tick
local u2 = setmetatable
local cos = math.cos
local sin = math.sin

function v1.new(a1, a2, a3) -- Line: 13 -- upvalues: u1 (val), cos (val), sin (val), u2 (val)
    local u4 = 0 * a1
    local u6 = u1()
    local u7 = a1
    local u8 = u4
    local u9 = a1
    local u10 = a2 or 1
    local u11 = a3 or 1
    local v1 = {}
    local v2 = {}

    local function getpv(a1) -- Line: 26
        -- upvalues: u11 (ref), u6 (ref), u10 (ref), cos (upval), sin (upval), u7 (ref), u9 (ref), u8 (ref)
        local v1, v2, v3, v4, v5, v6
        local v7 = u11 * (a1 - u6)
        local v8 = u10 * u10
        if v8 < 1 then
            v1 = (1 - v8) ^ 0.5
            v4 = 2.718281828459045 ^ (-u10 * v7) / v1
            v6 = v1 * v7
            v3 = v4 * cos(v6)
            v6 = v1 * v7
            v2 = v4 * sin(v6)
        elseif v8 ~= 1 then
            v1 = (v8 - 1) ^ 0.5
            v4 = 2.718281828459045 ^ ((-u10 + v1) * v7) / (2 * v1)
            v5 = 2.718281828459045 ^ ((-u10 - v1) * v7) / (2 * v1)
            v3 = v4 + v5
            v2 = v4 - v5
        else
            v4 = 2.718281828459045 ^ (-u10 * v7) / 1
            v3 = v4
            v2 = v4 * v7
        end
        v4 = v1 * v3 + u10 * v2
        v5 = 1 - (v1 * v3 + u10 * v2)
        v6 = v2 / u11
        local v9 = -u11 * v2
        local v10 = u11 * v2
        local v11 = v1 * v3 - u10 * v2
        return v4 * u7 + v5 * u9 + v6 * u8, v9 * u7 + v10 * u9 + v11 * u8
    end

    function v1.init(a1, a2, a3) -- Line: 57 -- upvalues: u6 (ref), u1 (upval), u7 (ref), u4 (val), u8 (ref), u9 (ref)
        u6 = u1()
        u7 = a1 or u4
        u8 = a2 or u4
        u9 = a3 or a1 or u4
    end

    function v2.__index(a1, a2) -- Line: 64 -- upvalues: u1 (upval), getpv (val), u9 (ref), u10 (ref), u11 (ref)
        local v1, v2
        local v3 = u1()
        if a2 == "p" then
            return (getpv(v3))
        end
        if a2 == "v" then
            _, v2 = getpv(v3)
            return v2
        end
        if a2 == "t" then
            return u9
        end
        if a2 == "d" then
            return u10
        end
        if a2 == "s" then
            return u11
        end
        if a2 ~= "a" then
            return
        end
        v1, v2 = getpv(v3)
        return u11 * u11 * (u9 - v1) - 2 * u11 * u10 * v2
    end

    function v2.__newindex(a1, a2, a3) -- Line: 85
        -- upvalues: u1 (upval), u7 (ref), u8 (ref), getpv (val), u6 (ref), u4 (val), u9 (ref), u10 (ref), u11 (ref)
        local v1 = u1()
        local v2, v3 = getpv(v1)
        u7 = v2
        u8 = v3
        u6 = v1
        if a2 == "p" then
            u7 = a3 or u4
            return
        end
        if a2 == "v" then
            u8 = a3 or u4
            return
        end
        if a2 == "t" then
            u9 = a3 or u4
            return
        end
        if a2 == "d" then
            u10 = a3 or 1
            return
        end
        if a2 == "s" then
            u11 = a3 or 1
        end
    end

    v1.init()
    return (u2(v1, v2))
end

return v1