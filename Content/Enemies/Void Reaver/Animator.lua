-- Script path: ReplicatedStorage.Content.Enemies.Void Reaver.Animator
-- Decompile time: 9.13 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function createBeam(a1, a2) -- Line: 14 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local u10 = game.ReplicatedStorage.Assets.Effects.Mob.VoidBall:Clone()
    u10:SetPrimaryPartCFrame((CFrame.new(a1)))
    u10.Tail.Transparency = 1
    u10.Tail.Mesh.Scale = Vector3.new(0, 0, 0)
    u10.Area.Mesh.Scale = Vector3.new(0, 0, 0)
    u10.Area.Transparency = 1
    u10.Void.Size = Vector3.new(0, 0, 0)
    u10.Void.Transparency = 1
    u10.Parent = workspace.CurrentCamera
    u10.Void.Death:Play()
    TweenService:Create(
        u10.Area.Mesh,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
        {Scale = Vector3.new(a2, a2, a2)}
    ):Play()
    TweenService:Create(u10.Area, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 0.3}):Play()
    TweenService:Create(
        u10.Void,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
        {Transparency = 0, Size = Vector3.new(a2, a2, a2)}
    ):Play()
    TweenService:Create(
        u10.Tail.Mesh,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
        {Scale = Vector3.new(a2, 0.5, 0.5)}
    ):Play()
    TweenService:Create(
        u10.Tail.Mesh,
        TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
        {Scale = Vector3.new(a2, 0.5, 0.5)}
    ):Play()
    TweenService:Create(u10.Tail, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 0.3}):Play()
    TimescaleUtilities.Delay(0.5, function() -- Line: 81 -- upvalues: TweenService (upval), u10 (val), a2 (val), TimescaleUtilities (upval)
        TweenService:Create(
            u10.Area.Mesh,
            TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
            {Scale = Vector3.new(0, 0, 0)}
        ):Play()
        TweenService:Create(
            u10.Area.Mesh,
            TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
            {Scale = Vector3.new(0, 0, 0)}
        ):Play()
        TweenService:Create(
            u10.Area,
            TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
            {CFrame = u10.Area.CFrame * CFrame.Angles(0, 12.566370614359172, 0)}
        ):Play()
        TweenService:Create(
            u10.Void,
            TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
            {Size = Vector3.new(0, 0, 0), Transparency = 1}
        ):Play()
        TweenService:Create(
            u10.Tail.Mesh,
            TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
            {Scale = Vector3.new(a2 * 3, 0, 0)}
        ):Play()
        TimescaleUtilities.Delay(1.5, function() -- Line: 126 -- upvalues: u10 (upval)
            u10:Destroy()
        end)
    end)
end

