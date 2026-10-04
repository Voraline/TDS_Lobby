-- Script path: ReplicatedStorage.Content.Maps.Outpost 16.Animator.Events.MapRifts
-- Decompile time: 13.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GlitchScreenStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.GlitchScreenStore)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u63 = Random.new()
local Sound_4 = Instance.new("Sound")
Sound_4.SoundId = "rbxassetid://137269319964390"
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://84409020127285"
local Sound_2 = Instance.new("Sound")
Sound_2.SoundId = "rbxassetid://85772790444280"

local function createSound(a1) -- Line: 26 -- upvalues: SoundService (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://" .. tostring(a1)
    Sound.Parent = SoundService
    return Sound
end

local u77 = {}
local Sound_5 = Instance.new("Sound")
Sound_5.SoundId = "rbxassetid://" .. tostring(93869978440702)
Sound_5.Parent = SoundService
local Sound_6 = Instance.new("Sound")
Sound_6.SoundId = "rbxassetid://" .. tostring(136466284570865)
Sound_6.Parent = SoundService
local Sound_7 = Instance.new("Sound")
Sound_7.SoundId = "rbxassetid://" .. tostring(102370030378314)
Sound_7.Parent = SoundService
u77[1] = Sound_5
u77[2] = Sound_6
u77[3] = Sound_7
local Sound_3 = Instance.new("Sound")
Sound_3.SoundId = "rbxassetid://" .. tostring(100215186043603)
Sound_3.Parent = SoundService
local Projectile = ReplicatedStorage.Assets.Effects.Mob.Drakobloxxer.Projectile

local function createDing(a1) -- Line: 43 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local Part = Instance.new("Part")
    Part.Name = "Ding"
    Part.BottomSurface = Enum.SurfaceType.Smooth
    Part.CFrame = CFrame.new(0, 500, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CanTouch = false
    Part.Size = Vector3.new(1, 1, 1)
    Part.TopSurface = Enum.SurfaceType.Smooth
    Part.Transparency = 1
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "BillboardGui"
    BillboardGui.Active = true
    BillboardGui.Brightness = 12
    BillboardGui.Size = UDim2.new(10, 100, 10, 100)
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ImageLabel"
    ImageLabel.Image = "rbxassetid://8120666025"
    ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
    ImageLabel.Size = UDim2.fromScale(1, 1)
    local UIScale = Instance.new("UIScale")
    UIScale.Name = "UIScale"
    UIScale.Scale = 1e-07
    UIScale.Parent = ImageLabel
    ImageLabel.Parent = BillboardGui
    BillboardGui.Parent = Part
    local u75 = Part:Clone()
    u75.Parent = workspace
    u75.Anchored = true
    u75.Position = a1
    TweenService:Create(u75.BillboardGui.ImageLabel, TweenInfo.new(5, Enum.EasingStyle.Linear), {Rotation = 720}):Play()
    TweenService:Create(u75.BillboardGui.ImageLabel.UIScale, TweenInfo.new(0.08, Enum.EasingStyle.Linear), {Scale = 1.7}):Play()
    task.delay(0.09, function() -- Line: 96 -- upvalues: TweenService (upval), u75 (val)
        TweenService:Create(u75.BillboardGui.ImageLabel.UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {Scale = 0}):Play()
    end)
    TimescaleUtilities.CleanUp(u75, 5)
end

local function makeTransparency(a1, a2) -- Line: 107 -- types: a1: userdata, a2: number
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = a2
            if not (a2 > 0.1) then
                j.CanCollide = true
            else
                j.CanCollide = false
            end
        end
    end
end

local function toggleEmitters(a1, a2) -- Line: 120
    for i, j in a1:GetDescendants() do
        if j then
            if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
                j.Enabled = a2
            end
        end
    end
end

local u118 = {}

function u118.init(a1) -- Line: 133 -- upvalues: toggleEmitters (val)
    for i, j in a1.Environment.SpinPoints:GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = 1
            j.CanCollide = false
        end
    end
    for k, n in a1.Environment.HitBuildings:GetChildren() do
        for m, i5 in n:GetChildren() do
            if i5.Name == "Building" then
                for i6, i7 in i5:GetDescendants() do
                    if i7:IsA("BasePart") then
                        i7.Transparency = 1
                        i7.CanCollide = false
                    end
                end
            end
            if i5.Name == "NonDamaged" then
                for i8, i9 in i5:GetDescendants() do
                    if i9:IsA("BasePart") then
                        i9.Transparency = 0
                        i9.CanCollide = true
                    end
                end
            end
            if i5.Name == "Effects" then
                toggleEmitters(i5, false)
            end
            if i5.Name == "Points" then
                for i10, i11 in i5:GetChildren() do
                    if i11:IsA("BasePart") then
                        i11.Transparency = 1
                        i11.CanCollide = false
                    end
                end
            end
        end
    end
end

function u118.spinProjectile(a1) -- Line: 164
    -- upvalues: GameState (val), TimescaleUtilities (val), GlitchScreenStore (val), u63 (val), CatRom (val)
    -- upvalues: EmitterManager (val), Sound_3 (val), Projectile (val), Sound (val), Sound_2 (val), RunService (val)
    -- upvalues: u77 (val), Shaker (val), createDing (val), TweenService (val)
    local Part, v1, v2, v3, v4, v5, v6, v7, v8
    GameState.Replicator:Set("WaveGlitch", true)
    TimescaleUtilities.Delay(3.5, function() -- Line: 167 -- upvalues: GameState (upval)
        GameState.Replicator:Set("WaveGlitch", false)
    end)
    GlitchScreenStore.setEnabled(true)
    TimescaleUtilities.Delay(1, function() -- Line: 173 -- upvalues: GlitchScreenStore (upval)
        GlitchScreenStore.setEnabled(false)
    end)
    for i = 1, 6 do
        v4 = {}
        v5 = i % 2 == 0
        v6 = #a1.Environment.SpinPoints:GetChildren()
        for j = 1, v6 do
            v8 = a1.Environment.SpinPoints:FindFirstChild((tostring(j)))
            if v8 and v8:IsA("BasePart") then
                table.insert(v4, v8.Position + (Vector3.new(u63:NextNumber(-20, 20), u63:NextNumber(-20, 20), (u63:NextNumber(-20, 20)))))
            end
        end
        if v5 then
            for k = #v4, 1, -1 do
                v8 = #v4 - k + 1
                v4[v8] = v4[k]
            end
        end
        local u119 = u63:NextNumber(5, 7)
        local u126 = CatRom.new(v4, 0.5, 0)
        v7 = a1.Environment.RiftCrack:Clone()
        v7:ScaleTo((v7:GetScale()) * 0.5)
        v7:PivotTo((CFrame.new((u126:SolvePosition(0)))))
        v7.Parent = workspace.Trash
        EmitterManager.manualEmit(v7)
        TimescaleUtilities.CleanUp(v7, 4)
        Part = Instance.new("Part")
        Part.Size = Vector3.new(1, 1, 1)
        Part.Position = u126:SolvePosition(0)
        Part.Anchored = true
        Part.CanCollide = false
        Part.Parent = workspace
        Part.Transparency = 1
        v1 = Sound_3:Clone()
        v1.Volume = 0.56
        v1.Parent = Part
        v1.RollOffMaxDistance = 1000
        v1.RollOffMinDistance = 0
        v1.RollOffMode = Enum.RollOffMode.Linear
        v1.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
        v1:Play()
        TimescaleUtilities.CleanUp(Part, 9)
        local u200 = Projectile:Clone()
        v2 = Sound:Clone()
        v2.Volume = 1
        v2.Parent = u200.Skull
        v2:Play()
        v2.PlaybackSpeed = Random.new():NextNumber(0.8, 0.9)
        u200.Parent = workspace
        local u218 = 0
        local u219 = nil
        local PointLight = Instance.new("PointLight")
        PointLight.Brightness = 3
        PointLight.Range = 60
        PointLight.Parent = u200.Skull
        PointLight.Color = Color3.fromRGB(255, 0, 221)
        local u234 = Sound_2:Clone()
        u234.Parent = u200.Skull
        u234:Play()
        u234.Looped = true
        u234.RollOffMinDistance = 50
        u234.RollOffMaxDistance = 180
        u234.RollOffMode = Enum.RollOffMode.InverseTapered
        u234.Volume = 1.1
        local Position = Vector3.new(0, 0, 0)
        local u245 = Vector3.new(0, 0, 0)
        local u247 = tick()
        local u248 = false
        v3 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 269
            -- upvalues: GameState (upval), u200 (val), Position (ref), u245 (ref), u234 (val), u247 (val), u218 (ref)
            -- upvalues: u119 (val), u248 (ref), u77 (upval), u63 (upval), TimescaleUtilities (upval), Shaker (upval)
            -- upvalues: createDing (upval), TweenService (upval), a1 (val), u126 (val), EmitterManager (upval)
            -- upvalues: PointLight (val), u219 (ref)
            local v1
            local v2 = a1_2 * GameState.TimeScale
            local v3 = (u200.Skull.Position - Position) / v2
            u245 = u245:Lerp(v3, (math.clamp(v2 * 5, 0, 1)))
            u234.PlaybackSpeed = math.lerp((math.clamp(u245.Magnitude / 20, 0.5, 1.6)) + math.sin(((tick()) - u247) * 2) / 2.5, u234.PlaybackSpeed, v2 * 4) * 0.7 * GameState.TimeScale
            u218 = u218 + v2 / u119
            local v4 = math.clamp(u218, 0, 1)
            if v4 >= 0.95 and not u248 then
                u248 = true
                local Part = Instance.new("Part")
                Part.Size = Vector3.new(1, 1, 1)
                Part.Position = u200.Skull.Position
                Part.Anchored = true
                Part.CanCollide = false
                Part.Parent = workspace
                Part.Transparency = 1
                v1 = u77[u63:NextInteger(1, #u77)]:Clone()
                v1.Volume = 0.78
                v1.Parent = Part
                v1.RollOffMaxDistance = 1000
                v1.RollOffMinDistance = 0
                v1.RollOffMode = Enum.RollOffMode.Linear
                v1.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
                v1:Play()
                TimescaleUtilities.CleanUp(Part, 9)
            end
            if not (v4 >= 1) then
                u200:PivotTo((CFrame.new(u126:SolvePosition(v4), (u126:SolvePosition((math.clamp(v4 + 0.1, 0, 1)))))))
                return
            end
            Shaker:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
            createDing(u200.Skull.Position)
            local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
            ColorCorrectionEffect.Parent = game.Lighting
            TweenService:Create(ColorCorrectionEffect, TweenInfo.new(0.01), {Brightness = 0.4}):Play()
            TimescaleUtilities.Delay(0.01, function() -- Line: 324 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
                TweenService:Create(
                    ColorCorrectionEffect,
                    TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
            TimescaleUtilities.CleanUp(ColorCorrectionEffect, 3)
            v1 = a1.Environment.RiftCrack:Clone()
            v1:PivotTo((CFrame.new((u126:SolvePosition(1)))))
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
            TweenService:Create(PointLight, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Brightness = 10}):Play()
            TimescaleUtilities.Delay(0.1, function() -- Line: 347 -- upvalues: TweenService (upval), PointLight (upval)
                TweenService:Create(PointLight, TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Brightness = 0}):Play()
            end)
            u219:Disconnect()
            for i, j in u200:GetDescendants() do
                if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
                    j.Enabled = false
                end
                if j:IsA("BasePart") then
                    j.Transparency = 1
                end
                if j:IsA("Sound") then
                    j.PlayOnRemove = false
                end
            end
            TimescaleUtilities.CleanUp(v1, 4)
            TimescaleUtilities.CleanUp(u200, 4)
        end)
        Position = u200.Skull.Position
        TimescaleUtilities.Wait(u63:NextNumber(0.5, 1))
    end
end

function u118.runProjectile(a1, a2) -- Line: 389
    -- upvalues: u63 (val), TimescaleUtilities (val), toggleEmitters (val), Bezier (val), Projectile (val), Sound (val)
    -- upvalues: RunService (val), Shaker (val), EmitterManager (val), TweenService (val)
    task.spawn(function() -- Line: 390
        -- upvalues: a1 (val), a2 (val), u63 (upval), TimescaleUtilities (upval), toggleEmitters (upval), Bezier (upval)
        -- upvalues: Projectile (upval), Sound (upval), RunService (upval), Shaker (upval), EmitterManager (upval)
        -- upvalues: TweenService (upval)
        local End, Start, v1, v2, v3, v4
        for i, j in a1.Environment.HitBuildings[a2]:GetChildren() do
            local u22 = u63:NextNumber(1.5, 2)
            TimescaleUtilities.Delay(u22, function() -- Line: 394 -- upvalues: j (val), toggleEmitters (upval)
                if j.Name == "Building" then
                    for i, j2 in j:GetDescendants() do
                        if j2:IsA("BasePart") then
                            j2.Transparency = 0
                            j2.CanCollide = true
                        end
                    end
                end
                if j.Name == "NonDamaged" then
                    for k, n in j:GetDescendants() do
                        if n:IsA("BasePart") then
                            n.Transparency = 1
                            n.CanCollide = false
                        end
                    end
                end
                if j.Name == "Effects" then
                    toggleEmitters(j, true)
                end
            end)
            if j.Name == "Points" then
                Start = j.Start
                End = j.End
                v3 = Start.Position + Vector3.new(u63:NextNumber(-15, 15), u63:NextNumber(-15, 15), (u63:NextNumber(-15, 15)))
                v4 = (Start.Position + End.Position) / 2 + Vector3.new(u63:NextNumber(-20, 20), u63:NextNumber(-50, 50), (u63:NextNumber(-20, 20)))
                v1 = v4 + Vector3.new(u63:NextNumber(-60, 60), u63:NextNumber(-60, 60), (u63:NextNumber(-60, 60)))
                local u121 = Bezier.new(v3, v4, v1, End.Position + Vector3.new(u63:NextNumber(-5, 5), 0, (u63:NextNumber(-5, 5))))
                local u125 = Projectile:Clone()
                local u129 = Sound:Clone()
                u129.Volume = 1
                u129.Parent = u125.Skull
                u129:Play()
                u129.PlaybackSpeed = Random.new():NextNumber(0.8, 0.9)
                u125.Parent = workspace
                local u143 = 0
                local u144 = nil
                v2 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 449
                    -- upvalues: u143 (ref), u22 (val), Shaker (upval), a1 (upval), u121 (val), EmitterManager (upval)
                    -- upvalues: u129 (val), TweenService (upval), TimescaleUtilities (upval), u144 (ref), u125 (val)
                    u143 = u143 + a1_2 / u22
                    local v1 = math.clamp(u143, 0, 1)
                    if not (v1 >= 1) then
                        u125:PivotTo((CFrame.new(u121:Get(v1), (u121:Get((math.clamp(v1 + 0.1, 0, 1)))))))
                        return
                    end
                    Shaker:Shake({0.5, 10, 0.01, 1}, 0.2, 0.5)
                    local v2 = a1.Environment.Explosion:Clone()
                    v2:PivotTo((CFrame.new((u121:Get(1)))))
                    v2.Parent = workspace.Trash
                    EmitterManager.manualEmit(v2)
                    local v3 = u129:Clone()
                    v3.Volume = 1
                    v3.PlaybackSpeed = Random.new():NextNumber(0.9, 1)
                    v3.Parent = v2.Explosion
                    local PointLight = Instance.new("PointLight")
                    PointLight.Brightness = 0
                    PointLight.Range = 15
                    PointLight.Parent = v2.Explosion
                    PointLight.Color = Color3.fromRGB(255, 0, 221)
                    TweenService:Create(
                        PointLight,
                        TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {Brightness = 10}
                    ):Play()
                    TimescaleUtilities.Delay(0.1, function() -- Line: 482 -- upvalues: TweenService (upval), PointLight (val)
                        TweenService:Create(
                            PointLight,
                            TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                            {Brightness = 0}
                        ):Play()
                    end)
                    v3:Play()
                    u144:Disconnect()
                    for i, j in u125:GetDescendants() do
                        if j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
                            j.Enabled = false
                        end
                        if j:IsA("BasePart") then
                            j.Transparency = 1
                        end
                        if j:IsA("Sound") then
                            j:Destroy()
                        end
                    end
                    TimescaleUtilities.CleanUp(v2, 4)
                    TimescaleUtilities.CleanUp(u125, 4)
                end)
                TimescaleUtilities.Wait(u63:NextNumber(0.1, 0.3))
            end
        end
    end)
end

u118.waves = {
    [6] = function(a1) -- Line: 531 -- upvalues: u118 (val)
        u118.runProjectile(a1, 1)
    end,
    [7] = function(a1) -- Line: 534 -- upvalues: u118 (val)
        u118.runProjectile(a1, 2)
    end,
    [8] = function(a1) -- Line: 537 -- upvalues: u118 (val)
        u118.runProjectile(a1, 3)
        u118.runProjectile(a1, 4)
    end,
    [9] = function(a1) -- Line: 541 -- upvalues: u118 (val)
        u118.spinProjectile(a1)
    end,
    [12] = function(a1) -- Line: 544 -- upvalues: u118 (val)
        u118.runProjectile(a1, 3)
        u118.runProjectile(a1, 4)
    end,
    [16] = function(a1) -- Line: 548 -- upvalues: u118 (val)
        u118.runProjectile(a1, 5)
        u118.runProjectile(a1, 6)
    end,
    [19] = function(a1) -- Line: 552 -- upvalues: u118 (val)
        u118.runProjectile(a1, 7)
    end,
}

function u118.cleanup(a1) -- Line: 557 -- upvalues: u118 (val)
    u118.init(a1)
end

return u118