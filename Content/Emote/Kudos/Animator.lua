-- Script path: ReplicatedStorage.Content.Emote.Kudos.Animator
-- Decompile time: 0.39 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 4
    local HumanoidRootPart = a1.Character.Instance:WaitForChild("HumanoidRootPart")
    local Sign_ThumbsUp = (a1.Character.Instance:WaitForChild("Sign")):WaitForChild("Sign_ThumbsUp")
    local Sign_ThumbsUpMotor = Sign_ThumbsUp:WaitForChild("Sign_ThumbsUpMotor")
    if Sign_ThumbsUpMotor and Sign_ThumbsUpMotor:IsA("Motor6D") and Sign_ThumbsUpMotor.Part0 == nil then
        Sign_ThumbsUpMotor.Part0 = HumanoidRootPart
    end
    Sign_ThumbsUp.Transparency = 0
end

return v1