-- Script path: ReplicatedStorage.Content.Tower.Sniper.Upgrade
-- Decompile time: 1.18 ms

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
            a3.Lead = true
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 28
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon:ClearAllChildren()
        a2.Gun.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 41 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Lead = true
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 43
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon:ClearAllChildren()
        a2.Gun.Parent = a1.Weapon
    end,
}