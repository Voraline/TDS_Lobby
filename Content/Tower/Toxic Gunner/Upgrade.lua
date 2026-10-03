-- Script path: ReplicatedStorage.Content.Tower.Toxic Gunner.Upgrade
-- Decompile time: 0.98 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 6
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            return
        end
        a3.ReloadSpeed = 5
    end,
    function(a1, a2, a3) -- Line: 16 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.PoisonDamage = 1
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 18
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a2.Pack.Glass.Transparency = 0.5
        a1.Upgrades["0"].Goggles:Destroy()
    end,
    function(a1, a2, a3) -- Line: 31 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Burst = 6
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 33
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon.Gun:Destroy()
        a2.Gun.Parent = a1.Weapon
        a3.Burst = 6
    end,
    function(a1, a2, a3) -- Line: 48 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Burst = 10
            a3.PoisonLength = 4
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 50
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Upgrades["2"].Mask:Destroy()
        a1.Weapon.Gun:Destroy()
        a2.Gun.Parent = a1.Weapon
        a3.Burst = 10
    end,
}