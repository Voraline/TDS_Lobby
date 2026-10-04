-- Script path: ReplicatedStorage.Shared.Modules.Octree
-- Decompile time: 5.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OctreeNode = require(ReplicatedStorage.Shared.Modules.Octree.OctreeNode)
local OctreeRegionUtils = require(ReplicatedStorage.Shared.Modules.Octree.OctreeRegionUtils)
local u17 = {ClassName = "Octree"}
u17.__index = u17

function u17.new() -- Line: 18 -- upvalues: u17 (val)
    local v1 = setmetatable({}, u17)
    v1._maxRegionSize = {512, 512, 512}
    v1._maxDepth = 4
    v1._regionHashMap = {}
    return v1
end

function u17.GetAllNodes(a1) -- Line: 28
    local v1 = {}
    for k, v in pairs(a1._regionHashMap) do
        for k2, i in pairs(v) do
            for k3, j in pairs(i.nodes) do
                v1[#v1 + 1] = k3
            end
        end
    end
    return v1
end

function u17.CreateNode(a1, a2, a3) -- Line: 42 -- upvalues: OctreeNode (val)
    assert(typeof(a2) == "Vector3", "Bad position value")
    assert(a3, "Bad object value")
    local v1 = OctreeNode.new(a1, a3)
    v1:SetPosition(a2)
    return v1
end

function u17.RadiusSearch(a1, a2, a3, a4) -- Line: 53 -- types: a1: table, a4: number?
    assert(typeof(a2) == "Vector3", "Bad position value")
    assert(type(a3) == "number", "Bad radius value")
    local v1 = true
    if a4 ~= nil then
        v1 = type(a4) == "number"
    end
    assert(v1, "Bad maxObjects value")
    return a1:_radiusSearch(a2.X, a2.Y, a2.Z, a3, a4)
end

function u17.KNearestNeighborsSearch(a1, a2, a3, a4, a5) -- Line: 62 -- types: a1: table, a5: number?
    local v1
    assert(typeof(a2) == "Vector3", "Bad position value")
    assert(type(a4) == "number", "Bad radius value")
    local v2 = true
    if a5 ~= nil then
        v2 = type(a5) == "number"
    end
    assert(v2, "Bad maxObjects value")
    local v3, v4 = a1:_radiusSearch(a2.X, a2.Y, a2.Z, a4, a5)
    local v5 = {}
    for k, v in pairs(v4) do
        table.insert(v5, {dist2 = v, index = k})
    end
    table.sort(v5, function(a1, a2) -- Line: 78
        return a1.dist2 < a2.dist2
    end)
    local v6 = {}
    local v7 = {}
    for i = 1, (math.min(#v5, a3)) do
        v1 = v5[i]
        v7[#v7 + 1] = v1.dist2
        v6[#v6 + 1] = v3[v1.index]
    end
    return v6, v7
end

function u17.GetNodesFromPart(a1, a2, a3) -- Line: 93 -- types: a1: table, a3: number?
    local position, size, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = false
    if typeof(a2) == "Instance" then
        v9 = a2:IsA("BasePart")
    end
    assert(v9, "Expected BasePart")
    v9 = true
    if a3 ~= nil then
        v9 = type(a3) == "number"
    end
    assert(v9, "Bad maxObjects value")
    local v10 = {}
    v9 = {}
    local Size = a2.Size
    local v11 = Size.X / 2
    local v12 = Size.Y / 2
    local v13 = Size.Z / 2
    local v14 = {
        Vector3.new(-v11, -v12, -v13),
        Vector3.new(-v11, -v12, v13),
        Vector3.new(-v11, v12, -v13),
        Vector3.new(-v11, v12, v13),
        Vector3.new(v11, -v12, -v13),
        Vector3.new(v11, -v12, v13),
        Vector3.new(v11, v12, -v13),
        (Vector3.new(v11, v12, v13)),
    }
    local v15 = (1 / 0)
    local v16 = (1 / 0)
    local v17 = (1 / 0)
    local v18 = (-1 / 0)
    local v19 = (-1 / 0)
    local v20 = (-1 / 0)
    for i, v in ipairs(v14) do
        v1 = a2.CFrame * v
        v15 = math.min(v15, v1.X)
        v16 = math.min(v16, v1.Y)
        v17 = math.min(v17, v1.Z)
        v18 = math.max(v18, v1.X)
        v19 = math.max(v19, v1.Y)
        v20 = math.max(v20, v1.Z)
    end
    local v21 = a2.CFrame:Inverse()
    local v22 = a3
    for k, i2 in pairs(a1._regionHashMap) do
        for k2, j in pairs(i2) do
            position = j.position
            v2 = position[1]
            v3 = position[2]
            v4 = position[3]
            size = j.size
            v5 = size[1] / 2
            v6 = size[2] / 2
            v7 = size[3] / 2
            for k3, k4 in pairs(j.nodes) do
                v8 = v21 * k3:GetPosition()
                if (math.abs(v8.X)) <= v11 + 1e-09 and (math.abs(v8.Z)) <= v13 + 1e-09 then
                    v10[#v10 + 1] = (k3:GetObject())
                    v9[#v9 + 1] = 0
                    if v22 and v22 <= #v10 then
                        return v10, v9
                    end
                end
            end
        end
    end
    return v10, v9
end

function u17.GetOrCreateLowestSubRegion(a1, a2, a3, a4) -- Line: 174 -- upvalues: OctreeRegionUtils (val)
    return OctreeRegionUtils.getOrCreateSubRegionAtDepth(a1:_getOrCreateRegion(a2, a3, a4), a2, a3, a4, a1._maxDepth)
end

function u17:_radiusSearch(a2, a3, a4, a5, a6) -- Line: 179
    -- upvalues: OctreeRegionUtils (val)
    local position, v1, v2, v3, v4, v5, v6
    local v7 = {}
    local v8 = {}
    local v9 = OctreeRegionUtils.getSearchRadiusSquared(a5, self._maxRegionSize[1], 1e-09)
    for k, v in pairs(self._regionHashMap) do
        for k2, i in pairs(v) do
            position = i.position
            v1 = position[1]
            v2 = position[2]
            v3 = position[3]
            v4 = v10 - v1
            v5 = v11 - v2
            v6 = v12 - v3
            if v4 * v4 + v5 * v5 + v6 * v6 <= v9 then
                OctreeRegionUtils.getNeighborsWithinRadius(i, v13, v10, v11, v12, v7, v8, v14._maxDepth, v15)
            end
        end
    end
    return v7, v8
end

function u17._getRegion(a1, a2, a3, a4) -- Line: 212 -- upvalues: OctreeRegionUtils (val)
    return OctreeRegionUtils.findRegion(a1._regionHashMap, a1._maxRegionSize, a2, a3, a4)
end

function u17:_getOrCreateRegion(a2, a3, a4) -- Line: 216 -- upvalues: OctreeRegionUtils (val)
    return OctreeRegionUtils.getOrCreateRegion(self._regionHashMap, self._maxRegionSize, a2, a3, a4)
end

return u17