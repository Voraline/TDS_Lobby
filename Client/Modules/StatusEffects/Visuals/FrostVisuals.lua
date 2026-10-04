-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.FrostVisuals
-- Decompile time: 4.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local RunService = game:GetService("RunService")
local Particles = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
return {
    onAdded = function(a1, a2) -- Line: 17 -- upvalues: Particles (val), ParticleLODController (val), Enum (val), RunService (val)
        local Attribute, v1, v2
        local Hitbox = a1.Hitbox or a1.Part
        if not Hitbox then
            return nil
        end
        local Frost = Particles:FindFirstChild("Frost")
        if not Frost then
            return nil
        end
        local v3 = {}
        local v4 = ParticleLODController.getOneShotMultiplier(Hitbox.Position)
        local v5 = a1
        for i, j in Frost:GetChildren() do
            v1 = j:Clone()
            v1.Parent = Hitbox
            if v1:IsA("ParticleEmitter") then
                Attribute = v1:GetAttribute("EmitCount")
                if Attribute then
                    v2 = ParticleLODController.scaleEmitCount(Attribute, v4)
                    if v2 > 0 then
                        v1:Emit(v2)
                    end
                end
                v1.Enabled = true
            end
            table.insert(v3, v1)
        end
        local u61 = nil
        local C0 = nil
        local v6 = nil
        local StatusEffectRenderer = v5.StatusEffectRenderer and v5.StatusEffectRenderer:has(Enum.StatusEffect.Boss)
        if not StatusEffectRenderer then
            local Model = v5.Model
            if Model then
                for k, n in Model:GetDescendants() do
                    if n:IsA("Motor6D") and n.Name == "RootJoint" then
                        u61 = n
                        C0 = n.C0
                        break
                    end
                end
            end
            if u61 and C0 then
                v6 = RunService.Heartbeat:Connect(function() -- Line: 68 -- upvalues: u61 (ref), C0 (ref)
                    if u61 and u61.Parent then
                        local v1 = (math.random() - 0.5) * 0.12
                        local v2 = (math.random() - 0.5) * 0.12
                        local v3 = (math.random() - 0.5) * 0.12
                        u61.C0 = C0 * CFrame.Angles(v1, v2, v3)
                    end
                end)
            end
        end
        return {particles = v3, rootJoint = u61, originalC0 = C0, connection = v6}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 87
        if not a3 then
            return
        end
        if a3.connection then
            a3.connection:Disconnect()
        end
        if a3.rootJoint and a3.originalC0 then
            a3.rootJoint.C0 = a3.originalC0
        end
        if a3.particles then
            for i, j in a3.particles do
                if not j:IsA("ParticleEmitter") then
                    j:Destroy()
                else
                    j.Enabled = false
                    task.delay(j.Lifetime.Max, function() -- Line: 105 -- upvalues: j (val)
                        j:Destroy()
                    end)
                end
            end
        end
    end,
}