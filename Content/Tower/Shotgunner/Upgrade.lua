-- Script path: ReplicatedStorage.Content.Tower.Shotgunner.Upgrade
-- Decompile time: 1.37 ms

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
            a3.ShotSize = 8
            a3.Spread = 60
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 17
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        local Gun = a2.Gun
        a1.Weapon.Gun:Destroy()
        Gun.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 33 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 35
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        if a1.Name == "Vigilante" then
            a1.Upgrades["0"].Outfit.Sleeves:Destroy()
            return
        end
        a1.Upgrades["0"].Vest:Destroy()
    end,
    function(a1, a2, a3) -- Line: 51 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Spread = 50
            a3.ShotSize = 12
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 53
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Upgrades["0"].Cap:Destroy()
        if a1.Name == "Vigilante" then
            a1.Upgrades["0"].Mask:Destroy()
        end
        local Gun = a2.Gun
        a1.Weapon.Gun:Destroy()
        Gun.Parent = a1.Weapon
    end,
}