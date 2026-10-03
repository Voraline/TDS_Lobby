-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.UIScale
-- Decompile time: 0.87 ms

local u0 = {}
local CurrentCamera = workspace.CurrentCamera
local u3 = 1
local u4 = {}

local function applyScale(a1, a2, a3) -- Line: 14 -- upvalues: u3 (ref) -- types: a1: userdata, a2: number, a3: number
    a1.Scale = math.clamp(u3, a2, a3)
end

local function updateScale() -- Line: 18 -- upvalues: CurrentCamera (val), u3 (ref), u4 (val)
    local X = CurrentCamera.ViewportSize.X
    local Y = CurrentCamera.ViewportSize.Y
    u3 = if not (Y < X) then 0.001388888888888889 * X else 0.001388888888888889 * Y
    for i, j in u4 do
        i.Scale = math.clamp(u3, j[1], j[2])
    end
end

updateScale()
;(CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateScale)

function u0.Register(a1, a2, a3) -- Line: 31
    -- upvalues: u3 (ref), u4 (val), u0 (val)
    local v1 = a2 or 0
    local v2 = a3 or (1 / 0)
    a1.Scale = math.clamp(u3, v1, v2)
    u4[a1] = {v1, v2}
    a1.Destroying:Connect(function() -- Line: 38 -- upvalues: u0 (upval), a1 (val)
        u0.Remove(a1)
    end)
end

function u0.Remove(a1) -- Line: 43 -- upvalues: u4 (val) -- types: a1: userdata
    u4[a1] = nil
end

return u0