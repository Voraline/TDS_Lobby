-- Script path: ReplicatedStorage.Content.Enemies.Long Ducky_old.Animator
-- Decompile time: 1.71 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

function v1.Initialize(a1) -- Line: 16
    -- upvalues: ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val), Animation (val)
    function a1.Face(a1_2) -- Line: 17 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.Spike(a1_2, a2, a3) -- Line: 26
        -- upvalues: ReplicatedStorage (upval), TweenService (upval), TimescaleUtilities (upval), a1 (val)
        local u10 = ReplicatedStorage.Assets.Effects.Mob.VoidSpike:Clone()
        u10.Color = BrickColor.new("Brick yellow").Color
        u10.CFrame = CFrame.new(a1_2 + Vector3.new(0, a3, 0))
        local CFrame_2 = u10.CFrame
        u10.Size = Vector3.new(0, 0, 0)
        local v1 = Vector3.new(a2, a2 / 4, a2)
        u10.Parent = workspace.Trash
        TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {Size = v1}):Play()
        TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame_2}):Play()
        u10.Exp:Play()
        TimescaleUtilities.Delay(0.2, function() -- Line: 50 -- upvalues: TweenService (upval), u10 (val), a1 (upval)
            TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 1}):Play()
            a1:Delay(0.4)
            u10:Destroy()
        end)
    end

    a1.Executables = {
        Face = function(a1_2) -- Line: 62 -- upvalues: a1 (val)
            a1.Face(a1_2)
        end,
        Slash = function(a1_2, a2, a3) -- Line: 66 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Attack,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.26666666666)
            task.spawn(function() -- Line: 74 -- upvalues: a2 (val), a1 (upval), a1_2 (val), a3 (val)
                for k, v in pairs(a2) do
                    if v ~= nil then
                        a1.Spike(v, a1_2, 0.5)
                    end
                    a1:Delay(a3)
                end
            end)
            a1:Delay(0.56666666666)
        end,
    }
end

return v1