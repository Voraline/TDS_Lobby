-- Script path: ReplicatedStorage.Content.Emote.Ducklings.Animator
-- Decompile time: 0.92 ms

local RunService = game:GetService("RunService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: RunService (val)
    local Instance = a1.Character.Instance
    a1._humanoid = Instance:WaitForChild("Humanoid")
    local DuckPart_2 = (Instance:WaitForChild("Ducklings"):WaitForChild("DuckPart")):WaitForChild("DuckPart")
    DuckPart_2.Part0 = Instance:WaitForChild("HumanoidRootPart")
    a1:PreloadTrack("rbxassetid://113934130655542")
    if a1.Preview then
        a1:OnTrackPlayed("rbxassetid://94085522019730", function(a1_2) -- Line: 22 -- upvalues: a1 (val) -- types: a1_2: userdata
            task.wait(1.8)
            a1_2:Stop()
            a1:PlayTrack("rbxassetid://113934130655542")
        end)
        return
    end
    a1:PreloadTrack("rbxassetid://139563483082193")
    a1:OnTrackPlayed("rbxassetid://94085522019730", function(a1_2) -- Line: 29 -- upvalues: a1 (val), RunService (upval) -- types: a1_2: userdata
        task.wait(1.8)
        a1_2:Stop()
        a1._currentAnim = a1:PlayTrack("rbxassetid://113934130655542")
        if not a1._connection then
            a1._connection = RunService.Heartbeat:Connect(function() -- Line: 34 -- upvalues: a1 (upval)
                if a1:IsMoving() and a1._currentAnim.Animation.AnimationId == "rbxassetid://113934130655542" then
                    a1._currentAnim:Stop()
                    a1._currentAnim = a1:PlayTrack("rbxassetid://139563483082193")
                    return
                end
                if not a1:IsMoving() and a1._currentAnim.Animation.AnimationId == "rbxassetid://139563483082193" then
                    a1._currentAnim:Stop()
                    a1._currentAnim = a1:PlayTrack("rbxassetid://113934130655542")
                end
            end)
            a1.Maid:Mark(a1._connection)
        end
    end)
end

function v1:IsMoving() -- Line: 55
    return 0 < self._humanoid.MoveDirection.Magnitude
end

return v1