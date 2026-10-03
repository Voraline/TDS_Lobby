-- Script path: ReplicatedStorage.Content.Enemies.Arrow.Animator
-- Decompile time: 1.80 ms

local RunService = game:GetService("RunService")
local v1 = {}
v1.__index = v1

local function getPath(a1) -- Line: 9
    if a1.ForcePosition then
        return nil
    end
    if a1.IntroPath and not a1.IntroDone then
        return a1.IntroPath
    end
    return a1.Path
end

local function updateArrows(a1, a2, a3, a4) -- Line: 20 -- types: a1: table, a2: number, a3: number, a4: table
    local Attribute, Rotation, Scalar, Scalar_4, speed, v1, v2, v3, v4
    local v5 = nil
    local v6 = nil
    for i, j in a1, v5, v6 do
        v4 = if i.Name ~= "End" then -1 else 1
        _, _, Scalar_4, Scalar = v7.path:GetScalar(v8 + v4)
        if Scalar_4 and Scalar then
            v2 = if not v7.reverse then CFrame.lookAt(Scalar_4, Scalar) else CFrame.lookAt(Scalar, Scalar_4)
            v1 = v2 * CFrame.Angles(0, 3.141592653589793, 0)
            Attribute = j:GetAttribute("Transform") or CFrame.identity
            Rotation = v1.Rotation
            speed = v7.speed
            v2 = Attribute:Lerp(Rotation, v9 * speed)
            j:SetAttribute("Transform", v2)
            v3 = j.Part1.CFrame * j.C1
            j.Transform = v3:ToObjectSpace(v2).Rotation:Inverse()
        end
    end
end

function v1.Initialize(a1) -- Line: 51 -- upvalues: RunService (val), updateArrows (val)
    a1.PathOffset = 0
    ;(a1.Model:WaitForChild("Head")):WaitForChild("Spawn"):Play()
    local Arrows = a1.Model:WaitForChild("Arrows")
    local Middle = Arrows:WaitForChild("Middle")
    local u23 = {}
    local Start = Arrows:WaitForChild("Start")
    u23[Start] = (Middle:WaitForChild("Start"))
    local End = Arrows:WaitForChild("End")
    u23[End] = (Middle:WaitForChild("End"))
    local u47 = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 66 -- upvalues: a1 (val), updateArrows (upval), u23 (val) -- types: a2: number
        local v1 = a1
        local IntroPath = if v1.ForcePosition then nil else if not v1.IntroPath then v1.Path else if v1.IntroDone then v1.Path else v1.IntroPath
        if IntroPath then
            updateArrows(u23, a1.PathDistance, a2, {path = IntroPath, speed = a1.Speed, reverse = a1.Reverse})
        end
    end)
    local u48 = nil
    local v1 = a1.OnDestroy:Connect(function() -- Line: 79 -- upvalues: u48 (ref), u47 (ref)
        u48:Disconnect()
        if u47 then
            u47:Disconnect()
            u47 = nil
        end
    end)
end

return v1