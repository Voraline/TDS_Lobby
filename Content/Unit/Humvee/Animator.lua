-- Script path: ReplicatedStorage.Content.Unit.Humvee.Animator
-- Decompile time: 3.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1

local function leftOrRight() -- Line: 16
    if Random.new():NextInteger(0, 1) then
        return 1
    end
    return -1
end

function v1.Face(a1, a2) -- Line: 26
    local lookVector = a1.Model.Weapon.Turret.CFrame.lookVector
    local Unit = (a2 - a1.Model.Weapon.Turret.Position).Unit
    local v1 = (math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X)))) * 0.017453292519943295
    local C0 = (a1.Model.PrimaryPart:WaitForChild("Motor")).C0
    a1.Model.PrimaryPart.Motor.C0 = C0 * CFrame.Angles(0, v1, 0)
end

function v1.Initialize(a1) -- Line: 39
    -- upvalues: EasySound (val), Animation (val), EffectsController (val), ReplicatedStorage (val), spr (val)
    -- upvalues: RunService (val)
    local v1
    local Drive = a1.Model.PrimaryPart:WaitForChild("Drive")
    a1._driveLoop = EasySound.Create({
        looped = true,
        audioGroup = "Towers",
        id = Drive.SoundId,
        parent = a1.Model.PrimaryPart,
        volume = Drive.Volume,
        playbackSpeed = Drive.PlaybackSpeed or 1,
    })
    a1._driveLoop:Play()
    a1.Replicator:Set("Name", "Humvee")
    local u31 = a1.Replicator:Get("Health")
    ;(a1.Replicator:GetStateChangedSignal("Health")):Connect(function() -- Line: 54 -- upvalues: a1 (val), u31 (val), EasySound (upval)
        if (a1.Replicator:Get("Health")) < u31 then
            local Hit = a1.Model.PrimaryPart:FindFirstChild("Hit")
            if Hit and Hit:IsA("Sound") then
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = Hit.SoundId,
                    parent = a1.Model.PrimaryPart,
                    volume = Hit.Volume,
                    playbackSpeed = Random.new():NextNumber(0.88, 1),
                })
            end
        end
    end)
    a1.Animations = {}
    for i, j in {"Walk"} do
        v1 = Animation.new({
            IgnorePriority = true,
            Track = a1.Model.Animations:WaitForChild(j),
            Target = (a1.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
        })
        a1.Animations[j] = v1
    end
    a1.Animations.Walk:Play()
    a1.Executables = {
        Death = function(a1_2) -- Line: 86
            -- upvalues: a1 (val), EasySound (upval), EffectsController (upval), ReplicatedStorage (upval), spr (upval)
            -- upvalues: RunService (upval)
            local v1
            a1.Animations.Walk:Stop()
            local Death = a1.Model.PrimaryPart:FindFirstChild("Death")
            if Death and Death:IsA("Sound") then
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = Death.SoundId,
                    parent = a1.Model.PrimaryPart,
                    volume = Death.Volume,
                })
            end
            a1.Dead = true
            local v2 = Random.new():NextNumber(-40, 40)
            local CFrame_2 = a1.Model.PrimaryPart.CFrame
            local new = CFrame.new
            local v3 = CFrame_2 * new((if not Random.new():NextInteger(0, 1) then -1 else 1) * 2.5, -0.5, 0) * CFrame.Angles(0, math.rad(v2), 0)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("SpecialMesh") then
                    v.TextureId = ""
                elseif v:IsA("BasePart") then
                    v.BrickColor = BrickColor.new("Black")
                    v.Material = Enum.Material.CorrodedMetal
                    if v:IsA("MeshPart") then
                        v.TextureID = ""
                    end
                end
            end
            EffectsController.Explosion({Radius = 3, Position = a1.Model.Hitbox.Position})
            for i, j in ReplicatedStorage.Assets.Effects.Client.VehicleFlames:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hitbox
            end
            if a1._driveLoop then
                EasySound.Destroy(a1._driveLoop)
                a1._driveLoop = nil
            end
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 1
            spr.target(a1.Model.PrimaryPart, 0.36, 2, {CFrame = v3})
            spr.target(NumberValue, 1, 3, {Value = 0.8})
            local v4 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 144 -- upvalues: a1 (upval), NumberValue (val)
                a1.Model:ScaleTo(NumberValue.Value)
            end)
            a1:Delay(a1_2)
            spr.stop(NumberValue)
            NumberValue:Destroy()
            if a1.Model and a1.Model.Parent and a1.Model.PrimaryPart then
                spr.stop(a1.Model.PrimaryPart)
            end
            v4:Disconnect()
        end,
    }
end

return v1