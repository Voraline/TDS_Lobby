-- Script path: ReplicatedStorage.Content.Consumables.Holy Hand Grenade Dev.Animator
-- Decompile time: 15.03 ms

local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local CurrentCamera = workspace.CurrentCamera
local ClockTime = Lighting.ClockTime
local Brightness = Lighting.Brightness

local function getRandomAngleCFrame() -- Line: 26
    return (CFrame.Angles(math.random() * 6.283185307179586, math.random() * 6.283185307179586, math.random() * 6.283185307179586))
end

local u89 = RaycastParams.new()
u89.FilterType = Enum.RaycastFilterType.Exclude
u89.IgnoreWater = false

local function lightingEffect() -- Line: 40
    -- upvalues: Create (val), Lighting (val), TimescaleUtilities (val), TweenService (val)
    local u13 = Create("Atmosphere", {
        Name = "Atmosphere",
        Density = 0.3,
        Glare = 1,
        Haze = 12,
        Color = Color3.fromRGB(255, 255, 255),
        Decay = Color3.fromRGB(255, 255, 255),
    })
    u13:AddTag("DONT_TOUCH")
    u13.Parent = Lighting
    return function() -- Line: 53 -- upvalues: TimescaleUtilities (upval), TweenService (upval), u13 (val)
        TimescaleUtilities.Wait(5)
        TweenService:Create(u13, TweenInfo.new(5), {Density = 0, Haze = 0, Color = Color3.new(1, 1, 1)}):Play()
        TimescaleUtilities.Delay(5, function() -- Line: 62 -- upvalues: u13 (upval)
            u13:Destroy()
        end)
    end
end

local function toggleSun(a1) -- Line: 68 -- upvalues: Lighting (val) -- types: a1: boolean
    if Lighting:FindFirstChild("Sky") then
        Lighting.Sky.CelestialBodiesShown = a1
    end
    if not Lighting:FindFirstChild("SunRays") then
        return
    end
    Lighting.SunRays.Enabled = a1
end

local function particleEffect() -- Line: 79
    -- upvalues: HttpService (val), Create (val), Players (val), RunService (val), TweenService (val)
    -- upvalues: TimescaleUtilities (val)
    local u9 = ("UPDATE_SPECS_%*"):format((HttpService:GenerateGUID(false)))
    local u118 = Create("Part", {
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
        (Create("ParticleEmitter", {
            Name = "Specs",
            Acceleration = Vector3.new(0, 7.139999866485596, 0),
            Brightness = 10,
            LightEmission = 1,
            LockedToPart = false,
            Rate = 40,
            Texture = "rbxassetid://8030760338",
            ZOffset = 1,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
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
        })),
    })
    u118.Parent = Players.LocalPlayer.Character
    RunService:BindToRenderStep(u9, Enum.RenderPriority.Camera.Value - 1, function() -- Line: 133 -- upvalues: u118 (val)
        if workspace.CurrentCamera then
            u118.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -u118.Size.Z / 2)
        end
    end)
    return function() -- Line: 139
        -- upvalues: TweenService (upval), u118 (val), TimescaleUtilities (upval), RunService (upval), u9 (val)
        TweenService:Create(u118.Specs, TweenInfo.new(2), {Rate = 0, Enabled = false}):Play()
        TimescaleUtilities.Delay(10, function() -- Line: 145 -- upvalues: RunService (upval), u9 (upval), u118 (upval)
            RunService:UnbindFromRenderStep(u9)
            u118:Destroy()
        end)
    end
end

