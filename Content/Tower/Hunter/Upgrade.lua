-- Script path: ReplicatedStorage.Content.Tower.Hunter.Upgrade
-- Decompile time: 0.88 ms

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
        a1.Upgrades["0"].Hat:Destroy()
    end,
    function(a1, a2, a3) -- Line: 28 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 30
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon.Gun:Destroy()
        a2.Gun.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 42 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 44
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon.Gun:Destroy()
        a2.Gun.Parent = a1.Weapon
    end,
}