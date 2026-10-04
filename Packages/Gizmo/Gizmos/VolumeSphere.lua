-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.VolumeSphere
-- Decompile time: 2.01 ms

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

function u2:Draw(a2, a3) -- Line: 25 -- upvalues: Terrain (val) -- types: self: table, a2: userdata, a3: number
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local SphereHandleAdornment = self.Request("SphereHandleAdornment")
    SphereHandleAdornment.Color3 = self.Propertys.Color3
    SphereHandleAdornment.Transparency = self.Propertys.Transparency
    SphereHandleAdornment.CFrame = a2
    SphereHandleAdornment.Radius = a3
    SphereHandleAdornment.AlwaysOnTop = self.Propertys.AlwaysOnTop
    SphereHandleAdornment.ZIndex = 1
    SphereHandleAdornment.Adornee = Terrain
    SphereHandleAdornment.Parent = Terrain
    Ceive.ActiveInstances = Ceive.ActiveInstances + 1
    self.Register(SphereHandleAdornment)
end

function u2.Create(a1, a2, a3) -- Line: 53 -- types: a1: table, a2: userdata, a3: number
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Radius = a3,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u2.Update(a1, a2) -- Line: 69
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Radius)
end

return u2