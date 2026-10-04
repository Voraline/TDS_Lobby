-- Script path: ReplicatedStorage.Content.GlobalModifiers.Blockouts
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u15 = nil
local u16 = {"Boombox"}

local function getBlockoutPart() -- Line: 12 -- upvalues: u15 (ref)
    local Texture
    if u15 then
        return u15
    end
    local Part = Instance.new("Part")
    Part.Name = "BlockoutPart"
    Part.Size = Vector3.new(1, 1, 1)
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = true
    Part.CanTouch = false
    Part.Color = Color3.fromRGB(163, 162, 165)
    Part.Transparency = 0
    Part.Material = Enum.Material.SmoothPlastic
    for i, j in Enum.NormalId:GetEnumItems() do
        Texture = Instance.new("Texture")
        Texture.Name = "Texture"
        Texture.Color3 = Color3.new()
        Texture.Face = j
        Texture.StudsPerTileU = 0.5
        Texture.StudsPerTileV = 0.5
        Texture.Texture = "rbxassetid://6372755229"
        Texture.Transparency = 0.8
        Texture.Parent = Part
    end
    u15 = Part
    return Part
end

return {
    displayName = "Block Outs",
    description = "enemies are replaced with blockouts.",
    icon = 18488721960,
    onEnableClient = function(a1, a2, a3) -- Line: 50 -- upvalues: LegacyMiddleware (val), u16 (val), getBlockoutPart (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 55 -- upvalues: u16 (upval), getBlockoutPart (upval)
            local WeldConstraint, v1
            if not a2 then
                return nil
            end
            if table.find(u16, a2.Name) then
                return a2
            end
            local Model = a2.Model
            local Folder = Instance.new("Folder")
            Folder.Name = "BlockOutParts"
            for i, j in Model:GetDescendants() do
                if j:IsA("BasePart") and j.Transparency ~= 1 then
                    j.Transparency = 1
                    j.LocalTransparencyModifier = 0
                    v1 = getBlockoutPart():Clone()
                    v1.CFrame = j.CFrame
                    v1.Size = j.Size
                    v1.Anchored = false
                    v1.Parent = Folder
                    v1.Name = "RootPart"
                    WeldConstraint = Instance.new("WeldConstraint")
                    WeldConstraint.Part0 = v1
                    WeldConstraint.Part1 = j
                    WeldConstraint.Parent = v1
                end
            end
            Folder.Parent = Model
            return a2
        end))
    end,
}