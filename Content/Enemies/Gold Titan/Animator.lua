-- Script path: ReplicatedStorage.Content.Enemies.Gold Titan.Animator
-- Decompile time: 2.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
    -- upvalues: EffectsController (val)
    local u2 = Random.new()
    a1.Executables = {
        SpawnTroops = function(a1_2, a2) -- Line: 18 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Call,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Death:Play()
        end,
        Crystal = function(a1) -- Line: 26
            -- upvalues: ReplicatedStorage (upval), u2 (val), TweenService (upval), TimescaleUtilities (upval)
            local u8 = ReplicatedStorage.Assets.Effects.Mob.GoldSpike:Clone()
            u8:PivotTo((CFrame.new(a1)) * (CFrame.Angles(0, u2:NextNumber(0, 6.283185307179586), 0)))
            u8.Ice.Transparency = 1
            u8.Ice2.Transparency = 1
            local Size = u8.Ice.Size
            u8.Ice.Size = Vector3.new(0, 0, 0)
            local Size_2 = u8.Ice2.Size
            u8.Ice2.Size = Vector3.new(0, 0, 0)
            u8.Parent = workspace.Trash
            TweenService:Create(
                u8.Ice,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 0, Size = Size}
            ):Play()
            TweenService:Create(
                u8.Ice2,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 0, Size = Size_2}
            ):Play()
            u8.Ice.Exp:Play()
            TimescaleUtilities.Delay(2, function() -- Line: 61 -- upvalues: TweenService (upval), u8 (val)
                TweenService:Create(
                    u8.Ice,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                    {Transparency = 1}
                ):Play()
                TweenService:Create(
                    u8.Ice2,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                    {Transparency = 1}
                ):Play()
            end)
            TimescaleUtilities.Delay(3, function() -- Line: 89 -- upvalues: u8 (val)
                u8:Destroy()
            end)
        end,
        Slam = function() -- Line: 94 -- upvalues: Animation (upval), a1 (val), TimescaleUtilities (upval)
            Animation.new({
                Track = a1.Model.Animations.Smash,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Death:Play()
            TimescaleUtilities.Delay(1, function() -- Line: 100 -- upvalues: a1 (upval)
                a1.Model.Head.SwordLunge:Play()
            end)
        end,
        Fist = function(a1, a2) -- Line: 105
            -- upvalues: ReplicatedStorage (upval), u2 (val), TweenService (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.Fist:Clone()
            u9.CFrame = (CFrame.new(a1 + Vector3.new(0, 30, 0))) * CFrame.Angles(0, u2:NextNumber(0, 6.283185307179586), 0)
            u9.Transparency = 1
            u9.Parent = workspace.Trash
            TweenService:Create(u9, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 0}):Play()
            TweenService:Create(u9, TweenInfo.new(a2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Position = a1}):Play()
            TimescaleUtilities.Delay(a2, function() -- Line: 131 -- upvalues: EffectsController (upval), a1 (val)
                EffectsController.Explosion({
                    Position = a1,
                    Radius = 5,
                    Color = BrickColor.new("Bright yellow"),
                    Sound = 12222084,
                    Material = Enum.Material.Granite,
                    Particles = false,
                    Visible = true,
                })
            end)
            TimescaleUtilities.Delay(a2 + 1, function() -- Line: 143 -- upvalues: TweenService (upval), u9 (val)
                TweenService:Create(
                    u9,
                    TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                    {Transparency = 1}
                ):Play()
            end)
            TimescaleUtilities.Delay(a2 + 2, function() -- Line: 160 -- upvalues: u9 (val)
                u9:Destroy()
            end)
        end,
    }
end

return v1