-- Script path: ReplicatedStorage.Client.Modules.Moonlite.EaseFuncs
-- Decompile time: 24.75 ms

local get
local u0 = {}
require(script.Parent.Types)

function u0.Linear(a1, a2, a3, a4) -- Line: 21
    return a3 * a1 / a4 + a2
end

function u0.Constant(a1, a2, a3, a4) -- Line: 29
    if a1 == a4 then
        return 1
    end
    return 0
end

function u0.InSine(a1, a2, a3, a4) -- Line: 37
    return -a3 * math.cos(a1 / a4 * 1.5707963267948966) + a3 + a2
end

function u0.OutSine(a1, a2, a3, a4) -- Line: 41
    return a3 * math.sin(a1 / a4 * 1.5707963267948966) + a2
end

function u0.InOutSine(a1, a2, a3, a4) -- Line: 45
    return -a3 / 2 * (math.cos(3.141592653589793 * a1 / a4) - 1) + a2
end

function u0.OutInSine(a1, a2, a3, a4) -- Line: 49 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutSine(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InSine(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InQuad(a1, a2, a3, a4) -- Line: 61
    return a3 * math.pow(a1 / a4, 2) + a2
end

function u0.OutQuad(a1, a2, a3, a4) -- Line: 66
    local v1 = a1 / a4
    return -a3 * v1 * (v1 - 2) + a2
end

function u0.InOutQuad(a1, a2, a3, a4) -- Line: 71
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return a3 / 2 * math.pow(v1, 2) + a2
    end
    return -a3 / 2 * ((v1 - 1) * (v1 - 3) - 1) + a2
end

function u0.OutInQuad(a1, a2, a3, a4) -- Line: 81 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutQuad(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InQuad(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InCubic(a1, a2, a3, a4) -- Line: 93
    return a3 * math.pow(a1 / a4, 3) + a2
end

function u0.OutCubic(a1, a2, a3, a4) -- Line: 98
    return a3 * (math.pow(a1 / a4 - 1, 3) + 1) + a2
end

function u0.InOutCubic(a1, a2, a3, a4) -- Line: 103
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return a3 / 2 * v1 * v1 * v1 + a2
    end
    v1 = v1 - 2
    return a3 / 2 * (v1 * v1 * v1 + 2) + a2
end

function u0.OutInCubic(a1, a2, a3, a4) -- Line: 114 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutCubic(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InCubic(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InQuart(a1, a2, a3, a4) -- Line: 126
    return a3 * math.pow(a1 / a4, 4) + a2
end

function u0.OutQuart(a1, a2, a3, a4) -- Line: 131
    local v1 = a1 / a4 - 1
    return -a3 * (math.pow(v1, 4) - 1) + a2
end

function u0.InOutQuart(a1, a2, a3, a4) -- Line: 136
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return a3 / 2 * math.pow(v1, 4) + a2
    end
    v1 = v1 - 2
    return -a3 / 2 * (math.pow(v1, 4) - 2) + a2
end

function u0.OutInQuart(a1, a2, a3, a4) -- Line: 147 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutQuart(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InQuart(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InQuint(a1, a2, a3, a4) -- Line: 159
    return a3 * math.pow(a1 / a4, 5) + a2
end

function u0.OutQuint(a1, a2, a3, a4) -- Line: 164
    return a3 * (math.pow(a1 / a4 - 1, 5) + 1) + a2
end

function u0.InOutQuint(a1, a2, a3, a4) -- Line: 169
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return a3 / 2 * math.pow(v1, 5) + a2
    end
    v1 = v1 - 2
    return a3 / 2 * (math.pow(v1, 5) + 2) + a2
end

function u0.OutInQuint(a1, a2, a3, a4) -- Line: 180 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutQuint(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InQuint(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InSextic(a1, a2, a3, a4) -- Line: 192
    return a3 * math.pow(a1 / a4, 6) + a2
end

function u0.OutSextic(a1, a2, a3, a4) -- Line: 197
    local v1 = a1 / a4 - 1
    return -a3 * (math.pow(v1, 6) - 1) + a2
end

function u0.InOutSextic(a1, a2, a3, a4) -- Line: 202
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return a3 / 2 * math.pow(v1, 6) + a2
    end
    v1 = v1 - 2
    return -a3 / 2 * (math.pow(v1, 6) - 2) + a2
end

function u0.OutInSextic(a1, a2, a3, a4) -- Line: 213 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutSextic(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InSextic(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InExpo(a1, a2, a3, a4) -- Line: 225
    if a1 == 0 then
        return a2
    end
    return a3 * math.pow(2, 10 * (a1 / a4 - 1)) + a2 - a3 * 0.001
end

function u0.OutExpo(a1, a2, a3, a4) -- Line: 233
    if a1 == a4 then
        return a2 + a3
    end
    return a3 * 1.001 * (-math.pow(2, -10 * a1 / a4) + 1) + a2
end

function u0.InOutExpo(a1, a2, a3, a4) -- Line: 241
    if a1 == 0 then
        return a2
    end
    if a1 == a4 then
        return a2 + a3
    end
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return a3 / 2 * math.pow(2, 10 * (v1 - 1)) + a2 - a3 * 0.0005
    end
    v1 = v1 - 1
    return a3 / 2 * 1.0005 * (-math.pow(2, -10 * v1) + 2) + a2
end

function u0.OutInExpo(a1, a2, a3, a4) -- Line: 260 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutExpo(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InExpo(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InCirc(a1, a2, a3, a4) -- Line: 272
    local v1 = a1 / a4
    return -a3 * (math.sqrt(1 - (math.pow(v1, 2))) - 1) + a2
end

function u0.OutCirc(a1, a2, a3, a4) -- Line: 277
    return a3 * math.sqrt(1 - (math.pow(a1 / a4 - 1, 2))) + a2
end

function u0.InOutCirc(a1, a2, a3, a4) -- Line: 282
    local v1 = a1 / a4 * 2
    if v1 < 1 then
        return -a3 / 2 * (math.sqrt(1 - v1 * v1) - 1) + a2
    end
    v1 = v1 - 2
    return a3 / 2 * (math.sqrt(1 - v1 * v1) + 1) + a2
end

function u0.OutInCirc(a1, a2, a3, a4) -- Line: 293 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutCirc(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InCirc(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.InBack(a1, a2, a3, a4, a5) -- Line: 305
    if not a5 then
        a5 = 1.70158
    end
    local v1 = a1 / a4
    return a3 * v1 * v1 * ((a5 + 1) * v1 - a5) + a2
end

function u0.OutBack(a1, a2, a3, a4, a5) -- Line: 314
    if not a5 then
        a5 = 1.70158
    end
    local v1 = a1 / a4 - 1
    return a3 * (v1 * v1 * ((a5 + 1) * v1 + a5) + 1) + a2
end

function u0.InOutBack(a1, a2, a3, a4, a5) -- Line: 323
    if not a5 then
        a5 = 1.70158
    end
    local v1 = a5 * 1.525
    local v2 = a1 / a4 * 2
    if v2 < 1 then
        return a3 / 2 * (v2 * v2 * ((v1 + 1) * v2 - v1)) + a2
    end
    v2 = v2 - 2
    return a3 / 2 * (v2 * v2 * ((v1 + 1) * v2 + v1) + 2) + a2
end

function u0.OutInBack(a1, a2, a3, a4, a5) -- Line: 339 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutBack(a1 * 2, a2, a3 / 2, a4, a5)
    end
    return u0.InBack(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4, a5)
end

function u0.OutBounce(a1, a2, a3, a4) -- Line: 351
    local v1 = a1 / a4
    if v1 < 0.36363636363636365 then
        return a3 * (7.5625 * v1 * v1) + a2
    end
    if v1 < 0.7272727272727273 then
        v1 = v1 - 0.5454545454545454
        return a3 * (7.5625 * v1 * v1 + 0.75) + a2
    end
    if v1 < 0.9090909090909091 then
        v1 = v1 - 0.8181818181818182
        return a3 * (7.5625 * v1 * v1 + 0.9375) + a2
    end
    v1 = v1 - 0.9545454545454546
    return a3 * (7.5625 * v1 * v1 + 0.984375) + a2
end

function u0.InBounce(a1, a2, a3, a4) -- Line: 368 -- upvalues: u0 (val)
    return a3 - u0.OutBounce(a4 - a1, 0, a3, a4) + a2
end

function u0.InOutBounce(a1, a2, a3, a4) -- Line: 372 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.InBounce(a1 * 2, 0, a3, a4) * 0.5 + a2
    end
    return u0.OutBounce(a1 * 2 - a4, 0, a3, a4) * 0.5 + a3 * 0.5 + a2
end

function u0.OutInBounce(a1, a2, a3, a4) -- Line: 380 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutBounce(a1 * 2, a2, a3 / 2, a4)
    end
    return u0.InBounce(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4)
end

function u0.ElasticBlend(a1, a2, a3, a4, a5, a6) -- Line: 392
    if a2 ~= 0 then
        local v1 = math.abs(a5)
        a6 = if a4 == 0 then 0 else a6 * (a4 / math.abs(a2))
        if math.abs(a1 * a3) < v1 then
            local v2 = math.abs(a1 * a3) / v1
            a6 = a6 * v2 + (1 - v2)
        end
    end
    return a6
end

function u0.InElastic(a1, a2, a3, a4, a5, a6) -- Line: 411 -- upvalues: u0 (val)
    local v1
    local v2 = 1
    if a1 == 0 then
        return a2
    end
    local v3 = a1 / a4
    if v3 == 1 then
        return a2 + a3
    end
    v3 = v3 - 1
    if not a6 or a6 == 0 then
        a6 = a4 * 0.3
    end
    if a5 == nil then
        v2 = u0.ElasticBend(v3, a3, a4, a5, a6 / 4, v2)
        a5 = a3
    elseif not (a5 < math.abs(a3)) then
        v1 = a6 / 6.283185307179586 * math.asin(a3 / a5)
    else
        v2 = u0.ElasticBend(v3, a3, a4, a5, a6 / 4, v2)
        a5 = a3
    end
    return -v2 * (a5 * math.pow(2, 10 * v3) * math.sin((v3 * a4 - v1) * 6.283185307179586 / a6)) + a2
end

function u0.OutElastic(a1, a2, a3, a4, a5, a6) -- Line: 442 -- upvalues: u0 (val)
    local v1
    local v2 = 1
    if a1 == 0 then
        return a2
    end
    local v3 = a1 / a4
    if v3 == 1 then
        return a2 + a3
    end
    v3 = -v3
    if not a6 or a6 == 0 then
        a6 = a4 * 0.3
    end
    if a5 == nil then
        v2 = u0.ElasticBlend(v3, a3, a4, a5, a6 / 4, v2)
        a5 = a3
    elseif not (a5 < math.abs(a3)) then
        v1 = a6 / 6.283185307179586 * math.asin(a3 / a5)
    else
        v2 = u0.ElasticBlend(v3, a3, a4, a5, a6 / 4, v2)
        a5 = a3
    end
    return v2 * (a5 * math.pow(2, 10 * v3) * math.sin((v3 * a4 - v1) * 6.283185307179586 / a6)) + a3 + a2
end

function u0.InOutElastic(a1, a2, a3, a4, a5, a6) -- Line: 473 -- upvalues: u0 (val)
    local v1
    local v2 = 1
    if a1 == 0 then
        return a2
    end
    local v3 = a1 / (a4 / 2)
    if v3 == 2 then
        return a2 + a3
    end
    v3 = v3 - 1
    if not a6 or a6 == 0 then
        a6 = a4 * 0.44999999999999996
    end
    if a5 == nil then
        v2 = u0.ElasticBlend(v3, a3, a4, a5, a6 / 4, v2)
        a5 = a3
    elseif not (a5 < math.abs(a3)) then
        v1 = a6 / 6.283185307179586 * math.asin(a3 / a5)
    else
        v2 = u0.ElasticBlend(v3, a3, a4, a5, a6 / 4, v2)
        a5 = a3
    end
    if v3 < 0 then
        v2 = v2 * -0.5
        return v2 * (a5 * math.pow(2, 10 * v3) * math.sin((v3 * a4 - v1) * 6.283185307179586 / a6)) + a2
    end
    v3 = -v3
    v2 = v2 * 0.5
    return v2 * (a5 * math.pow(2, 10 * v3) * math.sin((v3 * a4 - v1) * 6.283185307179586 / a6)) + a3 + a2
end

function u0.OutInElastic(a1, a2, a3, a4, a5, a6) -- Line: 511 -- upvalues: u0 (val)
    if a1 < a4 / 2 then
        return u0.OutElastic(a1 * 2, a2, a3 / 2, a4, a5, a6)
    end
    return u0.InElastic(a1 * 2 - a4, a2 + a3 / 2, a3 / 2, a4, a5, a6)
end

local u53 = {Type = "Linear", Params = {}}
local u55 = {}

local function constructHashKey(a1) -- Line: 532
    local Params = a1.Params or {}
    return (("%*|%*|%*|%*|%*"):format(a1.Type, Params.Direction, Params.Amplitude, Params.Period, Params.Overshoot))
end

function get(a1) -- Line: 537 -- upvalues: u53 (val), u55 (val), u0 (val), get (val)
    local v1 = a1 or u53
    local Params = v1.Params or {}
    local v2 = ("%*|%*|%*|%*|%*"):format(v1.Type, Params.Direction, Params.Amplitude, Params.Period, Params.Overshoot)
    if u55[v2] == nil then
        local Params_2 = v1.Params or {}
        local v3 = v1.Type or "Linear"
        local u37 = u0[("%*%*"):format(Params_2.Direction or "In", v3)]
        if not u37 then
            u37 = u0[v3]
        end
        if not u37 then
            return get(u53)
        else
            local u48 = nil
            local u40 = nil
            if v3 == "Elastic" then
                u48 = Params_2.Amplitude or 1
                u40 = Params_2.Period or 0.3
            elseif v3 == "Back" then
                u48 = Params_2.Overshoot or 1.70158
            end

            u55[v2] = function(a1) -- Line: 561 -- upvalues: u37 (val), u48 (ref), u40 (ref)
                return u37(a1, 0, 1, 1, u48, u40)
            end
        end
    end
    return u55[v2]
end

return {Get = get}