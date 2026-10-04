-- Script path: ReplicatedStorage.Content.Tower.Soldier.Upgrade
-- Decompile time: 1.24 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 6
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 19 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 21
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 34 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 36
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
        a1.Upgrades["0"].Vest:Destroy()
        local Gun = a1.Weapon.Gun
        Gun.Drum.Transparency = 0
        Gun.Mag.Transparency = 1
    end,
    function(a1, a2, a3) -- Line: 57 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 59
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
        a1.Upgrades["0"].Outfit:Destroy()
        a1.Upgrades["0"].Cap:Destroy()
        a1.Upgrades["3"].Vest:Destroy()
        a1.Weapon.Gun:Destroy()
        a2.Gun.Parent = a1.Weapon
    end,
}