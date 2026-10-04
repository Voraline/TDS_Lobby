-- Script path: ReplicatedStorage.Content.Tower.Necromancer.Upgrade
-- Decompile time: 1.47 ms

local u7 = game:GetService("RunService"):IsClient()
return {
    function(a1, a2, a3) -- Line: 5 -- upvalues: u7 (val)
        if not u7 then
            return
        end
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
        a2.Sight.Parent = a1.Weapon.Gun
    end,
    function(a1, a2, a3) -- Line: 19 -- upvalues: u7 (val)
        if not u7 then
            return
        end
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            elseif j:IsA("ParticleEmitter") then
                j.Enabled = true
            end
        end
    end,
    function(a1, a2, a3) -- Line: 33 -- upvalues: u7 (val)
        if not u7 then
            return
        end
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
    end,
    function(a1, a2, a3) -- Line: 45 -- upvalues: u7 (val)
        if not u7 then
            return
        end
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
        a2.Tank.Parent = a1.Weapon.Gun
    end,
    function(a1, a2, a3) -- Line: 59 -- upvalues: u7 (val)
        if not u7 then
            return
        end
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
        a1.Upgrades["2"].Accessories:Destroy()
    end,
    function(a1, a2, a3) -- Line: 73 -- upvalues: u7 (val)
        if not u7 then
            return
        end
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.Transparency = 0
            end
        end
        a1.Upgrades["0"].Arm:Destroy()
        a1.Upgrades["1"].Gloves:Destroy()
        local Transparency = a1.Weapon.Gun.Ammo.Transparency
        a1.Weapon.Gun:Destroy()
        a2.Gun.Ammo.Transparency = Transparency
        a2.Gun.Parent = a1.Weapon
    end,
}