-- Script path: ReplicatedStorage.Content.Tower.Demoman.Upgrade
-- Decompile time: 1.17 ms

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
            a3.ExplosionRadius = 3.5
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 17
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon:ClearAllChildren()
        a2.Weapon.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 30 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 32
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            a1.Weapon:ClearAllChildren()
            local Weapon = a2:FindFirstChild("Weapon")
            if Weapon then
                local Shell = Weapon:FindFirstChild("Shell")
                if Shell then
                    Shell.Transparency = 1
                end
                Weapon.Parent = a1.Weapon
                return
            end
        end
    end,
    function(a1, a2, a3) -- Line: 52 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 54
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            local Vest = a1.Upgrades["0"]:FindFirstChild("Vest")
            if Vest then
                Vest:Destroy()
            end
            local Cap = a1.Upgrades["0"]:FindFirstChild("Cap")
            if Cap then
                Cap:Destroy()
                return
            end
        end
    end,
}