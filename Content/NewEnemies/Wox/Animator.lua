-- Script path: ReplicatedStorage.Content.NewEnemies.Wox.Animator
-- Decompile time: 11.26 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ClientGameMiddleware = require(ReplicatedStorage.Client.Modules.Replicators.ClientGameMiddleware)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local PizzaBoss = game:GetService("ReplicatedStorage").Assets.Effects.Mob:WaitForChild("PizzaBoss")
local Cake = PizzaBoss.Cake
local CakeSlice = PizzaBoss.CakeSlice

function v1.Initialize(a1) -- Line: 33
    -- upvalues: Animation (val), ClientGameMiddleware (val), Enum (val), EffectsController (val), Lighting (val)
    -- upvalues: RunService (val), Players (val), Shaker (val), GameState (val), Cake (val), TimescaleUtilities (val)
    -- upvalues: spr (val), ItemDrop (val), EmitterManager (val), CakeSlice (val), ReplicatedStorage (val)
    -- upvalues: SoundService (val), TweenService (val), PizzaBoss (val), LightningBolt (val)
    local v1
    a1.Shooting = false
    local u3 = Random.new()
    a1.Model.Animations.Walk.Name = "walk2"
    local u16 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Speed = 0.2,
        Track = a1.Model.Animations.walk2,
        Target = a1.Model.AnimationController,
    })
    u16:Play()
    local v2 = {
        a1.Model["Limb shell.001"],
        a1.Model["Limb shell.002"],
        a1.Model["Limb shell.003"],
        a1.Model["Limb shell.004"],
        a1.Model["Limb shell.005"],
        a1.Model["Limb shell.006"],
        a1.Model["Limb shell.007"],
        a1.Model["Limb shell.008"],
        a1.Model["Cylinder.043"],
        a1.Model["Cylinder.031"],
        a1.Model.Waist,
        a1.Model.Chest,
        a1.Model["Cube.003"],
        a1.Model["Cube.015"],
        a1.Model["Cube.001"],
        a1.Model["Cube.001"],
        a1.Model["Cube.006"],
    }
    local u55 = {}
    local MaxHealth = a1.MaxHealth
    local v3 = MaxHealth / (#v2 + 1)
    local v4 = #v2
    for i = 1, v4 do
        v1 = {MaxHealth - i * (v3 + 1), v2[i]}
        u55[i] = v1
    end
    local u79 = 1
    if not ClientGameMiddleware.Replicator:Has(Enum.GameModifier.Redemption) then
        (a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 84 -- upvalues: u79 (ref), u55 (val), EffectsController (upval)
            local v1 = u79
            if #u55 < v1 then
                return
            end
            if a1 < u55[u79][1] then
                EffectsController.Explosion({
                    Position = u55[u79][2].Position,
                    Radius = Random.new():NextNumber(1.5, 3.5),
                    Color = BrickColor.new(Color3.new(1, 0.666667, 0)),
                    Sound = 5264403010,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
                v1 = u55[u79][2]
                v1.Transparency = 1
                u79 = u79 + 1
            end
        end)
    else
        for j, k in v2 do
            k.Transparency = 1
        end
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.DisplayOrder = 99999
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    local ViewportFrame = Instance.new("ViewportFrame")
    ViewportFrame.Size = UDim2.new(1, 0, 1, 0)
    ViewportFrame.Position = UDim2.new(0.5, 0, 1, 0)
    ViewportFrame.AnchorPoint = Vector2.new(0.5, 0)
    ViewportFrame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    ViewportFrame.LightColor = Color3.new(1, 0.435294, 0.294118)
    ViewportFrame.BackgroundTransparency = 1
    ViewportFrame.ImageTransparency = 1
    ViewportFrame.Parent = ScreenGui
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Size = UDim2.new(1, 0, 1, 0)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.ImageTransparency = 1
    ImageLabel.Image = "rbxassetid://8052577310"
    ImageLabel.Parent = ScreenGui
    local WorldModel = Instance.new("WorldModel")
    WorldModel.Parent = ViewportFrame
    local u169 = a1.Model:Clone()
    u169.Parent = WorldModel
    local Camera = Instance.new("Camera")
    Camera.Parent = ViewportFrame
    ViewportFrame.CurrentCamera = Camera
    local Frame = Instance.new("Frame")
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.ZIndex = 2
    Frame.BackgroundTransparency = 1
    Frame.Parent = ScreenGui
    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
    ColorCorrectionEffect:AddTag("DONT_TOUCH")
    ColorCorrectionEffect.Parent = Lighting
    task.spawn(function() -- Line: 151 -- upvalues: u169 (val)
        (game:GetService("ContentProvider")):PreloadAsync({u169, u169.Animations.Jumpscare})
    end)
    a1.Maid:Mark(ScreenGui)
    a1.Maid:Mark(ColorCorrectionEffect)
    a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 157 -- upvalues: Camera (val), u169 (val)
        Camera.CFrame = CFrame.lookAt((u169.HumanoidRootPart.CFrame * CFrame.new(0, 6.5, -5)).Position, u169["Cube.006"].Position)
    end)))
    local u229 = Animation.new({
        Track = a1.Model.Animations.CakeThrow,
        Target = a1.Model.AnimationController,
    })
    local u238 = Animation.new({
        Track = a1.Model.Animations.Guitar,
        Target = a1.Model.AnimationController,
    })
    local u247 = Animation.new({
        Track = a1.Model.Animations.CoinShoot,
        Target = a1.Model.AnimationController,
    })
    local u256 = Animation.new({
        Track = a1.Model.Animations.Windup,
        Target = a1.Model.AnimationController,
    })
    local u265 = Animation.new({
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController,
    })
    local u272 = Animation.new({Track = u169.Animations.Jumpscare, Target = u169.AnimationController})
    ScreenGui.Parent = Players.LocalPlayer.PlayerGui
    local u277 = a1.Model["Cube.006"]

    function a1.Face(a1_2) -- Line: 195 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 204 -- upvalues: a1 (val)
        local v1 = {
            a1.Model,
            workspace.Map.Boundaries,
            workspace.Towers,
            workspace.ClientUnits,
            workspace.CurrentCamera,
            workspace.Replicate,
        }
        for k, v in pairs(game.Players:GetChildren()) do
            table.insert(v1, v.Character)
        end
        return v1
    end

    function a1.EnabledRageEffect(a1_2) -- Line: 219 -- upvalues: a1 (val)
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v.Name == "Rage" and v:IsA("ParticleEmitter") then
                v.Enabled = a1_2
            end
        end
    end

    a1.Executables = {
        Death = function() -- Line: 228
            -- upvalues: u16 (val), u265 (val), a1 (val), Shaker (upval), GameState (upval), EffectsController (upval)
            local v1, v2
            u16:Stop()
            u265:Play()
            u265.Controller:AdjustSpeed(0.4)
            task.defer(function() -- Line: 234 -- upvalues: u265 (upval), a1 (upval)
                while u265.Controller.Length == 0 do
                    a1:Delay()
                end
                a1:Delay(u265.Controller.Length * 0.98)
                u265.Controller:AdjustSpeed(0)
            end)
            local v3 = tick()
            for k, v in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
            while true do
                if not ((tick() - v3) * GameState.TimeScale < 6) then
                    break
                end
                v1 = CFrame.new(Random.new():NextNumber(-4, 4), Random.new():NextNumber(-3, 3), Random.new():NextNumber(-3, 3))
                v2 = a1.Model.HumanoidRootPart.CFrame * v1
                EffectsController.Explosion({
                    Position = v2.Position,
                    Radius = Random.new():NextNumber(1.5, 3.5),
                    Color = BrickColor.new(Color3.new(1, 0.666667, 0)),
                    Sound = 5264403010,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
                a1:Delay((Random.new():NextNumber(0.2, 0.4)))
            end
            for k2, i in pairs(a1.Model.Torso.DeathParticle:GetChildren()) do
                if i:IsA("ParticleEmitter") and i.Name ~= "Smoke" then
                    i.Enabled = false
                end
            end
        end,
        Cake = function(a1_2) -- Line: 283
            -- upvalues: Cake (upval), u229 (val), TimescaleUtilities (upval), a1 (val), spr (upval), ItemDrop (upval)
            -- upvalues: EmitterManager (upval), CakeSlice (upval), u3 (val), Shaker (upval)
            local u4 = Cake:Clone()
            local Size = Cake.Size
            u229:Play()
            u229.Looped = false
            TimescaleUtilities.Delay(2.8499999999999996, function() -- Line: 290 -- upvalues: u229 (upval)
                u229:Stop()
            end)
            a1:Delay(0.375)
            a1.Model.Cake.Transparency = 0
            a1:Delay(1.2000000000000002)
            a1.Model.Cake.Transparency = 1
            local v1 = CFrame.new(a1.Model.Cake.Position)
            local Position = v1.Position
            u4.Size = Vector3.new(0, 0, 0)
            u4:PivotTo(v1)
            u4.Parent = workspace.Trash
            u4.Whoosh:Play()
            spr.target(u4, 1, 2, {Size = Size})
            ;(ItemDrop.Drop(Position, Position + Vector3.new(0, 3, 0), u4, 5, -0.9, 3.7, function(a1) -- Line: 319
                return CFrame.Angles(a1, 0, 0)
            end)):andThen(function() -- Line: 323
                -- upvalues: Position (val), u4 (val), EmitterManager (upval), a1_2 (val), CakeSlice (upval)
                -- upvalues: spr (upval), u3 (upval), ItemDrop (upval), Shaker (upval), a1 (upval)
                local Size
                local u2 = Position + Vector3.new(0, 3, 0)
                u4:Destroy()
                EmitterManager.Emit("CakeBreak", CFrame.lookAt(u2, Position))
                for i, j in a1_2 do
                    local u28 = CakeSlice:Clone()
                    Size = u28.Size
                    u28.Size = Vector3.new(0, 0, 0)
                    u28:PivotTo((CFrame.new(u2)))
                    u28.Parent = workspace.Trash
                    u28.Fuse:Play()
                    spr.target(u28, 1, 2, {Size = Size})
                    local u54 = u3:NextNumber()
                    ;(ItemDrop.Drop(u2, j, u28, 5, -0.9, 3.1, function(a1) -- Line: 348 -- upvalues: u2 (val), Position (upval), u54 (val)
                        local v1 = (CFrame.lookAt(u2, Position)) * CFrame.Angles(u54 + a1, 0, 0)
                        return v1 - v1.Position
                    end)):andThen(function() -- Line: 354 -- upvalues: u28 (val), EmitterManager (upval), u2 (val), Shaker (upval)
                        u28:Destroy()
                        EmitterManager.Emit("CakeExplosion", CFrame.new(u2))
                        Shaker:Shake({0.3, 20.5, 0.1, 0.2}, 0.5, 0.5)
                    end)
                    a1:Delay(0.05)
                end
            end)
        end,
        Gun = function(a1_2) -- Line: 364 -- upvalues: u247 (val), a1 (val)
            u247:Play()
            a1:Delay(3.3)
            u247:Stop()
        end,
        Guitar = function(a1_2) -- Line: 371 -- upvalues: u238 (val), a1 (val)
            u238:Play()
            a1:Delay(0.6)
            a1.Model.Guitar.Transparency = 0
            a1:Delay(2.5)
            a1.Model.Guitar.Transparency = 1
            a1:Delay(0.5)
            u238:Stop()
        end,
        Scare = function() -- Line: 382
            -- upvalues: ReplicatedStorage (upval), SoundService (upval), spr (upval), ImageLabel (val), u256 (val)
            -- upvalues: a1 (val), TimescaleUtilities (upval)
            local u6 = ReplicatedStorage.Assets.Sounds.Static:Clone()
            u6.Parent = SoundService
            u6.Volume = 0
            u6:Play()
            spr.target(workspace.CurrentCamera, 1, 0.5, {FieldOfView = 50})
            spr.target(ImageLabel, 1, 0.5, {ImageTransparency = 0})
            spr.target(u6, 1, 0.5, {Volume = 1})
            u256:Play()
            a1:Delay(2.5)
            u256:Stop()
            spr.target(ImageLabel, 1, 6, {ImageTransparency = 1})
            spr.target(workspace.CurrentCamera, 1, 6, {FieldOfView = 70})
            spr.target(u6, 1, 6, {Volume = 0})
            TimescaleUtilities.Delay(5, function() -- Line: 399 -- upvalues: u6 (val)
                u6:Destroy()
            end)
        end,
        Scream = function(a1_2) -- Line: 404
            -- upvalues: a1 (val), Shaker (upval), SoundService (upval), ReplicatedStorage (upval), u272 (val)
            -- upvalues: spr (upval), ViewportFrame (val), Frame (val), ColorCorrectionEffect (val)
            if (workspace.CurrentCamera.CFrame.LookVector:Dot((CFrame.lookAt(a1.Model.HumanoidRootPart.Position, workspace.CurrentCamera.CFrame.Position)).LookVector)) < 0.4
                or a1_2 then
                Shaker:Shake({6, 40.5, 0.05, 0.2}, 0.5, 5)
                SoundService:PlayLocalSound(ReplicatedStorage.Assets.Sounds.Jumpscare)
                u272:Play()
                spr.target(ViewportFrame, 1, 12, {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0, 0)})
                a1:Delay(0.5)
                SoundService:PlayLocalSound(ReplicatedStorage.Assets.Sounds.DeepImpact)
                SoundService:PlayLocalSound(ReplicatedStorage.Assets.Sounds.StringImpact)
                spr.target(Frame, 1, 12, {BackgroundTransparency = 0})
                spr.target(ColorCorrectionEffect, 1, 12, {Brightness = -0.7, Contrast = 0.5})
                a1:Delay(0.3)
                u272:Stop()
                ViewportFrame.Position = UDim2.new(0.5, 0, 1, 0)
                spr.target(ViewportFrame, 1, 12, {ImageTransparency = 1})
                spr.target(Frame, 1, 0.5, {BackgroundTransparency = 1})
                spr.target(ColorCorrectionEffect, 1, 0.2, {Brightness = 0, Contrast = 0})
            end
        end,
        Shoot = function(a1_2, a2, a3, a4) -- Line: 438
            -- upvalues: a1 (val), TweenService (upval), PizzaBoss (upval), ItemDrop (upval), EmitterManager (upval)
            local v1 = a1.Model:WaitForChild("Quad Coin gun")
            local v2 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v2}
            ):Play()
            local u40 = PizzaBoss:WaitForChild("Token"):Clone()
            local v3 = (CFrame.new(v1.Start.WorldPosition, a1_2)) - v1.Start.WorldPosition
            local u52 = CFrame.new(a1_2) * v3
            u40.CFrame = CFrame.new(v1.Start.WorldPosition, a1_2)
            u40.Parent = workspace.Trash
            ;(ItemDrop.Drop(v1.Start.WorldPosition, u52, u40, 5, -0.9, 3.7, function(a1) -- Line: 465
                return CFrame.Angles(a1, a1, 0)
            end)):andThen(function(a1) -- Line: 467 -- upvalues: u40 (val), EmitterManager (upval), u52 (val)
                u40:Destroy()
                EmitterManager.Emit("CoinExplosion", u52)
            end)
        end,
        Lightning = function(a1) -- Line: 473
            -- upvalues: LightningBolt (upval), EmitterManager (upval), TimescaleUtilities (upval)
            local v1 = {}
            local v2 = {}
            v1.WorldPosition = a1 + Vector3.new(0, 20, 0)
            v1.WorldAxis = Vector3.new(0, 0, 1)
            v2.WorldPosition = a1
            v2.WorldAxis = Vector3.new(0, 0, 1)
            local u12 = LightningBolt.new(v1, v2, 40)
            EmitterManager.Emit("LightningTouchdown", CFrame.new(a1))
            TimescaleUtilities.Delay(0.6, function() -- Line: 480 -- upvalues: u12 (val)
                u12:DestroyDissipate()
            end)
        end,
        StompEffect = function(a1_2, a2) -- Line: 485
            -- upvalues: ReplicatedStorage (upval), a1 (val), u277 (val), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), Shaker (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            local v1 = u277.Stomp:Clone()
            v1.Name = "Sound"
            v1.Parent = u277
            v1.PlaybackSpeed = Random.new():NextNumber(0.9, 1.1)
            v1:Play()
            game.Debris:AddItem(v1, v1.TimeLength)
            u9.Parent = workspace.CurrentCamera
            local v2 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(u9, TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = v2}):Play()
            TweenService:Create(u9, TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 517 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
    }
end

return v1