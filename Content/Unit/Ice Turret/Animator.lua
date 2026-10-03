-- Script path: ReplicatedStorage.Content.Unit.Ice Turret.Animator
-- Decompile time: 2.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local v1 = {}
v1.__index = v1
local u17 = {}

function u17.FireMax1(a1) -- Line: 10
    return CFrame.Angles(-math.rad(a1), 0, 0)
end

function u17.FireMax2(a1) -- Line: 13
    return CFrame.Angles(-math.rad(a1), math.rad(a1), 0)
end

function u17.FireMax3(a1) -- Line: 16
    return CFrame.Angles(-math.rad(a1), math.rad(a1), 0)
end

function v1:_faceTarget(a2) -- Line: 21 -- types: self: table, a2: vector
    local Unit, v1
    local v2 = {}
    for i, j in self.Model.HumanoidRootPart:GetChildren() do
        if j.Name == "LookAt" then
            table.insert(v2, j)
        end
    end
    for k, n in v2 do
        Unit = (self.Model.HumanoidRootPart.Position - a2).Unit
        v1 = math.atan2(Unit.X, Unit.Z)
        n.C1 = CFrame.Angles(0, -v1, 0)
    end
    local v3 = CFrame.lookAt(self.Model.Weapon.Rotate.Position, a2):ToOrientation()
    self.Model.Weapon.LookAt.Rotate.C1 = CFrame.Angles(-v3, 0, 0)
end

function v1:_fireTarget(a2) -- Line: 42 -- upvalues: EmitterManager (val)
    local Muzzle = self.Model.Weapon.Fire.Muzzle
    EmitterManager.manualEmit(Muzzle)
    self.Model.HumanoidRootPart.Shoot:Play()
    self:Bullet({
        Start = Muzzle.WorldPosition,
        End = a2.PrimaryPart.Position,
        Color = Color3.fromRGB(0, 255, 255),
        Spread = 50,
        Speed = 140,
    })
end

function v1.Initialize(a1) -- Line: 57 -- upvalues: SpringClass (val), u17 (val)
    local u6 = SpringClass.new(0, 0.55, 16)
    local C0 = a1.Model.Weapon.LookAt.Rotate.C0

    function a1.OnStepFunction() -- Line: 62 -- upvalues: u6 (val), a1 (val), C0 (val), u17 (upval)
        local p = u6.p
        a1.Model.Weapon.LookAt.Rotate.C0 = C0 * CFrame.new(0, 0, p) * CFrame.Angles(math.rad(p) * 70, 0, 0)
        if 1 < a1.Upgrade then
            local v1, v2
            for i, j in a1.Model.Weapon.Rotate:GetChildren() do
                if j:IsA("Motor6D") and u17[j.Name] then
                    v1 = u17[j.Name]
                    if v1 then
                        v2 = p * 120
                        j.C1 = v1((math.abs(v2)))
                    end
                end
            end
        end
    end

    a1.Executables = {}
    a1:Thread(function() -- Line: 83 -- upvalues: a1 (val), u6 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:_fireTarget(v1)
            a1:_faceTarget(v1.PrimaryPart.Position)
            local v2 = u6
            v2.v = v2.v + 4
            a1:Delay(a1.Cooldown)
        end
    end)
end

return v1