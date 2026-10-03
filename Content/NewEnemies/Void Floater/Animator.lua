-- Script path: ReplicatedStorage.Content.NewEnemies.Void Floater.Animator
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val), EasySound (val)
    local u12 = Animation.new({
        Track = a1.Model.Animations.Float,
        Target = a1.Model.AnimationController,
    }):Play()
    local u21 = Animation.new({
        Track = a1.Model.Animations.Fall,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Pop = function(a1_2) -- Line: 21 -- upvalues: u12 (val), u21 (val), a1 (val), EasySound (upval)
            u12:Stop()
            u21:Play()
            local Pop = a1.Model.Balloon:FindFirstChild("Pop")
            if Pop and Pop:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Enemies",
                    id = Pop.SoundId,
                    parent = a1.Model.PrimaryPart,
                    volume = Pop.Volume,
                })
            end
            a1.Model.Balloon.Particles:Emit(25)
            a1:Tween(
                a1.Model.Balloon,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = a1.Model.Balloon.Size / 5}
            ):Play()
            local PrimaryPart = a1.Model.PrimaryPart
            if PrimaryPart then
                local Node = PrimaryPart:FindFirstChild("Node")
                if Node then
                    a1:Tween(
                        Node,
                        TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                        {Position = Node.Position + Vector3.new(0, 2.5, 0)}
                    ):Play()
                    a1:Tween(
                        PrimaryPart,
                        TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                        {CFrame = PrimaryPart.CFrame - Vector3.new(0, 2.5, 0)}
                    ):Play()
                end
            end
            a1:Wait(a1_2)
            if a1.PrimaryPart:FindFirstChild("Node") then
                a1.PositionOffset = -a1.PrimaryPart.Node.Position
                u21:Stop()
                a1.Model.Balloon.Transparency = 1
            end
        end,
    }
end

return v1