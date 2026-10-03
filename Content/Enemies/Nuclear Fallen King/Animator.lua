-- Script path: ReplicatedStorage.Content.Enemies.Nuclear Fallen King.Animator
-- Decompile time: 4.09 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function createBeam(a1, a2) -- Line: 16 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local Part = Instance.new("Part")
    Part.Shape = "Cylinder"
    Part.Size = Vector3.new(0, 1, 1)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Material = "Neon"
    Part.Color = Color3.fromRGB(77, 165, 99)
    Part.Transparency = 0
    Part.CFrame = (CFrame.new(a1)) * CFrame.new(0, -2, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
    local Part_2 = Instance.new("Part")
    Part_2.Shape = "Cylinder"
    Part_2.Size = Vector3.new(0.30000001192092896, 0, 0)
    Part_2.Anchored = true
    Part_2.CanCollide = false
    Part_2.Material = "Neon"
    Part_2.Color = Color3.fromRGB(77, 165, 99)
    Part_2.Transparency = 0
    Part_2.CFrame = (CFrame.new(a1)) * CFrame.Angles(0, 0, 1.5707963267948966)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://164826470"
    Sound.Parent = Part_2
    Part.Parent = workspace.CurrentCamera
    Part_2.Parent = workspace.CurrentCamera
    Sound:Play()
    TweenService:Create(
        Part,
        TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
        {Size = Vector3.new(10, 1, 1), Transparency = 1}
    ):Play()
    TweenService:Create(
        Part_2,
        TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
        {Transparency = 1, Size = Vector3.new(0.3, a2, a2)}
    ):Play()
    TimescaleUtilities.Delay(1.5, function() -- Line: 57 -- upvalues: Part (val), Part_2 (val)
        Part:Destroy()
        Part_2:Destroy()
    end)
end

function v1.Initialize(a1) -- Line: 63
    -- upvalues: EasySound (val), Animation (val), ReplicatedStorage (val), TimescaleUtilities (val)
    -- upvalues: EffectsController (val), TweenService (val), Laser (val), GameState (val)
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

    local function playOneShot(a1) -- Line: 77 -- upvalues: EasySound (upval) -- types: a1: userdata?
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
        SpawnTroops = function(a1_2, a2) -- Line: 92 -- upvalues: Animation (upval), a1 (val), playOneShot (val), u1 (val)
            Animation.new({
                Track = a1.Model.Animations.Call,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Scream")))
            a1:Delay(0.3)
            for k, v in pairs(u1) do
                v.Dirt:Emit(10)
            end
        end,
        Stomp = function(a1_2, a2) -- Line: 104
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval), playOneShot (val), TweenService (upval)
            local u7 = ReplicatedStorage.Effects.SonicBoom:Clone()
            u7.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u7.Orientation = Vector3.new(90, -90, 0)
            a1.Model.HumanoidRootPart.Portal.BlackHole.Enabled = true
            a1.Model.HumanoidRootPart.Portal.Wither.Enabled = true
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(1.12)
            a1.Model.HumanoidRootPart.Portal.BlackHole.Enabled = false
            a1.Model.HumanoidRootPart.Portal.Wither.Enabled = false
            TimescaleUtilities.Delay(0.1, function() -- Line: 119 -- upvalues: EffectsController (upval), u7 (val), a1 (upval)
                EffectsController.Explosion({
                    Position = u7.Position,
                    Radius = 18,
                    Color = BrickColor.new("Royal purple"),
                    Sound = 2011915907,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
                a1:Delay(0.05)
                a1.Model.HumanoidRootPart.Node.Dirt:Emit(45)
            end)
            playOneShot((a1.Model.Head:FindFirstChild("Stomp")))
            u7.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(u7, TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = v1}):Play()
            TweenService:Create(u7, TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 154 -- upvalues: u7 (val)
                u7:Destroy()
            end)
        end,
        Block = function(a1_2) -- Line: 159 -- upvalues: Animation (upval), a1 (val)
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
        Shield = function(a1_2, a2) -- Line: 171 -- upvalues: a1 (val), ReplicatedStorage (upval), TimescaleUtilities (upval)
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
            TimescaleUtilities.Delay(a1_2, function() -- Line: 190 -- upvalues: u20 (val)
                u20:Destroy()
            end)
        end,
        Spin = function() -- Line: 195 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Spin,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.82)
            playOneShot((a1.Model.Head:FindFirstChild("SwordLunge")))
            a1.Model.Sword.Trail.Enabled = true
            a1:Delay(0.6)
            a1.Model.Sword.Trail.Enabled = false
        end,
        Death = function() -- Line: 207 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Dead")))
        end,
        Charge = function(a1_2) -- Line: 215 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Charge,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Sword.Shock.Enabled = true
            a1:Delay(a1_2)
            a1.Model.Sword.Shock.Enabled = false
        end,
        DeathBeam = function(a1, a2) -- Line: 225
            for k, v in pairs(a2) do
                if v ~= nil then
                    createBeam(v, a1)
                end
            end
        end,
        Lightning = function(a1) -- Line: 233 -- upvalues: Laser (upval), GameState (upval), TimescaleUtilities (upval)
            local v1 = {
                Start = a1.Start,
                Pos = a1.Position,
                Color = BrickColor.new("Bright green"),
                Transparency = 0.1,
                Size = 0.3,
                Fade = 2,
                Type = "Fade",
            }
            Laser:Bolt(v1)
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://821439273"
            Sound.Parent = a1.Head
            Sound.PlaybackSpeed = 1 * GameState.TimeScale
            Sound.Volume = 1
            Sound:Play()
            TimescaleUtilities.Delay(Sound.TimeLength, function() -- Line: 253 -- upvalues: Sound (val)
                Sound:Destroy()
            end)
        end,
        Rage = function() -- Line: 258 -- upvalues: Animation (upval), a1 (val), playOneShot (val)
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            playOneShot((a1.Model.Head:FindFirstChild("Scream")))
            a1.Model.Head.Eye1.Transparency = 0
            a1.Model.Head.Eye2.Transparency = 0
            a1.Model.HumanoidRootPart.PointLight.Enabled = true
            a1:Delay(3)
        end,
    }
end

return v1