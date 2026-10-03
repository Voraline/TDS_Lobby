-- Script path: ReplicatedStorage.Content.Emote.Old Man Candy Cane.Animator
-- Decompile time: 0.88 ms

game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: RunService (val)
    local Humanoid = a1.Character.Instance:WaitForChild("Humanoid")
    if not a1.Preview and a1.Local then
        local u9 = nil
        local u10 = nil
        a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 25 -- upvalues: Humanoid (val), a1 (val), u9 (ref)
            if 0 < Humanoid.MoveDirection.Magnitude then
                if a1._walkTrack then
                    return
                end
                a1._walkTrack = a1:PlayTrack("rbxassetid://82632451581293")
                u9:Stop()
                return
            end
            if a1._walkTrack then
                u9 = a1:PlayTrack("rbxassetid://127522533083274")
                a1._walkTrack:Stop()
                a1._walkTrack = nil
            end
        end)))
        a1:PreloadTrack("rbxassetid://127522533083274")
        a1:PreloadTrack("rbxassetid://82632451581293")
        a1:OnTrackPlayed("rbxassetid://127522533083274", function(a1) -- Line: 44 -- upvalues: u10 (ref), u9 (ref) -- types: a1: userdata
            u10:Stop()
            u9 = a1
        end)
        a1:OnTrackPlayed("rbxassetid://137868160486363", function(a1_2) -- Line: 49 -- upvalues: u10 (ref), a1 (val) -- types: a1_2: userdata
            u10 = a1_2
            task.wait(0.74)
            a1_2:AdjustSpeed(0)
            a1:PlayTrack("rbxassetid://127522533083274")
        end)
        return
    end
end

function v1.Destroy(a1) -- Line: 58
    if a1._walkTrack then
        a1._walkTrack:Stop()
    end
end

return v1