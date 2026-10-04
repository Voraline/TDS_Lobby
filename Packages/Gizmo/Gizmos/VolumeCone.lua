-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.VolumeCone
-- Decompile time: 1.27 ms

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

function u2:Draw(a2, a3, a4) -- Line: 26
    -- upvalues: Terrain (val)
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local ConeHandleAdornment = self.Request("ConeHandleAdornment")
    ConeHandleAdornment.Color3 = self.Propertys.Color3
    ConeHandleAdornment.Transparency = self.Propertys.Transparency
    ConeHandleAdornment.CFrame = a2
    ConeHandleAdornment.AlwaysOnTop = self.Propertys.AlwaysOnTop
    ConeHandleAdornment.ZIndex = 1
    ConeHandleAdornment.Height = a4
    ConeHandleAdornment.Radius = a3
    ConeHandleAdornment.Adornee = Terrain
    ConeHandleAdornment.Parent = Terrain
    Ceive.ActiveInstances = Ceive.ActiveInstances + 1
    self.Register(ConeHandleAdornment)
end

function u2.Create(a1, a2, a3, a4) -- Line: 56 -- types: a1: table, a2: userdata, a3: number, a4: number
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Radius = a3,
        Length = a4,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u2.Update(a1, a2) -- Line: 73
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Radius, a2.Length)
end

return u2