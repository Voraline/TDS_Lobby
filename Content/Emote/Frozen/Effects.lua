-- Script path: ReplicatedStorage.Content.Emote.Frozen.Effects
-- Decompile time: 0.84 ms

local TweenService = game:GetService("TweenService")
return {
    Freeze = function(a1, a2) -- Line: 4 -- upvalues: TweenService (val)
        local Ice = a2:WaitForChild("Ice")
        local HumanoidRootPart = a2:WaitForChild("HumanoidRootPart")
        local Humanoid = a2:WaitForChild("Humanoid")
        if Ice and HumanoidRootPart and Humanoid then
            local Expanded = Ice:WaitForChild("Expanded")
            local Handle = Ice:WaitForChild("Handle")
            Handle.CollisionGroup = "Players"
            Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
            if Expanded and Expanded.Value == false and Handle then
                local BoundingBox_2
                Expanded.Value = true
                _, BoundingBox_2 = a2:GetBoundingBox()
                Handle.CanCollide = true
                Handle.Size = Vector3.new(0, 0, 0)
                TweenService:Create(
                    Handle,
                    TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                    {Size = BoundingBox_2 * 1.1}
                ):Play()
                Handle.Sound:Play()
                Handle.Emitter:Emit(25)
                Handle.WaistRigAttachment.Wave:Emit(1)
            end
        end
    end,
}