-- Script path: ReplicatedStorage.Content.Unit.Snowball Elf.Animator
-- Decompile time: 2.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u34 = ReplicatedStorage.Assets.Effects.Mob["Snowball Elf"]

function v1.Initialize(a1) -- Line: 14
    -- upvalues: Animation (val), u34 (val), TweenService (val), EasySound (val), Projectile (val), EmitterManager (val)
    local u9 = a1.Model.AnimationController.Animator:LoadAnimation(a1.Model.Animations.Walk)
    local u18 = Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.AimIdle,
        Target = a1.Model.AnimationController,
    })
    local new_2 = Animation.new
    local v1 = {
        Track = a1.Model.Animations.Fire,
        Target = a1.Model.AnimationController,
    }
    local u27 = new_2(v1)
    a1.snowballModel = u34.Snowball
    if a1.FBXModel then
        v1 = u34:FindFirstChild(a1.Model.Name)
        if v1 then
            a1.snowballModel = v1
        end
    end

    function a1.DoWalk() -- Line: 39 -- upvalues: u9 (val), a1 (val)
        u9:Play()
        u9:AdjustSpeed(a1.Speed / 3.5)
    end

    a1.DoWalk()
    local Size = a1.Model.Handle.Size
    a1.Executables = {
        Death = function(a1_2) -- Line: 50 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            local Handle = a1.Model:FindFirstChild("Handle")
            if Handle then
                Handle.Transparency = 1
            end
        end,
        ShootState = function(a1_2) -- Line: 61 -- upvalues: u9 (val), u18 (val), a1 (val)
            if a1_2 then
                u9:Stop()
                u18:Play()
                return
            end
            a1.DoWalk()
            u18:Stop()
        end,
        Throw = function(a1_2) -- Line: 70 -- upvalues: u27 (val), a1 (val), TweenService (upval), Size (val)
            u27:Play()
            ;(u27.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1_2) -- Line: 73 -- upvalues: a1 (upval), TweenService (upval), Size (upval)
                local Handle = a1.Model:FindFirstChild("Handle")
                if a1_2 == "Throw" and Handle then
                    Handle.Transparency = 1
                    return
                end
                if a1_2 == "Roll" and Handle then
                    Handle.Size = Vector3.new(0, 0, 0)
                    TweenService:Create(
                        Handle,
                        TweenInfo.new(0.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {Size = Size}
                    ):Play()
                    Handle.Transparency = 0
                end
            end)
        end,
        Projectile = function(a1_2) -- Line: 100 -- upvalues: a1 (val), EasySound (upval), Projectile (upval), EmitterManager (upval)
            local Handle = a1.Model:WaitForChild("Handle")
            a1_2.Part = a1.snowballModel
            a1_2.Turn = 180
            a1_2.Start = a1.Model.Handle.CFrame
            EasySound.Play({
                audioGroup = "Towers",
                timeScaled = true,
                id = Handle.Fire.SoundId,
                parent = Handle,
                volume = Handle.Fire.Volume,
                playbackSpeed = Random.new():NextNumber(0.8, 1.2),
            })
            local v1 = Projectile:Throw(a1_2, function(a1) -- Line: 116 -- upvalues: EmitterManager (upval)
                local PrimaryPart = if not a1:IsA("Model") then nil else a1.PrimaryPart
                local HumanoidRootPart = a1:FindFirstChild("HumanoidRootPart") or PrimaryPart or a1:FindFirstChildWhichIsA("BasePart", true)
                if HumanoidRootPart then
                    EmitterManager.Emit("SnowExplosionSmall", CFrame.new(HumanoidRootPart.Position))
                end
            end)
            if v1:FindFirstChild("GlowTrail") then
                v1.GlowTrail.Enabled = true
            end
            if v1:FindFirstChild("SharpTrail") then
                v1.SharpTrail.Enabled = true
            end
        end,
        Face = function(a1_2) -- Line: 134 -- upvalues: a1 (val)
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
    }
end

return v1