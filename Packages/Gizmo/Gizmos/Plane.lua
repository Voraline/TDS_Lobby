-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Plane
-- Decompile time: 1.67 ms

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

function u0:Draw(a2, a3, a4) -- Line: 23 -- types: self: table, a2: vector, a3: vector, a4: vector
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v1 = a4 * Vector3.new(1, 1, 0)
    local v2 = CFrame.lookAt(a2, a2 + a3)
    local UpVector = v2.UpVector
    local RightVector = v2.RightVector
    local LookVector = v2.LookVector
    local v3 = v1 / 2
    local v4 = UpVector * v3.Y
    local v5 = RightVector * v3.X
    local v6 = LookVector * v3.Z
    ;(function(a1, a2_2, a3) -- Line: 42 -- upvalues: a2 (val), Ceive (val)
        local v1 = a2 + (a1 - a2_2 + a3)
        local v2 = a2 + (a1 + a2_2 + a3)
        local v3 = a2 + (-a1 - a2_2 + a3)
        local v4 = a2 + (-a1 + a2_2 + a3)
        Ceive.Ray:Draw(v1, v2)
        Ceive.Ray:Draw(v1, v3)
        Ceive.Ray:Draw(v2, v4)
        Ceive.Ray:Draw(v2, v3)
        Ceive.Ray:Draw(v3, v4)
    end)(
        v4,
        v5,
        v6
    )
end

function u0.Create(a1, a2, a3, a4) -- Line: 66 -- types: a1: table, a2: vector, a3: vector, a4: vector
    local v1 = {
        Enabled = true,
        Destroy = false,
        Position = a2,
        Normal = a3,
        Size = a4,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 83
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Position, a2.Normal, a2.Size)
end

return u0