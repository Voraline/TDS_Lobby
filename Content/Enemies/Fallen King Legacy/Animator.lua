-- Script path: ReplicatedStorage.Content.Enemies.Fallen King Legacy.Animator
-- Decompile time: 3.76 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = game:GetService("TweenService")

function v1.Initialize(a1) -- Line: 18
    -- upvalues: EasySound (val), Animation (val), ReplicatedStorage (val), TweenService (val), Debris (val)
    -- upvalues: Shaker (val), Laser (val)
    local u1 = {
        a1.Model.HumanoidRootPart.MobSpawn1,
        a1.Model.HumanoidRootPart.MobSpawn2,
        a1.Model.HumanoidRootPart.MobSpawn3,
        a1.Model.HumanoidRootPart.MobSpawn4,
        a1.Model.HumanoidRootPart.MobSpawn5,
        a1.Model.HumanoidRootPart.MobSpawn6,
        a1.Model.HumanoidRootPart.MobSpawn7,
        a1.Model.HumanoidRootPart.MobSpawn8,
        a1.Model.HumanoidRootPart.MobSpawn9,
        a1.Model.HumanoidRootPart.MobSpawn10,
    }

    local function playOneShot(a1) -- Line: 32 -- upvalues: EasySound (upval) -- types: a1: userdata?
        if a1 and a1:IsA("Sound") then
            EasySound.Play({
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                id = a1.SoundId,
                volume = a1.Volume,
                playbackSpeed = a1.PlaybackSpeed,
                parent = a1.Parent,
            })
            return
        end
    end

    a1.Executables = {
        SpawnTroops = function(a1_2, a2) -- Line: 47 -- upvalues: Animation (upval), a1 (val), playOneShot (val), u1 (val)
            Animation.new({
                Track = a1.Model.Animations.Call,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Scream")))
            for k, v in pairs(u1) do
                v.Dirt:Emit(10)
            end
            a1:Delay(0.5)
            a1.Model.Weapon.Summon.Wither.Enabled = true
            a1:Delay(1)
            a1.Model.Weapon.Summon.Wither.Enabled = false
        end,
        Stomp = function(a1_2, a2) -- Line: 62
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), playOneShot (val), TweenService (upval)
            -- upvalues: Debris (upval), Shaker (upval)
            local v1 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            v1.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            v1.Orientation = Vector3.new(90, -90, 0)
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.67)
            playOneShot((a1.Model.Head:FindFirstChild("Stomp")))
            v1.Parent = workspace.CurrentCamera
            local v2 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(v1, TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = v2}):Play()
            TweenService:Create(v1, TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
            Debris:AddItem(v1, a1_2)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
        Block = function(a1_2) -- Line: 115 -- upvalues: Animation (upval), a1 (val)
            local v1 = Animation.new({
                Track = a1.Model.Animations.Block,
                Target = a1.Model.AnimationController,
            }):Play()
            v1:AdjustWeight(1, 0.3)
            a1.Model.HumanoidRootPart.Immune.Enabled = true
            a1:Delay(a1_2)
            a1.Model.HumanoidRootPart.Immune.Enabled = false
            v1:Stop()
        end,
        Shield = function(a1_2, a2) -- Line: 128 -- upvalues: a1 (val), ReplicatedStorage (upval), Debris (upval)
            local Size = a1.Model.HumanoidRootPart.Size
            local Effects = ReplicatedStorage:FindFirstChild("Effects")
            local Shield = Effects and Effects:FindFirstChild("Shield")
            local v1 = Shield and Shield:Clone()
            if not v1 then
                return
            end
            v1:SetPrimaryPartCFrame(a1.Model.HumanoidRootPart.CFrame)
            v1.Effect.Size = Vector3.new(Size.X * 2.5, Size.Y * 1.5, Size.X * 2.5)
            v1.Effect.Damage1.Display.Text = a2
            v1.Effect.Damage2.Display.Text = a2
            v1.Effect.Damage3.Display.Text = a2
            v1.Effect.Damage4.Display.Text = a2
            v1.Parent = a1.Model
            v1.PrimaryPart.Weld.Part1 = a1.Model.HumanoidRootPart
            Debris:AddItem(v1, a1_2)
        end,
        Spin = function() -- Line: 149 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Spin,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("SwordLunge")))
            a1.Model.Sword.Trail.Enabled = true
            a1:Delay(1.5)
            a1.Model.Sword.Trail.Enabled = false
        end,
        Death = function() -- Line: 160 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Dead")))
        end,
        Charge = function(a1_2) -- Line: 168 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Charge,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Sword.Shock.Enabled = true
            wait(a1_2)
            a1.Model.Sword.Shock.Enabled = false
        end,
        Lightning = function(self) -- Line: 178 -- upvalues: Laser (upval), EasySound (upval)
            local v1 = {
                Lifetime = 1,
                minWidth = 0.1,
                maxWidth = 0.4,
                Bursts = 3,
                Color = Color3.fromRGB(0, 170, 255),
                Start = self.Start,
                End = self.Position,
                Offset = Random.new():NextNumber(0.25, 0.75),
            }
            Laser:Lightning(v1)
            EasySound.Play({
                id = 821439273,
                volume = 1,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = self.Head,
            })
        end,
        Rage = function() -- Line: 200 -- upvalues: Animation (upval), a1 (val), playOneShot (val), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Scream")))
            TweenService:Create(
                a1.Model.Head.Eye1,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = 0}
            ):Play()
            TweenService:Create(
                a1.Model.Head.Eye2,
                TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = 0}
            ):Play()
            a1.Model.HumanoidRootPart.PointLight.Enabled = true
        end,
    }
end

return v1