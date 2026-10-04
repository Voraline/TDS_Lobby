-- Script path: ReplicatedStorage.Content.Emote.Nutcracker.Animator
-- Decompile time: 0.75 ms

game:GetService("RunService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8
    local Instance = a1.Character.Instance
    local Humanoid = Instance:WaitForChild("Humanoid")
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    if a1.Preview then
        return
    end
    a1._walking = false
    a1._humanoid = Humanoid
    a1._root = HumanoidRootPart
    a1._thread = task.spawn(function() -- Line: 21 -- upvalues: HumanoidRootPart (val)
        while task.wait(0.03333333333333333) do
            HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0) + HumanoidRootPart.CFrame.LookVector * 2 * HumanoidRootPart.AssemblyMass
            task.wait(0.03333333333333333)
            HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)
        end
    end)
end

function v1.Destroy(a1) -- Line: 32
    if a1._thread then
        task.cancel(a1._thread)
    end
end

return v1