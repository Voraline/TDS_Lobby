-- Script path: ReplicatedStorage.Content.Tower.Scout.Upgrade
-- Decompile time: 1.17 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 6
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
        end
    end,
    function(a1, a2, a3) -- Line: 14 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 16
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
        end
    end,
    function(a1, a2, a3) -- Line: 24 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 26
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        local Shirt = a2:FindFirstChild("Shirt")
        local Shirt_2 = a1.Upgrades["0"]:FindFirstChild("Shirt")
        if Shirt and Shirt_2 then
            Shirt_2:Destroy()
        end
        a1.Weapon.Gun1:Destroy()
        a2.Gun1.Parent = a1.Weapon
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
        if a1.Name == "Cookie" then
            a1.Upgrades["3"].Armor:Destroy()
            a1.Upgrades["1"].Gloves:Destroy()
            a2.Outfit.Torso.Embers.Enabled = true
            a2.Outfit.Torso.PointLight.Enabled = true
        end
        local Outfit = a2:FindFirstChild("Outfit")
        local Outfit_2 = a1.Upgrades["0"]:FindFirstChild("Outfit")
        if Outfit and Outfit_2 then
            Outfit_2:Destroy()
        end
        local Shirt = a2:FindFirstChild("Shirt")
        local Shirt_2 = a1.Upgrades["0"]:FindFirstChild("Shirt")
        if Shirt and Shirt_2 then
            Shirt_2:Destroy()
        end
        a2.Gun2.Parent = a1.Weapon
    end,
}