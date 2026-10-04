-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Box
-- Decompile time: 1.97 ms

local u0 = {}
u0.__index = u0

function u0.Init(a1, a2, a3, a4, a5) -- Line: 6 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.Ceive = a1
    v1.Propertys = a2
    v1.Request = a3
    v1.Release = a4
    v1.Retain = a5
    return v1
end

function u0:Draw(a2, a3, a4) -- Line: 23 -- types: self: table, a2: userdata, a3: vector, a4: boolean
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local Position = a2.Position
    local UpVector = a2.UpVector
    local RightVector = a2.RightVector
    local LookVector = a2.LookVector
    local v1 = a3 / 2
    local v2 = UpVector * v1.Y
    local v3 = RightVector * v1.X
    local v4 = LookVector * v1.Z

    local function CalculateYFace(a1, a2, a3) -- Line: 39 -- upvalues: Position (val), Ceive (val), a4 (val)
        local v1 = Position + (a1 - a2 + a3)
        local v2 = Position + (a1 + a2 + a3)
        local v3 = Position + (a1 - a2 - a3)
        local v4 = Position + (a1 + a2 - a3)
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        if a4 ~= false then
            Ceive.Ray:Draw(v2, v3)
        end
        Ceive.Ray:Draw(v3, v4)
    end

    local function CalculateZFace(a1, a2, a3) -- Line: 56 -- upvalues: Position (val), Ceive (val), a4 (val)
        local v1 = Position + (a1 - a2 + a3)
        local v2 = Position + (a1 + a2 + a3)
        local v3 = Position + (-a1 - a2 + a3)
        local v4 = Position + (-a1 + a2 + a3)
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        if a4 ~= false then
            Ceive.Ray:Draw(v2, v3)
        end
        Ceive.Ray:Draw(v3, v4)
    end

    local function CalculateXFace(a1, a2, a3) -- Line: 73 -- upvalues: Position (val), Ceive (val), a4 (val)
        local v1 = Position + (a1 - a2 - a3)
        local v2 = Position + (a1 - a2 + a3)
        local v3 = Position + (-a1 - a2 - a3)
        local v4 = Position + (-a1 - a2 + a3)
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        if a4 ~= false then
            Ceive.Ray:Draw(v2, v3)
        end
        Ceive.Ray:Draw(v3, v4)
    end

    CalculateXFace(v2, v3, v4)
    CalculateXFace(v2, -v3, v4)
    CalculateYFace(v2, v3, v4)
    CalculateYFace(-v2, v3, v4)
    CalculateZFace(v2, v3, v4)
    CalculateZFace(v2, v3, -v4)
end

function u0.Create(a1, a2, a3, a4) -- Line: 106 -- types: a1: table, a2: userdata, a3: vector, a4: boolean
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Size = a3,
        DrawTriangles = a4,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 123
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Size, a2.DrawTriangles)
end

return u0