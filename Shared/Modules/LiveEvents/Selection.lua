-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Selection
-- Decompile time: 1.37 ms

local Definitions = require(script.Parent.Definitions)
return {
    seed = function(a1, a2) -- Line: 7 -- types: a1: number, a2: string
        local v1 = a1
        local v2 = #a2
        for i = 1, v2 do
            v1 = (v1 * 31 + string.byte(a2, i)) % 2147483646
        end
        return (math.max(v1, 1))
    end,
    chaos = function(a1, a2) -- Line: 15 -- upvalues: Definitions (val) -- types: a1: number, a2: table?
        local v1, v2, v3, v4
        local v5 = Random.new(a1)
        local v6 = {}
        for i, j in Definitions.Actions do
            if j.chaosEligible and not j.destructive and table.find(j.contexts, "Game") then
                table.insert(v6, j)
            end
        end
        for k = #v6, 2, -1 do
            v2 = v5:NextInteger(1, k)
            v3 = v6[v2]
            v4 = v6[k]
            v6[k] = v3
            v6[v2] = v4
        end
        local v7 = table.clone(a2 or {})
        local v8 = {}
        v2 = nil
        v3 = nil
        for n, m in v6, v2, v3 do
            v1 = true
            for i5, i6 in m.conflictGroups do
                if v7[i6] then
                    v1 = false
                    break
                end
            end
            if v1 then
                table.insert(v8, m.id)
                for i7, i8 in m.conflictGroups do
                    if i8 ~= "tower-upgrades" then
                        v7[i8] = true
                    end
                end
                if #v8 == 10 then
                    return v8, nil
                end
            end
        end
        return nil, "Chaos needs ten compatible actions. Stop conflicting effects and try again."
    end,
}