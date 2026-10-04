-- Script path: ReplicatedStorage.Content.Tower.Minigunner.Upgrade
-- Decompile time: 1.82 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if RunService:IsClient() then
            return table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 6 -- upvalues: a1 (val)
                if a2:IsA("BasePart") then
                    if a1.Name == "Ghost" then
                        a2.Transparency = 0.6
                        return
                    end
                    a2.Transparency = 0
                end
            end)
        end
    end,
    function(a1, a2, a3) -- Line: 19 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 21 -- upvalues: a1 (val)
            if a2:IsA("BasePart") then
                if a1.Name == "Ghost" then
                    a2.Transparency = 0.6
                    return
                end
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 34 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 36 -- upvalues: a1 (val)
            if a2:IsA("BasePart") then
                if a1.Name == "Ghost" then
                    a2.Transparency = 0.6
                    return
                end
                a2.Transparency = 0
            end
        end)
        local Minigun = a2.Minigun
        if 0 < a1.Weapon.Minigun.Handle.Barrel.MaxVelocity then
            for k, v in pairs(Minigun:GetDescendants()) do
                if v:IsA("Motor6D") and v.Name == "Barrel" then
                    v.MaxVelocity = 0.4
                end
            end
        end
        a1.Upgrades["0"].Sleeves:Destroy()
        a1.Weapon:ClearAllChildren()
        Minigun.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 63 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 65 -- upvalues: a1 (val)
            if a2:IsA("BasePart") then
                if a1.Name == "Ghost" then
                    a2.Transparency = 0.6
                    return
                end
                a2.Transparency = 0
            end
        end)
        if not a2:FindFirstChild("Turret") then
            local Minigun = a2.Minigun
            if 0 < a1.Weapon.Minigun.Handle.Barrel.MaxVelocity then
                for k, v in pairs(Minigun:GetDescendants()) do
                    if v:IsA("Motor6D") and v.Name == "Barrel" then
                        v.MaxVelocity = 0.4
                    end
                end
            end
            a1.Weapon:ClearAllChildren()
            Minigun.Parent = a1.Weapon
        else
            if 0 < a1.Weapon.Minigun.Handle.Barrel.MaxVelocity then
                a2.Turret.Handle.Barrel.MaxVelocity = 0.4
            end
            a1.Weapon:ClearAllChildren()
            a2.Turret.Parent = a1.Weapon
        end
        if a2:FindFirstChild("Outfit") then
            a1.Upgrades["0"].Armor:Destroy()
            a1.Upgrades["3"].Armor:Destroy()
            a1.Upgrades["0"].Outfit:Destroy()
        end
        if a1.Name == "Golden" then
            if a3.fireAnim.IsPlaying then
                a3.fireAnimMax:Play()
            end
            a3.fireAnim:Stop()
            a3.holster:Stop()
        end
        a1.Upgrades["1"].Mask:Destroy()
        a1.Upgrades["2"].Goggles:Destroy()
    end,
}