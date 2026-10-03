-- Script path: ReplicatedStorage.Shared.Modules.Octree.OctreeNode
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local OctreeRegionUtils = require(ReplicatedStorage.Shared.Modules.Octree.OctreeRegionUtils)
local u11 = {ClassName = "OctreeNode"}
u11.__index = u11

function u11.new(a1, a2) -- Line: 12 -- upvalues: u11 (val)
    local v1 = setmetatable({}, u11)
    v1._octree = a1 or error("No octree")
    v1._object = a2 or error("No object")
    v1._currentLowestRegion = nil
    v1._position = nil
    return v1
end

function u11:KNearestNeighborsSearch(a2, a3, a4) -- Line: 24 -- types: self: table, a4: number?
    return self._octree:KNearestNeighborsSearch(self._position, a2, a3, a4)
end

function u11.GetObject(a1) -- Line: 28
    return a1._object
end

function u11:RadiusSearch(a2, a3) -- Line: 32 -- types: self: table, a3: number?
    return self._octree:RadiusSearch(self._position, a2, a3)
end

function u11.GetPosition(a1) -- Line: 36
    return a1._position
end

function u11.GetRawPosition(a1) -- Line: 40
    return a1._px, a1._py, a1._pz
end

function u11.SetPosition(a1, a2) -- Line: 44 -- upvalues: OctreeRegionUtils (val)
    if a1._position == a2 then
        return
    end
    local v1 = Vector3.new(a2.X, 0, a2.Z)
    local x = v1.x
    local y = v1.y
    local z = v1.z
    a1._px = x
    a1._py = y
    a1._pz = z
    a1._position = v1
    if a1._currentLowestRegion and OctreeRegionUtils.inRegionBounds(a1._currentLowestRegion, x, y, z) then
        return
    end
    local OrCreateLowestSubRegion = a1._octree:GetOrCreateLowestSubRegion(x, y, z)
    if not a1._currentLowestRegion then
        OctreeRegionUtils.addNode(OrCreateLowestSubRegion, a1)
    else
        OctreeRegionUtils.moveNode(a1._currentLowestRegion, OrCreateLowestSubRegion, a1)
    end
    a1._currentLowestRegion = OrCreateLowestSubRegion
end

function u11.Destroy(a1) -- Line: 80 -- upvalues: OctreeRegionUtils (val)
    if a1._currentLowestRegion then
        OctreeRegionUtils.removeNode(a1._currentLowestRegion, a1)
    end
end

return u11