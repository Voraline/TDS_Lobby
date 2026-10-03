-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Mecha Base
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Streaming = require(ReplicatedStorage.Shared.Modules.Network).Channel("Streaming")
return {
    Init = function(a1, a2, a3) -- Line: 9 -- upvalues: Streaming (val), Assets (val)
        Streaming:FireServer("SelectUnit", "Mark1", a1.Name)
        local v1 = a1:GetAttribute("Preview") == true
        local Mark1 = Assets:WaitForChild("Units"):WaitForChild("Mark1")
        local Default = (Mark1:WaitForChild("Skins")):WaitForChild(a1.Name, 1) or (Mark1:WaitForChild("Skins")):FindFirstChild("Default")
        if not Default then
            return
        end
        local v2 = Default:Clone()
        v2:PivotTo((CFrame.new(0, 2, 3)))
        a1:Destroy()
        a2.Rotation = CFrame.Angles(0, 3.9269908169872414, 0)
        a2.ShadowRadius = 2
        if not a3 then
            a2.Offset = Vector3.new(0, if not v1 then 1.6 else 0, if not v1 then 1 else -1)
        else
            a2.Offset = Vector3.new(-0.5, -1.5, -32)
        end
        a2.Offset = a2.Offset + Vector3.new(0.5, 0, 0)
        v2.Destroying:Once(function() -- Line: 35 -- upvalues: Streaming (upval), a1 (val)
            Streaming:FireServer("RemoveUnits", {Mark1 = {a1.Name}})
        end)
        return v2
    end,
    Animation = function(a1) -- Line: 43
        return a1.Animations.Walk
    end,
}