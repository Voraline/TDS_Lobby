-- Script path: ReplicatedStorage.Packages.Fusion.Colour.Oklab
-- Decompile time: 1.06 ms

return {
    to = function(a1) -- Line: 13 -- types: a1: userdata
        local v1 = a1.R * 0.4122214708 + a1.G * 0.5363325363 + a1.B * 0.0514459929
        local v2 = a1.R * 0.2119034982 + a1.G * 0.6806995451 + a1.B * 0.1073969566
        local v3 = a1.R * 0.0883024619 + a1.G * 0.2817188376 + a1.B * 0.6299787005
        local v4 = v1 ^ 0.3333333333333333
        local v5 = v2 ^ 0.3333333333333333
        local v6 = v3 ^ 0.3333333333333333
        return (Vector3.new(
            v4 * 0.2104542553 + v5 * 0.793617785 - v6 * 0.0040720468,
            v4 * 1.9779984951 - v5 * 2.428592205 + v6 * 0.4505937099,
            v4 * 0.0259040371 + v5 * 0.7827717662 - v6 * 0.808675766
        ))
    end,
    from = function(a1, a2) -- Line: 31 -- types: a1: vector, a2: boolean?
        local v1 = a1.X + a1.Y * 0.3963377774 + a1.Z * 0.2158037573
        local v2 = a1.X - a1.Y * 0.1055613458 - a1.Z * 0.0638541728
        local v3 = a1.X - a1.Y * 0.0894841775 - a1.Z * 1.291485548
        local v4 = v1 ^ 3
        local v5 = v2 ^ 3
        local v6 = v3 ^ 3
        local v7 = v4 * 4.0767416621 - v5 * 3.3077115913 + v6 * 0.2309699292
        local v8 = v4 * -1.2684380046 + v5 * 2.6097574011 - v6 * 0.3413193965
        local v9 = v4 * -0.0041960863 - v5 * 0.7034186147 + v6 * 1.707614701
        if not a2 then
            v7 = math.clamp(v7, 0, 1)
            v8 = math.clamp(v8, 0, 1)
            v9 = math.clamp(v9, 0, 1)
        end
        return Color3.new(v7, v8, v9)
    end,
}