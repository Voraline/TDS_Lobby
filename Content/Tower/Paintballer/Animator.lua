-- Script path: ReplicatedStorage.Content.Tower.Paintballer.Animator
-- Decompile time: 2.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local u41 = {}
u41.Green = BrickColor.new("Sea green")
local v1 = {}
v1.__index = v1

function v1:Fire() -- Line: 19 -- upvalues: EasySound (val), Animation (val)
    for k, v in pairs(self.Model.Weapon:GetDescendants()) do
        if v:FindFirstChild("Fire") and v:FindFirstChild("Start") and v.Fire:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v.Fire.SoundId,
                parent = v,
                playbackSpeed = v.Fire.PlaybackSpeed,
            })
            v.Start.Flash:Emit(35)
            v.Start.Flash2:Emit(60)
        end
        Animation.new({
            Track = v1.Model.Animations.Fire["0"].Fire,
            Target = v1.Model.AnimationController,
        }):Play()
    end
end

function v1.Initialize(a1) -- Line: 41
    -- upvalues: SharedControllerFunctions (val), ReplicatedStorage (val), u41 (val), Projectile (val)
    -- upvalues: TimescaleUtilities (val), Create (val), EasySound (val), TweenService (val)
    SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})

    function a1.PredictMovement(a1, a2, a3) -- Line: 47
        return (a1.Path:GetScalar(a1.PathDistance + a1.Speed * ((a2 - a1.PrimaryPart.Position).Magnitude / a3)))
    end

    a1.Executables = {
        Projectile = function(a1_2, a2) -- Line: 61
            -- upvalues: a1 (val), SharedControllerFunctions (upval), ReplicatedStorage (upval), u41 (upval)
            -- upvalues: Projectile (upval), TimescaleUtilities (upval), Create (upval), EasySound (upval)
            -- upvalues: TweenService (upval)
            a1:Face(a1_2)
            SharedControllerFunctions.AimArmsAt(a1, a1_2)
            SharedControllerFunctions.AimHeadAt(a1, a1_2)
            a1:Fire()
            local Handle = a1.Model.Weapon.Handle
            local Paint = ReplicatedStorage.Assets.Effects.Projectile:WaitForChild("Paint")
            local v1 = u41[a1.Model.Name] or BrickColor.new("Deep blue")
            Paint.BrickColor = v1
            v1 = {
                Part = Paint,
                Speed = 40,
                Gravity = 4,
                Type = "Linear",
                Start = Handle.CFrame,
                End = a1_2,
                Turn = 0,
            }
            local v2 = Projectile:CalcDuration(v1)
            Projectile:Throw(v1)
            TimescaleUtilities.Delay(v2, function() -- Line: 84
                -- upvalues: Create (upval), a1_2 (val), u41 (upval), a1 (upval), TimescaleUtilities (upval)
                -- upvalues: EasySound (upval), TweenService (upval), a2 (val)
                local v1 = Create
                local v2 = {
                    Size = Vector3.new(0, 0, 0),
                    Anchored = true,
                    CanCollide = false,
                    CanTouch = false,
                    CanQuery = false,
                    CastShadow = false,
                    Shape = Enum.PartType.Ball,
                    Position = a1_2,
                }
                local v3 = u41[a1.Model.Name] or BrickColor.new("Deep blue")
                v2.BrickColor = v3
                v2.Material = Enum.Material.Neon
                v2.Parent = workspace.CurrentCamera
                v1 = v1("Part", v2)
                TimescaleUtilities.CleanUp(v1, 0.25)
                EasySound.Play({id = 5079543012, soundGroupName = "Towers", parent = v1})
                TweenService:Create(v1, TweenInfo.new(0.25), {Transparency = 1, Size = Vector3.new(1, 1, 1) * (a2 * 2)}):Play()
            end)
        end,
    }
end

return v1