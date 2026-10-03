-- Script path: ReplicatedStorage.Shared.Modules.RotatedRegion3
-- Decompile time: 4.69 ms

local GJK = require(script:WaitForChild("GJK"))
local Supports = require(script:WaitForChild("Supports"))
local Vertices = require(script:WaitForChild("Vertices"))
local u21 = {}
u21.__index = u21

local function getCorners(a1, a2) -- Line: 86
    return {
        a1:PointToWorldSpace((Vector3.new(-a2.x, a2.y, a2.z))),
        a1:PointToWorldSpace((Vector3.new(-a2.x, -a2.y, a2.z))),
        a1:PointToWorldSpace((Vector3.new(-a2.x, -a2.y, -a2.z))),
        a1:PointToWorldSpace((Vector3.new(a2.x, -a2.y, -a2.z))),
        a1:PointToWorldSpace((Vector3.new(a2.x, a2.y, -a2.z))),
        a1:PointToWorldSpace((Vector3.new(a2.x, a2.y, a2.z))),
        a1:PointToWorldSpace((Vector3.new(a2.x, -a2.y, a2.z))),
        (a1:PointToWorldSpace((Vector3.new(-a2.x, a2.y, -a2.z)))),
    }
end

local function worldBoundingBox(a1) -- Line: 99
    local x, y, z
    local v1 = {}
    local v2 = {}
    local v3 = {}
    local v4 = #a1
    for i = 1, v4 do
        x = a1[i].x
        y = a1[i].y
        z = a1[i].z
        v1[i] = x
        v2[i] = y
        v3[i] = z
    end
    return (Vector3.new(math.min((unpack(v1))), math.min((unpack(v2))), (math.min((unpack(v3)))))), (Vector3.new(math.max((unpack(v1))), math.max((unpack(v2))), (math.max((unpack(v3))))))
end

function u21.new(a1, a2) -- Line: 111 -- upvalues: u21 (val), Vertices (val), Supports (val), worldBoundingBox (val)
    local v1 = setmetatable({}, u21)
    v1.CFrame = a1
    v1.Size = a2
    v1.Shape = "Block"
    v1.Set = Vertices.Block(a1, a2 / 2)
    v1.Support = Supports.PointCloud
    v1.Centroid = a1.p
    v1.AlignedRegion3 = Region3.new(worldBoundingBox(v1.Set))
    return v1
end

u21.Block = u21.new

function u21.Wedge(a1, a2) -- Line: 129 -- upvalues: u21 (val), Vertices (val), Supports (val), worldBoundingBox (val)
    local v1 = setmetatable({}, u21)
    v1.CFrame = a1
    v1.Size = a2
    v1.Shape = "Wedge"
    v1.Set = Vertices.Wedge(a1, a2 / 2)
    v1.Support = Supports.PointCloud
    v1.Centroid = Vertices.GetCentroid(v1.Set)
    v1.AlignedRegion3 = Region3.new(worldBoundingBox(v1.Set))
    return v1
end

function u21.CornerWedge(a1, a2) -- Line: 145
    -- upvalues: u21 (val), Vertices (val), Supports (val), worldBoundingBox (val)
    local v1 = setmetatable({}, u21)
    v1.CFrame = a1
    v1.Size = a2
    v1.Shape = "CornerWedge"
    v1.Set = Vertices.CornerWedge(a1, a2 / 2)
    v1.Support = Supports.PointCloud
    v1.Centroid = Vertices.GetCentroid(v1.Set)
    v1.AlignedRegion3 = Region3.new(worldBoundingBox(v1.Set))
    return v1
end

function u21.Cylinder(a1, a2) -- Line: 161
    -- upvalues: u21 (val), Supports (val), worldBoundingBox (val), getCorners (val)
    local v1 = setmetatable({}, u21)
    v1.CFrame = a1
    v1.Size = a2
    v1.Shape = "Cylinder"
    v1.Set = {a1, a2 / 2}
    v1.Support = Supports.Cylinder
    v1.Centroid = a1.p
    v1.AlignedRegion3 = Region3.new(worldBoundingBox((getCorners(unpack(v1.Set)))))
    return v1
end

function u21.Ball(a1, a2) -- Line: 177 -- upvalues: u21 (val), Supports (val), worldBoundingBox (val), getCorners (val)
    local v1 = setmetatable({}, u21)
    v1.CFrame = a1
    v1.Size = a2
    v1.Shape = "Ball"
    v1.Set = {a1, a2 / 2}
    v1.Support = Supports.Ellipsoid
    v1.Centroid = a1.p
    v1.AlignedRegion3 = Region3.new(worldBoundingBox((getCorners(unpack(v1.Set)))))
    return v1
end

function u21.FromPart(a1) -- Line: 193 -- upvalues: u21 (val), Vertices (val)
    return u21[Vertices.Classify(a1)](a1.CFrame, a1.Size)
end

function u21.CastPoint(a1, a2) -- Line: 199 -- upvalues: GJK (val), Supports (val)
    return GJK.new(a1.Set, {a2}, a1.Centroid, a2, a1.Support, Supports.PointCloud):IsColliding()
end

function u21:CastPart(a2) -- Line: 205 -- upvalues: u21 (val), GJK (val)
    local v1 = u21.FromPart(a2)
    return GJK.new(self.Set, v1.Set, self.Centroid, v1.Centroid, self.Support, v1.Support):IsColliding()
end

function u21:FindPartsInRegion3(a2, a3, a4) -- Line: 211
    local v1 = a4 or workspace
    local v2 = {}
    local v3 = v1:FindPartsInRegion3(self.AlignedRegion3, a2, a3)
    local v4 = #v3
    for i = 1, v4 do
        if self:CastPart(v3[i]) then
            table.insert(v2, v3[i])
        end
    end
    return v2
end

function u21:FindPartsInRegion3WithIgnoreList(a2, a3, a4) -- Line: 223
    local v1 = {}
    local v2 = a4:FindPartsInRegion3WithIgnoreList(self.AlignedRegion3, a2 or {}, a3)
    local v3 = #v2
    for i = 1, v3 do
        if self:CastPart(v2[i]) then
            table.insert(v1, v2[i])
        end
    end
    return v1
end

function u21:FindPartsInRegion3WithWhiteList(a2, a3, a4) -- Line: 235
    local v1 = {}
    local v2 = a4:FindPartsInRegion3WithWhiteList(self.AlignedRegion3, a2 or {}, a3)
    local v3 = #v2
    for i = 1, v3 do
        if self:CastPart(v2[i]) then
            table.insert(v1, v2[i])
        end
    end
    return v1
end

function u21.Cast(a1, a2, a3) -- Line: 247
    return a1:FindPartsInRegion3WithIgnoreList(not (type(a2) ~= "table") and a2 or {a2}, a3)
end

return u21