-- Script path: ReplicatedStorage.Content.Tower.Cowboy.Upgrade
-- Decompile time: 1.43 ms

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
            a3.spinDuration = 1.3
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 28
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon.Gun1:Destroy()
        a2.Gun1.Parent = a1.Weapon
        a3.spinDuration = 1.3
    end,
    function(a1, a2, a3) -- Line: 43 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 45
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        local Scarf = a2:FindFirstChild("Scarf")
        if Scarf and Scarf:FindFirstChild("Torso") then
            a1.Upgrades["0"].Shirt:Destroy()
        end
        a2.Gun2.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 63 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.spinDuration = 1
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 65
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        local Outfit = a1.Upgrades["0"]:FindFirstChild("Outfit")
        if Outfit then
            Outfit:Destroy()
        end
        if a1.Name == "Ducky" then
            a1.Upgrades["4"].Scarf:Destroy()
        end
        a1.Upgrades["0"].Arm:Destroy()
        a1.Upgrades["2"].Shades:Destroy()
        a1.Weapon.Gun1:Destroy()
        a1.Weapon.Gun2:Destroy()
        a2.Gun1.Parent = a1.Weapon
        a2.Gun2.Parent = a1.Weapon
        a3.spinDuration = 1
    end,
}