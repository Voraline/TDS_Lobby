-- Script path: ReplicatedStorage.Shared.Modules.RotatedRegion3.Vertices
-- Decompile time: 4.92 ms

local u0 = {}
u0[1] = (Vector3.new(1, 1, 1))
u0[2] = (Vector3.new(-1, 1, 1))
u0[3] = (Vector3.new(-1, 1, -1))
u0[4] = (Vector3.new(1, 1, -1))
u0[5] = (Vector3.new(1, -1, 1))
u0[6] = (Vector3.new(-1, -1, 1))
u0[7] = (Vector3.new(-1, -1, -1))
u0[8] = (Vector3.new(1, -1, -1))
local v1 = {1, 2, 3, 4, 5, 6, 7, 8}
local v2 = {1, 2, 5, 6, 7, 8}
local v3 = {4, 5, 6, 7, 8}

local function fromIndexArray(a1) -- Line: 32 -- upvalues: u0 (val)
    local v1 = {}
    local v2 = #a1
    for i = 1, v2 do
        v1[i] = u0[a1[i]]
    end
    return v1
end

local function cylinder(a1) -- Line: 40
    local v1
    local v2 = {}
    local v3 = 6.283185307179586 / a1
    for i = 1, a1 do
        v1 = (CFrame.fromAxisAngle(Vector3.new(1, 0, 0), i * v3)) * Vector3.new(0, 1, 0)
        v2[i] = Vector3.new(1, 0, 0) + v1
        v2[a1 + i] = Vector3.new(-1, 0, 0) + v1
    end
    return v2
end

