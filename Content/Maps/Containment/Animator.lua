-- Script path: ReplicatedStorage.Content.Maps.Containment.Animator
-- Decompile time: 4.42 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u45 = {Density = 0.5, Glare = 2.212, Haze = 2.12}
u45.Color = Color3.fromRGB(230, 100, 239)
u45.Decay = Color3.fromRGB(74, 29, 100)
local u56 = {}
local v1 = Color3.fromRGB(255, 1, 255)
local v2 = Color3.fromRGB(160, 76, 255)
u56[1] = v1
u56[2] = v2
u56[3] = Color3.fromRGB(255, 39, 140)
local u72 = nil
local Atmosphere = Lighting:WaitForChild("Atmosphere")
local u77 = {}
local u78 = {}
local u79 = {}
local u80 = nil
local u81 = {}
u81.Offset = Atmosphere.Offset
u81.Density = Atmosphere.Density
u81.Color = Atmosphere.Color
u81.Decay = Atmosphere.Decay
u81.Glare = Atmosphere.Glare
u81.Haze = Atmosphere.Haze
local u89 = Random.new()

local function ShootLighting() -- Line: 46
    -- upvalues: u72 (ref), u89 (val), u56 (val), Laser (val), EmitterManager (val)
    u72 = workspace:WaitForChild("Map")
    local v1 = u72:GetExtentsSize() / 6
    local Position = u72:GetBoundingBox().Position
    local X = Position.X
    local Z = Position.Z
    local v2 = Vector3.new(X + u89:NextNumber(-v1.X, v1.X), 200, Z + (u89:NextNumber(-v1.Z, v1.Z)))
    local v3 = workspace:Raycast(v2, (Vector3.new(-0, -210, -0)))
    if not v3 then
        return
    end
    local v4 = v3.Position + Vector3.new(u89:NextNumber(-4, 4), 0, (u89:NextNumber(-4, 4)))
    Laser:Lightning({
        Lifetime = 0.8,
        minWidth = 0.1,
        maxWidth = 2,
        Bursts = 1,
        Color = u56[math.random(1, #u56)],
        Start = v2,
        End = v4,
        Offset = Random.new():NextNumber(4, 8),
    })
    EmitterManager.Emit("EnemyPurpleImpact", CFrame.new(v4), 6)
end

local function disableEffects() -- Line: 84
    -- upvalues: u72 (ref), Atmosphere (ref), Lighting (val), u80 (ref), u79 (val), u81 (val), TweenService (val)
    -- upvalues: u77 (val), u78 (val)
    local Angles, CFrame_2, v1, v2, v3
    u72 = workspace:WaitForChild("Map")
    Atmosphere = Lighting:WaitForChild("Atmosphere")
    if u80 then
        u80:Disconnect()
        u80 = nil
    end
    for i, j in u79 do
        j:Cancel()
    end
    for k, n in u81 do
        Atmosphere[k] = n
    end
    for m, i5 in u72.Environment:GetDescendants() do
        if i5:IsA("SurfaceLight") then
            v1 = TweenService
            v2 = TweenInfo.new(4)
            v3 = {Color = Color3.fromRGB(179, 119, 91)}
            v1:Create(i5, v2, v3):Play()
        end
    end
    TweenService:Create(
        u72:WaitForChild("InnerParticleDome"),
        TweenInfo.new(10, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Transparency = 1}
    ):Play()
    for i6, i7 in (u72:WaitForChild("Environment")):WaitForChild("Effects"):GetDescendants() do
        if i7:IsA("ParticleEmitter") or i7:IsA("Beam") then
            i7.Enabled = false
        end
        if i7:IsA("BasePart") then
            if not u77[i7] then
                u77[i7] = i7.CFrame
                u78[i7] = i7.Size
            end
            i7.Size = Vector3.new(0, 0, 0)
            CFrame_2 = i7.CFrame
            Angles = CFrame.Angles
            v2 = math.rad((math.random(-180, 180)))
            i7.CFrame = CFrame_2 * Angles(0, v2, 0)
            i7.LocalTransparencyModifier = 1
        end
    end
end

local function phase2() -- Line: 131
    -- upvalues: Shaker (val), u72 (ref), Atmosphere (ref), Lighting (val), TweenService (val), u45 (val), u79 (val)
    -- upvalues: u80 (ref), RunService (val), ShootLighting (val), u77 (val), u78 (val), TimescaleUtilities (val)
    local v1, v2, v3
    Shaker:Shake({
        0.3,
        15,
        0.5,
        Vector3.new(0.20000000298023224, 0.10000000149011612, 0.20000000298023224),
        (Vector3.new(2, 0.20000000298023224, 2)),
    }, 2, 15)
    u72 = workspace:WaitForChild("Map")
    Atmosphere = Lighting:WaitForChild("Atmosphere")
    local v4 = TweenService:Create(
        u72.InnerParticleDome,
        TweenInfo.new(10, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Transparency = 0}
    )
    local v5 = TweenService:Create(Atmosphere, TweenInfo.new(10, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), u45)
    v4:Play()
    v5:Play()
    table.insert(u79, v4)
    table.insert(u79, v5)
    local u59 = 0
    local u66 = Random.new():NextNumber(0.5, 1.5)
    u80 = RunService.Heartbeat:Connect(function(a1) -- Line: 158 -- upvalues: u59 (ref), u66 (ref), ShootLighting (upval), u72 (upval)
        u59 = u59 + a1
        if u66 < u59 then
            u59 = 0
            u66 = Random.new():NextNumber(0.5, 1.5)
            ShootLighting()
        end
        local InnerParticleDome = u72.InnerParticleDome
        InnerParticleDome.CFrame = InnerParticleDome.CFrame * CFrame.Angles(0, math.rad(90 * a1), 0)
    end)
    for i, j in u72.Environment:GetDescendants() do
        if j:IsA("SurfaceLight") then
            v3 = TweenService
            v1 = TweenInfo.new(4)
            v2 = {Color = Color3.fromRGB(77, 38, 134)}
            v3:Create(j, v1, v2):Play()
        end
    end
    for k, n in u72.Environment.Effects:GetDescendants() do
        if n:IsA("ParticleEmitter") or n:IsA("Beam") then
            n.Enabled = true
        end
        if n:IsA("BasePart") then
            v3 = TweenService
            v1 = TweenInfo.new(10, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            v2 = {LocalTransparencyModifier = 0, CFrame = u77[n], Size = u78[n]}
            v3 = v3:Create(n, v1, v2)
            v3:Play()
            table.insert(u79, v3)
            TimescaleUtilities.Wait(0.045)
        end
    end
end

TagReplicator.hook("HalloweenMap", function(a1, a2) -- Line: 198 -- upvalues: disableEffects (val), phase2 (val)
    if not a2:Get("Phase2Active") then
        disableEffects()
    end
    ;(a2:GetStateChangedSignal("Phase2Active")):Connect(function(a1) -- Line: 203 -- upvalues: phase2 (upval), disableEffects (upval)
        if a1 then
            phase2()
            return
        end
        disableEffects()
    end)
end)
return function() end