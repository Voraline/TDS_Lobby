-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Military Base
-- Decompile time: 1.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Streaming = require(ReplicatedStorage.Shared.Modules.Network).Channel("Streaming")
return {
    Init = function(a1, a2, a3) -- Line: 9 -- upvalues: Streaming (val), Assets (val)
        local v1, v2, v3
        if a1:GetAttribute("Preview") then
            if not a3 then
                local v4 = CFrame.Angles(0.3490658503988659, 0.6981317007977318, 0)
                local HeightOffset = a1:FindFirstChild("HeightOffset", true)
                if HeightOffset then
                    HeightOffset.WorldCFrame = HeightOffset.WorldCFrame * (v4 * CFrame.new(3.8, -1.9, -4.5))
                end
                a2.ShadowRadius = 3
                a2.Offset = Vector3.new(0, -0.20000000298023224, -4)
                a2.Rotation = v4
            else
                a2.Offset = Vector3.new(0, -3, -40)
                a2.Rotation = CFrame.Angles(0.3490658503988659, 0.6981317007977318, 0)
            end
            a2.Rotation = a2.Rotation * CFrame.Angles(0, 3.141592653589793, 0)
            return a1
        end
        Streaming:FireServer("SelectUnit", "Humvee", a1.Name)
        local Skins = Assets:WaitForChild("Units"):WaitForChild("Humvee"):WaitForChild("Skins")
        local Default = Skins:WaitForChild(a1.Name, 1) or Skins:FindFirstChild("Default")
        if not Default then
            return
        end
        local v5 = Skins.Name == "Default"
        local v6 = Default:Clone()
        v6:PivotTo((CFrame.new()))
        a1:Destroy()
        if not a3 then
            v1 = if not v5 then 0 else -8
            v2 = if not v5 then -1.5 else 0
            v3 = -4
        else
            v1 = if not v5 then 0 else -8
            v2 = if not v5 then -3 else -1.6
            v3 = -20
        end
        if not a3 then
            a2.Offset = Vector3.new(v1, v2 + 0.8, v3)
        else
            a2.Offset = Vector3.new(v1, v2 + 1.2, v3)
        end
        a2.Rotation = CFrame.Angles(0, 3.490658503988659, 0)
        a2.ShadowRadius = 0
        v6.Destroying:Once(function() -- Line: 69 -- upvalues: Streaming (upval), a1 (val)
            Streaming:FireServer("RemoveUnits", {Humvee = {a1.Name}})
        end)
        return v6
    end,
    Animation = function(a1) -- Line: 77
        if a1:FindFirstChild("Animations") and a1.Animations:FindFirstChild("Walk") then
            return a1.Animations.Walk
        end
        return nil
    end,
}