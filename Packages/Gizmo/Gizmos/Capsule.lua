-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Capsule
-- Decompile time: 2.09 ms

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
    local v1, v2, v3, v4
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v5 = a2.Position + a2.UpVector * (a4 / 2)
    local v6 = a2.Position - a2.UpVector * (a4 / 2)
    v5 = CFrame.lookAt(v5, v5 + a2.UpVector)
    v6 = CFrame.lookAt(v6, v6 - a2.UpVector)
    local v7 = nil
    local v8 = nil
    local v9 = nil
    local v10 = nil
    local v11, v12, v13 = a3, a2, a5
    for i = 0, 360, (math.floor(360 / a5)) do
        v1 = math.sin((math.rad(i))) * v11
        v2 = v12.LookVector * ((math.cos((math.rad(i)))) * v11) + v12.RightVector * v1
        v3 = v5.Position + v2
        v4 = v6.Position + v2
        Ceive.Ray:Draw(v3, v4)
        Ceive.Circle:Draw((CFrame.new(v5.Position)) * v12.Rotation * CFrame.Angles(0, math.rad(i), 0), v11, v13 / 2, 90, false)
        Ceive.Circle:Draw(
            (CFrame.new(v6.Position)) * v12.Rotation * CFrame.Angles(3.141592653589793, math.rad(i), 0),
            v11,
            v13 / 2,
            90,
            false
        )
        if v7 then
            Ceive.Ray:Draw(v7, v3)
            Ceive.Ray:Draw(v8, v4)
            v7 = v3
            v8 = v4
        else
            v7 = v3
            v8 = v4
            v9 = v3
            v10 = v4
        end
    end
    Ceive.Ray:Draw(v7, v9)
    Ceive.Ray:Draw(v8, v10)
end

function u0.Create(a1, a2, a3, a4, a5) -- Line: 91 -- types: a1: table, a2: userdata, a3: number, a4: number, a5: number
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

function u0.Update(a1, a2) -- Line: 109
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Radius, a2.Length, a2.Subdivisions)
end

return u0