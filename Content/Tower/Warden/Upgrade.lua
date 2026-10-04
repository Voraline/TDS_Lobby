-- Script path: ReplicatedStorage.Content.Tower.Warden.Upgrade
-- Decompile time: 1.44 ms

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
        local Baton = a2.Baton
        a1.Weapon.Baton:Destroy()
        Baton.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 31 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.canStun = true
            a3.Lead = true
            a3.stunLength = 1.5
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 33
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        local Hat = a1.Upgrades["0"]:FindFirstChild("Hat")
        local Equipment = a1.Upgrades["1"]:FindFirstChild("Equipment")
        if Hat then
            Hat:Destroy()
        end
        if Equipment then
            Equipment:Destroy()
        end
        local Baton = a2.Baton
        a1.Weapon.Baton:Destroy()
        Baton.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 61 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.canBlock = true
            a3.stunLength = 2
            a3.animNumber = 4
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 63
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
        local Shirt = a1.Upgrades["0"]:FindFirstChild("Shirt")
        local Armor = a1.Upgrades["2"]:FindFirstChild("Armor")
        local Helmet = a1.Upgrades["3"]:FindFirstChild("Helmet")
        if Helmet then
            Helmet:Destroy()
        end
        if a2:FindFirstChild("Shirt") and Shirt then
            Shirt:Destroy()
        end
        if Armor then
            Armor:Destroy()
        end
        local Baton = a2.Baton
        a1.Weapon.Baton:Destroy()
        Baton.Parent = a1.Weapon
        a2.Shield.Parent = a1.Weapon
    end,
}