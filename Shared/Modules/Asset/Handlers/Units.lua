-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Units
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Assets = ReplicatedStorage:WaitForChild("Assets")
local u19 = {}
return function(a1, a2) -- Line: 10 -- upvalues: u19 (val), Assets (val), SoundService (val), Icons (val)
    local v1 = u19[a1]
    if not v1 then
        local Name
        local Units = Assets:WaitForChild("Units")
        local Towers = SoundService:WaitForChild("Towers")
        local v2 = Units:WaitForChild(a1)
        v1 = {
            Stats = require(v2:WaitForChild("Stats")),
            Icon = Icons.Units[a1] or "rbxassetid://13333189485",
        }
        v1.Skins = {}
        for i, v in ipairs((v2:WaitForChild("Skins")):GetChildren()) do
            Name = v.Name
            for i2, i3 in ipairs(v:GetDescendants()) do
                if i3:IsA("Sound") then
                    i3.SoundGroup = Towers
                end
            end
            v1.Skins[Name] = v
        end
        u19[a1] = v1
    end
    local v3 = v1
    if a2 then
        v3 = v1.Skins[a2] or v1.Skins.Default
    end
    return v3
end