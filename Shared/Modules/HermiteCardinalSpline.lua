-- Script path: ReplicatedStorage.Shared.Modules.HermiteCardinalSpline
-- Decompile time: 1.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LinearPath = require(ReplicatedStorage.Shared.Modules.LinearPath)
local u10 = {DEBUG = false}

function u10.Get(a1, a2, a3, a4) -- Line: 39
    -- upvalues: u10 (val)
    local Part_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
    local v16 = {}
    if u10.DEBUG then
        local Part
        v13 = #a2
        for i = 1, v13 do
            Part = Instance.new("Part")
            Part.Anchored = true
            Part.CanCollide = false
            Part.Size = Vector3.new(0.10000000149011612, 0.699999988079071, 0.10000000149011612)
            Part.Name = i
            Part.Position = a2[i]
            Part.Color = Color3.new(0, 1, 0)
            Part.Parent = workspace
        end
    end
    v13 = #a2 - 2
    for j = 1, v13, a4 do
        v14 = math.floor(j)
        v15 = j - v14
        v1 = a2[v14]
        v2 = a2[v14 + 1] or v1
        v3 = a2[v14 + 2] or v2
        v4 = a2[v14 + 3]
        v4 = (1 - a3) * ((v4 or v3) - v2)
        v5 = (1 - a3) * (v3 - v1)
        v6 = v15 * v15
        v7 = v6 * v15
        v8 = v7 * 2 - v6 * 3 + 1
        v9 = v7 - v6 * 2 + v15
        v10 = v7 * -2 + v6 * 3
        v11 = v7 - v6
        v12 = v8 * v2 + v9 * v5 + v10 * v3 + v11 * v4
        if u10.DEBUG then
            Part_2 = Instance.new("Part")
            Part_2.Anchored = true
            Part_2.CanCollide = false
            Part_2.Size = Vector3.new(0.20000000298023224, 0.5, 0.20000000298023224)
            Part_2.Color = Color3.new(1, 0, 0)
            Part_2.Position = v12
            Part_2.Parent = workspace
        end
        table.insert(v16, v12)
    end
    return v16
end

function u10.ToLinearPath(a1, a2, a3, a4) -- Line: 98
    -- upvalues: LinearPath (val), u10 (val)
    return LinearPath.new(u10:Get(a2, a3, a4), true)
end

return u10