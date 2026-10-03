-- Script path: ReplicatedStorage.Content.Tower.Accelerator.Upgrade
-- Decompile time: 2.38 ms

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
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 17
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            a1.Upgrades["0"].Pack:Destroy()
            local Outfit = a2:FindFirstChild("Outfit")
            if Outfit then
                Outfit:Destroy()
            end
        end
    end,
    function(a1, a2, a3) -- Line: 31 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 33
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            local Sleeves = a1.Upgrades["0"]:FindFirstChild("Sleeves")
            if Sleeves then
                Sleeves:Destroy()
                local Gloves = a1.Upgrades["1"]:FindFirstChild("Gloves")
                if Gloves then
                    Gloves:Destroy()
                    return
                end
            end
        end
    end,
    function(a1, a2, a3) -- Line: 51 -- upvalues: RunService (val)
        if not RunService:IsClient() then
            return
        end
        table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 53
            if a2:IsA("BasePart") then
                a2.Transparency = 0
            end
        end)
    end,
    function(a1, a2, a3) -- Line: 62 -- upvalues: RunService (val)
        if RunService:IsClient() then
            table.foreach(a2:GetDescendants(), function(a1, a2) -- Line: 64
                if a2:IsA("BasePart") then
                    a2.Transparency = 0
                end
            end)
            a1.Upgrades["1"].Goggles:Destroy()
            a1.Upgrades["2"].Pack:Destroy()
            local Helmet = a1.Upgrades["3"]:FindFirstChild("Helmet")
            if Helmet then
                Helmet:Destroy()
            end
            local Attribute = a2:GetAttribute("BeamColor") or Color3.fromRGB(180, 119, 255)
            a3.beamColor = Attribute
            if a3.lightningBeam ~= nil then
                a3.lightningBeam.Color = Attribute
            end
            if a2:FindFirstChild("Armor") then
                local Armor = a1.Upgrades["3"]:FindFirstChild("Armor")
                if Armor then
                    Armor:Destroy()
                end
            end
            if a2:FindFirstChild("Hood") then
                local Hood = a1.Upgrades["4"]:FindFirstChild("Hood")
                if Hood then
                    Hood:Destroy()
                end
            end
            if a2:FindFirstChild("Outfit") then
                local Outfit = a1.Upgrades["0"]:FindFirstChild("Outfit")
                if Outfit then
                    Outfit:Destroy()
                end
            end
            if a1.Name ~= "Hazmat" then
                for k, v in pairs(a1:GetDescendants()) do
                    if not v:IsA("BasePart") or v.Material ~= Enum.Material.Neon then
                        if v:IsA("ParticleEmitter") or v:IsA("Beam") then
                            v.Color = ColorSequence.new(Attribute, Attribute)
                        end
                    elseif v.Name ~= "GridPart" then
                        v.Color = Attribute
                    elseif v:IsA("ParticleEmitter") or v:IsA("Beam") then
                        v.Color = ColorSequence.new(Attribute, Attribute)
                    end
                end
            end
        end
    end,
}