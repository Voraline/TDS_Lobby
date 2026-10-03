-- Script path: ReplicatedStorage.Content.Tower.Paintballer.Upgrade
-- Decompile time: 1.07 ms

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
            a3.ExplosiveRange = 3
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 17
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a3.ExplosiveRange = 3
    end,
    function(a1, a2, a3) -- Line: 28 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        a1.Weapon.Handle.Transparency = 1
        a1.Weapon.Handle.Parent = a1.Upgrades["0"]
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 32
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a2.Handle.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 42 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.ExplosiveRange = 4
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 44
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a3.ExplosiveRange = 4
    end,
    function(a1, a2, a3) -- Line: 55 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.ExplosiveRange = 5
            return
        end
        a1.Upgrades["1"].Mask:Destroy()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 58
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a3.ExplosiveRange = 5
    end,
}