-- Script path: ReplicatedStorage.Content.Consumables.Nuke.Animator
-- Decompile time: 9.62 ms

local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local LocalPlayer = Players.LocalPlayer
local Nuke = ReplicatedStorage.Assets.Effects.Client.Nuke

local function getRayParams() -- Line: 24
    local v1 = RaycastParams.new()
    v1.RespectCanCollide = true
    v1.FilterType = Enum.RaycastFilterType.Include
    v1.FilterDescendantsInstances = {
        workspace:WaitForChild("Map"),
        workspace:WaitForChild("Cliff"),
        (workspace:WaitForChild("Ground")),
    }
    return v1
end

local function getGroundRay(a1) -- Line: 37 -- upvalues: getRayParams (val) -- types: a1: vector
    local v1 = workspace
    local v2 = a1 + Vector3.new(0, 1, 0)
    local v3 = getRayParams()
    return v1:Raycast(v2, Vector3.new(0, -10, 0), v3)
end

local function lightingEffect() -- Line: 41
    -- upvalues: Create (val), Lighting (val), TimescaleUtilities (val), TweenService (val)
    local u13 = Create("Atmosphere", {
        Name = "Atmosphere",
        Density = 0.899,
        Haze = 10,
        Color = Color3.fromRGB(255, 85, 0),
        Decay = Color3.fromRGB(0, 0, 0),
    })
    u13:AddTag("DONT_TOUCH")
    u13.Parent = Lighting
    return function() -- Line: 53 -- upvalues: TimescaleUtilities (upval), TweenService (upval), u13 (val)
        TimescaleUtilities.Wait(10)
        TweenService:Create(u13, TweenInfo.new(5), {Density = 0, Haze = 0, Color = Color3.new(1, 1, 1)}):Play()
        TimescaleUtilities.Delay(5, function() -- Line: 62 -- upvalues: u13 (upval)
            u13:Destroy()
        end)
    end
end

local function particleEffect() -- Line: 68
    -- upvalues: HttpService (val), Create (val), Players (val), RunService (val), TweenService (val)
    -- upvalues: TimescaleUtilities (val)
    local u9 = ("UPDATE_SPECS_%*"):format((HttpService:GenerateGUID(false)))
    local u127 = Create("Part", {
        Name = "Part",
        Anchored = true,
        BottomSurface = Enum.SurfaceType.Smooth,
        CFrame = CFrame.new(7.64935303, 21.6255646, -2.56286621, -1, 0, 0, 0, 1, 0, 0, 0, -1),
        CanCollide = false,
        EnableFluidForces = false,
        Rotation = Vector3.new(180, 0, 180),
        Size = Vector3.new(77.19999694824219, 77.19999694824219, 77.19999694824219),
        TopSurface = Enum.SurfaceType.Smooth,
        Transparency = 1,
        Create("ParticleEmitter", {
            Name = "Specs",
            Acceleration = Vector3.new(0, 7.139999866485596, 0),
            Brightness = 10,
            LightEmission = 1,
            LockedToPart = false,
            Rate = 40,
            Texture = "rbxassetid://8030760338",
            ZOffset = 1,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 85, 0)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
            }),
            EmissionDirection = Enum.NormalId.Right,
            Lifetime = NumberRange.new(4, 8),
            Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.78), (NumberSequenceKeypoint.new(1, 1.78))}),
            Speed = NumberRange.new(17.8),
            SpreadAngle = Vector2.new(-45, 45),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.0286, 0.0938, 0.0813),
                NumberSequenceKeypoint.new(0.247, 0.0625, 0.0454),
                NumberSequenceKeypoint.new(0.418, 0.144, 0.0305),
                NumberSequenceKeypoint.new(0.646, 0.294, 0.022),
                NumberSequenceKeypoint.new(0.907, 0.706, 0.0125),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        (Create("PointLight", {Name = "Light", Range = 60, Brightness = 4, Color = Color3.fromRGB(255, 85, 0)})),
    })
    u127.Parent = Players.LocalPlayer.Character
    RunService:BindToRenderStep(u9, Enum.RenderPriority.Camera.Value - 1, function() -- Line: 129 -- upvalues: u127 (val)
        if workspace.CurrentCamera then
            u127.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -u127.Size.Z / 2)
        end
    end)
    return function() -- Line: 135
        -- upvalues: TweenService (upval), u127 (val), TimescaleUtilities (upval), RunService (upval), u9 (val)
        TweenService:Create(u127.Specs, TweenInfo.new(2), {Rate = 0, Enabled = false}):Play()
        TweenService:Create(u127.Light, TweenInfo.new(2), {Brightness = 0}):Play()
        TimescaleUtilities.Delay(10, function() -- Line: 145 -- upvalues: RunService (upval), u9 (upval), u127 (upval)
            RunService:UnbindFromRenderStep(u9)
            u127:Destroy()
        end)
    end
end

