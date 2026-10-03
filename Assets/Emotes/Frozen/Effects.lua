-- Script path: ReplicatedStorage.Assets.Emotes.Frozen.Effects
-- Decompile time: 0.90 ms

local TweenService = game:GetService("TweenService")
return {
    Freeze = function(a1, a2) -- Line: 4 -- upvalues: TweenService (val)
        local Ice = a2:WaitForChild("Ice")
        local HumanoidRootPart = a2:WaitForChild("HumanoidRootPart")
        local Humanoid = a2:WaitForChild("Humanoid")
        if Ice and HumanoidRootPart and Humanoid then
            local Expanded = Ice:WaitForChild("Expanded")
            local Handle = Ice:WaitForChild("Handle")
            Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            if Expanded and Expanded.Value == false and Handle then
                Expanded.Value = true
                local v1 = Vector3.new(5, a2.Humanoid.HipHeight * 2 + 4, 6)
                Handle.Size = Vector3.new(0, 0, 0)
                Handle.CFrame = HumanoidRootPart.CFrame
                Handle.CanCollide = true
                TweenService:Create(
                    Handle,
                    TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                    {Size = Vector3.new(v1.X, v1.Y, v1.Z / 1.5)}
                ):Play()
                Handle.Sound:Play()
                Handle.Emitter:Emit(25)
                Handle.WaistRigAttachment.Wave:Emit(1)
            end
        end
    end,
}