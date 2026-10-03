-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Cone
-- Decompile time: 1.51 ms

local u0 = {}
u0.__index = u0

function u0.Init(a1, a2, a3, a4, a5) -- Line: 8 -- upvalues: u0 (val)
    local v1 = setmetatable({}, u0)
    v1.Ceive = a1
    v1.Propertys = a2
    v1.Request = a3
    v1.Release = a4
    v1.Retain = a5
    return v1
end

function u0:Draw(a2, a3, a4, a5) -- Line: 26 -- types: self: table, a2: userdata, a3: number, a4: number, a5: number
    local v1, v2
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v3 = a2 * CFrame.Angles(-1.5707963267948966, 0, 0)
    local v4 = v3.Position + v3.UpVector * (a4 / 2)
    local v5 = v3.Position + -v3.UpVector * (a4 / 2)
    v4 = CFrame.lookAt(v4, v4 + v3.UpVector)
    v5 = CFrame.lookAt(v5, v5 - v3.UpVector)
    local v6 = nil
    local v7 = nil
    local v8 = a3
    for i = 0, 360, (math.floor(360 / a5)) do
        v1 = math.sin((math.rad(i))) * v8
        v2 = v5.Position + (v3.LookVector * ((math.cos((math.rad(i)))) * v8) + v3.RightVector * v1)
        if v6 then
            Ceive.Ray:Draw(v2, v4.Position)
            Ceive.Ray:Draw(v6, v2)
            v6 = v2
        else
            v6 = v2
            v7 = v2
            Ceive.Ray:Draw(v2, v4.Position)
        end
    end
    Ceive.Ray:Draw(v6, v7)
end

function u0.Create(a1, a2, a3, a4, a5) -- Line: 78 -- types: a1: table, a2: userdata, a3: number, a4: number, a5: number
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Radius = a3,
        Length = a4,
        Subdivisions = a5,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 96
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Radius, a2.Length, a2.Subdivisions)
end

return u0