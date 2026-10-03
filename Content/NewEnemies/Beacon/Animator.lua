-- Script path: ReplicatedStorage.Content.NewEnemies.Beacon.Animator
-- Decompile time: 0.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1
local VoidCultist = ReplicatedStorage.Assets.Effects.Mob.VoidCultist

local function cloneAndWeldEffect(a1, a2) -- Line: 10 -- upvalues: VoidCultist (val) -- types: a1: userdata, a2: string
    local PrimaryPart = a1.PrimaryPart
    if not PrimaryPart then
        return nil
    end
    local v1 = VoidCultist:FindFirstChild(a2)
    if v1 and v1:IsA("BasePart") then
        local v2 = v1:Clone()
        v2.Anchored = false
        v2.CanCollide = false
        v2.CanTouch = false
        v2.CanQuery = false
        local v3 = (a1:GetExtentsSize()).Y / 2
        v2.CFrame = CFrame.new(PrimaryPart.Position - Vector3.new(0, 1, 0) * v3)
        v2.Parent = a1
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = PrimaryPart
        WeldConstraint.Part1 = v2
        WeldConstraint.Parent = v2
        return v2
    end
    return nil
end

function v1.Initialize(a1) -- Line: 40 -- upvalues: cloneAndWeldEffect (val), EmitterManager (val)
    local u4 = cloneAndWeldEffect(a1.Model, "HealingAura")
    if u4 then
        EmitterManager.toggle(u4, true)
        a1.Maid:Mark(function() -- Line: 45 -- upvalues: EmitterManager (upval), u4 (val)
            EmitterManager.toggle(u4, false)
            u4:Destroy()
        end)
    end
    a1.Executables = {}
end

return v1