-- Script path: ReplicatedStorage.Content.Emote.Moon Walk.Animator
-- Decompile time: 1.73 ms

local RunService = game:GetService("RunService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: RunService (val)
    if a1.Preview then
        return
    end
    if a1.Local then
        local HumanoidRootPart = a1.Character.Instance:WaitForChild("HumanoidRootPart")
        local LinearVelocity = Instance.new("LinearVelocity")
        LinearVelocity.ForceLimitMode = Enum.ForceLimitMode.PerAxis
        LinearVelocity.MaxAxesForce = Vector3.new((1 / 0), 0, (1 / 0))
        LinearVelocity.Attachment0 = HumanoidRootPart:FindFirstChild("RootRigAttachment")
        LinearVelocity.Parent = HumanoidRootPart
        a1._linearVelocity = LinearVelocity
        a1._connection = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 25 -- upvalues: a1 (val), HumanoidRootPart (val)
            if a1._linearVelocity and a1.Local then
                local Instance = a1.Character.Instance
                local v1 = Instance:WaitForChild("Humanoid").MoveDirection * 12
                a1._linearVelocity.VectorVelocity = a1._linearVelocity.VectorVelocity:Lerp(Vector3.new(v1.X, 0, v1.Z), a2 * 4)
                local Magnitude = a1._linearVelocity.VectorVelocity.Magnitude
                if Magnitude > 0.5 then
                    local Position = HumanoidRootPart.Position
                    Instance.HumanoidRootPart.CFrame = Instance.HumanoidRootPart.CFrame:Lerp(CFrame.new(Position, Position - a1._linearVelocity.VectorVelocity), a2 * 20)
                end
                a1.Track:AdjustSpeed(1 * (Magnitude / 12))
            end
        end)
    end
    a1:PlayTrack("rbxassetid://118908946731673", 0)
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 58
    if self.Local then
        if self._connection then
            self._connection:Disconnect()
            self._connection = nil
        end
        if self._linearVelocity then
            self._linearVelocity:Destroy()
        end
    end
end

return v1