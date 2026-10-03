-- Script path: ReplicatedStorage.Shared.Modules.Tween.Easing
-- Decompile time: 13.85 ms

local Bezier = require(script.Parent.Bezier)
local v1 = Bezier.new(0.4, 0, 0.6, 1)
local v2 = Bezier.new(0.4, 0, 0.2, 1)
local v3 = Bezier.new(0.4, 0, 1, 1)
local v4 = Bezier.new(0, 0, 0.2, 1)
local sin = math.sin
local cos = math.cos
local abs = math.abs
local asin = math.asin

local function InElastic(a1, a2, a3, a4, a5, a6) -- Line: 298 -- upvalues: abs (val), sin (val), asin (val)
    local v1 = a1 / a4 - 1
    local v2 = a6 or a4 * 0.3
    return v1 == -1 and a2 or v1 == 0 and a2 + a3 or (if not a5 then -(a3 * 2 ^ (10 * v1) * sin((v1 * a4 - v2 * 0.25) * 6.283185307179586 / v2)) + a2 or -(a5 * 2 ^ (10 * v1) * sin((v1 * a4 - v2 / 6.283185307179586 * (asin(a3 / a5))) * 6.283185307179586 / v2)) + a2 else a5 < abs(a3) and -(a3 * 2 ^ (10 * v1) * sin((v1 * a4 - v2 * 0.25) * 6.283185307179586 / v2)) + a2 or -(a5 * 2 ^ (10 * v1) * sin((v1 * a4 - v2 / 6.283185307179586 * (asin(a3 / a5))) * 6.283185307179586 / v2)) + a2)
end

local function OutElastic(a1, a2, a3, a4, a5, a6) -- Line: 307 -- upvalues: abs (val), sin (val), asin (val)
    local v1 = a1 / a4
    local v2 = a6 or a4 * 0.3
    return v1 == 0 and a2 or v1 == 1 and a2 + a3 or (if not a5 then a3 * 2 ^ (-10 * v1) * sin((v1 * a4 - v2 * 0.25) * 6.283185307179586 / v2) + a3 + a2 or a5 * 2 ^ (-10 * v1) * sin((v1 * a4 - v2 / 6.283185307179586 * (asin(a3 / a5))) * 6.283185307179586 / v2) + a3 + a2 else a5 < abs(a3) and a3 * 2 ^ (-10 * v1) * sin((v1 * a4 - v2 * 0.25) * 6.283185307179586 / v2) + a3 + a2 or a5 * 2 ^ (-10 * v1) * sin((v1 * a4 - v2 / 6.283185307179586 * (asin(a3 / a5))) * 6.283185307179586 / v2) + a3 + a2)
end

local function OutBounce(a1, a2, a3, a4) -- Line: 389
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

