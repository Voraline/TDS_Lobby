-- Script path: ReplicatedStorage.Content.Emote.Slime.Animator
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15 -- upvalues: Animation (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Slime = Instance:WaitForChild("Slime")
    local RootMotor = (Slime:WaitForChild("RootPart")):WaitForChild("RootMotor")
    local Animator = (Slime:WaitForChild("AnimationController")):WaitForChild("Animator")
    Slime:PivotTo(HumanoidRootPart.CFrame)
    RootMotor.Part1 = HumanoidRootPart
    a1.slime = Slime
    a1:PreloadTrack("rbxassetid://129650182596917")
    local u38 = Animation.new({Id = 136854274025572, Preload = true, Target = Animator})
    local u42 = Animation.new({Id = 103197320888114, Preload = true, Target = Animator})
    a1:OnTrackPlayed("rbxassetid://83277520491007", function(a1_2) -- Line: 38 -- upvalues: u38 (val), u42 (val), a1 (val) -- types: a1_2: userdata
        u38:Play()
        task.wait(1.9)
        u38:Stop()
        a1_2:Stop()
        u42:Play()
        a1:PlayTrack("rbxassetid://129650182596917")
    end)
end

return v1