-- Script path: ReplicatedStorage.Content.Tower.Mortar.Upgrade
-- Decompile time: 1.10 ms

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
    end,
    function(a1, a2, a3) -- Line: 26 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.ExplosionRadius = 5
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 28
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon:ClearAllChildren()
        a2.Mortar.Parent = a1.Weapon
        a3.ExplosionRadius = 5
    end,
    function(a1, a2, a3) -- Line: 42 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.ExplosionRadius = 6
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 44
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a3.ExplosionRadius = 6
    end,
    function(a1, a2, a3) -- Line: 55 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.ExplosionRadius = 7
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 57
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon:ClearAllChildren()
        a2.Mortar.Parent = a1.Weapon
    end,
}