function v1.Initialize(a1) -- Line: 132
    -- upvalues: ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val), Animation (val), Shaker (val)
    -- upvalues: EffectsController (val)
    function a1.Face(a1_2) -- Line: 133 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.Spike(a1, a2, a3) -- Line: 142
        -- upvalues: ReplicatedStorage (upval), TweenService (upval), TimescaleUtilities (upval)
        local u10 = ReplicatedStorage.Assets.Effects.Mob.VoidSpike:Clone()
        u10.CFrame = CFrame.new(a1)
        u10.Transparency = 1
        u10.Size = Vector3.new(0, 0, 0)
        local v1 = Vector3.new(a2, a2 * 2, a2)
        u10.Parent = workspace.Trash
        TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
            Transparency = 0,
            Size = v1,
            CFrame = CFrame.new(a1 + Vector3.new(0, a3, 0)),
        }):Play()
        u10.Exp:Play()
        TimescaleUtilities.Delay(0.2, function() -- Line: 164 -- upvalues: TweenService (upval), u10 (val), a1 (val), a2 (val), TimescaleUtilities (upval)
            TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
                Transparency = 1,
                CFrame = CFrame.new(a1),
                Size = Vector3.new(a2 / 2, a2 / 4, a2 / 2),
            }):Play()
            TimescaleUtilities.Delay(0.4, function() -- Line: 174 -- upvalues: u10 (upval)
                u10:Destroy()
            end)
        end)
    end

    local u14 = Animation.new({
        Track = a1.Model.Animations.Hold,
        Target = a1.Model.AnimationController,
    }):Play()
    u14:AdjustSpeed(0.17)
    a1.Executables = {
        Face = function(a1_2) -- Line: 188 -- upvalues: a1 (val)
            a1.Face(a1_2)
        end,
        Stomp = function(a1_2, a2) -- Line: 191
            -- upvalues: ReplicatedStorage (upval), a1 (val), Animation (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval), Shaker (upval)
            local u9 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u9.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u9.Orientation = Vector3.new(90, -90, 0)
            u9.BrickColor = BrickColor.new("Black")
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.31)
            a1.Model.Head.Hit:Play()
            a1.Model.Head.Stomp:Play()
            u9.Parent = workspace.CurrentCamera
            local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
            TweenService:Create(
                u9,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1, Size = v1}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 219 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
        end,
        DeathBeam = function(a1, a2) -- Line: 226
            for k, v in pairs(a2) do
                if v ~= nil then
                    createBeam(v, a1)
                end
            end
        end,
        Portal = function() -- Line: 234 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Hoard:Play()
        end,
        Slash = function(a1_2, a2, a3) -- Line: 242 -- upvalues: Animation (upval), a1 (val), Shaker (upval)
            Animation.new({
                Track = a1.Model.Animations.Slash,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Slash:Play()
            a1:Delay(0.7)
            a1.Model.Weapon.Sword.Blade.Trail.Enabled = true
            a1:Delay(0.1)
            coroutine.wrap(function(a1) -- Line: 253 -- upvalues: a2 (val), a1_2 (val), a3 (val)
                local v1 = a1
                for k, v in pairs(a2) do
                    if v ~= nil then
                        v1.Spike(v, a1_2, 0.5)
                    end
                    v1:Delay(a3)
                end
            end)(a1)
            Shaker:Shake({2, 5, 0.25, 0.5}, 0.7, 0.5)
            a1:Delay(0.65)
            a1.Model.Weapon.Sword.Blade.Trail.Enabled = false
        end,
        Sprinting = function() -- Line: 266 -- upvalues: Animation (upval), a1 (val)
            (Animation.new({
                Track = a1.Model.Animations.Sprint,
                Target = a1.Model.AnimationController,
            }):Play()):AdjustSpeed(a1.Speed / 3.5)
        end,
        Rage = function(a1_2, a2, a3) -- Line: 275
            -- upvalues: Animation (upval), a1 (val), u14 (val), TweenService (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval), ReplicatedStorage (upval), Shaker (upval)
            local Color, v1, v2
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            u14:Stop()
            a1:Delay(0.4875)
            local v3 = a1.Model.Weapon.Sword:Clone()
            v3.PrimaryPart.Anchored = true
            local u42 = #workspace.Map.Paths["1"]:GetChildren()
            local v4 = (CFrame.new(a1.Model.Weapon.Sword.PrimaryPart.Position, workspace.Map.Paths["1"][u42].Position + Vector3.new(0, 3, 0))) * CFrame.Angles(0, 3.141592653589793, 0) - a1.Model.Weapon.Sword.PrimaryPart.Position
            v3:SetPrimaryPartCFrame((CFrame.new(a1.Model.Weapon.Sword.PrimaryPart.Position, workspace.Map.Paths["1"][u42].Position + Vector3.new(0, 3, 0))) * (CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)))
            v3.Parent = workspace.CurrentCamera
            TweenService:Create(v3.PrimaryPart, TweenInfo.new(a3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {
                CFrame = CFrame.new(workspace.Map.Paths["1"][u42].Position + Vector3.new(0, 3, 0)) * v4 * CFrame.new(0, 0, -7),
            }):Play()
            a1.Model.Weapon.Sword:Destroy()
            a1.Model.Head.Throw:Play()
            TimescaleUtilities.Delay(a3, function() -- Line: 320 -- upvalues: EffectsController (upval), u42 (val)
                EffectsController.Explosion({
                    Position = workspace.Map.Paths["1"][u42].Position,
                    Radius = 15,
                    Color = BrickColor.new("Royal purple"),
                    Sound = 440145223,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
            end)
            a1:Delay(1.1)
            local u164 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
            u164.CFrame = CFrame.new(a1.Model.HumanoidRootPart.Node.WorldPosition)
            u164.Orientation = Vector3.new(90, -90, 0)
            u164.BrickColor = BrickColor.new("Black")
            Animation.new({
                Track = a1.Model.Animations.Stomp,
                Target = a1.Model.AnimationController,
            }):Play()
            TimescaleUtilities.Delay(0.31, function() -- Line: 342 -- upvalues: a1 (upval), u164 (val), a2 (val), a1_2 (val), TweenService (upval), Shaker (upval)
                a1.Model.Head.Hit:Play()
                a1.Model.Head.Stomp:Play()
                u164.Parent = workspace.CurrentCamera
                local v1 = Vector3.new(a2 * a1_2, a2 * a1_2, 0.1)
                TweenService:Create(u164, TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Size = v1}):Play()
                TweenService:Create(
                    u164,
                    TweenInfo.new(a1_2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                    {Transparency = 1}
                ):Play()
                game.Debris:AddItem(u164, a1_2)
                Shaker:Shake({2, 4, 0.5, 1}, 2, 0.5)
            end)
            a1:Delay(0.25)
            a1.Model.Folder.Helmet.Transparency = 1
            a1.Model.Folder.Mask.Transparency = 1
            a1.Model.Folder.Glow.HelmetGlow.Transparency = 1
            a1.Model.Folder.Glow.FinalHair.Transparency = 0
            a1.Model.Folder.Helmet.Emitter:Emit(60)
            a1.Model.Folder.Helmet.Break:Play()
            for k, v in pairs({
                a1.Model.Folder.Glow.FinalHair,
                a1.Model.Folder.Glow.Spike1,
                a1.Model.Folder.Glow.Spike2,
                a1.Model.Folder.Glow.ChestGlow,
                a1.Model.Folder.Glow.SleeveGlow1,
                a1.Model.Folder.Glow.SleeveGlow2,
                a1.Model["Right Arm"],
            }) do
                Color = v.Color
                v.Color = Color3.fromRGB(10, 10, 10)
                v.Material = Enum.Material.Neon
                v1 = TweenService
                v2 = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                v1:Create(v, v2, {Transparency = 0, Color = Color}):Play()
            end
            a1:Delay(1)
            a1.Model.Head.Scream:Play()
            a1.Model.Weapon.LeftEnergy.Rage.Enabled = true
            a1.Model.Weapon.RightEnergy.Rage.Enabled = true
            a1.Model.Folder.Boot1.Rage.Enabled = true
            a1.Model.Folder.Boot2.Rage.Enabled = true
        end,
        Death = function() -- Line: 421 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play():AdjustSpeed(0.5)
            local v3 = {
                a1.Model["Left Arm"],
                a1.Model["Left Leg"],
                a1.Model["Right Arm"],
                a1.Model["Right Leg"],
                a1.Model.Torso,
                a1.Model.Head,
            }
            a1.Model.Weapon.LeftEnergy.Rage.Enabled = false
            a1.Model.Weapon.RightEnergy.Rage.Enabled = false
            a1.Model.Folder.Boot1.Rage.Enabled = false
            a1.Model.Folder.Boot2.Rage.Enabled = false
            a1.Model.Torso.Emitter1.Enabled = false
            a1.Model.Torso.Emitter2.Enabled = false
            a1.Model.Torso.Emitter3.Enabled = false
            a1.Model.Head.Fall:Play()
            a1:Delay(8)
            for k, v in pairs(v3) do
                v.DeathEmitter.Enabled = true
            end
            for k2, i in pairs(a1.Model:GetDescendants()) do
                if i:IsA("BasePart") then
                    v2 = TweenService
                    v1 = TweenInfo.new(16, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
                    v2:Create(i, v1, {Transparency = 1}):Play()
                end
            end
            a1:Delay(8)
            a1.Model.Head.Dead:Play()
            a1:Delay(8)
            for k3, j in pairs(v3) do
                j.DeathEmitter.Enabled = false
            end
        end,
    }
end

return v1