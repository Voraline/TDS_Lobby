-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.VolumeCylinder
-- Decompile time: 1.40 ms

local Terrain = workspace.Terrain
local u2 = {}
u2.__index = u2

function u2.Init(a1, a2, a3, a4, a5, a6) -- Line: 8 -- upvalues: u2 (val)
    local v1 = setmetatable({}, u2)
    v1.Ceive = a1
    v1.Propertys = a2
    v1.Request = a3
    v1.Release = a4
    v1.Retain = a5
    v1.Register = a6
    return v1
end

function u2:Draw(a2, a3, a4, a5, a6) -- Line: 28
    -- upvalues: Terrain (val)
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local CylinderHandleAdornment = self.Request("CylinderHandleAdornment")
    CylinderHandleAdornment.Color3 = self.Propertys.Color3
    CylinderHandleAdornment.Transparency = self.Propertys.Transparency
    CylinderHandleAdornment.CFrame = a2
    CylinderHandleAdornment.Height = a4
    CylinderHandleAdornment.Radius = a3
    CylinderHandleAdornment.InnerRadius = a5 or 0
    CylinderHandleAdornment.Angle = a6 or 360
    CylinderHandleAdornment.AlwaysOnTop = self.Propertys.AlwaysOnTop
    CylinderHandleAdornment.ZIndex = 1
    CylinderHandleAdornment.Adornee = Terrain
    CylinderHandleAdornment.Parent = Terrain
    Ceive.ActiveInstances = Ceive.ActiveInstances + 1
    self.Register(CylinderHandleAdornment)
end

function u2.Create(a1, a2, a3, a4, a5, a6) -- Line: 62
    -- upvalues: 
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Radius = a3,
        Length = a4,
        InnerRadius = a5 or 0,
        Angle = a6 or 360,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u2.Update(a1, a2) -- Line: 81
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Radius, a2.Length, a2.InnerRadius, a2.Angle)
end

return u2