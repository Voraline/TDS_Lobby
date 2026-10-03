-- Script path: ReplicatedStorage.Content.Tower.DJ Booth.Upgrade
-- Decompile time: 2.40 ms

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
        a2.Laptop.Parent = a1.Weapon.Booth
    end,
    function(a1, a2, a3) -- Line: 17 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        a1.Upgrades["0"].Headphones:Destroy()
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 20
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 29 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 31
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
        a2.Speakers.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 42 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 44
            if a2:IsA("BasePart") then
                a2.Transparency = 0
                return
            end
            if a2:IsA("Beam") then
                a2.Enabled = true
            end
        end)
        a1.Weapon.Booth:Destroy()
        if a1.Name ~= "Neko" and a1.Name ~= "Ghost" and a1.Name ~= "Plushie" then
            a3:CreateVisualizer(a2.Booth.Screen, 10)
        end
        a2.Booth.Parent = a1.Weapon
    end,
    function(a1, a2, a3) -- Line: 67 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 69
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                    return
                end
                if a2:IsA("Beam") then
                    a2.Enabled = true
                end
            end)
            a1.Weapon.Speakers:Destroy()
            a1.Upgrades["4"].Jacket:Destroy()
            a1.Upgrades["2"].Cap:Destroy()
            a1.Upgrades["0"].Colors:Destroy()
            if a1.Name == "Plushie" then
                a1.Weapon.Booth:Destroy()
            end
            if a1.Name == "Neko" then
                a1.Weapon:ClearAllChildren()
                a3:CreateVisualizer(a2.Booth.Screen.Screen1, 10)
                a3:CreateVisualizer(a2.Booth.Screen.Screen2, 4)
                a3:CreateVisualizer(a2.Booth.Screen.Screen3, 4)
                for k, v in pairs(a2.Booth:GetChildren()) do
                    if v.Name == "Light" then
                        v.Root.Transparency = 1
                        v.Light.Transparency = 1
                        v.AnimationController:LoadAnimation(a1.Animations.Lights):Play()
                    end
                end
            elseif a1.Name == "Ghost" then
                a2.Stage.Fog.Emitter.Enabled = true
                a2.FireMachine.Parent = a1.Weapon
            end
            a2.Booth.Parent = a1.Weapon
            if a1.Name == "Neon Rave" then
                local v1 = a3
                for k2, i in pairs(a1:GetDescendants()) do
                    if i.Name == "Neon" then
                        if i:IsA("BasePart") then
                            table.insert(v1.NeonParts, i)
                        end
                    elseif i.Name == "Screen" and i:IsA("BasePart") then
                        table.insert(v1.NeonParts, i)
                    end
                end
                return
            end
        end
    end,
}