-- Script path: ReplicatedStorage.Shared.Modules.RotatedRegion3.Supports
-- Decompile time: 1.50 ms

local function rayPlane(a1, a2, a3, a4) -- Line: 6
    local v1 = -(a1 - a3):Dot(a4) / a2:Dot(a4)
    return a1 + v1 * a2, v1
end

return {
    PointCloud = function(a1, a2) -- Line: 16
        local v1
        local v2 = a1[1]
        local v3 = a1[1]:Dot(a2)
        local v4 = #a1
        local v5, v6 = a1, a2
        for i = 2, v4 do
            v1 = v5[i]:Dot(v6)
            if v3 < v1 then
                v2 = v5[i]
            end
        end
        return v2
    end,
    Cylinder = function(a1, a2) -- Line: 28
        local v1
        local v2, v3 = unpack(a1)
        local v4 = v2:VectorToObjectSpace(a2)
        local v5 = math.min(v3.y, v3.z)
        local v6 = v4:Dot((Vector3.new(1, 0, 0)))
        local v7 = Vector3.new(v3.x, 0, 0)
        if v6 ~= 0 then
            v7 = v6 > 0 and v7 or -v7
            local v8 = -(Vector3.new(0, 0, 0) - v7):Dot((Vector3.new(1, 0, 0))) / v4:Dot((Vector3.new(1, 0, 0)))
            v1 = v7 + (Vector3.new(0, 0, 0) + v8 * v4 - v7).Unit * v5
        else
            v1 = v4.Unit * v5
        end
        return v2:PointToWorldSpace(v1)
    end,
    Ellipsoid = function(a1, a2) -- Line: 46
        local v1, v2 = unpack(a1)
        return v1:PointToWorldSpace(v2 * (v2 * (v1:VectorToObjectSpace(a2))).Unit)
    end,
}