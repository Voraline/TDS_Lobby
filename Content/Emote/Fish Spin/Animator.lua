-- Script path: ReplicatedStorage.Content.Emote.Fish Spin.Animator
-- Decompile time: 0.53 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 4
    local Instance = a1.Character.Instance
    local LeftHand = Instance:WaitForChild("LeftHand")
    local RightHand = Instance:WaitForChild("RightHand")
    local FishSpin = Instance:WaitForChild("FishSpin")
    local Fish_2 = FishSpin:WaitForChild("Fish_2")
    local Fish_1 = FishSpin:WaitForChild("Fish_1")
    local Left_Fish_Fin = FishSpin:WaitForChild("Left_Fish_Fin")
    local Right_Fish_Fin = FishSpin:WaitForChild("Right_Fish_Fin")
    local Left_Fish_Fin_2 = Fish_2:WaitForChild("Left_Fish_Fin")
    local Right_Fish_Fin_2 = Fish_1:WaitForChild("Right_Fish_Fin")
    Left_Fish_Fin.Part0 = LeftHand
    Left_Fish_Fin.Part1 = Left_Fish_Fin_2
    Right_Fish_Fin.Part0 = RightHand
    Right_Fish_Fin.Part1 = Right_Fish_Fin_2
end

function v1.update(a1, a2) end

function v1.Destroy(a1) end

return v1