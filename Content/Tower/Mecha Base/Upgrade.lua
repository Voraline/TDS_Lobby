-- Script path: ReplicatedStorage.Content.Tower.Mecha Base.Upgrade
-- Decompile time: 1.21 ms

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
        a3.UnitToSend = "Mark1Rocket"
    end,
    function(a1, a2, a3) -- Line: 16 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.UnitToSend = "Mark2"
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 18
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a1.Upgrades["0"].Mech1:Destroy()
        a2.Parent["0"]:ClearAllChildren()
        a2.Parent["1"]:ClearAllChildren()
    end,
    function(a1, a2, a3) -- Line: 31 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.UnitToSend = "Mark3"
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 33
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a2.Parent["2"]:ClearAllChildren()
    end,
    function(a1, a2, a3) -- Line: 44 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.UnitToSend = "Mark4"
            return
        end
        a2.Parent["3"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 47
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 57 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.UnitToSend = "Mark5"
            return
        end
        a2.Parent["4"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 60
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
}