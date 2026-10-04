-- Script path: ReplicatedStorage.Content.Emote.Downvote.Animator
-- Decompile time: 0.42 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 4
    local HumanoidRootPart = a1.Character.Instance:WaitForChild("HumanoidRootPart")
    local Sign_ThumbsDown = (a1.Character.Instance:WaitForChild("Sign")):WaitForChild("Sign_ThumbsDown")
    local Sign_ThumbsDownMotor = Sign_ThumbsDown:WaitForChild("Sign_ThumbsDownMotor")
    if Sign_ThumbsDownMotor and Sign_ThumbsDownMotor:IsA("Motor6D") and Sign_ThumbsDownMotor.Part0 == nil then
        Sign_ThumbsDownMotor.Part0 = HumanoidRootPart
    end
    Sign_ThumbsDown.Transparency = 0
end

return v1