local function icoSphere(a1) -- Line: 51
    local v1, v2, v3, v4, v5, v6, v7
    local u324 = {}
    u324[1] = (Vector3.new(-1, 1.6180340051651, 0))
    u324[2] = (Vector3.new(1, 1.6180340051651, 0))
    u324[3] = (Vector3.new(-1, -1.6180340051651, 0))
    u324[4] = (Vector3.new(1, -1.6180340051651, 0))
    u324[5] = (Vector3.new(0, -1, 1.6180340051651))
    u324[6] = (Vector3.new(0, 1, 1.6180340051651))
    u324[7] = (Vector3.new(0, -1, -1.6180340051651))
    u324[8] = (Vector3.new(0, 1, -1.6180340051651))
    u324[9] = (Vector3.new(1.6180340051651, 0, -1))
    u324[10] = (Vector3.new(1.6180340051651, 0, 1))
    u324[11] = (Vector3.new(-1.6180340051651, 0, -1))
    u324[12] = (Vector3.new(-1.6180340051651, 0, 1))
    local v8 = {
        1,
        12,
        6,
        1,
        6,
        2,
        1,
        2,
        8,
        1,
        8,
        11,
        1,
        11,
        12,
        2,
        6,
        10,
        6,
        12,
        5,
        12,
        11,
        3,
        11,
        8,
        7,
        8,
        2,
        9,
        4,
        10,
        5,
        4,
        5,
        3,
        4,
        3,
        7,
        4,
        7,
        9,
        4,
        9,
        10,
        5,
        10,
        6,
        3,
        5,
        12,
        7,
        3,
        11,
        9,
        7,
        8,
        10,
        9,
        2,
    }
    local u326 = {}

    local function split(a1, a2) -- Line: 137 -- upvalues: u326 (val), u324 (val)
        local v1 = a1 < a2 and a1 .. "," .. a2 or a2 .. "," .. a1
        if not u326[v1] then
            local v2 = u324
            local v3 = #u324 + 1
            v2[v3] = (u324[a1] + u324[a2]) / 2
            u326[v1] = #u324
        end
        return u326[v1]
    end

    for i = 1, a1 do
        for j = #v8, 1, -3 do
            v1 = v8[j - 2]
            v2 = v8[j - 1]
            v3 = v8[j]
            v5 = v1 < v2 and v1 .. "," .. v2 or v2 .. "," .. v1
            if not u326[v5] then
                u324[#u324 + 1] = (u324[v1] + u324[v2]) / 2
                u326[v5] = #u324
            end
            v4 = u326[v5]
            v6 = v2 < v3 and v2 .. "," .. v3 or v3 .. "," .. v2
            if not u326[v6] then
                u324[#u324 + 1] = (u324[v2] + u324[v3]) / 2
                u326[v6] = #u324
            end
            v5 = u326[v6]
            v7 = v3 < v1 and v3 .. "," .. v1 or v1 .. "," .. v3
            if not u326[v7] then
                u324[#u324 + 1] = (u324[v3] + u324[v1]) / 2
                u326[v7] = #u324
            end
            v6 = u326[v7]
            v8[#v8 + 1] = v1
            v8[#v8 + 1] = v4
            v8[#v8 + 1] = v6
            v8[#v8 + 1] = v2
            v8[#v8 + 1] = v5
            v8[#v8 + 1] = v4
            v8[#v8 + 1] = v3
            v8[#v8 + 1] = v6
            v8[#v8 + 1] = v5
            v8[#v8 + 1] = v4
            v8[#v8 + 1] = v5
            v8[#v8 + 1] = v6
            table.remove(v8, j)
            table.remove(v8, j - 1)
            table.remove(v8, j - 2)
        end
    end
    local v9 = #u324
    for k = 1, v9 do
        u324[k] = u324[k].Unit
    end
    return u324
end

local function vertShape(a1, a2, a3) -- Line: 187
    local v1
    local v2 = {}
    local v3 = #a3
    for i = 1, v3 do
        v1 = a3[i] * a2
        v2[i] = (a1:PointToWorldSpace(v1))
    end
    return v2
end

local function getCentroidFromSet(a1) -- Line: 195
    local v1 = a1[1]
    local v2 = #a1
    for i = 2, v2 do
        v1 = v1 + a1[2]
    end
    return v1 / #a1
end

local function classify(a1) -- Line: 203
    if a1.ClassName == "Part" then
        if a1.Shape == Enum.PartType.Block then
            return "Block"
        end
        if a1.Shape == Enum.PartType.Cylinder then
            return "Cylinder"
        end
        if a1.Shape == Enum.PartType.Ball then
            return "Ball"
        end
        return
    end
    if a1.ClassName == "WedgePart" then
        return "Wedge"
    end
    if a1.ClassName == "CornerWedgePart" then
        return "CornerWedge"
    end
    if a1:IsA("BasePart") then
        return "Block"
    end
end

local u37 = {}
local v4 = #v1
for i = 1, v4 do
    u37[i] = u0[v1[i]]
end
local u53 = {}
local v5 = #v2
for j = 1, v5 do
    u53[j] = u0[v2[j]]
end
local u72 = {}
local v6 = #v3
for k = 1, v6 do
    u72[k] = u0[v3[k]]
end
local u101 = cylinder(20)
local u110 = icoSphere(2)
return {
    Block = function(a1, a2) -- Line: 230 -- upvalues: vertShape (val), u37 (val)
        return (vertShape(a1, a2, u37))
    end,
    Wedge = function(a1, a2) -- Line: 233 -- upvalues: vertShape (val), u53 (val)
        return (vertShape(a1, a2, u53))
    end,
    CornerWedge = function(a1, a2) -- Line: 236 -- upvalues: vertShape (val), u72 (val)
        return (vertShape(a1, a2, u72))
    end,
    Cylinder = function(a1, a2) -- Line: 239 -- upvalues: vertShape (val), u101 (val)
        return (vertShape(a1, a2, u101))
    end,
    Ball = function(a1, a2) -- Line: 242 -- upvalues: vertShape (val), u110 (val)
        return (vertShape(a1, a2, u110))
    end,
    GetCentroid = getCentroidFromSet,
    Classify = classify,
}