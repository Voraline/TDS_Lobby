-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.VolumeArrow
-- Decompile time: 0.96 ms

local u0 = {}
u0.__index = u0

function u0.Init(a1, a2, a3, a4, a5, a6) -- Line: 6 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.Ceive = a1
    v1.Propertys = a2
    v1.Request = a3
    v1.Release = a4
    v1.Retain = a5
    v1.Register = a6
    return v1
end

function u0:Draw(a2, a3, a4, a5, a6, a7) -- Line: 27
    -- upvalues: 
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v1 = CFrame.lookAt(a3 - (a3 - a2).Unit * (a6 / 2), a3)
    if a7 ~= true then
        Ceive.Ray:Draw(a2, a3)
    else
        local Position = v1.Position
        local Magnitude = (Position - a2).Magnitude
        Ceive.VolumeCylinder:Draw(CFrame.lookAt((a2 + Position) / 2, a3), a4, Magnitude)
    end
    Ceive.VolumeCone:Draw(v1, a5, a6)
end

function u0.Create(a1, a2, a3, a4, a5, a6, a7) -- Line: 58
    -- upvalues: 
    local v1 = {
        Enabled = true,
        Destroy = false,
        Origin = a2,
        End = a3,
        CylinderRadius = a4,
        ConeRadius = a5,
        Length = a6,
        UseCylinder = a7,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 78
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Origin, a2.End, a2.Radius, a2.Length, a2.UseCylinder)
end

return u0