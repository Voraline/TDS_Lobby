-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Engineer.Animator
-- Decompile time: 1.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local CorruptedCommander = ReplicatedStorage.Assets.Effects.Mob.CorruptedCommander
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12
    -- upvalues: Animation (val), CorruptedCommander (val), TweenService (val), TimescaleUtilities (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1.Executables = {
        Fire = function(a1_2) -- Line: 28
            -- upvalues: a1 (val), CorruptedCommander (upval), TweenService (upval), TimescaleUtilities (upval)
            a1._animations.Fire:Play()
            a1:Delay(0.5)
            a1:Face(a1_2, TweenInfo.new(0.25), true)
            local Start = a1.Model.PrimaryPart:FindFirstChild("Start", true)
            if Start then
                a1:Delay(0.25)
                local v1 = CorruptedCommander.Bullet:Clone()
                v1.Parent = workspace.Trash
                v1.CFrame = CFrame.new(Start.WorldPosition, a1_2)
                local v2 = (Start.WorldPosition - a1_2).Magnitude / 40
                TweenService:Create(v1, TweenInfo.new(v2, Enum.EasingStyle.Linear), {Position = a1_2 + Vector3.new(0, 1, 0)}):Play()
                TimescaleUtilities.CleanUp(v1, v2 + 0.1)
            end
            a1:Delay(0.85)
        end,
        Death = function() -- Line: 52 -- upvalues: a1 (val)
            a1._animations.Death:Play()
            a1:Delay(1.33)
        end,
        PlaceSentry = function() -- Line: 56 -- upvalues: a1 (val)
            a1._animations.Sentry:Play()
            a1:Delay(3)
        end,
    }
end

return v1