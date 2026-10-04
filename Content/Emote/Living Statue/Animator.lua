-- Script path: ReplicatedStorage.Content.Emote.Living Statue.Animator
-- Decompile time: 1.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: Animation (val)
    local v1
    local Instance = a1.Character.Instance
    a1:OnTrackPlayed("rbxassetid://131886008909730", function(a1) -- Line: 17 -- types: a1: userdata
        task.wait(0.4)
        a1:AdjustSpeed(0)
    end)
    if not a1.Preview then
        v1 = workspace:WaitForChild("BodyClone_" .. Instance.Name)
    else
        local Transparency
        v1 = Instance:Clone()
        a1._bodyClone = v1
        v1.Name = "BodyClone_" .. Instance.Name
        v1.Parent = Instance.Parent
        for i, j in v1:GetDescendants() do
            if j:IsA("BasePart") then
                j.Material = Enum.Material.Slate
                j.Color = Color3.fromRGB(163, 162, 165)
            elseif j:IsA("Decal")
                or j:IsA("Shirt")
                or j:IsA("Pants")
                or j:IsA("ShirtGraphic")
                or j:IsA("SurfaceAppearance")
                or j:IsA("Sound")
                or j:IsA("ParticleEmitter") then
                j:Destroy()
            end
            if j:IsA("MeshPart") then
                j.TextureID = ""
            end
        end
        for k, n in Instance:GetDescendants() do
            if n:IsA("BasePart") or n:IsA("Decal") then
                Transparency = n.Transparency
                n:SetAttribute("EmoteLivingStatue_OriginalTransparency", Transparency)
                n.Transparency = 1
            end
        end
        a1._bodyClone = v1
    end
    local v2 = Animation.new({
        Id = 131886008909730,
        Preload = true,
        Target = (v1:WaitForChild("Humanoid")):WaitForChild("Animator"),
    })
    v2:Play()
    task.wait(0.35)
    v2:AdjustSpeed(0)
end

function v1:Destroy() -- Line: 68
    if self._bodyClone then
        local Attribute
        self._bodyClone:Destroy()
        for i, j in self.Character.Instance:GetDescendants() do
            if j:IsA("BasePart") or j:IsA("Decal") then
                Attribute = j:GetAttribute("EmoteLivingStatue_OriginalTransparency")
                if Attribute then
                    j.Transparency = Attribute
                    j:SetAttribute("EmoteLivingStatue_OriginalTransparency", nil)
                end
            end
        end
    end
end

return v1