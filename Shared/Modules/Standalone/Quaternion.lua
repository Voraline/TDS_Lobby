-- Script path: ReplicatedStorage.Shared.Modules.Standalone.Quaternion
-- Decompile time: 0.43 ms

local new = Vector3.new
local new_2 = CFrame.new
local v1 = new()
new_2()
local Dot = v1.Dot
local Cross = v1.Cross
return function(a1, a2, a3) -- Line: 8 -- upvalues: Dot (val), Cross (val), new_2 (val)
    local v1 = a1.magnitude * a2.magnitude
    local v2 = Dot(a1, a2)
    local v3 = Cross(a1, a2)
    local v4 = new_2(0, 0, 0, v3.x, v3.y, v3.z, v2 + v1)
    if a3 then
        return v4 - v4 * a3 + a3
    end
    return v4
end