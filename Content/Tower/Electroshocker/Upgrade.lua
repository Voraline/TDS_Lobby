-- Script path: ReplicatedStorage.Content.Tower.Electroshocker.Upgrade
-- Decompile time: 1.65 ms

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
    end,
    function(a1, a2, a3) -- Line: 49 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 51 -- upvalues: a1 (val)
            if a2:IsA("BasePart") then
                if a1.Name == "Ghost" then
                    a2.Transparency = 0.6
                    return
                end
                a2.Transparency = 0
            end
        end)
        a1.Weapon:ClearAllChildren()
        local Gun = a2.Gun
        Gun.Parent = a1.Weapon
        for k, v in pairs(Gun.Handle:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = true
            end
        end
    end,
    function(a1, a2, a3) -- Line: 73 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1_2, a2) -- Line: 75 -- upvalues: a1 (val)
            if a2:IsA("BasePart") then
                if a1.Name == "Ghost" then
                    a2.Transparency = 0.6
                    return
                end
                a2.Transparency = 0
            end
        end)
        if a2:FindFirstChild("Outfit") then
            a1.Upgrades["0"].Outfit:Destroy()
        end
        a1.Upgrades["0"].Hat:Destroy()
        a1.Upgrades["3"].Armor:Destroy()
        a1.Upgrades["2"].Headset:Destroy()
        a1.Upgrades["1"].Goggles:Destroy()
    end,
}