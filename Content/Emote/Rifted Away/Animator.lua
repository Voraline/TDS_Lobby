-- Script path: ReplicatedStorage.Content.Emote.Rifted Away.Animator
-- Decompile time: 0.56 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Portal = Instance:WaitForChild("Portal")
    local Smoke = Portal:WaitForChild("Smoke")
    if Portal and HumanoidRootPart then
        Portal:PivotTo(HumanoidRootPart.CFrame * (CFrame.new(0, 2, 6)))
        Portal:PivotTo((Portal:GetPivot()) * (CFrame.Angles(1.3962634015954636, 1.5707963267948966, 0)))
        Smoke.CFrame = (CFrame.new(HumanoidRootPart.Position, Portal:GetPivot().Position)) * CFrame.Angles(0, 3.141592653589793, 0)
        Smoke.Position = Smoke.Position - Vector3.new(0, 2, 0)
    end
    a1:PreloadTrack("rbxassetid://73312005074588")
    a1:OnTrackPlayed("rbxassetid://86820667532755", function(a1_2) -- Line: 23 -- upvalues: a1 (val) -- types: a1_2: userdata
        task.wait(0.4)
        a1_2:Stop()
        a1:PlayTrack("rbxassetid://73312005074588")
    end)
end

return v1