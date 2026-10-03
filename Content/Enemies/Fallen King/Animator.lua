-- Script path: ReplicatedStorage.Content.Enemies.Fallen King.Animator
-- Decompile time: 3.61 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 15
    -- upvalues: EasySound (val), Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
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

    local function playOneShot(a1) -- Line: 30 -- upvalues: EasySound (upval) -- types: a1: userdata?
        if a1 and a1:IsA("Sound") then
            EasySound.Play({
                soundGroupName = "Enemies",
                destroyOnEnd = true,
                id = a1.SoundId,
                volume = a1.Volume,
                playbackSpeed = a1.PlaybackSpeed,
                parent = a1.Parent,
            })
            return
        end
    end

    a1.Executables = {
        SpawnTroops = function(a1_2, a2) -- Line: 45 -- upvalues: Animation (upval), a1 (val), playOneShot (val), u1 (val)
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
        Stomp = function(a1_2, a2) -- Line: 60
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), playOneShot (val), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), Shaker (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.67)
            playOneShot((a1.Model.Head:FindFirstChild("Stomp")))
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 87 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
        Block = function(a1_2) -- Line: 94 -- upvalues: Animation (upval), a1 (val)
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
        Shield = function(a1_2, a2) -- Line: 107 -- upvalues: a1 (val), ReplicatedStorage (upval), TimescaleUtilities (upval)
            local Size = a1.Model.HumanoidRootPart.Size
            local Effects = ReplicatedStorage:FindFirstChild("Effects")
            local Shield = Effects and Effects:FindFirstChild("Shield")
            local u20 = Shield
            if u20 then
                u20 = Shield:Clone()
            end
            if not u20 then
                return
            end
            u20:SetPrimaryPartCFrame(a1.Model.HumanoidRootPart.CFrame)
            u20.Effect.Size = Vector3.new(Size.X * 2.5, Size.Y * 1.5, Size.X * 2.5)
            u20.Effect.Damage1.Display.Text = a2
            u20.Effect.Damage2.Display.Text = a2
            u20.Effect.Damage3.Display.Text = a2
            u20.Effect.Damage4.Display.Text = a2
            u20.Parent = a1.Model
            u20.PrimaryPart.Weld.Part1 = a1.Model.HumanoidRootPart
            TimescaleUtilities.Delay(a1_2, function() -- Line: 126 -- upvalues: u20 (val)
                u20:Destroy()
            end)
        end,
        Spin = function() -- Line: 131 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Spin,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("SwordLunge")))
            a1.Model.Sword.Trail.Enabled = true
            a1:Delay(1.5)
            a1.Model.Sword.Trail.Enabled = false
        end,
        Death = function() -- Line: 142 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Dead")))
        end,
        Charge = function(a1_2) -- Line: 150 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Charge,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Sword.Shock.Enabled = true
            a1:Delay(a1_2)
            a1.Model.Sword.Shock.Enabled = false
        end,
        Lightning = function(self) -- Line: 160 -- upvalues: Laser (upval), playOneShot (val), EasySound (upval)
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
            playOneShot((self.Head:FindFirstChild("Lightning")))
            if not self.Head or not self.Head:FindFirstChild("Lightning") then
                EasySound.Play({
                    id = 821439273,
                    volume = 1,
                    soundGroupName = "Enemies",
                    destroyOnEnd = true,
                    parent = self.Head,
                })
            end
        end,
        Rage = function() -- Line: 186 -- upvalues: Animation (upval), a1 (val), playOneShot (val), TweenService (upval)
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