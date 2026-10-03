-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Line
-- Decompile time: 0.64 ms

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

function u0:Draw(a2, a3) -- Line: 22 -- types: self: table, a2: userdata, a3: number
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    Ceive.Ray:Draw(a2.Position + a2.LookVector * (-a3 / 2), a2.Position + a2.LookVector * (a3 / 2))
end

function u0.Create(a1, a2, a3) -- Line: 40 -- types: a1: table, a2: userdata, a3: number
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Length = a3,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 56
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Length)
end

return u0