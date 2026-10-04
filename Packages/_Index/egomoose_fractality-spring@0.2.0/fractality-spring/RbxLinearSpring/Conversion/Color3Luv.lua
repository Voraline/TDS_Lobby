-- Script path: ReplicatedStorage.Packages._Index.egomoose_fractality-spring@0.2.0.fractality-spring.RbxLinearSpring.Conversion.Color3Luv
-- Decompile time: 2.83 ms

local min = math.min
local v1 = {}

local function inverseGammaCorrectD65(a1) -- Line: 7 -- types: a1: number
    return a1 < 0.0404482362771076 and a1 / 12.92 or (a1 + 0.055) ^ 2.4 * 0.87941546140213
end

local function gammaCorrectD65(a1) -- Line: 11 -- types: a1: number
    return a1 < 0.0031306684425 and a1 * 12.92 or a1 ^ 0.4166666666666667 * 1.055 - 0.055
end

function v1.rgbToLuv(a1) -- Line: 15 -- types: a1: userdata
    local v1, v2
    local R = a1.R
    local G = a1.G
    local B = a1.B
    local v3 = R
    local v4 = v3 < 0.0404482362771076 and v3 / 12.92 or (v3 + 0.055) ^ 2.4 * 0.87941546140213
    v3 = G
    local v5 = v3 < 0.0404482362771076 and v3 / 12.92 or (v3 + 0.055) ^ 2.4 * 0.87941546140213
    v3 = B
    local v6 = v3 < 0.0404482362771076 and v3 / 12.92 or (v3 + 0.055) ^ 2.4 * 0.87941546140213
    v3 = 0.9257063972951867 * v4 - 0.8333736323779866 * v5 - 0.09209820666085898 * v6
    local v7 = 0.2125862307855956 * v4 + 0.7151703037034108 * v5 + 0.0722004986433362 * v6
    local v8 = 3.6590806972265884 * v4 + 11.442689580057424 * v5 + 4.114991502426484 * v6
    local v9 = v7 > 0.008856451679035631 and 116 * v7 ^ 0.3333333333333333 - 16 or 903.296296296296 * v7
    if not (v8 > 1e-14) then
        v1 = -0.19783 * v9
        v2 = -0.46832 * v9
    else
        v1 = v9 * v3 / v8
        v2 = v9 * (9 * v7 / v8 - 0.46832)
    end
    return {v9, v1, v2}
end

function v1.luvToRgb(a1) -- Line: 44 -- upvalues: min (val) -- types: a1: table
    local v1 = a1[1]
    if v1 < 0.0197955 then
        return Color3.new(0, 0, 0)
    end
    local v2 = a1[2] / v1 + 0.19783
    local v3 = a1[3] / v1 + 0.46832
    local v4 = (v1 + 16) / 116
    v4 = v4 > 0.20689655172413793 and v4 * v4 * v4 or v4 * 0.12841854934601665 - 0.01771290335807126
    local v5 = v4 * v2 / v3
    local v6 = v4 * ((3 - v2 * 0.75) / v3 - 5)
    local v7 = v5 * 7.2914074 - v4 * 1.537208 - v6 * 0.4986286
    local v8 = v5 * -2.180094 + v4 * 1.8757561 + v6 * 0.0415175
    local v9 = v5 * 0.1253477 - v4 * 0.2040211 + v6 * 1.0569959
    if not (v7 < 0) or not (v7 < v8) then
        if not (v8 < 0) then
            if v9 < 0 then
                v7 = v7 - v9
                v8 = v8 - v9
                v9 = 0
            end
        elseif v8 < v9 then
            v7 = v7 - v8
            v9 = v9 - v8
            v8 = 0
        elseif v9 < 0 then
            v7 = v7 - v9
            v8 = v8 - v9
            v9 = 0
        end
    elseif v7 < v9 then
        v8 = v8 - v7
        v9 = v9 - v7
        v7 = 0
    elseif not (v8 < 0) then
        if v9 < 0 then
            v7 = v7 - v9
            v8 = v8 - v9
            v9 = 0
        end
    elseif v8 < v9 then
        v7 = v7 - v8
        v9 = v9 - v8
        v8 = 0
    elseif v9 < 0 then
        v7 = v7 - v9
        v8 = v8 - v9
        v9 = 0
    end
    return Color3.new(
        min(v7 < 0.0031306684425 and v7 * 12.92 or v7 ^ 0.4166666666666667 * 1.055 - 0.055, 1),
        min(v8 < 0.0031306684425 and v8 * 12.92 or v8 ^ 0.4166666666666667 * 1.055 - 0.055, 1),
        (min(v9 < 0.0031306684425 and v9 * 12.92 or v9 ^ 0.4166666666666667 * 1.055 - 0.055, 1))
    )
end

return v1