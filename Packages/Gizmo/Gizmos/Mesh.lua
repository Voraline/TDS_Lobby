-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Mesh
-- Decompile time: 3.20 ms

local function Map(a1, a2, a3, a4, a5) -- Line: 1
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

local u1 = {}
u1.__index = u1

function u1.Init(a1, a2, a3, a4, a5) -- Line: 10 -- upvalues: u1 (val)
    local v1 = setmetatable({}, u1)
    v1.Ceive = a1
    v1.Propertys = a2
    v1.Request = a3
    v1.Release = a4
    v1.Retain = a5
    return v1
end

function u1:Draw(a2, a3, a4, a5) -- Line: 28 -- types: self: table, a2: userdata, a3: vector
    local v1, v2, v3, v4
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v5 = (-1 / 0)
    local v6 = (-1 / 0)
    local v7 = (-1 / 0)
    local v8 = (1 / 0)
    local v9 = (1 / 0)
    local v10 = (1 / 0)
    for i, j in a4 do
        v5 = math.max(v5, j.x)
        v6 = math.max(v6, j.y)
        v7 = math.max(v7, j.z)
        v8 = math.min(v8, j.x)
        v9 = math.min(v9, j.y)
        v10 = math.min(v10, j.z)
    end
    for k, n in a4 do
        v1 = (n.x - v8) / (v5 - v8) * 1 + -0.5
        v2 = (n.y - v9) / (v6 - v9) * 1 + -0.5
        v3 = (n.z - v10) / (v7 - v10) * 1 + -0.5
        a4[k] = a2 * CFrame.new(Vector3.new(v1, v2, v3) * a3)
    end
    for m, i5 in a5 do
        if #i5 ~= 3 then
            v1 = a4[i5[1].v]
            v2 = a4[i5[2].v]
            v3 = a4[i5[3].v]
            v4 = a4[i5[4].v]
            Ceive.Ray:Draw(v1.Position, v2.Position)
            Ceive.Ray:Draw(v1.Position, v4.Position)
            Ceive.Ray:Draw(v4.Position, v2.Position)
            Ceive.Ray:Draw(v3.Position, v4.Position)
            Ceive.Ray:Draw(v2.Position, v3.Position)
        else
            v1 = a4[i5[1].v]
            v2 = a4[i5[2].v]
            v3 = a4[i5[3].v]
            Ceive.Ray:Draw(v1.Position, v2.Position)
            Ceive.Ray:Draw(v2.Position, v3.Position)
            Ceive.Ray:Draw(v3.Position, v1.Position)
        end
    end
end

function u1.Create(a1, a2, a3, a4, a5) -- Line: 94 -- types: a1: table, a2: userdata, a3: vector
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Size = a3,
        Vertices = a4,
        Faces = a5,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u1.Update(a1, a2) -- Line: 112
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Size, a2.Vertices, a2.Faces)
end

return u1