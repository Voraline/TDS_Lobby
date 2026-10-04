-- Script path: ReplicatedStorage.Packages.Fusion.Animation.springCoefficients
-- Decompile time: 1.31 ms

return function(a1, a2, a3) -- Line: 21 -- types: a1: number, a2: number, a3: number
    if a1 ~= 0 and a3 ~= 0 then
        local v1, v2, v3, v4, v5, v6
        if a2 > 1 then
            v1 = math.sqrt(a2 ^ 2 - 1)
            v2 = (-v1 - a2) * a3
            v3 = (v1 - a2) * a3
            v4 = 1 / (v2 - v3)
            v5 = math.exp(a1 * v2)
            v6 = math.exp(a1 * v3)
            return (v6 * v2 - v5 * v3) * v4, (v5 - v6) * v4, v2 * v3 * (-v5 + v6) * v4, (v2 * v5 - v3 * v6) * v4
        end
        if a2 == 1 then
            v1 = a1 * a3
            v2 = math.exp(-v1)
            return v2 * (v1 + 1), v2 * a1, -v2 * (a1 * a3 * a3), v2 * (1 - v1)
        end
        v1 = math.sqrt(1 - a2 ^ 2) * a3
        v2 = math.exp(-a1 * a2 * a3)
        v3 = math.sin(a1 * v1)
        v4 = v1 * math.cos(a1 * v1)
        v5 = a2 * a3 * v3
        v6 = 1 / v1
        return v2 * (v4 + v5) * v6, v2 * v3 * v6, -v2 * (v1 * v1 + a2 * a2 * a3 * a3) * v3 * v6, v2 * (v4 - v5) * v6
    end
    return 1, 0, 0, 1
end