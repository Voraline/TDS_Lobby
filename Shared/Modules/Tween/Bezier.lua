-- Script path: ReplicatedStorage.Shared.Modules.Tween.Bezier
-- Decompile time: 0.80 ms

return {
    new = function(a1, a2, a3, a4) -- Line: 6
        if a1 and a2 and a3 and a4 then
            local v1 = 3 * a3
            local u7 = 3 * a1
            local v2 = 3 * a4
            local u11 = 3 * a2
            local u16 = 6 * (a3 - 2 * a1)
            local u18 = 1 - v2 + u11
            local u20 = 1 - v1 + u7
            local u23 = v1 - 2 * u7
            local u26 = v2 - 2 * u11
            local u28 = 3 * u20
            return function(a1, a2, a3, a4) -- Line: 18
                -- upvalues: u16 (ref), u28 (val), u7 (val), u20 (val), u23 (val), u18 (ref), u26 (val), u11 (ref)
                local v1
                local v2 = (a3 or 1) * a1 / (a4 or 1) + (a2 or 0)
                local v3 = v2
                for i = 1, 4 do
                    v1 = v3 * (u16 + u28 * v3) + u7
                    if v1 == 0 then
                        break
                    end
                    v3 = v3 - (((u20 * v3 + u23) * v3 + u7) * v3 - v2) / v1
                end
                return ((u18 * v3 + u26) * v3 + u11) * v3
            end
        end
        error("[Bezier] - Need 4 numbers to construct a Bezier curve")
    end,
}