-- Script path: ReplicatedStorage.Content.Emote.Coin Ride.Animator
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: EasySound (val)
    a1:OnTrackPlayed("rbxassetid://86747234020945", function(a1_2) -- Line: 13 -- upvalues: a1 (val) -- types: a1_2: userdata
        task.wait(1.2)
        a1_2:Stop()
        a1:PlayTrack("rbxassetid://125994754675261")
    end)
    local HumanoidRootPart = a1.Character.Instance:WaitForChild("HumanoidRootPart")
    local v1 = a1.Character.Instance:WaitForChild("Coin Ride")
    local platform = v1:WaitForChild("platform")
    if platform then
        if not a1.Preview then
            platform.Anchored = true
            local Position = (a1.Character.Instance:GetPivot()).Position
            local v2 = RaycastParams.new()
            v2.FilterType = Enum.RaycastFilterType.Exclude
            v2.FilterDescendantsInstances = {a1.Character.Instance, v1}
            local v3 = workspace:Raycast(Position, Vector3.new(0, -100, 0), v2)
            if not v3 then
                v1:PivotTo((a1.Character.Instance:GetPivot()))
            else
                local v4 = v3.Position.Y + v1:GetExtentsSize().Y / 2
                local Position_2 = a1.Character.Instance:GetPivot().Position
                v1:PivotTo((CFrame.new(Position_2.X, v4, Position_2.Z)))
            end
            a1.Maid:Mark((EasySound.Play({
                id = 77113012406021,
                looped = true,
                volume = 0.25,
                audioGroup = "Emotes",
                parent = platform,
            })))
        end
        local Motor6D = Instance.new("Motor6D")
        a1.Maid:Mark(Motor6D)
        Motor6D.Parent = HumanoidRootPart
        Motor6D.Part0 = HumanoidRootPart
        Motor6D.Part1 = platform
        Motor6D.C0 = CFrame.new(-0.0733947754, -0.432473421, -5.97906494, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    end
end

return v1