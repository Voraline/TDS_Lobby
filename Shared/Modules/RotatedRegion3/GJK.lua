-- Script path: ReplicatedStorage.Shared.Modules.RotatedRegion3.GJK
-- Decompile time: 2.87 ms

local u0 = {}
u0.__index = u0

local function tripleProduct(a1, a2, a3) -- Line: 11
    return a2 * a3:Dot(a1) - a1 * a3:Dot(a2)
end

local function containsOrigin(a1, a2, a3) -- Line: 15
    local v1, v2, v3, v4, v5
    local v6 = a2[#a2]
    local v7 = -v6
    if #a2 ~= 4 then
        if #a2 == 3 then
            v1 = a2[2]
            v2 = a2[1]
            v3 = v1 - v6
            v4 = v2 - v6
            v5 = v3:Cross(v4)
            local Unit = (v3 * v3:Dot(v4) - v4 * v3:Dot(v3)).Unit
            local Unit_2 = (v4 * v4:Dot(v3) - v3 * v4:Dot(v4)).Unit
            if 0 < (Unit:Dot(v7)) then
                table.remove(a2, 1)
                return false, Unit
            end
            if 0 < (Unit_2:Dot(v7)) then
                table.remove(a2, 2)
                return false, Unit_2
            end
            if not (v6 - v6 == Vector3.new(0, 0, 0)) then
                return true
            end
            return false, 0 < (v5:Dot(v7)) and v5 or -v5
        end
        v2 = a2[1] - v6
        return false, (v7 * v2:Dot(v2) - v2 * v2:Dot(v7)).Unit
    end
    v1 = a2[3]
    v2 = a2[2]
    v3 = a2[1]
    v4 = v1 - v6
    v5 = v2 - v6
    local v8 = v3 - v6
    local v9 = v4:Cross(v5)
    local v10 = v5:Cross(v8)
    local v11 = v8:Cross(v4)
    v9 = 0 < (v9:Dot(v8)) and -v9 or v9
    v10 = 0 < (v10:Dot(v4)) and -v10 or v10
    v11 = 0 < (v11:Dot(v5)) and -v11 or v11
    if 0 < (v9:Dot(v7)) then
        table.remove(a2, 1)
        return false, v9
    end
    if 0 < (v10:Dot(v7)) then
        table.remove(a2, 2)
        return false, v10
    end
    if not (0 < (v11:Dot(v7))) then
        return true
    end
    table.remove(a2, 3)
    return false, v11
end

function u0.new(a1, a2, a3, a4, a5, a6) -- Line: 74 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.SetA = a1
    v1.SetB = a2
    v1.CentroidA = a3
    v1.CentroidB = a4
    v1.SupportA = a5
    v1.SupportB = a6
    return v1
end

function u0.IsColliding(a1) -- Line: 89 -- upvalues: containsOrigin (val)
    local v1, v2
    local Unit = (a1.CentroidA - a1.CentroidB).Unit
    local v3 = {(a1.SupportA(a1.SetA, Unit)) - a1.SupportB(a1.SetB, -Unit)}
    local v4 = -Unit
    for i = 1, 20 do
        table.insert(v3, (a1.SupportA(a1.SetA, v4)) - (a1.SupportB(a1.SetB, -v4)))
        if (v3[#v3]:Dot(v4)) <= 0 then
            return false
        end
        v1, v2 = containsOrigin(a1, v3, v4)
        if v1 then
            return true
        end
    end
    return false
end

return u0