-- Script path: ReplicatedStorage.Content.Tower.Freezer.Upgrade
-- Decompile time: 1.62 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 6
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            return
        end
        a3.MaxTime = 1.35
    end,
    function(a1, a2, a3) -- Line: 16 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 18
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
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
        a1.Weapon.Handle.Start.FrostBurn.Enabled = true
    end,
    function(a1, a2, a3) -- Line: 40 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 42
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        if a1.Name == "IcyTea" then
            a1.Upgrades["0"].Outfit:Destroy()
        end
        if a1.Name == "Foam" then
            local Handle = a2.Handle
            Handle.Start.FrostBurn.Enabled = true
            a1.Weapon.Handle:Destroy()
            Handle.Parent = a1.Weapon
            return
        end
        a1.Weapon.Handle.Transparency = 1
        a1.Weapon.Handle.Start.FrostBurn.Enabled = false
        a1.Weapon.Handle.Parent = a1.Upgrades["0"]
        a2.Handle2.Parent = a1.Weapon
        a1.Weapon.Handle2.Start.FrostBurn.Enabled = true
    end,
    function(a1, a2, a3) -- Line: 71 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.DefenseMelt = 10
            a3.MaxTime = 1.5
            return
        end
        if a1.Name ~= "Deep Freeze" and a1.Name ~= "Foam" then
            local v1 = a1
            for k, v in pairs(a1.Upgrades["4"]:GetChildren()) do
                if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                    v.Transparency = 1
                end
            end
            if v1.Name ~= "Mint Choco" then
                v1.Upgrades["3"].Hat:Destroy()
            end
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 87
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
}