local function flashEffect() -- Line: 152 -- upvalues: LocalPlayer (val), TweenService (val), TimescaleUtilities (val)
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.IgnoreGuiInset = true
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.fromScale(1, 1)
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame.BackgroundTransparency = 0
    Frame.BorderSizePixel = 0
    TweenService:Create(Frame, TweenInfo.new(3), {BackgroundTransparency = 1, BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    Frame.Parent = ScreenGui
    ScreenGui.Parent = PlayerGui
    TimescaleUtilities.Delay(3, function() -- Line: 171 -- upvalues: ScreenGui (val)
        ScreenGui:Destroy()
    end)
    TimescaleUtilities.Wait(0.1)
end

local function explosionEffect(a1, a2) -- Line: 178
    -- upvalues: getRayParams (val), flashEffect (val), EmitterManager (val), Shaker (val)
    local v1 = workspace
    local v2 = a1 + Vector3.new(0, 1, 0)
    local v3 = getRayParams()
    v1 = v1:Raycast(v2, Vector3.new(0, -10, 0), v3)
    flashEffect()
    EmitterManager.Emit("Nuke", CFrame.new(a1), a2 / 80, nil, nil, nil, {priority = "GameplayCritical"})
    if v1 then
        EmitterManager.Emit(
            "BombHit",
            (CFrame.lookAt(v1.Position, v1.Position + v1.Normal)) * CFrame.Angles(1.5707963267948966, 0, 0) * CFrame.new(0, -0.05, 0),
            4
        )
    end
    local v4 = Shaker:Shake({30, 10, 0, 1.5}, 1, 0.5)
    v4.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448)
    v4.RotationInfluence = Vector3.new(2, 1, 4)
end

local function dropBomb(a1, a2, a3) -- Line: 205
    -- upvalues: Nuke (val), Create (val), TweenService_2 (val), TweenService (val)
    local u13 = CFrame.Angles(Random.new():NextInteger(-2, 2), 0, 0)
    local u22 = (CFrame.new(a1)) * CFrame.Angles(-1.5707963267948966, 0, 0)
    local u24 = u22 + Vector3.new(0, 50, 0)
    local u28 = Nuke:Clone()
    u28.PrimaryPart.CFrame = u24
    u28.Parent = workspace.Terrain
    local v1 = Create("Sound", {
        Name = "LoopingSFX",
        SoundId = "rbxassetid://17428226390",
        Looped = true,
        Volume = 1,
        PlaybackSpeed = 1,
    })
    v1.Parent = u28.PrimaryPart
    if not v1.Loaded then
        v1.Loaded:Wait()
    end
    v1:Play()
    TweenService_2:Create(v1, TweenInfo.new(a2 * 2), {PlaybackSpeed = 0.1}):Play()
    local v2 = TweenService:Create(u28.PrimaryPart, TweenInfo.new(a2, Enum.EasingStyle.Linear), function(a1) -- Line: 237 -- upvalues: u28 (val), u24 (val), u22 (val), u13 (val) -- types: a1: number
        if not u28.PrimaryPart then
            return
        end
        u28.PrimaryPart.CFrame = (u24:Lerp(u22, a1 ^ 2)) * CFrame.identity:Lerp(u13, a1) * CFrame.Angles(0, 3.141592653589793, 0)
    end)
    v2._time = workspace:GetServerTimeNow() - a3
    v2.PlaybackState = Enum.PlaybackState.Paused
    v2:Play()
    return u28
end

local function createSound(a1) -- Line: 254 -- upvalues: GameState (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://17410058300"
    if not Sound.Loaded then
        Sound.Loaded:Wait()
    end
    Sound.PlaybackSpeed = 1 * GameState.TimeScale
    Sound.Parent = a1
    Sound:Play()
    Sound.Ended:Connect(function() -- Line: 263 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
end

return {
    OnEquip = function(a1) -- Line: 269
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 270
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Radio = ReplicatedStorage.Assets.Effects.Client.Radio
            ;(PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories({Radio})
            if a1.Executor == Players.LocalPlayer then
                local v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Radio.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = Radio.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v2:Play(0)
                v1:Play(0)
                a1.currentAnimations = {v2, v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 303 -- upvalues: TypedPromise (val), Players (val), PlayerCharacterReplicator (val)
        return TypedPromise.new(function(a1_2) -- Line: 304 -- upvalues: Players (upval), a1 (val), PlayerCharacterReplicator (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character):RemoveAccessories(true)
            if a1.Executor == Players.LocalPlayer then
                for i, j in a1.currentAnimations do
                    j:Stop(0)
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 322
        -- upvalues: Players (val), createSound (val), TypedPromise (val), dropBomb (val), TimescaleUtilities (val)
        -- upvalues: lightingEffect (val), particleEffect (val), explosionEffect (val), Create (val)
        task.spawn(function() -- Line: 323 -- upvalues: Players (upval), a1 (val), createSound (upval)
            local Character = Players:GetPlayerByUserId(a1.PlayerId).Character
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                createSound(Character.HumanoidRootPart)
            end
        end)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 330
            -- upvalues: a1 (val), dropBomb (upval), TimescaleUtilities (upval), lightingEffect (upval)
            -- upvalues: particleEffect (upval), explosionEffect (upval), Create (upval)
            local Context = a1.Context
            local v1 = math.max(0, Context.explosionStarts - (workspace:GetServerTimeNow()))
            local v2 = dropBomb(Context.position, v1, Context.started)
            TimescaleUtilities.Wait(v1)
            v2:Destroy()
            local u27 = lightingEffect()
            local u29 = particleEffect()
            explosionEffect(Context.position, Context.explosionRadius)
            local v3 = Create("Sound", {Name = "Kaboom", SoundId = "rbxassetid://17428226874", Volume = 0.6})
            v3.Parent = workspace
            if not v3.Loaded then
                v3.Loaded:Wait()
            end
            v3:Play()
            TimescaleUtilities.Delay(4, function() -- Line: 357 -- upvalues: u27 (val), u29 (val), a1_2 (val)
                u27()
                u29()
                a1_2()
            end)
            a3(function() -- Line: 363 -- upvalues: u27 (val), u29 (val)
                u27()
                u29()
            end)
        end)
    end,
}