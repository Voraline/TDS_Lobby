-- Script path: ReplicatedStorage.Content.Emote.Broomstick.Animator
-- Decompile time: 5.17 ms

local RunService = game:GetService("RunService")
local u6 = Random.new()
local v1 = {}
v1.__index = v1

local function restoreJointTransform(a1) -- Line: 17 -- types: a1: table
    if a1.appliedTransform and a1.joint.Transform == a1.appliedTransform then
        a1.joint.Transform = a1.animationTransform
    end
    a1.appliedTransform = nil
end

local function applyJointTransform(a1, a2) -- Line: 24 -- types: a1: table, a2: userdata
    if a1.appliedTransform and a1.joint.Transform == a1.appliedTransform then
        a1.joint.Transform = a1.animationTransform
    end
    a1.appliedTransform = nil
    a1.animationTransform = a1.joint.Transform
    a1.joint.Transform = a2 * a1.animationTransform
    a1.appliedTransform = a1.joint.Transform
end

function v1.Initialize(a1) -- Line: 31 -- upvalues: RunService (val), u6 (val)
    a1._connections = {}
    a1._jointData = {}
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    if a1.Preview then
        local HipHeight = Humanoid.HipHeight
        Humanoid.HipHeight = 2
        a1.Maid:Mark(function() -- Line: 41 -- upvalues: Humanoid (val), HipHeight (val)
            Humanoid.HipHeight = HipHeight
        end)
        return
    end
    local BroomAccessory = Instance:WaitForChild("BroomAccessory")
    local u160 = {}
    for k, v in pairs(BroomAccessory.Part:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
            table.insert(u160, v)
        end
    end

    local function toggleParticles(a1) -- Line: 55 -- upvalues: u160 (val) -- types: a1: boolean
        for k, v in pairs(u160) do
            v.Enabled = a1
        end
    end

    a1._character = Instance
    a1._root = HumanoidRootPart
    a1._humanoid = Humanoid
    a1:PlayTrack("rbxassetid://125388025345166").Stopped:Wait()
    if not a1:IsPlaying() then
        return
    end
    local u59 = RaycastParams.new()
    u59.FilterType = Enum.RaycastFilterType.Exclude
    u59.FilterDescendantsInstances = {Instance}
    u59.RespectCanCollide = true
    local u161 = 0
    local u162 = Vector3.new()
    a1._connections.Movement = RunService.PostSimulation:Connect(function(a1_2) -- Line: 77
        -- upvalues: Humanoid (val), u162 (ref), HumanoidRootPart (val), u161 (ref), a1 (val), u59 (val)
        local MoveDirection = Humanoid.MoveDirection
        u162 = HumanoidRootPart.CFrame:VectorToObjectSpace(MoveDirection)
        local v1 = -u162.Z * 30
        u161 = math.lerp(u161, v1, (math.min(a1_2 * 1.5, 1)))
        if a1.Local then
            local v2 = HumanoidRootPart.CFrame.LookVector * u161 * a1_2
            local Magnitude = v2.Magnitude
            if Magnitude > 0 then
                u59.CollisionGroup = HumanoidRootPart.CollisionGroup
                local v3 = workspace:Blockcast(HumanoidRootPart.CFrame, HumanoidRootPart.Size, v2, u59)
                if v3 then
                    v2 = v2 * (math.max(v3.Distance - 0.05, 0) / Magnitude)
                    u161 = 0
                end
                local v4 = HumanoidRootPart
                v4.CFrame = v4.CFrame + v2
            end
            if 0 < (math.abs(MoveDirection.X)) then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(
                    CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + MoveDirection),
                    (math.min(a1_2 * 2, 1))
                )
            end
        end
    end)
    for k2, i in pairs({
        (Instance:WaitForChild("LowerTorso")):WaitForChild("Root"),
        ((Instance:WaitForChild("Head")):WaitForChild("Neck")),
    }) do
        assert(i:IsA("Motor6D") or i:IsA("AnimationConstraint"), "Unsupported avatar joint")
        a1._jointData[i.Name] = {joint = i, animationTransform = i.Transform}
    end
    a1._connections.RestorePose = RunService.PreAnimation:Connect(function() -- Line: 117 -- upvalues: a1 (val)
        local v1 = nil
        local v2 = nil
        for i, j in a1._jointData, v1, v2 do
            if j.appliedTransform and j.joint.Transform == j.appliedTransform then
                j.joint.Transform = j.animationTransform
            end
            j.appliedTransform = nil
        end
    end)
    local u116 = u6:NextNumber(-100000, 100000)
    local u122 = u6:NextNumber(-100000, 100000)
    local u128 = u6:NextNumber(-100000, 100000)
    local u129 = 0
    local u130 = 0
    local u131 = 0
    a1._connections.Hover = RunService.PreSimulation:Connect(function(a1_2) -- Line: 132
        -- upvalues: u131 (ref), u116 (val), u122 (val), u128 (val), u162 (ref), u129 (ref), u130 (ref), a1 (val)
        -- upvalues: u161 (ref), u160 (val)
        local v1 = time()
        if u131 < 0.999 then
            u131 = math.lerp(u131, 1, a1_2)
        end
        local v2 = math.noise(v1 / 250 * 100, v1 / 250 * 100, u116)
        local v3 = math.noise(v1 / 250 * 100, v1 / 250 * 100, u122)
        local noise_3 = math.noise
        local v4 = -u162.X * 30
        local v5 = u162.Z * 25
        u129 = math.lerp(u129, v4, a1_2 * 2)
        u130 = math.lerp(u130, v5, a1_2 * 2)
        local Neck = a1._jointData.Neck
        local v6 = CFrame.Angles(math.rad(-u130), 0, 0)
        if Neck.appliedTransform and Neck.joint.Transform == Neck.appliedTransform then
            Neck.joint.Transform = Neck.animationTransform
        end
        Neck.appliedTransform = nil
        Neck.animationTransform = Neck.joint.Transform
        Neck.joint.Transform = v6 * Neck.animationTransform
        Neck.appliedTransform = Neck.joint.Transform
        local Root = a1._jointData.Root
        v6 = (CFrame.new((Vector3.new(v2, v3, (noise_3(v1 / 250 * 100, v1 / 250 * 100, u128)))) * u131)) * CFrame.Angles(math.rad(u130), 0, 0) * CFrame.Angles(0, 0, (math.rad(u129)))
        if Root.appliedTransform and Root.joint.Transform == Root.appliedTransform then
            Root.joint.Transform = Root.animationTransform
        end
        Root.appliedTransform = nil
        Root.animationTransform = Root.joint.Transform
        Root.joint.Transform = v6 * Root.animationTransform
        Root.appliedTransform = Root.joint.Transform
        local v7 = u161 > 10
        for k, v in pairs(u160) do
            v.Enabled = v7
        end
    end)
end

function v1.update(a1, a2) end

function v1.Destroy(a1) -- Line: 163
    if a1.Preview then
        return
    end
    for k, v in pairs(a1._connections) do
        v:Disconnect()
    end
    local v1 = nil
    local v2 = nil
    for i, j in a1._jointData, v1, v2 do
        if j.appliedTransform and j.joint.Transform == j.appliedTransform then
            j.joint.Transform = j.animationTransform
        end
        j.appliedTransform = nil
    end
end

return v1