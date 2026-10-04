-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Swordmaster.Animator
-- Decompile time: 2.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 16
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), Projectile (val), Create (val)
    -- upvalues: TimescaleUtilities (val)
    function a1.Face(a1_2) -- Line: 17 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    a1.Executables = {
        Immune = function(a1_2) -- Line: 26 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Immune.Enabled = a1_2
        end,
        Sword = function(a1_2) -- Line: 29 -- upvalues: a1 (val)
            a1.Model.Weapon1.Sword.Transparency = a1_2
            a1.Model.Weapon1.Glow.Transparency = a1_2
        end,
        Face = function(a1_2) -- Line: 33 -- upvalues: a1 (val)
            a1.Face(a1_2)
        end,
        Spin = function() -- Line: 36 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Combo,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.17)
            a1.Model.Head.Slash:Play()
            a1:Delay(0.34)
            a1.Model.Head.Slash:Play()
            a1:Delay(0.57)
            a1.Model.Head.SwordLunge:Play()
        end,
        Death = function() -- Line: 49 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
        Rage = function() -- Line: 57 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Scream:Play()
            a1.Model.Head.Eye1.Transparency = 0
            a1.Model.Head.Eye2.Transparency = 0
        end,
        SpikeAttack = function() -- Line: 67 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Spikes,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        Spike = function(a1) -- Line: 74 -- upvalues: ReplicatedStorage (upval), TweenService (upval)
            local v1 = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Mob").EvilSpike:Clone()
            v1.CFrame = a1.Start
            v1.Parent = workspace.CurrentCamera
            local v2 = Vector3.new(a1.Width, a1.Length, a1.Width)
            local v3 = a1.Start * CFrame.new(0, a1.Length / 2, 0)
            TweenService:Create(v1, TweenInfo.new(a1.TotalTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {Size = v2}):Play()
            TweenService:Create(
                v1,
                TweenInfo.new(a1.TotalTime, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v3}
            ):Play()
            task.wait(a1.TotalTime + math.random(75, 200) / 100)
            TweenService:Create(v1, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 1}):Play()
            game.Debris:AddItem(v1, 2)
        end,
        Knife = function(a1_2, a2) -- Line: 118
            -- upvalues: a1 (val), Animation (upval), Projectile (upval), Create (upval), TimescaleUtilities (upval)
            a1.Model.Dagger.Transparency = 0
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.33)
            a1.Model.Dagger.Transparency = 1
            a1_2.Start = a1.Model.Dagger.CFrame
            local v1 = Projectile:CalcDuration(a1_2)
            Projectile:Throw(a1_2)
            Create("Sound", {
                PlayOnRemove = true,
                SoundId = a1.Model.Head.Slash.SoundId,
                Parent = a1.Model.Dagger,
            }):Destroy()
            a1:Delay(v1)
            local u69 = a1.Model.HumanoidRootPart.Effects:Clone()
            u69.Parent = workspace.Terrain
            u69.CFrame = CFrame.new(a1_2.End)
            u69.Impact:Emit(1)
            u69.Stomp:Play()
            TimescaleUtilities.Delay(2, function() -- Line: 142 -- upvalues: u69 (val)
                u69:Destroy()
            end)
        end,
    }
end

return v1