-- Script path: ReplicatedStorage.Content.Emote.Fat Bunny.Animator
-- Decompile time: 0.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15 -- upvalues: RunService (val), EasySound (val)
    local Instance = a1.Character.Instance
    a1._humanoid = Instance:WaitForChild("Humanoid")
    local FatBunny = Instance:WaitForChild("FatBunny")
    local BodyMotor = FatBunny:WaitForChild("BodyMotor")
    BodyMotor.Part0 = Instance:WaitForChild("HumanoidRootPart")
    a1:PreloadTrack("rbxassetid://92407475182769")
    if a1.Preview then
        a1:OnTrackPlayed("rbxassetid://107756830005878", function(a1_2) -- Line: 25 -- upvalues: a1 (val) -- types: a1_2: userdata
            task.wait(1.2)
            a1_2:Stop()
            a1:PlayTrack("rbxassetid://92407475182769")
        end)
        return
    end
    a1:PreloadTrack("rbxassetid://75777586920117")
    a1:OnTrackPlayed("rbxassetid://107756830005878", function(a1_2) -- Line: 32 -- upvalues: a1 (val), RunService (upval) -- types: a1_2: userdata
        task.wait(1.2)
        a1_2:Stop()
        a1._currentAnim = a1:PlayTrack("rbxassetid://92407475182769")
        if not a1._connection then
            a1._connection = RunService.Heartbeat:Connect(function() -- Line: 37 -- upvalues: a1 (upval)
                if a1:IsMoving() and a1._currentAnim.Animation.AnimationId == "rbxassetid://92407475182769" then
                    a1._currentAnim:Stop()
                    a1._currentAnim = a1:PlayTrack("rbxassetid://75777586920117")
                    return
                end
                if not a1:IsMoving() and a1._currentAnim.Animation.AnimationId == "rbxassetid://75777586920117" then
                    a1._currentAnim:Stop()
                    a1._currentAnim = a1:PlayTrack("rbxassetid://92407475182769")
                end
            end)
            a1.Maid:Mark(a1._connection)
        end
    end)
    EasySound.Play({
        id = 124926274559975,
        audioGroup = "Emotes",
        destroyOnEnd = true,
        volume = 0.5,
        parent = FatBunny,
    })
end

function v1:IsMoving() -- Line: 65
    return 0 < self._humanoid.MoveDirection.Magnitude
end

return v1