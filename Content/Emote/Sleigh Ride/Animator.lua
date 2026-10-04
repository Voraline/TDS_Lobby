-- Script path: ReplicatedStorage.Content.Emote.Sleigh Ride.Animator
-- Decompile time: 2.82 ms

local RunService = game:GetService("RunService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: RunService (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    if a1.Preview then
        Humanoid.HipHeight = 2
        return
    end
    local SleighAccessory = Instance:WaitForChild("SleighAccessory")
    local u17 = {}
    local v1 = {
        (Instance:WaitForChild("LowerTorso")):WaitForChild("Root"),
        (Instance:WaitForChild("Head")):WaitForChild("Neck"),
        (SleighAccessory.Handle:WaitForChild("HumanoidRootPart")),
    }
    a1._motorData = {}
    for k, v in pairs(v1) do
        a1._motorData[v.Name] = {motor = v, C0 = v.C0}
    end
    a1._connections = {}

    local function toggleParticles(a1) -- Line: 40 -- upvalues: u17 (val) -- types: a1: boolean
        for k, v in pairs(u17) do
            v.Enabled = a1
        end
    end

    local u60 = a1:PlayTrack("rbxassetid://87945441841544")
    u60:AdjustWeight(0.01)
    local u65 = 0
    local u66 = 0
    local u68 = Vector3.new()
    a1._connections.Movement = RunService.PostSimulation:Connect(function(a1_2) -- Line: 52
        -- upvalues: Humanoid (val), u68 (ref), HumanoidRootPart (val), u65 (ref), u66 (ref), a1 (val)
        local MoveDirection = Humanoid.MoveDirection
        u68 = HumanoidRootPart.CFrame:VectorToObjectSpace(MoveDirection)
        local v1 = -u68.Z * 30
        u65 = math.lerp(u65, v1, a1_2 * 1.5)
        u66 = math.lerp(u66, 1, a1_2)
        if a1.Local then
            local v2 = HumanoidRootPart
            v2.CFrame = v2.CFrame * CFrame.new(0, 0, -u65 * a1_2)
            if 0 < (math.abs(MoveDirection.X)) then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + MoveDirection), a1_2 * 2)
            end
        end
    end)
    local u78 = 0
    local u79 = 0
    a1._connections.Hover = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 71
        -- upvalues: u68 (ref), u78 (ref), u79 (ref), a1 (val), u66 (ref), u65 (ref), u17 (val), u60 (val)
        local v1 = -u68.X * 30
        local v2 = u68.Z * 15
        u78 = math.lerp(u78, v1, a2 * 2)
        u79 = math.lerp(u79, v2, a2 * 2)
        a1._motorData.Neck.motor.C0 = a1._motorData.Neck.C0 * CFrame.Angles(math.rad(-u79), 0, 0) * CFrame.Angles(0, 0, (math.rad(-u78)))
        local v3 = a1._motorData.Root.C0 * CFrame.new(0, u66 + math.sin(a1_2 * 1.5) * 0.5, 0) * CFrame.Angles(math.rad(u79), 0, 0) * CFrame.Angles(0, 0, (math.rad(u78)))
        a1._motorData.Root.motor.C0 = v3
        a1._motorData.HumanoidRootPart.motor.C0 = v3
        local v4 = u65 > 10
        for k, v in pairs(u17) do
            v.Enabled = v4
        end
        u60:AdjustWeight((math.clamp(u65 / 7.5, 0.01, 1)))
    end)
end

function v1.Destroy(a1) -- Line: 94
    if a1.Preview then
        return
    end
    for k, v in pairs(a1._connections) do
        v:Disconnect()
    end
    for k2, i in pairs(a1._motorData) do
        i.motor.C0 = i.C0
    end
end

return v1