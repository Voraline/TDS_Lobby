-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Arrow
-- Decompile time: 0.77 ms

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

function u0:Draw(a2, a3, a4, a5, a6) -- Line: 26
    -- upvalues: 
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    Ceive.Ray:Draw(a2, a3)
    Ceive.Cone:Draw(CFrame.lookAt(a3 + (a2 - a3).Unit * (a5 / 2), a3), a4, a5, a6)
end

function u0.Create(a1, a2, a3, a4, a5, a6) -- Line: 47
    -- upvalues: 
    local v1 = {
        Enabled = true,
        Destroy = false,
        Origin = a2,
        End = a3,
        Radius = a4,
        Length = a5,
        Subdivisions = a6,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 66
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Origin, a2.End, a2.Radius, a2.Length, a2.Subdivisions)
end

return u0