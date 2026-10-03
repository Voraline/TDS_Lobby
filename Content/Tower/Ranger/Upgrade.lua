-- Script path: ReplicatedStorage.Content.Tower.Ranger.Upgrade
-- Decompile time: 1.75 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 6
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 19 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 21
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 34 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Lead = true
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 36
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
        a1.Weapon.Sniper:Destroy()
        a2.Sniper.Parent = a1.Weapon
        a1.Upgrades["2"].Laser:Destroy()
        if a1.Name ~= "Wraith" then
            return
        end
        a1.Upgrades["0"].Chestplate1.Transparency = 1
    end,
    function(a1, a2, a3) -- Line: 58 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 60
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 73 -- upvalues: RunService (val)
        if RunService:IsClient() then
            a1.Upgrades["2"].Shades:Destroy()
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 77
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                    return
                end
                if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                    a2.Enabled = true
                end
            end)
            a1.Weapon.Sniper:Destroy()
            a2.Sniper.Parent = a1.Weapon
            if a2:FindFirstChild("Colors") then
                a1.Upgrades["0"].Colors:Destroy()
                local Armor = a1.Upgrades["4"]:FindFirstChild("Armor")
                if Armor then
                    Armor:Destroy()
                end
                local Bag = a1.Upgrades["3"]:FindFirstChild("Bag")
                if Bag then
                    Bag:Destroy()
                end
            end
            if a1.Name == "Wraith" then
                a1.Upgrades["3"].Chestplate2.Transparency = 1
                a1.Upgrades["1"].BraceR.Transparency = 1
                a1.Upgrades["1"].BraceL.Transparency = 1
                return
            end
        end
    end,
}