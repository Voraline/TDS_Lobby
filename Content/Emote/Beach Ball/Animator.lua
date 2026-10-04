-- Script path: ReplicatedStorage.Content.Emote.Beach Ball.Animator
-- Decompile time: 3.67 ms

local RunService = game:GetService("RunService")
local u6 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 18 -- upvalues: RunService (val), u6 (val)
    a1._connections = {}
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    local BeachBall = Instance:WaitForChild("BeachBall")
    local beachball = BeachBall:WaitForChild("beachball")
    local beachball_2 = beachball:WaitForChild("beachball")
    beachball_2.Part0 = HumanoidRootPart
    beachball_2.Part1 = beachball
    BeachBall:ScaleTo(Humanoid.HipHeight / 2)
    if a1.Preview then
        return
    end
    a1._character = Instance
    a1._root = HumanoidRootPart
    a1._humanoid = Humanoid
    a1._currentAnimation = nil
    a1._moveTrack = a1:PreloadTrack("rbxassetid://102218275360560")
    a1._idleTrack = a1:PreloadTrack("rbxassetid://139421502600949")
    a1._jumpTrack = a1:PreloadTrack("rbxassetid://108105973069738")
    local u44 = 0
    local u46 = Vector3.new()
    a1._connections.Movement = RunService.PostSimulation:Connect(function(a1_2) -- Line: 49
        -- upvalues: Humanoid (val), u46 (ref), HumanoidRootPart (val), u44 (ref), a1 (val), beachball (val)
        local MoveDirection = Humanoid.MoveDirection
        u46 = HumanoidRootPart.CFrame:VectorToObjectSpace(MoveDirection)
        local v1 = -u46.Z * 15
        u44 = math.lerp(u44, v1, a1_2)
        if a1.Local then
            local v2 = HumanoidRootPart
            v2.CFrame = v2.CFrame * CFrame.new(0, 0, -u44 * a1_2)
            if 0 < (math.abs(MoveDirection.X)) then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(
                    CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + MoveDirection),
                    a1_2 * 0.2
                )
            end
        end
        local new = CFrame.new
        local LookVector = if not (0.1 < MoveDirection.Magnitude) then HumanoidRootPart.CFrame.LookVector else MoveDirection
        local Rotation = (new(Vector3.new(0, 0, 0), LookVector)).Rotation
        beachball.VFX.WorldCFrame = CFrame.new(beachball.VFX.WorldPosition) * Rotation
        beachball.VFX.Sparks.TinySparks.Rate = math.clamp(u44 / 7.5, 0, 1) * 40
    end)
    if not a1.Local then
        return
    end
    a1._idleTrack:Play()
    local v1 = {
        (Instance:WaitForChild("LowerTorso")):WaitForChild("Root"),
        ((Instance:WaitForChild("Head")):WaitForChild("Neck")),
    }
    a1._motorData = {}
    for k, v in pairs(v1) do
        a1._motorData[v.Name] = {motor = v, C0 = v.C0}
    end
    local u94 = u6:NextNumber(-100000, 100000)
    local u100 = u6:NextNumber(-100000, 100000)
    local u106 = u6:NextNumber(-100000, 100000)
    local u107 = 0
    a1._connections.Jump = Humanoid.Jumping:Connect(function() -- Line: 99 -- upvalues: a1 (val)
        a1._moveTrack:Stop()
        a1._jumpTrack:Play()
    end)
    a1._connections.Hover = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 104
        -- upvalues: u107 (ref), u94 (val), u100 (val), u106 (val), a1 (val), u44 (ref)
        if u107 < 0.999 then
            u107 = math.lerp(u107, 1, a2)
        end
        local v1 = (Vector3.new(
            math.noise(a1_2 / 250 * 100, a1_2 / 250 * 100, u94),
            math.noise(a1_2 / 250 * 100, a1_2 / 250 * 100, u100),
            (math.noise(a1_2 / 250 * 100, a1_2 / 250 * 100, u106))
        )) * u107
        a1._motorData.Root.motor.C0 = a1._motorData.Root.C0 * CFrame.new(v1)
        if u44 < 1.5 then
            if not a1._idleTrack.IsPlaying then
                a1._idleTrack:Play()
            end
            if not a1._moveTrack.IsPlaying then
                return
            end
            a1._moveTrack:Stop()
            return
        end
        if a1._idleTrack.IsPlaying then
            a1._idleTrack:Stop(0.2)
        end
        if not a1._moveTrack.IsPlaying and not a1._jumpTrack.IsPlaying then
            a1._moveTrack:Play(0.2)
        end
        if not a1._jumpTrack.IsPlaying then
            a1._moveTrack:AdjustSpeed((math.clamp(u44 / 7.5, 0, 1.2)))
        end
    end)
end

function v1.update(a1, a2) end

function v1.Destroy(a1) -- Line: 142
    if a1.Preview then
        return
    end
    for k, v in pairs(a1._connections) do
        v:Disconnect()
    end
    a1._moveTrack:Stop()
    a1._idleTrack:Stop()
    a1._jumpTrack:Stop()
end

return v1