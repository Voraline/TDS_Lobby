-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.BurnVisuals
-- Decompile time: 0.76 ms

local Particles = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
return {
    onAdded = function(a1, a2) -- Line: 13 -- upvalues: Particles (val)
        local v1
        local Hitbox = a1.Hitbox or a1.Part
        if not Hitbox then
            return nil
        end
        local Flames = Particles:FindFirstChild("Flames")
        if not Flames then
            return nil
        end
        local v2 = {}
        for i, j in Flames:GetChildren() do
            v1 = j:Clone()
            v1.Parent = Hitbox
            v1.Enabled = true
            table.insert(v2, v1)
        end
        return {particles = v2}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 35
        if a3 and a3.particles then
            for i, j in a3.particles do
                if not j:IsA("ParticleEmitter") then
                    j:Destroy()
                else
                    j.Enabled = false
                    task.delay(j.Lifetime.Max, function() -- Line: 43 -- upvalues: j (val)
                        j:Destroy()
                    end)
                end
            end
            return
        end
    end,
}