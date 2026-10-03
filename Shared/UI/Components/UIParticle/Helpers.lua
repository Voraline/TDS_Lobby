-- Script path: ReplicatedStorage.Shared.UI.Components.UIParticle.Helpers
-- Decompile time: 1.16 ms

local u1 = Random.new()
return {
    EvaluateNumberRange = function(a1) -- Line: 46 -- upvalues: u1 (val) -- types: a1: Vector2
        if typeof(a1) ~= "NumberRange" then
            return a1
        end
        return u1:NextNumber(a1.Min, a1.Max)
    end,
    EvaluateSequence = function(a1, a2) -- Line: 15 -- types: a1: userdata, a2: number
        local v1, v2, v3
        local v4 = typeof(a1)
        local v5 = v4 == "NumberSequence"
        if v4 ~= "ColorSequence" and not v5 then
            return a1
        end
        if a2 == 0 then
            return a1.Keypoints[1].Value
        end
        if a2 == 1 then
            return a1.Keypoints[#a1.Keypoints].Value
        end
        local v6 = #a1.Keypoints - 1
        local v7, v8 = a1, a2
        for i = 1, v6 do
            v1 = v7.Keypoints[i]
            v2 = v7.Keypoints[i + 1]
            if v1.Time <= v8 and v8 < v2.Time then
                v3 = (v8 - v1.Time) / (v2.Time - v1.Time)
                if v5 then
                    return (v2.Value - v1.Value) * v3 + v1.Value
                end
                return v1.Value:Lerp(v2.Value, v3)
            end
        end
    end,
    Normalize = function(a1, a2, a3) -- Line: 11 -- types: a3: number
        return (a3 - a1) / (a2 - a1)
    end,
    Rotate = function(a1, a2) -- Line: 3 -- types: a1: userdata, a2: number
        local v1 = math.sin((math.rad(a2)))
        local v2 = math.cos((math.rad(a2)))
        local X = a1.X
        local Y = a1.Y
        return Vector2.new(v2 * X - v1 * Y, v1 * X + v2 * Y)
    end,
}