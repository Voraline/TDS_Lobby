-- Script path: ReplicatedStorage.Shared.Modules.Upgrades.TowerUpgradeMiddleware
-- Decompile time: 2.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware).new({dontClean = true})
local Boundedness = v1.Boundedness
local u23 = if not RunService:IsServer() then "Client" else "Server"
local u28 = Color3.fromRGB(180, 119, 255)
local u29 = {Screen = 10, Screen2 = 4, Screen3 = 4}
v1:Hook("DJ Booth", Boundedness.Inbound, function(a1, a2) -- Line: 20 -- upvalues: u23 (val), u29 (val) -- types: a2: number
    if u23 ~= "Client" then
        return
    end
    local Model = a1.Model
    local Booth = Model.Upgrades[tostring(a2)]:FindFirstChild("Booth", true)
    if Booth then
        local v1
        for i, j in Booth:GetChildren() do
            if u29[j.Name] then
                v1 = u29[j.Name]
                a1:CreateVisualizer(j, v1)
            end
        end
    end
    if a2 == 5 and Booth then
        for k, v in pairs(Booth:GetChildren()) do
            if v.Name == "Light" then
                v.AnimationController:LoadAnimation(Model.Animations.Lights):Play()
            end
        end
    end
end)
v1:Hook("Accelerator", Boundedness.Outbound, function(a1, a2) -- Line: 54 -- upvalues: u23 (val), u28 (val) -- types: a2: number
    if u23 ~= "Client" then
        return
    end
    local Model = a1.Model
    if Model.Name == "Champion" then
        return
    end
    local v1 = Model.Upgrades[(tostring(a2))]
    if a2 == 5 then
        local Attribute = v1:GetAttribute("BeamColor") or u28
        a1.beamColor = Attribute
        if a1.lightningBeam ~= nil then
            a1.lightningBeam.Color = Attribute
        end
        for k, v in pairs(Model:GetDescendants()) do
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
end)
v1:Hook("Engineer", Boundedness.Outbound, function(a1, a2) -- Line: 91 -- upvalues: u23 (val) -- types: a2: number
    if u23 ~= "Client" then
        return
    end
    local Model = a1.Model
    local v1 = Model.Upgrades[tostring(a2)]
    if a2 == 1 then
        local Sight = v1:FindFirstChild("Sight")
        if not Sight then
            return
        end
        Sight.Parent = Model.Weapon.Gun
        return
    end
    if a2 == 3 then
        local Tank = v1:FindFirstChild("Tank")
        if Tank then
            Tank.Parent = Model.Weapon.Gun
        end
    end
end)
v1:Hook("Turret", Boundedness.Inbound, function(a1, a2) -- Line: 113 -- upvalues: u23 (val) -- types: a2: number
    if u23 ~= "Client" then
        return
    end
    for k, v in pairs(a1.Model.Upgrades[tostring(a2)]:GetDescendants()) do
        if v:IsA("RopeConstraint") then
            v.Visible = true
        end
    end
end)
v1:Hook("Minigunner", Boundedness.Inbound, function(a1, a2) -- Line: 131 -- upvalues: u23 (val), ReplicatedStorage (val) -- types: a2: number
    if u23 ~= "Client" then
        return
    end
    local Model = a1.Model
    local v1 = Model.Upgrades[tostring(a2)]
    if Model.Name == "Golden" and a2 >= 4 then
        (require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)).AppendJoints(
            a1,
            {(((v1:WaitForChild("Minigun")):WaitForChild("MaxBase")):WaitForChild("Handle"))}
        )
    end
end)
return v1