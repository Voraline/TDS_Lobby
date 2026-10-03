-- Script path: ReplicatedStorage.Packages.Gizmo.Gizmos.Circle
-- Decompile time: 1.62 ms

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

function u0:Draw(a2, a3, a4, a5, a6) -- Line: 25
    -- upvalues: 
    local v1, v2
    local Ceive = self.Ceive
    if not Ceive.Enabled then
        return
    end
    local v3 = nil
    local v4 = nil
    local v5 = 0
    local v6 = a5
    for i = 0, v6, (math.floor(a5 / a4)) do
        v1 = math.sin((math.rad(i))) * a3
        v2 = a2.Position + (a2.UpVector * ((math.cos((math.rad(i)))) * a3) + a2.RightVector * v1)
        if v3 ~= nil then
            Ceive.Ray:Draw(v3, v2)
            v3 = v2
        else
            v3 = v2
            v4 = v2
        end
        v5 = i
    end
    if v5 ~= a5 then
        v6 = math.sin((math.rad(a5))) * a3
        Ceive.Ray:Draw(v3, a2.Position + (a2.UpVector * ((math.cos((math.rad(a5)))) * a3) + a2.RightVector * v6))
    end
    if a6 ~= false then
        Ceive.Ray:Draw(v3, v4)
    end
    return v3
end

function u0.Create(a1, a2, a3, a4, a5, a6) -- Line: 81
    -- upvalues: 
    local v1 = {
        Enabled = true,
        Destroy = false,
        Transform = a2,
        Radius = a3,
        Subdivisions = a4,
        Angle = a5,
        ConnectToStart = a6,
        AlwaysOnTop = a1.Propertys.AlwaysOnTop,
        Transparency = a1.Propertys.Transparency,
        Color3 = a1.Propertys.Color3,
    }
    a1.Retain(a1, v1)
    return v1
end

function u0.Update(a1, a2) -- Line: 100
    local Ceive = a1.Ceive
    Ceive.PushProperty("AlwaysOnTop", a2.AlwaysOnTop)
    Ceive.PushProperty("Transparency", a2.Transparency)
    Ceive.PushProperty("Color3", a2.Color3)
    a1:Draw(a2.Transform, a2.Radius, a2.Subdivisions, a2.Angle, a2.ConnectToStart)
end

return u0