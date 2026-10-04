-- Script path: ReplicatedStorage.Content.NewEnemies.Lead Balloon.Animator
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val), TweenService (val)
    local u1 = 0
    local u32 = {
        Animation.new({
            Track = a1.Model.Animations.Float1,
            Target = a1.Model.AnimationController,
        }):Play(),
        Animation.new({
            Track = a1.Model.Animations.Float2,
            Target = a1.Model.AnimationController,
        }),
        (Animation.new({
            Track = a1.Model.Animations.Float3,
            Target = a1.Model.AnimationController,
        })),
    }
    local u44 = Animation.new({
        Track = a1.Model.Animations.Fall,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Fall = function(a1_2) -- Line: 37 -- upvalues: a1 (val), u44 (val), TweenService (upval)
            local HumanoidRootPart = a1.Model:FindFirstChild("HumanoidRootPart")
            u44:Play()
            if HumanoidRootPart then
                local Node = HumanoidRootPart:FindFirstChild("Node")
                if Node then
                    TweenService:Create(
                        Node,
                        TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                        {Position = Node.Position + Vector3.new(0, 2.5, 0)}
                    ):Play()
                    TweenService:Create(
                        HumanoidRootPart,
                        TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                        {CFrame = HumanoidRootPart.CFrame - Vector3.new(0, 2.5, 0)}
                    ):Play()
                end
            end
            a1:Delay(a1_2)
            if a1.PrimaryPart:FindFirstChild("Node") then
                a1.PositionOffset = -a1.PrimaryPart.Node.Position
                u44:Stop()
            end
        end,
        Pop = function(a1_2, a2) -- Line: 81 -- upvalues: a1 (val), u1 (ref), u32 (val), TweenService (upval)
            local v1
            for i = 1, (math.floor(a1_2)) do
                v1 = a1.Model:FindFirstChild("Balloon" .. i)
                if v1 and u1 < i then
                    u32[i]:Stop()
                    v1.Pop:Play()
                    v1.Particles:Emit(25)
                    TweenService:Create(
                        v1,
                        TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                        {Transparency = 1, Size = v1.Size / 5}
                    ):Play()
                    if i < #u32 then
                        u32[i + 1]:Play()
                    end
                    v1.Rope.Visible = false
                    a1:Delay(a2)
                end
            end
            u1 = a1_2
        end,
    }
end

return v1