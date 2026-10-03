-- Script path: ReplicatedStorage.Content.Tower.Farm.Upgrade
-- Decompile time: 1.18 ms

local RunService = game:GetService("RunService")
return {
    function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Income = 100
            return
        end
        a2.Parent["0"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 7
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 18 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Income = 250
            return
        end
        a2.Parent["1"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 21
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 32 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Income = 500
            return
        end
        a2.Parent["2"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 35
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 46 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Income = 750
            return
        end
        a2.Parent["3"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 49
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 60 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.Income = 1500
            return
        end
        if a1.Name ~= "Xmas" then
            a2.Parent["4"]:ClearAllChildren()
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 65
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
}