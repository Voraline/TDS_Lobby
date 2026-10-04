-- Script path: ReplicatedStorage.Content.Tower.Militant.Upgrade
-- Decompile time: 1.71 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 6 -- upvalues: a1 (val)
                if a2:IsA("BasePart") then
                    if a1.Name == "Ghost" then
                        a2.Transparency = 0.6
                        return
                    end
                    a2.Transparency = 0
                    return
                end
                if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                    a2.Enabled = true
                end
            end)
            if a1.Name == "Arsenal" then
                a1.HumanoidRootPart.UpgradeSound:Play()
                return
            end
        end
    end,
    function(a1, a2, a3) -- Line: 27 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 29 -- upvalues: a1 (val)
                if a2:IsA("BasePart") then
                    if a1.Name == "Ghost" then
                        a2.Transparency = 0.6
                        return
                    end
                    a2.Transparency = 0
                end
            end)
            if a1.Name == "Arsenal" then
                a1.Head.face.Transparency = 1
                a1.Head.face2.Transparency = 0
                a1.HumanoidRootPart.UpgradeSound:Play()
            end
            local Gun = a2:FindFirstChild("Gun")
            if Gun then
                a1.Weapon:ClearAllChildren()
                Gun.Parent = a1.Weapon
                return
            end
        end
    end,
    function(a1, a2, a3) -- Line: 55 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 57 -- upvalues: a1 (val)
            if a2:IsA("BasePart") then
                if a1.Name == "Ghost" then
                    a2.Transparency = 0.6
                    return
                end
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                a2.Enabled = true
            end
        end)
        if a1.Name == "Arsenal" then
            a1.Upgrades["0"].Hat:Destroy()
            a1.Upgrades["2"].Mask:Destroy()
            a1.Head.face2.Transparency = 1
            a1.Head.face3.Transparency = 0
            a1.HumanoidRootPart.UpgradeSound:Play()
        end
        local Gun = a1.Weapon.Gun
        Gun.Mag.Transparency = 1
        a2.Attachments.Parent = Gun
    end,
    function(a1, a2, a3) -- Line: 89 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 91 -- upvalues: a1 (val)
                if a2:IsA("BasePart") then
                    if a1.Name == "Ghost" then
                        a2.Transparency = 0.6
                        return
                    end
                    a2.Transparency = 0
                    return
                end
                if a2:IsA("Beam") or a2.Name == "Laser" and a2:IsA("ParticleEmitter") then
                    a2.Enabled = true
                end
            end)
            a1.Upgrades["0"].Outfit:Destroy()
            a1.Upgrades["0"].Colors:Destroy()
            a1.Upgrades["0"].Armor:Destroy()
            if a1.Name == "Arsenal" then
                a1.HumanoidRootPart.UpgradeSound:Play()
            end
            local Gun = a2:FindFirstChild("Gun")
            if Gun then
                a1.Weapon:ClearAllChildren()
                Gun.Parent = a1.Weapon
                return
            end
        end
    end,
}