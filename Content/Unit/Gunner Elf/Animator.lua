-- Script path: ReplicatedStorage.Content.Unit.Gunner Elf.Animator
-- Decompile time: 2.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local v1 = {}
v1.__index = v1
local u27 = Random.new()
local u31 = ReplicatedStorage.Assets.Effects.Mob["Snowball Elf"]

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), u31 (val), EmitterManager (val), u27 (val), EasySound (val), Projectile (val)
    local u9 = Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    })
    local u18 = Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.AimIdle,
        Target = a1.Model.AnimationController,
    })
    local new_3 = Animation.new
    local v1 = {
        Preload = true,
        Track = a1.Model.Animations.Fire,
        Target = a1.Model.AnimationController,
    }
    local u27_2 = new_3(v1)
    a1.snowballModel = u31.Snowball
    if a1.FBXModel then
        v1 = u31:FindFirstChild(a1.Model.Name)
        if v1 then
            a1.snowballModel = v1
        end
    end

    function a1.DoWalk() -- Line: 41 -- upvalues: u9 (val)
        u9:Play()
    end

    a1.DoWalk()
    a1.Executables = {
        Death = function(a1_2) -- Line: 48 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            local Handle = a1.Model:FindFirstChild("Handle")
            if Handle then
                Handle.Transparency = 1
            end
        end,
        ShootState = function(a1_2) -- Line: 59 -- upvalues: u9 (val), u18 (val), a1 (val)
            if a1_2 then
                u9:Stop()
                u18:Play()
                return
            end
            a1.DoWalk()
            u18:Stop()
        end,
        Projectile = function(a1_2) -- Line: 68
            -- upvalues: a1 (val), u27_2 (val), EmitterManager (upval), u27 (upval), EasySound (upval)
            -- upvalues: Projectile (upval)
            local v1
            local Handle = a1.Model:WaitForChild("Handle")
            local VFX = a1.Model:FindFirstChild("VFX")
            u27_2:Play()
            a1_2.Part = a1.snowballModel
            a1_2.Turn = 180
            local Value = nil
            if not a1.FBXModel then
                Value = Handle:FindFirstChild("Start") or VFX:FindFirstChild("Start")
            else
                local Configuration = Handle:FindFirstChild("Configuration")
                if Configuration then
                    Value = Configuration.Attachments.Start.Value
                end
            end
            if Value and not Value:IsA("Attachment") then
                Value = Value:FindFirstChild("Start")
            end
            local WorldCFrame = Value and Value.WorldCFrame or Handle.CFrame
            a1_2.Start = WorldCFrame
            if Value then
                EmitterManager.manualEmit(Value)
            end
            local Fire = Handle:FindFirstChild("Fire")
            if Fire and Fire:IsA("Sound") then
                v1 = u27:NextNumber(0.9, 1.2)
                local SoundId = Fire.SoundId
                if not string.find(SoundId, "rbxassetid://")
                    and string.find(SoundId, "http://www.roblox.com/asset/") then
                    local v2 = string.split(SoundId, "=")
                    local v3 = v2[2] and tonumber(v2[2])
                    if v3 then
                        SoundId = "rbxassetid://" .. v3
                    end
                end
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = SoundId,
                    parent = Handle,
                    volume = Fire.Volume,
                    playbackSpeed = v1,
                })
            end
            v1 = Projectile:Throw(a1_2, function(a1) -- Line: 120 -- upvalues: EmitterManager (upval)
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
        Face = function(a1_2) -- Line: 139 -- upvalues: a1 (val)
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
    }
end

return v1