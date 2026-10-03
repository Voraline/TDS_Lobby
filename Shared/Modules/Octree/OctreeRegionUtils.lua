-- Script path: ReplicatedStorage.Shared.Modules.Octree.OctreeRegionUtils
-- Decompile time: 6.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Draw = require(ReplicatedStorage.Shared.Modules.Draw)
local u10 = {
    {0.25, 0.25, -0.25},
    {-0.25, 0.25, -0.25},
    {0.25, 0.25, 0.25},
    {-0.25, 0.25, 0.25},
    {0.25, -0.25, -0.25},
    {-0.25, -0.25, -0.25},
    {0.25, -0.25, 0.25},
    {-0.25, -0.25, 0.25},
}
local u43 = {}

function u43.visualize(a1) -- Line: 23 -- upvalues: Draw (val)
    local size = a1.size
    local position = a1.position
    local v1 = size[1]
    local v2 = size[2]
    local v3 = size[3]
    local v4 = Draw.box(Vector3.new(position[1], position[2], position[3]), (Vector3.new(v1, v2, v3)))
    v4.Transparency = 0.9
    v4.Name = "OctreeRegion_" .. tostring(a1.depth)
    return v4
end

function u43.create(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 36
    local v1 = a4 / 2
    local v2 = a5 / 2
    local v3 = a6 / 2
    local v4 = {node_count = 0, subRegions = {}, lowerBounds = {a1 - v1, a2 - v2, a3 - v3}}
    v4.upperBounds = {a1 + v1, a2 + v2, a3 + v3}
    v4.position = {a1, a2, a3}
    v4.size = {a4, a5, a6}
    v4.parent = a7
    v4.depth = a7 and a7.depth + 1 or 1
    v4.parentIndex = a8
    v4.nodes = {}
    return v4
end

function u43.addNode(a1, a2) -- Line: 68
    assert(a2, "no node added")
    local parent = a1
    local v1 = a2
    while parent do
        if not parent.nodes[v1] then
            parent.nodes[v1] = v1
            parent.node_count = parent.node_count + 1
        end
        parent = parent.parent
    end
end

function u43.moveNode(a1, a2, a3) -- Line: 81
    assert(a1.depth == a2.depth, "fromLowest.depth ~= toLowest.depth")
    assert(a1 ~= a2, "fromLowest == toLowest")
    local parent_2 = a1
    local parent_3 = a2
    local v1 = a3
    while parent_2 ~= parent_3 do
        assert(parent_2.nodes[v1], "no node")
        assert(0 < parent_2.node_count, "node count > 0")
        parent_2.nodes[v1] = nil
        parent_2.node_count = parent_2.node_count - 1
        if parent_2.node_count <= 0 and parent_2.parentIndex then
            assert(parent_2.parent, "no parent")
            assert(parent_2.parent.subRegions[parent_2.parentIndex] == parent_2, "no form")
            parent_2.parent.subRegions[parent_2.parentIndex] = nil
        end
        assert(not parent_3.nodes[v1], "no node")
        parent_3.nodes[v1] = v1
        parent_3.node_count = parent_3.node_count + 1
        parent_2 = parent_2.parent
        parent_3 = parent_3.parent
    end
end

function u43.removeNode(a1, a2) -- Line: 119
    if not a2 then
        return
    end
    local parent = a1
    local v1 = a2
    while parent do
        if parent.nodes[v1] and 0 < parent.node_count then
            parent.nodes[v1] = nil
            parent.node_count = parent.node_count - 1
            if parent.node_count <= 0 and parent.parentIndex then
                if parent.parent and parent.parent.subRegions[parent.parentIndex] == parent then
                    parent.parent.subRegions[parent.parentIndex] = nil
                    parent = parent.parent
                    continue
                end
                return
            end
            parent = parent.parent
            continue
        end
        return
    end
end

function u43.getSearchRadiusSquared(a1, a2, a3) -- Line: 148
    local v1 = a1 + 0.8660254037844386 * a2
    return v1 * v1 + a3
end

function u43.getNeighborsWithinRadius(a1, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 159 -- upvalues: u43 (val)
    local RawPosition, RawPosition_2, RawPosition_3, position, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    assert(a8, "no maxDepth")
    local v11 = u43.getSearchRadiusSquared(a2, a1.size[1] / 2, 1e-06)
    local v12 = a2 * a2
    local v13, v14, v15, v16, v17, v18, v19, v20 = a3, a4, a5, a8, a6, a7, a9, a2
    for k, v in pairs(a1.subRegions) do
        position = v.position
        v1 = position[1]
        v2 = position[2]
        v3 = position[3]
        v4 = v13 - v1
        v5 = v14 - v2
        v6 = v15 - v3
        if v4 * v4 + v5 * v5 + v6 * v6 <= v11 then
            if v.depth ~= v16 then
                u43.getNeighborsWithinRadius(v, v20, v13, v14, v15, v17, v18, v16, v19)
            else
                for k2, i in pairs(v.nodes) do
                    RawPosition, RawPosition_2, RawPosition_3 = k2:GetRawPosition()
                    v7 = v13 - RawPosition
                    v8 = v14 - RawPosition_2
                    v9 = v15 - RawPosition_3
                    v10 = v7 * v7 + v8 * v8 + v9 * v9
                    if v10 <= v12 then
                        v17[#v17 + 1] = (k2:GetObject())
                        v18[#v18 + 1] = v10
                        if v19 and v19 <= #v17 then
                            return
                        end
                    end
                end
            end
        end
    end
end

function u43.getOrCreateSubRegionAtDepth(a1, a2, a3, a4, a5) -- Line: 219 -- upvalues: u43 (val)
    local v1, v2
    local v3 = a1
    local v4, v5, v6 = a2, a3, a4
    for i = a1.depth, a5 do
        v2 = u43.getSubRegionIndex(v3, v4, v5, v6)
        v1 = v3.subRegions[v2]
        if not v1 then
            v1 = u43.createSubRegion(v3, v2)
            v3.subRegions[v2] = v1
        end
        v3 = v1
    end
    return v3
end

function u43.createSubRegion(a1, a2) -- Line: 237 -- upvalues: u10 (val), u43 (val)
    local size = a1.size
    local position = a1.position
    local v1 = u10[a2]
    return u43.create(
        position[1] + v1[1] * size[1],
        position[2] + v1[2] * size[2],
        position[3] + v1[3] * size[3],
        size[1] / 2,
        size[2] / 2,
        size[3] / 2,
        a1,
        a2
    )
end

function u43.inRegionBounds(a1, a2, a3, a4) -- Line: 251
    local lowerBounds = a1.lowerBounds
    local upperBounds = a1.upperBounds
    local v1 = false
    if lowerBounds[1] <= a2 then
        v1 = false
        if a2 <= upperBounds[1] then
            v1 = false
            if lowerBounds[2] <= a3 then
                v1 = false
                if a3 <= upperBounds[2] then
                    v1 = false
                    if lowerBounds[3] <= a4 then
                        v1 = a4 <= upperBounds[3]
                    end
                end
            end
        end
    end
    return v1
end

function u43.getSubRegionIndex(a1, a2, a3, a4) -- Line: 264
    local v1 = if not (a1.position[1] < a2) then 2 else 1
    if a3 <= a1.position[2] then
        v1 = v1 + 4
    end
    if a1.position[3] <= a4 then
        v1 = v1 + 2
    end
    return v1
end

function u43.getTopLevelRegionHash(a1, a2, a3) -- Line: 278
    return a1 * 73856093 + a2 * 19351301 + a3 * 83492791
end

function u43.getTopLevelRegionCellIndex(a1, a2, a3, a4) -- Line: 283
    local v1 = math.floor(a2 / a1[1] + 0.5)
    local v2 = math.floor(a3 / a1[2] + 0.5)
    local v3 = math.floor(a4 / a1[3] + 0.5)
    if v1 ~= v1 then
        v1 = 0
    end
    if v2 ~= v2 then
        v2 = 0
    end
    if v3 ~= v3 then
        v3 = 0
    end
    return v1, v2, v3
end

function u43.getTopLevelRegionPosition(a1, a2, a3, a4) -- Line: 304
    return a1[1] * a2, a1[2] * a3, a1[3] * a4
end

function u43.areEqualTopRegions(a1, a2, a3, a4) -- Line: 308
    local position = a1.position
    local v1 = false
    if position[1] == a2 then
        v1 = false
        if position[2] == a3 then
            v1 = position[3] == a4
        end
    end
    return v1
end

function u43.findRegion(a1, a2, a3, a4, a5) -- Line: 313 -- upvalues: u43 (val)
    local v1, v2, v3 = u43.getTopLevelRegionCellIndex(a2, a3, a4, a5)
    local v4 = a1[u43.getTopLevelRegionHash(v1, v2, v3)]
    if not v4 then
        return nil
    end
    local v5, v6, v7 = u43.getTopLevelRegionPosition(a2, v1, v2, v3)
    for k, v in pairs(v4) do
        if u43.areEqualTopRegions(v, v5, v6, v7) then
            return v
        end
    end
    return nil
end

function u43.getOrCreateRegion(a1, a2, a3, a4, a5) -- Line: 332 -- upvalues: u43 (val)
    local v1, v2, v3 = u43.getTopLevelRegionCellIndex(a2, a3, a4, a5)
    local v4 = u43.getTopLevelRegionHash(v1, v2, v3)
    local v5 = a1[v4]
    if not v5 then
        a1[v4] = {}
    end
    local v6, v7, v8 = u43.getTopLevelRegionPosition(a2, v1, v2, v3)
    for k, v in pairs(v5) do
        if u43.areEqualTopRegions(v, v6, v7, v8) then
            return v
        end
    end
    local v9 = u43.create(v6, v7, v8, a2[1], a2[2], a2[3])
    table.insert(v5, v9)
    return v9
end

return u43