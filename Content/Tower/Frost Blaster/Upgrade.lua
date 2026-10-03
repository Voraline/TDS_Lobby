-- Script path: ReplicatedStorage.Content.Tower.Frost Blaster.Upgrade
-- Decompile time: 1.17 ms

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
        a1.Head.face.Transparency = 1
    end,
    function(a1, a2, a3) -- Line: 27 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.DefenseMelt = 5
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 29
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon.Gun.Handle.Start.FrostBurn.Enabled = true
    end,
    function(a1, a2, a3) -- Line: 40 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.MaxTime = 0.8
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 42
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Weapon.Gun:Destroy()
        a2.Gun.Handle2.Start.FrostBurn.Enabled = true
        a2.Gun.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 55 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 57
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Upgrades["1"].Backpack.Transparency = 1
        a1.Upgrades["2"].Goggles.Transparency = 1
        a1.Upgrades["2"].Headphones.Transparency = 1
    end,
}