-- Script path: ReplicatedStorage.Packages.Fusion.Animation.getTweenRatio
-- Decompile time: 0.53 ms

local TweenService = game:GetService("TweenService")
return function(a1, a2) -- Line: 10 -- upvalues: TweenService (val) -- types: a1: userdata, a2: number
    local DelayTime = a1.DelayTime
    local Time = a1.Time
    local Reverses = a1.Reverses
    local v1 = 1 + a1.RepeatCount
    local EasingStyle = a1.EasingStyle
    local EasingDirection = a1.EasingDirection
    local v2 = DelayTime + Time
    if Reverses then
        v2 = v2 + Time
    end
    if v2 * v1 <= a2 then
        return 1
    end
    local v3 = a2 % v2
    if v3 <= DelayTime then
        return 0
    end
    local v4 = (v3 - DelayTime) / Time
    if v4 > 1 then
        v4 = 2 - v4
    end
    return (TweenService:GetValue(v4, EasingStyle, EasingDirection))
end