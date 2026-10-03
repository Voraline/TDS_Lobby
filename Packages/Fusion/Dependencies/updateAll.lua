-- Script path: ReplicatedStorage.Packages.Fusion.Dependencies.updateAll
-- Decompile time: 1.34 ms

local Parent_2 = script.Parent.Parent
require(Parent_2.PubTypes)
return function(a1) -- Line: 16
    local v1, v2, v3, v4
    local v5 = {}
    local v6 = {}
    local v7 = 0
    local v8 = {}
    local v9 = 0
    for k in pairs(a1.dependentSet) do
        v7 = v7 + 1
        v6[v7] = k
    end
    repeat
        v3 = true
        for i, v in ipairs(v6) do
            v5[v] = true
            if v.dependentSet ~= nil then
                for k2 in pairs(v.dependentSet) do
                    v9 = v9 + 1
                    v8[v9] = k2
                    v3 = false
                end
            end
        end
        v4 = v8
        v8 = v6
        v6 = v4
        v9 = 0
        table.clear(v8)
    until v3
    v7 = 0
    table.clear(v6)
    for k3 in pairs(v1.dependentSet) do
        v7 = v7 + 1
        v6[v7] = k3
    end
    repeat
        v3 = true
        for i2, i3 in ipairs(v6) do
            v5[i3] = nil
            if i3:update() and i3.dependentSet ~= nil then
                for k4 in pairs(i3.dependentSet) do
                    v2 = true
                    for k5 in pairs(k4.dependencySet) do
                        if v5[k5] then
                            v2 = false
                            break
                        end
                    end
                    if v2 then
                        v9 = v9 + 1
                        v8[v9] = k4
                        v3 = false
                    end
                end
            end
        end
        if not v3 then
            table.clear(v6)
        end
    until v3
end