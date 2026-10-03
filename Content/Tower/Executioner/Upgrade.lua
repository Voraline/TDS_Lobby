-- Script path: ReplicatedStorage.Content.Tower.Executioner.Upgrade
-- Decompile time: 1.13 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 6
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 15 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 17
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a2.Handle.Transparency = a1.Weapon.Handle.Transparency
        a1.Weapon.Handle:Destroy()
        a2.Handle.Parent = a1.Weapon
        a3:CreateProjectile()
    end,
    function(a1, a2, a3) -- Line: 33 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 35
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            return
        end
        a3.MaxBounce = 3
    end,
    function(a1, a2, a3) -- Line: 45 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 47
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Upgrades["0"].Outfit:Destroy()
    end,
    function(a1, a2, a3) -- Line: 57 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.MaxBounce = 7
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 59
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Upgrades["0"].Vest:Destroy()
        a1.Upgrades["4"].Outfit:Destroy()
        a2.Handle.Transparency = a1.Weapon.Handle.Transparency
        a1.Weapon.Handle:Destroy()
        a2.Handle.Parent = a1.Weapon
        a3:CreateProjectile()
    end,
}