return {
    OnEquip = function(a1) -- Line: 153
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), PlayerCharacterReplicator (val)
        -- upvalues: Create (val), Animation (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 154
            -- upvalues: Players (upval), a1 (val), ReplicatedStorage (upval), PlayerCharacterReplicator (upval)
            -- upvalues: Create (upval), Animation (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local HolyHandGrenade = ReplicatedStorage.Assets.Effects.Client.HolyHandGrenade
            local v1 = {HolyHandGrenade}
            a1.clearAccessories = (PlayerCharacterReplicator.GetEntityFromModel(PlayerByUserId.Character)):AddAccessories(v1)
            local u28 = Create("Sound", {SoundId = "rbxassetid://17428226590", Volume = 0.5})
            u28.Parent = PlayerByUserId.Character.Head
            u28:Play()
            u28.Ended:Connect(function() -- Line: 169 -- upvalues: u28 (val)
                u28:Destroy()
            end)
            if a1.Executor == Players.LocalPlayer then
                local v2 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = HolyHandGrenade.Animations.Equip,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                local v3 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Track = HolyHandGrenade.Animations.Idle,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v1 = Animation.new({
                    IsPersistent = true,
                    IgnorePriority = true,
                    Preload = true,
                    Track = HolyHandGrenade.Animations.Throw,
                    Target = PlayerByUserId.Character.Humanoid.Animator,
                })
                v3:Play(0)
                v2:Play(0)
                a1.currentAnimations = {v3, v2, throw = v1}
            end
            a1_2()
        end)
    end,
    OnUnequip = function(a1) -- Line: 204 -- upvalues: TypedPromise (val), Players (val)
        return TypedPromise.new(function(a1_2) -- Line: 205 -- upvalues: Players (upval), a1 (val)
            if not Players:GetPlayerByUserId(a1.PlayerId).Character then
                return
            end
            if a1.clearAccessories then
                a1.clearAccessories()
                a1.clearAccessories = nil
            end
            if a1.Executor == Players.LocalPlayer then
                for i, j in a1.currentAnimations do
                    if i ~= "throw" then
                        j:Stop(0)
                    end
                end
            end
            a1_2()
        end)
    end,
    OnUse = function(a1) -- Line: 229
        -- upvalues: u89 (val), ClockTime (ref), Lighting (val), Brightness (ref), Players (val), TypedPromise (val)
        -- upvalues: ReplicatedStorage (val), Create (val), TweenService (val), RunService (val), GameState (val)
        -- upvalues: Projectile (val), TimescaleUtilities (val), CurrentCamera (val), LightningBolt (val), Shaker (val)
        -- upvalues: lightingEffect (val), particleEffect (val)
        u89.FilterDescendantsInstances = {
            workspace.Nametags,
            workspace.Items,
            workspace.Consumables,
            workspace.ClientUnits,
            workspace.Towers,
            workspace.NPCs,
        }
        if a1.currentAnimations then
            a1.currentAnimations.throw:Play(0)
        end
        local Context = a1.Context
        if not workspace:GetAttribute("InHeaven") then
            ClockTime = Lighting.ClockTime
            Brightness = Lighting.Brightness
        end
        workspace:SetAttribute("InHeaven", true)
        local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
        local u46 = Context.lifeTime or 4
        return TypedPromise.new(function(a1, a2) -- Line: 257
            -- upvalues: PlayerByUserId (val), ReplicatedStorage (upval), Create (upval), Lighting (upval)
            -- upvalues: TweenService (upval), RunService (upval), GameState (upval), Projectile (upval), u46 (val)
            -- upvalues: Context (val), TimescaleUtilities (upval), Players (upval), u89 (upval), CurrentCamera (upval)
            -- upvalues: LightningBolt (upval), Shaker (upval), lightingEffect (upval), particleEffect (upval)
            -- upvalues: Brightness (upval), ClockTime (upval)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            if PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("RightHand") then
                local u14 = 0
                local v1 = ReplicatedStorage.Assets.Effects.Client.HolyHandGrenade:Clone()
                v1.Parent = workspace
                local Handle = v1.Handle
                Handle.Anchored = true
                local CFrame_2 = PlayerByUserId.Character.RightHand.CFrame
                Handle:PivotTo(CFrame_2)
                local u36 = Create("Sound", {SoundId = "rbxassetid://17437371807", Volume = 0.5})
                u36.Parent = PlayerByUserId.Character.RightHand
                u36:Play()
                u36.Ended:Connect(function() -- Line: 282 -- upvalues: u36 (val)
                    u36:Destroy()
                end)
                local u48 = 0
                local u52 = Lighting.ClockTime / 24 * 6.283185307179586
                local Position = Handle.Position
                local u61 = ReplicatedStorage.Assets.Effects.Client.Sun:Clone()
                u61.Parent = workspace
                u61.Anchored = true
                if Lighting:FindFirstChild("Sky") then
                    Lighting.Sky.CelestialBodiesShown = false
                end
                if Lighting:FindFirstChild("SunRays") then
                    Lighting.SunRays.Enabled = false
                end
                TweenService:Create(Lighting, TweenInfo.new(3), {Brightness = 0}):Play()

                local function EaseInOutSine(a1) -- Line: 312
                    return (1 - math.cos(3.141592653589793 * a1)) * 0.5
                end

                local u97 = CFrame.Angles(0.7853981633974483, 0, 0)
                local u102 = CFrame.new(Position)
                local u116 = RunService.Heartbeat:Connect(function(a1) -- Line: 322
                    -- upvalues: u48 (ref), GameState (upval), u52 (ref), u102 (val), u97 (val), u61 (val)
                    -- upvalues: Lighting (upval)
                    u48 = math.min(30, u48 + 6 * a1 * GameState.TimeScale)
                    u52 = u52 + u48 * a1 * GameState.TimeScale
                    u52 = u52 % 6.283185307179586
                    local v1 = CFrame.Angles(0, u52, 0)
                    local v2 = CFrame.new(0, 0, 3000)
                    u61.Position = (u102 * u97 * v1 * v2).Position
                    local v3 = math.clamp(u48 / 30, 0, 1)
                    local v4 = math.lerp(0, 18.5, v3)
                    local v5 = math.lerp(15, 21.5, v3)
                    local v6 = (1 - math.cos(3.141592653589793 * (u52 / 6.283185307179586))) * 0.5
                    Lighting.ClockTime = math.lerp(v4, v5, v6)
                end)
                ;((Projectile:throwWithPhysics({
                    asset = Handle,
                    duration = u46,
                    start = Handle.Position,
                    target = Context.position,
                    rotation = function(a1) -- Line: 349 -- upvalues: u14 (ref), Context (upval) -- types: a1: vector
                        u14 = u14 + 0.1 * a1.Magnitude / 10
                        return CFrame.Angles(Context.noise + u14, Context.noise + u14, 0)
                    end,
                    include = {
                        workspace:WaitForChild("Map"),
                        workspace:WaitForChild("Cliff"),
                        (workspace:WaitForChild("Ground")),
                    },
                })):andThen(function(a1) -- Line: 359
                    -- upvalues: TimescaleUtilities (upval), Handle (ref), Players (upval), u89 (upval)
                    -- upvalues: RunService (upval), GameState (upval), Create (upval), TweenService (upval)
                    -- upvalues: CurrentCamera (upval), LightningBolt (upval), Shaker (upval), ReplicatedStorage (upval)
                    -- upvalues: Lighting (upval), lightingEffect (upval), particleEffect (upval), u116 (ref), u61 (val)
                    -- upvalues: Brightness (upval), ClockTime (upval)
                    local Folder, v1, v2
                    TimescaleUtilities.Wait(0.1)
                    local u6 = false
                    local u7 = 0
                    local u8 = false
                    local u9 = false
                    local u12 = CFrame.new(a1)
                    local u13 = 0
                    local u14 = {}
                    local Attachment = Instance.new("Attachment")
                    Attachment.Name = "Attachment0"
                    Attachment.Parent = Handle

                    local function triggerAllRetraction() -- Line: 384
                        -- upvalues: u8 (ref), TimescaleUtilities (upval), u9 (ref)
                        if u8 then
                            return
                        end
                        u8 = true
                        TimescaleUtilities.Wait(1)
                        u9 = true
                    end

                    local v3 = next
                    local Players_2, Players_3 = Players:GetPlayers()
                    for k, v in v3, Players_2, Players_3 do
                        table.insert(u89.FilterDescendantsInstances, v.Character)
                    end
                    for i = 1, 15 do
                        Folder = Instance.new("Folder")
                        Folder.Name = "Ray" .. i
                        local Attachment_2 = Instance.new("Attachment")
                        Attachment_2.Name = "Attachment1"
                        local Beam = Instance.new("Beam")
                        Beam.Attachment0 = Attachment
                        Beam.Attachment1 = Attachment_2
                        Beam.FaceCamera = true
                        Beam.Width0 = 0.1
                        Beam.Width1 = 0
                        Beam.Brightness = 1000
                        Beam.LightEmission = 1
                        Beam.LightInfluence = 0
                        Beam.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            (NumberSequenceKeypoint.new(1, 1)),
                        })
                        Beam.Parent = Folder
                        Attachment_2.Parent = Folder
                        Folder.Parent = Handle
                        v1 = Random.new():NextNumber(0.5, 1)
                        TimescaleUtilities.Delay(1.5 + v1, function() -- Line: 424 -- upvalues: u14 (val), i (val), Attachment_2 (val), Beam (val), Attachment (val)
                            u14[i] = {
                                rayTime = 4.5,
                                timeElapsed = 0,
                                progress = 0,
                                phase = "Extend",
                                attachment = Attachment_2,
                                beam = Beam,
                                orientation = CFrame.Angles(
                                    math.random() * 6.283185307179586,
                                    math.random() * 6.283185307179586,
                                    math.random() * 6.283185307179586
                                ),
                                origin = Attachment,
                                maxRayLength = 23 - math.random(1, 5),
                            }
                        end)
                    end
                    v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 439
                        -- upvalues: u13 (ref), GameState (upval), u6 (ref), Handle (upval), u12 (val), u14 (val)
                        -- upvalues: u7 (ref), u9 (ref), u8 (ref), TimescaleUtilities (upval)
                        local v1, v2, v3, v4
                        u13 = u13 + a1 * GameState.TimeScale
                        if not u6 then
                            v1 = math.lerp(0, 30, (math.min(1, u13 / 10)))
                            v2 = math.noise(u13 * 15 * 1) * 0.5
                            local v5 = math.noise(u13 * 15 * 1.2) * 0.5
                            Handle.CFrame = u12 * CFrame.new(v2, v1, v5)
                        end
                        v1 = nil
                        v2 = nil
                        local v6 = a1
                        for i, j in u14, v1, v2 do
                            if j.phase == "Extend" then
                                j.timeElapsed = j.timeElapsed + v6
                                v4 = j.timeElapsed / j.rayTime
                                j.progress = math.min(1, v4)
                                v3 = math.lerp(0, j.maxRayLength, j.progress)
                                if 1 <= j.progress and j.phase ~= "WaitingForRetract" then
                                    u7 = u7 + 1
                                    j.phase = "WaitingForRetract"
                                end
                                j.currentLength = v3
                                j.beam.Width1 = math.lerp(0, 0.5, j.currentLength / j.maxRayLength)
                                j.attachment.CFrame = j.origin.CFrame * j.orientation * CFrame.new(j.currentLength, 0, 0)
                            elseif j.phase == "WaitingForRetract" then
                                j.currentLength = j.maxRayLength
                                if u9 then
                                    j.phase = "Retract"
                                    j.timeElapsed = 0
                                    j.rayTime = 0.15
                                end
                                j.beam.Width1 = math.lerp(0, 0.5, j.currentLength / j.maxRayLength)
                                j.attachment.CFrame = j.origin.CFrame * j.orientation * CFrame.new(j.currentLength, 0, 0)
                            elseif j.phase == "Retract" then
                                j.timeElapsed = j.timeElapsed + v6
                                v4 = j.timeElapsed / j.rayTime
                                j.progress = math.min(1, v4)
                                v3 = math.lerp(j.maxRayLength, 0, j.progress)
                                if not (1 <= j.progress) then
                                    j.currentLength = v3
                                    j.beam.Width1 = math.lerp(0, 0.5, j.currentLength / j.maxRayLength)
                                    j.attachment.CFrame = j.origin.CFrame * j.orientation * CFrame.new(j.currentLength, 0, 0)
                                else
                                    j.phase = "Done"
                                    j.attachment.Parent:Destroy()
                                    u14[i] = nil
                                end
                            end
                        end
                        if u7 == 15 and not u8 then
                            if u8 then
                                return
                            end
                            u8 = true
                            TimescaleUtilities.Wait(1)
                            u9 = true
                        end
                    end)
                    TimescaleUtilities.Wait(1)
                    v3 = Create("Sound", {SoundId = "rbxassetid://96059608437411", RollOffMaxDistance = 200, Volume = 2})
                    v3.Parent = Handle
                    v3:Play()
                    TimescaleUtilities.Wait(1.5)
                    TweenService:Create(CurrentCamera, TweenInfo.new(10, Enum.EasingStyle.Sine), {FieldOfView = 120}):Play()
                    TimescaleUtilities.Wait(2.5)
                    for k2, j in pairs(Handle.Parent:GetChildren()) do
                        if j:IsA("BasePart") and j ~= Handle then
                            j.Transparency = 1
                        end
                    end
                    local BillboardGui = Instance.new("BillboardGui")
                    BillboardGui.Size = UDim2.fromScale(23, 23)
                    BillboardGui.Brightness = 1000
                    local ImageLabel = Instance.new("ImageLabel")
                    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                    ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
                    ImageLabel.Size = UDim2.fromScale(0, 0)
                    ImageLabel.BackgroundTransparency = 1
                    ImageLabel.Image = "rbxassetid://6196665106"
                    ImageLabel.ImageTransparency = 1
                    ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
                    ImageLabel.Parent = BillboardGui
                    BillboardGui.Parent = Handle
                    TweenService:Create(ImageLabel, TweenInfo.new(3), {ImageTransparency = 0, Size = UDim2.fromScale(1, 1)}):Play()
                    local PointLight = Instance.new("PointLight")
                    PointLight.Name = "Light"
                    PointLight.Range = 0
                    PointLight.Brightness = 0
                    PointLight.Parent = Handle
                    TweenService:Create(PointLight, TweenInfo.new(3), {Brightness = 75, Range = 50}):Play()
                    TimescaleUtilities.Wait(2)
                    local u241 = Create("Sound", {SoundId = "rbxassetid://18959502073", PlaybackSpeed = 0.75, Volume = 3})
                    u241.Parent = Handle
                    u241:Play()
                    u241.Ended:Connect(function() -- Line: 580 -- upvalues: u241 (val)
                        u241:Destroy()
                    end)
                    TimescaleUtilities.Wait(1)
                    TweenService:Create(
                        ImageLabel,
                        TweenInfo.new(0.17, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                        {ImageTransparency = 1, Size = UDim2.fromScale(0, 0)}
                    ):Play()
                    TweenService:Create(PointLight, TweenInfo.new(3), {Brightness = 0, Range = 0}):Play()
                    TimescaleUtilities.Wait(0.17)
                    local Attachment_3 = Instance.new("Attachment")
                    Attachment_3.Parent = workspace.Terrain
                    Attachment_3.WorldCFrame = Handle.CFrame * CFrame.new(0, 150, 0)
                    local v4 = LightningBolt.new(Attachment_3, Attachment, 10)
                    v4.Thickness = 2
                    v4.Color = Color3.new(1, 1, 1)
                    v4.Frequency = 3
                    v4.PulseSpeed = 5
                    TimescaleUtilities.Wait(0.1)
                    TweenService:Create(
                        Handle,
                        TweenInfo.new(0.17, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                        {CFrame = CFrame.new(a1)}
                    ):Play()
                    TimescaleUtilities.Wait(0.05)
                    TweenService:Create(
                        CurrentCamera,
                        TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                        {FieldOfView = 50}
                    ):Play()
                    v1 = workspace
                    local v5 = u89
                    v1 = v1:Raycast(Attachment_3.WorldPosition, Vector3.new(0, -1000, 0), v5)
                    local v6 = Shaker:Shake({50, 32, 0, 1.5}, 0.5, 0.2)
                    v6.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448)
                    v6.RotationInfluence = Vector3.new(2, 1, 4)
                    TimescaleUtilities.Wait(0.1)
                    local u389 = ReplicatedStorage.Assets.Effects.Mob.SonicBoom:Clone()
                    u389.CFrame = CFrame.new(a1)
                    u389.Orientation = Vector3.new(90, -90, 0)
                    u389.Color = Color3.fromRGB(255, 255, 255)
                    u389.Material = Enum.Material.Neon
                    u389.Parent = workspace.CurrentCamera
                    TweenService:Create(
                        u389,
                        TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {Size = Vector3.new(500, 500, 2), Transparency = 1}
                    ):Play()
                    if v1 then
                        TimescaleUtilities.Wait(0.05)
                        local u426 = Create("Sound", {
                            SoundId = "rbxassetid://76537715852614",
                            RollOffMaxDistance = 200,
                            PlaybackSpeed = 0.8,
                            Volume = 7,
                        })
                        u426.Parent = Handle
                        u426:Play()
                        u426.Ended:Connect(function() -- Line: 678 -- upvalues: u426 (val)
                            u426:Destroy()
                        end)
                        v5 = CFrame.new(v1.Position)
                        v2 = ReplicatedStorage.Assets.Effects.Client.HolyCrater:Clone()
                        v2.Parent = workspace.Terrain
                        v2.CFrame = v5
                        local Part = Instance.new("Part")
                        Part.Shape = Enum.PartType.Ball
                        Part.Material = Enum.Material.Neon
                        Part.Color = Color3.fromRGB(255, 255, 255)
                        Part.Size = Vector3.new(0, 0, 0)
                        Part.Anchored = true
                        Part.CanCollide = false
                        Part.CastShadow = false
                        Part.CFrame = v5
                        Part.Parent = Handle
                        for k3, k4 in pairs(v2:GetChildren()) do
                            k4:Emit(1)
                        end
                        TweenService:Create(
                            Part,
                            TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                            {Size = Vector3.new(100, 100, 100)}
                        ):Play()
                        TimescaleUtilities.Delay(0.5, function() -- Line: 716 -- upvalues: Part (val)
                            Part:Destroy()
                        end)
                    end
                    local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
                    ColorCorrectionEffect.Parent = Lighting
                    v5 = lightingEffect()
                    v2 = particleEffect()
                    TimescaleUtilities.Wait(0.1)
                    TweenService:Create(
                        ColorCorrectionEffect,
                        TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {Brightness = 5}
                    ):Play()
                    TimescaleUtilities.Wait(0.5)
                    v4:Destroy()
                    TweenService:Create(
                        ColorCorrectionEffect,
                        TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                        {Brightness = 0}
                    ):Play()
                    TimescaleUtilities.Delay(0.5, function() -- Line: 758 -- upvalues: u389 (val)
                        u389:Destroy()
                    end)
                    TimescaleUtilities.Delay(6, function() -- Line: 762 -- upvalues: ColorCorrectionEffect (val)
                        ColorCorrectionEffect:Destroy()
                    end)
                    TimescaleUtilities.Wait(4)
                    if Lighting:FindFirstChild("Sky") then
                        Lighting.Sky.CelestialBodiesShown = true
                    end
                    if Lighting:FindFirstChild("SunRays") then
                        Lighting.SunRays.Enabled = true
                    end
                    u116:Disconnect()
                    u61:Destroy()
                    Handle:Destroy()
                    CurrentCamera.FieldOfView = 70
                    TweenService:Create(
                        Lighting,
                        TweenInfo.new(5, Enum.EasingStyle.Linear),
                        {Brightness = Brightness, ClockTime = ClockTime}
                    ):Play()
                    TimescaleUtilities.Wait(5)
                    workspace:SetAttribute("InHeaven", nil)
                    v5()
                    v2()
                end)):finally(function() -- Line: 785 -- upvalues: a1 (val)
                    a1()
                end)
                return
            end
            a2("Invalid player character")
        end)
    end,
}