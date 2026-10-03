-- Script path: ReplicatedStorage.Content.Emote.Free Spirit.Animator
-- Decompile time: 2.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 20 -- upvalues: Animation (val), RunService (val)
    local Transparency
    a1._connections = {}
    local Instance = a1.Character.Instance
    local Humanoid = Instance:WaitForChild("Humanoid")
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Ghost = Instance:WaitForChild("Ghost")
    local RootMotor = (Ghost:WaitForChild("RootPart")):WaitForChild("RootMotor")
    local Animator = (Ghost:WaitForChild("AnimationController")):WaitForChild("Animator")
    for i, j in Ghost:GetDescendants() do
        if j ~= Ghost.PrimaryPart then
            if j:IsA("BasePart") or j:IsA("Decal") then
                Transparency = j.Transparency
                j:SetAttribute("EmoteFreeSpirit_OriginalTransparency", Transparency)
                j.Transparency = 1
            end
        end
    end
    Ghost:PivotTo(HumanoidRootPart.CFrame)
    RootMotor.Part1 = HumanoidRootPart
    local u66 = {
        spawn = Animation.new({Id = 116303735611415, Preload = true, Target = Animator}),
        idle = Animation.new({Id = 72862824273590, Preload = true, Target = Animator}),
        move = Animation.new({Id = 109567111271379, Preload = true, Target = Animator}),
    }
    local u67 = true
    a1:OnTrackPlayed("rbxassetid://112602256572924", function(a1_2) -- Line: 61 -- upvalues: u66 (ref), a1 (val), Ghost (val), u67 (ref) -- types: a1_2: userdata
        u66.spawn:Play()
        if a1.Preview then
            task.spawn(function() -- Line: 64 -- upvalues: a1_2 (val)
                task.wait(2)
                a1_2:AdjustSpeed(0)
            end)
        end
        task.spawn(function() -- Line: 69 -- upvalues: Ghost (upval), u66 (upval), u67 (upval)
            local Attribute
            task.wait(1)
            for i, j in Ghost:GetDescendants() do
                if j:IsA("BasePart") or j:IsA("Decal") then
                    Attribute = j:GetAttribute("EmoteFreeSpirit_OriginalTransparency")
                    if Attribute then
                        j.Transparency = Attribute
                        j:SetAttribute("EmoteFreeSpirit_OriginalTransparency", nil)
                    end
                end
            end
            task.wait(2.9)
            u66.idle:Play()
            u67 = false
        end)
        task.wait(2)
        if not a1.Preview then
            a1_2:Stop()
        end
    end)
    if a1.Preview then
        return
    end
    local u75 = 0
    local u77 = Vector3.new()
    local u78 = false
    local idle = u66.idle
    a1._connections.Movement = RunService.PostSimulation:Connect(function(a1_2) -- Line: 100
        -- upvalues: u67 (ref), Humanoid (val), u77 (ref), HumanoidRootPart (val), u78 (ref), u75 (ref), a1 (val)
        -- upvalues: idle (ref), u66 (ref)
        if u67 then
            return
        end
        local MoveDirection = Humanoid.MoveDirection
        u77 = HumanoidRootPart.CFrame:VectorToObjectSpace(MoveDirection)
        u78 = 0 < (math.abs(MoveDirection.X))
        local v1 = -u77.Z * 15
        u75 = math.lerp(u75, v1, a1_2)
        if a1.Local then
            local v2 = HumanoidRootPart
            v2.CFrame = v2.CFrame * CFrame.new(0, 0, -u75 * a1_2)
            if u78 then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(
                    CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + MoveDirection),
                    a1_2 * 0.2
                )
            end
        end
        if u78 and idle ~= u66.move then
            idle:Stop()
            idle = u66.move
            idle:Play()
            return
        end
        if not u78 and idle ~= u66.idle then
            idle:Stop()
            idle = u66.idle
            idle:Play()
        end
    end)
end

function v1.Destroy(a1) -- Line: 132
    for k, v in pairs(a1._connections) do
        v:Disconnect()
    end
end

return v1