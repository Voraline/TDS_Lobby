-- Script path: ReplicatedStorage.Shared.Modules.LiveEventEntityMath
-- Decompile time: 0.60 ms

return {
    bouncePosition = function(a1, a2, a3, a4) -- Line: 5 -- types: a1: vector, a2: vector, a3: number, a4: number
        local v1 = math.clamp(a3, 0, 1)
        local v2 = (math.abs((math.sin(v1 * 3.141592653589793 * a4)))) * (1 - v1) * 24
        return (a1:Lerp(a2, v1)) + Vector3.new(0, 1, 0) * v2
    end,
    safePathDistance = function(a1, a2) -- Line: 16 -- types: a1: number, a2: number
        if a1 == a1 and a1 ~= (1 / 0) and not (a1 <= 10) then
            return (math.clamp(a1 * math.clamp(a2, 0.05, 0.8), 5, a1 - 5))
        end
        return nil
    end,
}