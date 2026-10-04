-- Script path: ReplicatedStorage.Content.Enemies.Cart.Animator
-- Decompile time: 0.82 ms

local v1 = {}
v1.__index = v1
local u2 = Random.new()

function v1.Initialize(a1) -- Line: 10 -- upvalues: u2 (val)
    a1._random = u2:NextNumber()
    local C1 = a1.Model.HumanoidRootPart.Base.C1
    local u9 = 0

    function a1.OnStepFunction(a1_2) -- Line: 14 -- upvalues: u9 (ref), a1 (val), C1 (val)
        u9 = u9 + a1_2 * 5
        local v1 = CFrame.Angles(a1_2 * (a1.Speed * 2), 0, 0)
        local LeftWheel = a1.Model.Torso.LeftWheel
        LeftWheel.C1 = LeftWheel.C1 * v1
        local RightWheel = a1.Model.Torso.RightWheel
        RightWheel.C1 = RightWheel.C1 * v1
        a1.Model.HumanoidRootPart.Base.C1 = C1 * CFrame.new(0, -math.abs((math.noise(u9 + a1._random, u9 * 0.5))) * 0.1, 0) * CFrame.Angles(0, 0, math.noise(u9 + a1._random, u9 * 0.5) * 0.2)
    end
end

return v1