-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.VolumeBox
-- Decompile time: 0.91 ms

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

function u2:Draw(a2, a3) -- Line: 25 -- upvalues: Terrain (val) -- types: self: table, a2: userdata, a3: vector
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local BoxHandleAdornment = self.Request("BoxHandleAdornment")
    BoxHandleAdornment.Color3 = self.Propertys.Color3
    BoxHandleAdornment.Transparency = self.Propertys.Transparency
    BoxHandleAdornment.CFrame = a2
    BoxHandleAdornment.Size = a3
    BoxHandleAdornment.AlwaysOnTop = self.Propertys.AlwaysOnTop
    BoxHandleAdornment.ZIndex = 1
    BoxHandleAdornment.Adornee = Terrain
    BoxHandleAdornment.Parent = Terrain
    Ceive.ActiveInstances = Ceive.ActiveInstances + 1
    self.Register(BoxHandleAdornment)
end

function u2.Create(a1, a2, a3) -- Line: 53 -- types: a1: table, a2: userdata, a3: vector
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Size = a3,
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
    a1:Draw(a2.Transform, a2.Size)
end

return u2