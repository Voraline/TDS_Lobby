-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.SpeedBoostVisuals
-- Decompile time: 5.64 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SpeedyFast = ReplicatedStorage:WaitForChild("Assets").Effects.Particles:FindFirstChild("SpeedyFast")

local function getVfxPart(a1) -- Line: 14 -- types: a1: userdata
    if a1:IsA("BasePart") then
        return a1
    end
    if a1:IsA("Model") then
        return a1.PrimaryPart or a1:FindFirstChildWhichIsA("BasePart", true)
    end
    return nil
end

local function scaleVfx(a1, a2) -- Line: 26 -- types: a1: userdata, a2: number
    if a1:IsA("Model") then
        a1:ScaleTo(a2)
        return
    end
    if a1:IsA("BasePart") then
        a1.Size = a1.Size * a2
    end
end

return {
    onAdded = function(a1, a2) -- Line: 35 -- upvalues: SpeedyFast (val), EmitterManager (val)
        if not SpeedyFast then
            return nil
        end
        local Model = a1.Model
        if Model and Model.PrimaryPart then
            local new, v1
            local v2 = SpeedyFast:Clone()
            local PrimaryPart = if not v2:IsA("BasePart") then if not v2:IsA("Model") then nil else v2.PrimaryPart or v2:FindFirstChildWhichIsA("BasePart", true) else v2
            if not PrimaryPart then
                v2:Destroy()
                return nil
            end
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = Model.PrimaryPart
            WeldConstraint.Part1 = PrimaryPart
            WeldConstraint.Parent = PrimaryPart
            PrimaryPart.CFrame = Model.PrimaryPart.CFrame * CFrame.Angles(0, 0, -1.5707963267948966)
            PrimaryPart.Anchored = false
            local v3 = a1.Height or 2
            v2.Name = "SpeedBoostVFX"
            if v2:IsA("Model") then
                v2:ScaleTo(v3)
            elseif v2:IsA("BasePart") then
                v2.Size = v2.Size * v3
            end
            v2.Parent = workspace.CurrentCamera
            local v4 = (a1.BaseSpeed or 6) / 6
            for i, j in v2:GetDescendants() do
                if j:IsA("ParticleEmitter") and j.Name ~= "Glow" then
                    new = NumberRange.new
                    v1 = j.Speed.Min * v4
                    j.Speed = new(v1, j.Speed.Max * v4)
                end
            end
            EmitterManager.toggle(v2, true)
            return {vfxModel = v2}
        end
        return nil
    end,
    onRemoved = function(a1, a2, a3) -- Line: 78 -- upvalues: EmitterManager (val), Debris (val)
        if a3 and a3.vfxModel then
            EmitterManager.toggle(a3.vfxModel, false)
            Debris:AddItem(a3.vfxModel, 4)
            return
        end
    end,
}