return {
    Sharp = v1,
    Standard = v2,
    Acceleration = v3,
    Deceleration = v4,
    Linear = function(a1, a2, a3, a4) -- Line: 74
        return a3 * a1 / a4 + a2
    end,
    Spring = function(a1, a2, a3, a4) -- Line: 100 -- upvalues: cos (val)
        local v1 = a1 / a4
        return (1 + -2.72 ^ (-6.9 * v1) * cos(-20.106192982974676 * v1)) * a3 + a2
    end,
    SoftSpring = function(a1, a2, a3, a4) -- Line: 105 -- upvalues: cos (val)
        local v1 = a1 / a4
        return (1 + -2.72 ^ (-7.5 * v1) * cos(-10.053096491487338 * v1)) * a3 + a2
    end,
    RevBack = function(a1, a2, a3, a4) -- Line: 89 -- upvalues: sin (val), cos (val)
        local v1 = 1 - a1 / a4
        return a3 * (1 - ((sin(v1 * 1.5707963267948966)) + (sin(v1 * 3.141592653589793)) * (cos(v1 * 3.141592653589793) + 1) * 0.5)) + a2
    end,
    RidiculousWiggle = function(a1, a2, a3, a4) -- Line: 94 -- upvalues: sin (val)
        return a3 * sin((sin(a1 / a4 * 3.141592653589793)) * 1.5707963267948966) + a2
    end,
    Smooth = function(a1, a2, a3, a4) -- Line: 78
        local v1 = a1 / a4
        return a3 * v1 * v1 * (3 - 2 * v1) + a2
    end,
    Smoother = function(a1, a2, a3, a4) -- Line: 83
        local v1 = a1 / a4
        return a3 * v1 * v1 * v1 * (v1 * (6 * v1 - 15) + 10) + a2
    end,
    InQuad = function(a1, a2, a3, a4) -- Line: 111
        local v1 = a1 / a4
        return a3 * v1 * v1 + a2
    end,
    OutQuad = function(a1, a2, a3, a4) -- Line: 116
        local v1 = a1 / a4
        return -a3 * v1 * (v1 - 2) + a2
    end,
    InOutQuad = function(a1, a2, a3, a4) -- Line: 121
        local v1 = a1 / a4 * 2
        return v1 < 1 and a3 * 0.5 * v1 * v1 + a2 or -a3 * 0.5 * ((v1 - 1) * (v1 - 3) - 1) + a2
    end,
    OutInQuad = function(a1, a2, a3, a4) -- Line: 126
        local v1
        if a1 < a4 * 0.5 then
            v1 = 2 * a1 / a4
            return -0.5 * a3 * v1 * (v1 - 2) + a2
        end
        v1 = (a1 * 2 - a4) / a4
        local v2 = 0.5 * a3
        return v2 * v1 * v1 + a2 + v2
    end,
    InCubic = function(a1, a2, a3, a4) -- Line: 136
        local v1 = a1 / a4
        return a3 * v1 * v1 * v1 + a2
    end,
    OutCubic = function(a1, a2, a3, a4) -- Line: 141
        local v1 = a1 / a4 - 1
        return a3 * (v1 * v1 * v1 + 1) + a2
    end,
    InOutCubic = function(a1, a2, a3, a4) -- Line: 146
        local v1 = a1 / a4 * 2
        if v1 < 1 then
            return a3 * 0.5 * v1 * v1 * v1 + a2
        end
        v1 = v1 - 2
        return a3 * 0.5 * (v1 * v1 * v1 + 2) + a2
    end,
    OutInCubic = function(a1, a2, a3, a4) -- Line: 156
        local v1
        if a1 < a4 * 0.5 then
            v1 = a1 * 2 / a4 - 1
            return a3 * 0.5 * (v1 * v1 * v1 + 1) + a2
        end
        v1 = (a1 * 2 - a4) / a4
        local v2 = a3 * 0.5
        return v2 * v1 * v1 * v1 + a2 + v2
    end,
    InQuart = function(a1, a2, a3, a4) -- Line: 166
        local v1 = a1 / a4
        return a3 * v1 * v1 * v1 * v1 + a2
    end,
    OutQuart = function(a1, a2, a3, a4) -- Line: 171
        local v1 = a1 / a4 - 1
        return -a3 * (v1 * v1 * v1 * v1 - 1) + a2
    end,
    InOutQuart = function(a1, a2, a3, a4) -- Line: 176
        local v1 = a1 / a4 * 2
        if v1 < 1 then
            return a3 * 0.5 * v1 * v1 * v1 * v1 + a2
        end
        v1 = v1 - 2
        return -a3 * 0.5 * (v1 * v1 * v1 * v1 - 2) + a2
    end,
    OutInQuart = function(a1, a2, a3, a4) -- Line: 186
        local v1
        if a1 < a4 * 0.5 then
            v1 = a1 * 2 / a4 - 1
            return -(a3 * 0.5) * (v1 * v1 * v1 * v1 - 1) + a2
        end
        v1 = (a1 * 2 - a4) / a4
        local v2 = a3 * 0.5
        return v2 * v1 * v1 * v1 * v1 + a2 + v2
    end,
    InQuint = function(a1, a2, a3, a4) -- Line: 196
        local v1 = a1 / a4
        return a3 * v1 * v1 * v1 * v1 * v1 + a2
    end,
    OutQuint = function(a1, a2, a3, a4) -- Line: 201
        local v1 = a1 / a4 - 1
        return a3 * (v1 * v1 * v1 * v1 * v1 + 1) + a2
    end,
    InOutQuint = function(a1, a2, a3, a4) -- Line: 206
        local v1 = a1 / a4 * 2
        if v1 < 1 then
            return a3 * 0.5 * v1 * v1 * v1 * v1 * v1 + a2
        end
        v1 = v1 - 2
        return a3 * 0.5 * (v1 * v1 * v1 * v1 * v1 + 2) + a2
    end,
    OutInQuint = function(a1, a2, a3, a4) -- Line: 216
        local v1
        if a1 < a4 * 0.5 then
            v1 = a1 * 2 / a4 - 1
            return a3 * 0.5 * (v1 * v1 * v1 * v1 * v1 + 1) + a2
        end
        v1 = (a1 * 2 - a4) / a4
        local v2 = a3 * 0.5
        return v2 * v1 * v1 * v1 * v1 * v1 + a2 + v2
    end,
    InSine = function(a1, a2, a3, a4) -- Line: 226 -- upvalues: cos (val)
        return -a3 * cos(a1 / a4 * 1.5707963267948966) + a3 + a2
    end,
    OutSine = function(a1, a2, a3, a4) -- Line: 230 -- upvalues: sin (val)
        return a3 * sin(a1 / a4 * 1.5707963267948966) + a2
    end,
    InOutSine = function(a1, a2, a3, a4) -- Line: 234 -- upvalues: cos (val)
        return -a3 * 0.5 * (cos(3.141592653589793 * a1 / a4) - 1) + a2
    end,
    OutInSine = function(a1, a2, a3, a4) -- Line: 238 -- upvalues: sin (val), cos (val)
        local v1 = a3 * 0.5
        return a1 < a4 * 0.5 and v1 * sin(a1 * 2 / a4 * 1.5707963267948966) + a2 or -v1 * cos((a1 * 2 - a4) / a4 * 1.5707963267948966) + 2 * v1 + a2
    end,
    InExpo = function(a1, a2, a3, a4) -- Line: 244
        return not (a1 ~= 0) and a2 or a3 * 2 ^ (10 * (a1 / a4 - 1)) + a2 - a3 * 0.001
    end,
    OutExpo = function(a1, a2, a3, a4) -- Line: 248
        return not (a1 ~= a4) and a2 + a3 or a3 * 1.001 * (1 - 2 ^ (-10 * a1 / a4)) + a2
    end,
    InOutExpo = function(a1, a2, a3, a4) -- Line: 252
        local v1 = a1 / a4 * 2
        return v1 == 0 and a2 or v1 == 2 and a2 + a3 or v1 < 1 and a3 * 0.5 * 2 ^ (10 * (v1 - 1)) + a2 - a3 * 0.0005 or a3 * 0.5 * 1.0005 * (2 - 2 ^ (-10 * (v1 - 1))) + a2
    end,
    OutInExpo = function(a1, a2, a3, a4) -- Line: 260
        local v1 = a3 * 0.5
        return if not (a1 < a4 * 0.5) then not (a1 * 2 - a4 ~= 0) and a2 + v1 or v1 * 2 ^ (10 * ((a1 * 2 - a4) / a4 - 1)) + a2 + v1 - v1 * 0.001 else not (a1 * 2 ~= a4) and a2 + v1 or v1 * 1.001 * (1 - 2 ^ (-20 * a1 / a4)) + a2 or not (a1 * 2 - a4 ~= 0) and a2 + v1 or v1 * 2 ^ (10 * ((a1 * 2 - a4) / a4 - 1)) + a2 + v1 - v1 * 0.001
    end,
    InCirc = function(a1, a2, a3, a4) -- Line: 267
        local v1 = a1 / a4
        return -a3 * ((1 - v1 * v1) ^ 0.5 - 1) + a2
    end,
    OutCirc = function(a1, a2, a3, a4) -- Line: 272
        local v1 = a1 / a4 - 1
        return a3 * (1 - v1 * v1) ^ 0.5 + a2
    end,
    InOutCirc = function(a1, a2, a3, a4) -- Line: 277
        local v1 = a1 / a4 * 2
        if v1 < 1 then
            return -a3 * 0.5 * ((1 - v1 * v1) ^ 0.5 - 1) + a2
        end
        v1 = v1 - 2
        return a3 * 0.5 * ((1 - v1 * v1) ^ 0.5 + 1) + a2
    end,
    OutInCirc = function(a1, a2, a3, a4) -- Line: 287
        local v1
        local v2 = a3 * 0.5
        if a1 < a4 * 0.5 then
            v1 = a1 * 2 / a4 - 1
            return v2 * (1 - v1 * v1) ^ 0.5 + a2
        end
        v1 = (a1 * 2 - a4) / a4
        return -v2 * ((1 - v1 * v1) ^ 0.5 - 1) + a2 + v2
    end,
    InElastic = InElastic,
    OutElastic = OutElastic,
    InOutElastic = function(a1, a2, a3, a4, a5, a6) -- Line: 316 -- upvalues: abs (val), asin (val), sin (val)
        if a1 == 0 then
            return a2
        end
        local v1 = a1 / a4 * 2 - 1
        if v1 == 1 then
            return a2 + a3
        end
        local v2 = a6 or a4 * 0.45
        local v3 = v2
        local v4 = a5 or 0
        if not v4 then
            v4 = a3
            v2 = v3 * 0.25
        elseif not (v4 < abs(a3)) then
            v2 = v3 / 6.283185307179586 * asin(a3 / v4)
        else
            v4 = a3
            v2 = v3 * 0.25
        end
        if v1 < 1 then
            return -0.5 * v4 * 2 ^ (10 * v1) * sin((v1 * a4 - v2) * 6.283185307179586 / v3) + a2
        end
        return v4 * 2 ^ (-10 * v1) * sin((v1 * a4 - v2) * 6.283185307179586 / v3) * 0.5 + a3 + a2
    end,
    OutInElastic = function(a1, a2, a3, a4, a5, a6) -- Line: 346 -- upvalues: OutElastic (val), InElastic (val)
        if a1 < a4 * 0.5 then
            return (OutElastic(a1 * 2, a2, a3 * 0.5, a4, a5, a6))
        end
        return (InElastic(a1 * 2 - a4, a2 + a3 * 0.5, a3 * 0.5, a4, a5, a6))
    end,
    InBack = function(a1, a2, a3, a4, a5) -- Line: 354
        local v1 = a5 or 1.70158
        local v2 = a1 / a4
        return a3 * v2 * v2 * ((v1 + 1) * v2 - v1) + a2
    end,
    OutBack = function(a1, a2, a3, a4, a5) -- Line: 360
        local v1 = a5 or 1.70158
        local v2 = a1 / a4 - 1
        return a3 * (v2 * v2 * ((v1 + 1) * v2 + v1) + 1) + a2
    end,
    InOutBack = function(a1, a2, a3, a4, a5) -- Line: 366
        local v1 = (a5 or 1.70158) * 1.525
        local v2 = a1 / a4 * 2
        if v2 < 1 then
            return a3 * 0.5 * (v2 * v2 * ((v1 + 1) * v2 - v1)) + a2
        end
        v2 = v2 - 2
        return a3 * 0.5 * (v2 * v2 * ((v1 + 1) * v2 + v1) + 2) + a2
    end,
    OutInBack = function(a1, a2, a3, a4, a5) -- Line: 377
        local v1
        local v2 = a3 * 0.5
        local v3 = a5 or 1.70158
        if a1 < a4 * 0.5 then
            v1 = a1 * 2 / a4 - 1
            return v2 * (v1 * v1 * ((v3 + 1) * v1 + v3) + 1) + a2
        end
        v1 = (a1 * 2 - a4) / a4
        return v2 * v1 * v1 * ((v3 + 1) * v1 - v3) + a2 + v2
    end,
    InBounce = function(a1, a2, a3, a4) -- Line: 405 -- upvalues: OutBounce (val)
        return a3 - OutBounce(a4 - a1, 0, a3, a4) + a2
    end,
    OutBounce = OutBounce,
    InOutBounce = function(a1, a2, a3, a4) -- Line: 409 -- upvalues: OutBounce (val)
        if a1 < a4 * 0.5 then
            return (a3 - OutBounce(a4 - a1 * 2, 0, a3, a4) + 0) * 0.5 + a2
        end
        return OutBounce(a1 * 2 - a4, 0, a3, a4) * 0.5 + a3 * 0.5 + a2
    end,
    OutInBounce = function(a1, a2, a3, a4) -- Line: 417 -- upvalues: OutBounce (val)
        if a1 < a4 * 0.5 then
            return (OutBounce(a1 * 2, a2, a3 * 0.5, a4))
        end
        local v1 = a1 * 2 - a4
        local v2 = a2 + a3 * 0.5
        local v3 = a3 * 0.5
        return v3 - OutBounce(a4 - v1, 0, v3, a4) + v2
    end,
}