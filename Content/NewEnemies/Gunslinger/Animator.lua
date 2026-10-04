-- Script path: ReplicatedStorage.Content.NewEnemies.Gunslinger.Animator
-- Decompile time: 8.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local GunSlinger = ReplicatedStorage.Assets.Effects.Mob:WaitForChild("GunSlinger")

function v1.Initialize(a1) -- Line: 18
    -- upvalues: Animation (val), Laser (val), GunSlinger (val), TimescaleUtilities (val), TweenService (val)
    -- upvalues: GameState (val)
    a1.Shooting = false
    local u10 = Animation.new({
        Track = a1.Model.Animations.RevolverIntro,
        Target = a1.Model.AnimationController,
    })
    local u19 = Animation.new({
        Track = a1.Model.Animations.MinigunIntro,
        Target = a1.Model.AnimationController,
    })
    local u28 = Animation.new({
        Track = a1.Model.Animations.MinigunLoop,
        Target = a1.Model.AnimationController,
    })

    function a1.Face(a1_2) -- Line: 34 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 43 -- upvalues: a1 (val)
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

    function a1.EnabledRageEffect(a1_2) -- Line: 58 -- upvalues: a1 (val)
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v.Name == "Rage" and v:IsA("ParticleEmitter") then
                v.Enabled = a1_2
            end
        end
    end

    a1.Executables = {
        Barrage = function(a1_2, a2) -- Line: 67 -- upvalues: a1 (val), u19 (val), u28 (val)
            a1.Shooting = a1_2
            if a1_2 and a2 then
                a1.StartFireTime = os.clock() + a2
            end
            local Handle3 = a1.Model:WaitForChild("Handle3")
            local Barrel = a1.Model:WaitForChild("Barrel")
            if not a1_2 then
                u28:Stop()
                u19.Controller:AdjustSpeed(1)
                Handle3.Fire:Stop()
                return
            end
            u19:Play()
            Handle3.Open:Play()
            local u28_2 = nil
            pcall(function() -- Line: 82 -- upvalues: u28_2 (ref), u19 (upval), Handle3 (val), Barrel (val)
                u28_2 = (u19.Controller:GetMarkerReachedSignal("Event")):Connect(function(a1) -- Line: 85 -- upvalues: u19 (upval), Handle3 (upval), Barrel (upval)
                    if a1 == "Freeze" then
                        u19.Controller:AdjustSpeed(0)
                        return
                    end
                    if a1 == "Appear" then
                        Handle3.Transparency = 0
                        Barrel.Transparency = 0
                        return
                    end
                    if a1 == "Hide" then
                        Handle3.Transparency = 1
                        Barrel.Transparency = 1
                    end
                end)
            end)
            a1:Delay(a2)
            u28:Play()
            Handle3.Fire:Play()
            u19.Controller.Stopped:Wait()
            u28_2:Disconnect()
        end,
        BeamPosition = function(a1_2) -- Line: 112 -- upvalues: a1 (val), Laser (upval)
            local Attribute, v1
            local Handle3 = a1.Model.Handle3
            for k, v in pairs(Handle3.Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            for k2, i in pairs(a1_2) do
                v1 = {
                    Start = Handle3.Start.WorldPosition,
                    Pos = i,
                    Color = BrickColor.new("Cork").Color,
                    Transparency = 0.1,
                    Size = 0.04,
                    Fade = 90,
                    Type = "Bullet",
                    Bullet = "Normal",
                }
                Laser:Cast(v1)
            end
        end,
        Rage = function(a1_2) -- Line: 141 -- upvalues: Animation (upval), a1 (val), GunSlinger (upval), TimescaleUtilities (upval)
            Animation.new({
                Track = a1.Model.Animations.Rage,
                Target = a1.Model.AnimationController,
            }):Play()
            task.defer(function() -- Line: 147 -- upvalues: GunSlinger (upval), TimescaleUtilities (upval), a1_2 (val), a1 (upval)
                local u7 = GunSlinger:WaitForChild("Sandstorm"):Clone()
                u7.Parent = workspace.CurrentCamera
                TimescaleUtilities.Delay(a1_2 + 5, function() -- Line: 151 -- upvalues: u7 (val)
                    u7:Destroy()
                end)
                a1:Delay(a1_2)
                for k, v in pairs(u7:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                end
            end)
        end,
        Shoot = function(a1_2, a2, a3, a4) -- Line: 165
            -- upvalues: a1 (val), TweenService (upval), GunSlinger (upval), Animation (upval), GameState (upval)
            -- upvalues: TimescaleUtilities (upval)
            local Attribute
            local Handle = a1.Model:WaitForChild("Handle")
            local v1 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v1}
            ):Play()
            local u40 = GunSlinger:WaitForChild("Bullet"):Clone()
            local v2 = (CFrame.new(Handle.Start.WorldPosition, a1_2)) - Handle.Start.WorldPosition
            local u52 = CFrame.new(a1_2) * v2
            u40.CFrame = CFrame.new(Handle.Start.WorldPosition, a1_2)
            u40.Parent = workspace.CurrentCamera
            TweenService:Create(u40, TweenInfo.new(a2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = u52}):Play()
            Animation.new({
                Track = a1.Model.Animations.RevolverFire,
                Target = a1.Model.AnimationController,
            }):Play()
            local v3 = Handle.Fire:Clone()
            v3.Name = "FireSound"
            v3.PlaybackSpeed = (Random.new():NextNumber(0.8, 1.2)) * GameState.TimeScale
            v3.Parent = Handle
            v3:Play()
            game.Debris:AddItem(v3, v3.TimeLength)
            for k, v in pairs(Handle.Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            TimescaleUtilities.Delay(a2 * 2, function() -- Line: 228 -- upvalues: u40 (val)
                u40:Destroy()
            end)
            coroutine.wrap(function(a1) -- Line: 232 -- upvalues: a2 (val), u40 (val), GunSlinger (upval), u52 (val), TimescaleUtilities (upval)
                local Attribute, Attribute_2
                a1:Delay(a2)
                u40.Transparency = 1
                for k, v in pairs(u40.Effect:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v.Enabled = false
                    end
                end
                local u30 = GunSlinger:WaitForChild("BulletDirt"):Clone()
                u30.CFrame = u52 * CFrame.Angles(0, 3.141592653589793, 0)
                u30.Parent = workspace.CurrentCamera
                for k2, i in pairs(u30.Effect:GetChildren()) do
                    if i:IsA("ParticleEmitter") then
                        Attribute_2 = i:GetAttribute("EmitCount")
                        if Attribute_2 then
                            i:Emit(Attribute_2)
                        end
                    end
                end
                for k3, j in pairs(u30.Effect:GetChildren()) do
                    if j:IsA("ParticleEmitter") then
                        Attribute = j:GetAttribute("EmitCount")
                        if Attribute then
                            j:Emit(Attribute)
                        end
                    end
                end
                TimescaleUtilities.Delay(4, function() -- Line: 264 -- upvalues: u30 (val)
                    u30:Destroy()
                end)
            end)(a1)
        end,
        Revolver = function(a1) -- Line: 270 -- upvalues: u10 (val)
            if not a1 then
                u10.Controller:AdjustSpeed(1)
                return
            end
            u10:Play()
            local u5 = nil
            pcall(function() -- Line: 276 -- upvalues: u5 (ref), u10 (upval)
                u5 = (u10.Controller:GetMarkerReachedSignal("Freeze")):Connect(function(a1) -- Line: 279 -- upvalues: u10 (upval)
                    u10.Controller:AdjustSpeed(0)
                end)
                u10.Controller.Stopped:Wait()
                u5:Disconnect()
            end)
        end,
        BulletRain = function(a1_2, a2, a3, a4) -- Line: 291
            -- upvalues: a1 (val), Animation (upval), GunSlinger (upval), TweenService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local Attribute, CFrame_3, v1, v2, v3
            local Handle2 = a1.Model:WaitForChild("Handle2")
            Animation.new({
                Track = a1.Model.Animations.SkyShoot,
                Target = a1.Model.AnimationController,
            }):Play()
            local v4 = Handle2.Fire:Clone()
            v4.Name = "FireSound"
            v4.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
            v4.Parent = Handle2
            v4:Play()
            game.Debris:AddItem(v4, v4.TimeLength)
            for k, v in pairs(Handle2.Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            a1:Delay(a2)
            local u74 = GunSlinger:WaitForChild("Bullet"):Clone()
            u74.CFrame = CFrame.new(Handle2.Start.WorldPosition, Handle2.Start.WorldPosition + Vector3.new(0, 80 * a1_2, 0))
            u74.Parent = workspace.CurrentCamera
            TweenService:Create(
                u74,
                TweenInfo.new(a1_2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = u74.CFrame + Vector3.new(0, 80 * a1_2, 0)}
            ):Play()
            TimescaleUtilities.Delay(a1_2, function() -- Line: 339 -- upvalues: u74 (val)
                u74:Destroy()
            end)
            for k2, i in pairs(a4) do
                v1 = i[1]
                v2 = i[2]
                local u144 = GunSlinger:WaitForChild("BulletRain"):Clone()
                u144:SetPrimaryPartCFrame((CFrame.new(v1)))
                local Bullet = u144:WaitForChild("Bullet")
                local Warn = u144:WaitForChild("Warn")
                CFrame_3 = Bullet.CFrame
                Bullet.CFrame = Bullet.CFrame + Vector3.new(0, 80 * (a1_2 * v2), 0)
                v3 = a1_2 * v2
                u144.Parent = workspace.CurrentCamera
                Warn.Size = Vector3.new(0, 0, 0)
                Warn.Transparency = 0
                TweenService:Create(
                    Warn,
                    TweenInfo.new(v3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                    {Size = Vector3.new(a3 * 2, a3 * 2, a3 * 2)}
                ):Play()
                TweenService:Create(
                    Bullet,
                    TweenInfo.new(v3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                    {CFrame = CFrame_3}
                ):Play()
                TimescaleUtilities.Delay(v3, function() -- Line: 390 -- upvalues: Warn (val), Bullet (val), u144 (val)
                    local Attribute
                    Warn.Transparency = 1
                    Bullet.Transparency = 1
                    Bullet.Hit:Play()
                    for k, v in pairs(Bullet.Effect:GetChildren()) do
                        if v:IsA("ParticleEmitter") then
                            v.Enabled = false
                        end
                    end
                    for k2, i in pairs(Warn.Effect:GetChildren()) do
                        if i:IsA("ParticleEmitter") then
                            Attribute = i:GetAttribute("EmitCount")
                            if Attribute then
                                i:Emit(Attribute)
                            end
                        end
                    end
                    game.Debris:AddItem(u144, 4)
                end)
            end
        end,
        Death = function() -- Line: 416 -- upvalues: Animation (upval), a1 (val), TweenService (upval)
            local v1, v2, v3, v4
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            task.defer(function() -- Line: 423 -- upvalues: u10 (val), a1 (upval)
                while u10.Controller.Length == 0 do
                    a1:Delay(0.01)
                end
                a1:Delay(u10.Controller.Length * 0.9)
                u10.Controller:AdjustSpeed(0)
            end)
            local DeathEffects = a1.Model.HumanoidRootPart:WaitForChild("DeathEffects")
            local v5 = {}
            for k, v in pairs({"Waist", "Torso", "Head", "Left Hand", "Right Hand", "Left Leg", "Right Leg"}) do
                v4 = a1.Model:FindFirstChild(v)
                if v4 then
                    for k2, i in pairs(DeathEffects:GetChildren()) do
                        v3 = i:Clone()
                        v3.Parent = v4
                        v3.Enabled = true
                        table.insert(v5, v3)
                    end
                end
            end
            a1:Delay(6)
            for k3, j in pairs(a1.Model:GetDescendants()) do
                if j:IsA("MeshPart") then
                    j.TextureID = ""
                    j.Color = Color3.new(0.313725, 0.313725, 0.313725)
                    v4 = TweenService
                    v1 = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
                    v2 = {Color = Color3.new(0.0862745, 0.0862745, 0.0862745)}
                    v4:Create(j, v1, v2):Play()
                end
            end
            a1:Delay(2)
            for k4, k5 in pairs(v5) do
                k5.Enabled = false
            end
        end,
    }

    function a1.OnStepFunction(a1_2) -- Line: 483 -- upvalues: a1 (val)
        if a1.Shooting then
            local HumanoidRootPart = a1.Model.HumanoidRootPart
            local Position = HumanoidRootPart.Position
            HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(CFrame.new(
                Position,
                Position + Vector3.new(math.cos((os.clock()) - a1.StartFireTime) * 0.15, 0, math.sin((os.clock()) - a1.StartFireTime) * 0.15)
            ), a1_2 * 5)
        end
    end
end

return v1