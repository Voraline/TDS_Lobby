-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Mercenary Base
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Streaming = require(ReplicatedStorage.Shared.Modules.Network).Channel("Streaming")
local u17 = {"Rifleman", "Grenadier", "Field Medic", "Riot Guard"}
return {
    Init = function(a1, a2, a3) -- Line: 16 -- upvalues: u17 (val), Streaming (val), Assets (val)
        local v1
        if a1:GetAttribute("Preview") then
            if not a3 then
                v1 = CFrame.Angles(0.3490658503988659, 0.6981317007977318, 0)
                local HeightOffset = a1:FindFirstChild("HeightOffset", true)
                if HeightOffset then
                    HeightOffset.WorldCFrame = HeightOffset.WorldCFrame * (v1 * CFrame.new(3.8, -1.9, -4.5))
                end
                a2.ShadowRadius = 3
                a2.Offset = Vector3.new(0, -0.5, -4)
                a2.Rotation = v1
            else
                a2.Offset = Vector3.new(0, -3, -40)
                a2.Rotation = CFrame.Angles(0.3490658503988659, 0.6981317007977318, 0)
            end
            a2.Rotation = a2.Rotation * CFrame.Angles(0, 3.141592653589793, 0)
            return a1
        end
        v1 = if not a3 then u17[math.random(1, #u17)] else "Mercenary Base"
        Streaming:FireServer("SelectUnit", v1, a1.Name)
        local v2 = Assets:WaitForChild("Units"):WaitForChild(v1)
        local Default = (v2:WaitForChild("Skins")):WaitForChild(a1.Name, 1) or (v2:WaitForChild("Skins")):FindFirstChild("Default")
        if not Default then
            return
        end
        local v3 = Default:Clone()
        v3:PivotTo((CFrame.new(0, 2, 3)))
        a1:Destroy()
        a2.Rotation = CFrame.Angles(0, 3.9269908169872414, 0)
        a2.ShadowRadius = 1
        v3.Destroying:Once(function() -- Line: 62 -- upvalues: Streaming (upval), a1 (val)
            Streaming:FireServer("RemoveUnits", {unitName = {a1.Name}})
        end)
        return v3
    end,
    Animation = function(a1) -- Line: 70
        if a1:GetAttribute("Preview") then
            return
        end
        return a1.Animations.Idle
    end,
}