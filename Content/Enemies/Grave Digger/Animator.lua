-- Script path: ReplicatedStorage.Content.Enemies.Grave Digger.Animator
-- Decompile time: 1.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 13
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val), Shaker (val)
    local u1 = {
        a1.Model.HumanoidRootPart.MobSpawn1,
        a1.Model.HumanoidRootPart.MobSpawn2,
        a1.Model.HumanoidRootPart.MobSpawn3,
        a1.Model.HumanoidRootPart.MobSpawn4,
        a1.Model.HumanoidRootPart.MobSpawn5,
        a1.Model.HumanoidRootPart.MobSpawn6,
    }
    a1.Executables = {
        SpawnTroops = function(a1_2, a2) -- Line: 24 -- upvalues: Animation (upval), a1 (val), u1 (val)
            Animation.new({
                Track = a1.Model.Animations.Dig,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.75)
            a1.Model.Head.Dig:Play()
            for k, v in pairs(u1) do
                v.Dirt:Emit(10)
            end
        end,
        Death = function() -- Line: 36 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
        Stomp = function(a1_2, a2) -- Line: 44
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), Shaker (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            a1.Model.Head.Scream:Play()
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.8)
            a1.Model.Head.Stomp:Play()
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 70 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
    }
end

return v1