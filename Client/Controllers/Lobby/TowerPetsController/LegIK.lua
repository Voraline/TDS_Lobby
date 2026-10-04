-- Script path: ReplicatedStorage.Client.Controllers.Lobby.TowerPetsController.LegIK
-- Decompile time: 2.70 ms

game:GetService("RunService")
CFrame.new(-0.25, -0.45, 0)
CFrame.new(0.25, -0.45, 0)
local u19 = CFrame.Angles(0, 3.141592653589793, 0)
local u20 = {}
u20.__index = u20

function u20.new(a1, a2) -- Line: 21 -- upvalues: u20 (val) -- types: a2: string
    local v1 = setmetatable({}, u20)
    local Torso = a1:FindFirstChild("Torso")
    local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart")
    if Torso and HumanoidRootPart then
        local v2 = Torso:FindFirstChild(a2 .. " Hip") or Torso:FindFirstChild(a2 .. " Leg") or HumanoidRootPart:FindFirstChild(a2 .. " Leg") or HumanoidRootPart:FindFirstChild(a2 .. " Hip")
        v1._Torso = Torso
        v1._RootPart = HumanoidRootPart
        v1._Hip = v2
        v1._HipC0Cache = v2.C0
        return v1
    end
end

function u20.Reset(a1, a2) -- Line: 45
    a1._Hip.C0 = a1._Hip.C0:Lerp(a1._HipC0Cache, a2 * 10)
end

function u20.Solve(a1, a2) -- Line: 49 -- upvalues: u19 (val) -- types: a1: table, a2: vector
    local v1 = a1._Hip.Part0.CFrame:ToObjectSpace(a1._RootPart.CFrame)
    local v2 = (a1._RootPart.CFrame * a1._HipC0Cache):PointToObjectSpace(a2)
    local v3 = math.atan2(v2.Z, v2.Y)
    local v4 = math.atan2(v2.X, v2.Y)
    a1._Hip.C0 = a1._HipC0Cache * CFrame.Angles(v3, 0, v4) * u19 * (v1 - v1.p):Inverse()
end

function u20.Destroy(a1) -- Line: 59
    a1._Hip.C0 = a1._HipC0Cache
    a1._TransformResetLoop:Disconnect()
end

return u20