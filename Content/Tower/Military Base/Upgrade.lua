-- Script path: ReplicatedStorage.Content.Tower.Military Base.Upgrade
-- Decompile time: 1.26 ms

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
        a3.UnitToSend = "Humvee"
    end,
    function(a1, a2, a3) -- Line: 16 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 18
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            return
        end
        a3.UnitToSend = "Humvee 2"
    end,
    function(a1, a2, a3) -- Line: 28 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 30
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            return
        end
        a3.UnitToSend = "Humvee 3"
    end,
    function(a1, a2, a3) -- Line: 40 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.UnitToSend = "Tank"
            return
        end
        a2.Parent["0"]:ClearAllChildren()
        a2.Parent["1"]:ClearAllChildren()
        a2.Parent["2"]:ClearAllChildren()
        a2.Parent["3"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 47
            if a2:IsA("BasePart") then
                if not a2:FindFirstChildWhichIsA("Texture") then
                    a2.Transparency = 0
                end
            elseif a2:IsA("Texture") and not a2:FindFirstChildWhichIsA("Texture") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 59 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            a3.UnitToSend = "Railgun Tank"
            return
        end
        a2.Parent["4"]:ClearAllChildren()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 63
            if a2:IsA("BasePart") then
                if not a2:FindFirstChildWhichIsA("Texture") then
                    a2.Transparency = 0
                end
            elseif a2:IsA("Texture") and not a2:FindFirstChildWhichIsA("Texture") then
                a2.Transparency = 0
            end
        end)
    end,
}