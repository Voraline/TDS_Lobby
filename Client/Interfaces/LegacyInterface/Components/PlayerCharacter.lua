-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.PlayerCharacter
-- Decompile time: 0.74 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local LocalPlayer = Players.LocalPlayer
local v1, u32 = (require(ReplicatedStorage.Packages.Charm)).signal((Assets.Templates:WaitForChild("Character")))
task.spawn(function() -- Line: 17 -- upvalues: RunService (val), LocalPlayer (val), u32 (val)
    if not RunService:IsRunning() then
        return
    end
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    Character:WaitForChild("Humanoid")
    Character:WaitForChild("HumanoidRootPart")
    Character.Archivable = true
    local v1 = Character:Clone()
    v1.Archivable = true
    v1:PivotTo((CFrame.new()))
    local Humanoid_2 = v1:FindFirstChildOfClass("Humanoid")
    local Animate = v1:FindFirstChild("Animate")
    if Humanoid_2 then
        Humanoid_2.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    end
    if Animate then
        Animate:Destroy()
    end
    u32(v1)
end)
return {getCharacter = v1}