-- Script path: ReplicatedStorage.Content.Maps.Banlands.Animator.Events.MapEffects
-- Decompile time: 12.11 ms

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = {}
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u57 = Random.new()

local function hideParts(a1, a2) -- Line: 38 -- types: a1: userdata, a2: boolean?
    local v1
    local v2 = {}
    local Descendants = a1:GetDescendants()
    v2[1] = a1
    v2[2] = unpack(Descendants)
    local v3 = nil
    local v4 = nil
    local v5 = a2
    for i, j in v2, v3, v4 do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = if not v5 then 1 else 0
        elseif j:IsA("ParticleEmitter") or j:IsA("Beam") then
            v1 = v5 == true
            j.Enabled = v1
        end
    end
end

local function getRandomPointInPart(a1) -- Line: 48 -- upvalues: u57 (val) -- types: a1: userdata
    local v1 = a1.Size / 2
    return a1.Position + Vector3.new(u57:NextNumber(-v1.X, v1.X), u57:NextNumber(-v1.Y, v1.Y), (u57:NextNumber(-v1.Z, v1.Z)))
end

local function getProjectileCFrame(a1, a2, a3) -- Line: 59 -- types: a1: number, a3: number
    local v1
    local v2 = a2:Get(a3)
    local v3 = a2:Get((math.min(1, a3 + 0.01)))
    local v4 = Vector3.new(math.noise(v2.X * 0.2, a1) * 1, math.noise(v2.Y * 0.2, a1) * 1, (math.noise(v2.Z * 0.2, a1)) * 1)
    if a3 <= 0.1 then
        v1 = a3 / 0.1
        v4 = Vector3.new(0, 0, 0):Lerp(v4, v1)
    elseif a3 >= 0.9 then
        v1 = (a3 - 0.9) / 0.1
        v4 = v4:Lerp(Vector3.new(0, 0, 0), v1)
    end
    v2 = v2 + v4
    return CFrame.lookAt(v2, v3)
end

local function createTrail(a1, a2) -- Line: 80 -- upvalues: ReplicatedStorage (val) -- types: a1: userdata, a2: vector
    local v1
    local Attachment = Instance.new("Attachment")
    local Attachment_2 = Instance.new("Attachment")
    Attachment.WorldCFrame = CFrame.new(0, -a2.X * 0.3, 0)
    Attachment_2.WorldCFrame = CFrame.new(0, a2.X * 0.3, 0)
    Attachment.Parent = a1
    Attachment_2.Parent = a1
    for i, j in ReplicatedStorage.Assets.Effects.Mob.Drakobloxxer.Projectile.Model.Part["3"]:GetChildren() do
        v1 = j:Clone()
        v1.Attachment0 = Attachment
        v1.Attachment1 = Attachment_2
        v1.Parent = Attachment
    end
end

local function fireProjectile(a1) -- Line: 100
    -- upvalues: Maid (val), u57 (val), Bezier (val), ReplicatedStorage (val), getProjectileCFrame (val)
    -- upvalues: EmitterManager (val), RunService (val), GameState (val), Shaker (val), hideParts (val)
    -- upvalues: TweenService_2 (val)
    local u3 = Maid.new()
    local startPoint = a1.startPoint
    local endPoint = a1.endPoint
    local complete = a1.complete
    local v1 = a1.scale or 1
    local Effects = a1.map.Effects
    local Rift = Effects.Rifts.Rift
    local v2 = (startPoint:Lerp(endPoint, 0.2)) + Vector3.new(u57:NextNumber(-50, 50), 0, (u57:NextNumber(-50, 50)))
    local v3 = (startPoint:Lerp(endPoint, 0.8)) + Vector3.new(u57:NextNumber(-50, 50), 0, (u57:NextNumber(-50, 50))) * 0.4
    local u62 = u57:NextInteger(-9999999, 9999999) / 1000
    local u69 = Bezier.new(startPoint, v2, v3, endPoint)
    local u78 = ReplicatedStorage.Assets.Effects.Mob.Drakobloxxer.Projectile:Clone()
    local v4 = Rift:Clone()
    local PointLight = Instance.new("PointLight")
    PointLight.Brightness = 10
    PointLight.Range = 6
    PointLight.Parent = u78.Skull
    PointLight.Color = Color3.fromRGB(255, 0, 221)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://85772790444280"
    Sound.Parent = u78.Skull
    Sound.Looped = true
    Sound.RollOffMinDistance = 50
    Sound.RollOffMaxDistance = 180
    Sound.RollOffMode = Enum.RollOffMode.InverseTapered
    Sound.Volume = 1.1
    Sound:Play()
    local Model = Instance.new("Model")
    Model.Name = "ProjectileContainer"
    if a1.projectile then
        u78.Skull.Transparency = 1
        local v5 = a1.projectile:Clone()
        v5.CFrame = u78.Skull.CFrame
        v5.Anchored = false
        v5.CanCollide = false
        v5.Size = v5.Size * (u78.Skull.Size.Magnitude / v5.Size.Magnitude)
        v5.Parent = u78
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = u78.Skull
        WeldConstraint.Part1 = v5
        WeldConstraint.Parent = u78.Skull
    end
    u78:ScaleTo(0.5)
    local Skull = u78.Skull
    Skull.Size = Skull.Size * 0.6
    u78.Skull.Material = Enum.Material.Neon
    u78.Skull.Color = Color3.fromRGB(182, 129, 255)
    u78.Model.Part.Transparency = 1
    u78.Parent = Model
    u78:PivotTo((getProjectileCFrame(u62, u69, 0)))
    v4:PivotTo((u78:GetPivot()) * (CFrame.Angles(1.5707963267948966, 0, 0)))
    v4.Parent = Model
    u3:Mark(v4)
    u3:Mark(u78)
    EmitterManager.manualEmit(v4)
    local u190 = nil
    local u191 = 0
    local u192 = Vector3.new(0, 0, 0)
    local u194 = tick()
    u190 = (RunService.Heartbeat:Connect(function(a1) -- Line: 191
        -- upvalues: GameState (upval), u69 (val), u191 (ref), u78 (val), u192 (ref), Sound (val), u194 (val)
        -- upvalues: u190 (ref), Effects (val), endPoint (val), u3 (val), Shaker (upval), EmitterManager (upval)
        -- upvalues: hideParts (upval), TweenService_2 (upval), PointLight (val), complete (val)
        -- upvalues: getProjectileCFrame (upval), u62 (val)
        local v1 = a1 * GameState.TimeScale
        local Magnitude = ((u69:Get((math.min(u191 + 0.01, 1)))) - u69:Get((math.max(u191 - 0.01, 0)))).Magnitude
        local v2 = 0
        if Magnitude > 0 then
            v2 = v1 * 0.8 / Magnitude
        end
        local v3 = (u78.Skull.Position - Vector3.new(0, 0, 0)) / v1
        u192 = u192:Lerp(v3, (math.clamp(v1 * 5, 0, 1)))
        Sound.PlaybackSpeed = math.lerp((math.clamp(u192.Magnitude / 20, 0.5, 1.6)) + math.sin(((tick()) - u194) * 2) / 2.5, Sound.PlaybackSpeed, v1 * 4) * 0.7 * GameState.TimeScale
        u191 = u191 + v2
        if u191 >= 1 then
            u190:Disconnect()
            local Model = Instance.new("Model")
            local v4 = Effects.Explosion:Clone()
            v4:PivotTo((CFrame.new(endPoint)))
            v4.Parent = Model
            Model:ScaleTo(3)
            Model.Parent = workspace.Terrain
            u3:Mark(Model)
            Sound:Stop()
            u78.Skull.Impact:Destroy()
            Shaker:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
            EmitterManager.manualEmit(v4)
            hideParts(u78)
            TweenService_2:Create(PointLight, TweenInfo.new(2, Enum.EasingStyle.Exponential), {Brightness = 0}):Play()
            task.delay(2, function() -- Line: 237 -- upvalues: u3 (upval)
                u3:Sweep()
            end)
            if complete then
                complete()
            end
        end
        u78:PivotTo((getProjectileCFrame(u62, u69, u191)))
    end))
    u3:Mark(u190)
    u3:Mark(Model)
    Model.Parent = workspace.Terrain
    if v1 ~= 1 then
        Model:ScaleTo(v1)
    end
    return u3
end

local function riftIn(a1) -- Line: 261
    -- upvalues: Maid (val), u57 (val), RunService (val), GameState (val), TweenService (val), spr (val)
    -- upvalues: EmitterManager (val), Shaker (val), EasySound (val), createTrail (val)
    local u3 = Maid.new()
    local target = a1.target
    local complete = a1.complete
    local Effects = a1.map.Effects
    local Rift = Effects.Rifts.Rift
    local Pivot = target:GetPivot()
    local u21 = (CFrame.new(Pivot.Position * Vector3.new(1, 0, 1) + Vector3.new(0, 80, 0))) * Pivot.Rotation
    local NumberValue = Instance.new("NumberValue")
    local u39 = Vector2.new(u57:NextNumber(-0.5, 0.5), u57:NextNumber(-0.5, 0.5)) * 360
    local Model = Instance.new("Model")
    local u45 = target:Clone()
    local PrimaryPart = if not u45:IsA("Model") then u45 else u45.PrimaryPart
    u45.Parent = Model
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://85772790444280"
    Sound.Parent = PrimaryPart
    Sound.Looped = true
    Sound.RollOffMinDistance = 50
    Sound.RollOffMaxDistance = 180
    Sound.RollOffMode = Enum.RollOffMode.InverseTapered
    Sound.Volume = 1.1
    Sound:Play()
    local ExtentsSize = Model:GetExtentsSize()
    Model:ScaleTo(0.3)
    local u74 = nil
    local u75 = 0
    local u76 = Vector3.new(0, 0, 0)
    local u78 = tick()
    NumberValue.Changed:Connect(function(a1) -- Line: 303 -- upvalues: Model (val)
        for i, j in Model:GetDescendants() do
            if j:IsA("BasePart") then
                j.LocalTransparencyModifier = a1
            end
        end
    end)
    u74 = RunService.Heartbeat:Connect(function(a1) -- Line: 311
        -- upvalues: GameState (upval), u75 (ref), TweenService (upval), u21 (val), Pivot (val), u39 (val), u45 (val)
        -- upvalues: u76 (ref), Sound (val), u78 (val), u74 (ref), spr (upval), Model (val), Effects (val)
        -- upvalues: ExtentsSize (val), u3 (val), EmitterManager (upval), Shaker (upval), EasySound (upval)
        -- upvalues: complete (val)
        local v1 = a1 * GameState.TimeScale
        u75 = u75 + v1
        local v2 = math.clamp(u75 / 2.5, 0, 1)
        local Value = TweenService:GetValue(v2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local v3 = u21:Lerp(Pivot, Value)
        local v4 = u39:Lerp(Vector2.zero, Value)
        u45:PivotTo(v3 * (CFrame.Angles(math.rad(v4.X), 0, (math.rad(v4.Y)))))
        local v5 = (v3.Position - Vector3.new(0, 0, 0)) / v1
        u76 = u76:Lerp(v5, (math.clamp(v1 * 5, 0, 1)))
        Sound.PlaybackSpeed = math.lerp((math.clamp(u76.Magnitude / 20, 0.5, 1.6)) + math.sin(((tick()) - u78) * 2) / 2.5, Sound.PlaybackSpeed, v1 * 4) * 0.7 * GameState.TimeScale
        if v2 >= 1 then
            u74:Disconnect()
            spr.bump(Model, 0.6, 2, {Scale = 4})
            spr.target(Model, 0.6, 2, {Scale = 1})
            local Model_2 = Instance.new("Model")
            local v6 = Effects.Explosion:Clone()
            v6:PivotTo((CFrame.new(Pivot.Position)))
            v6.Parent = Model_2
            Model_2:ScaleTo(4 * ExtentsSize.Magnitude / 10)
            Model_2.Parent = workspace.Terrain
            u3:Mark(Model_2)
            EmitterManager.manualEmit(v6)
            Shaker:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
            Sound:Stop()
            EasySound.Play({
                id = 72258292922239,
                destroyOnEnd = true,
                volume = 4,
                timeScaled = true,
                position = Pivot.Position,
            })
            task.delay(3, function() -- Line: 367 -- upvalues: complete (upval), u3 (upval)
                if complete then
                    complete()
                end
                u3:Sweep()
            end)
        end
    end)
    local v1 = Rift:Clone()
    v1:PivotTo((CFrame.new(u21.Position)) + (Vector3.new(0, ExtentsSize.Y * 0.3, 0)))
    v1.Parent = workspace.Terrain
    v1:ScaleTo((math.max(0.6, ExtentsSize.Magnitude / 20)))
    u3:Mark(v1)
    EmitterManager.manualEmit(v1)
    task.delay(0, function() -- Line: 384
        -- upvalues: spr (upval), NumberValue (val), Model (val), u45 (val), createTrail (upval), ExtentsSize (val)
        spr.target(NumberValue, 1, 4, {Value = 0})
        spr.target(Model, 1, 2, {Scale = 1})
        task.wait(1)
        if u45:IsA("BasePart") then
            createTrail(u45, u45.Size)
            return
        end
        createTrail(u45.PrimaryPart, ExtentsSize)
    end)
    NumberValue.Value = 1
    Model.Parent = workspace.Terrain
    u3:Mark(NumberValue)
    u3:Mark(Model)
    u3:Mark(u74)
    return u3
end

function v1.init(a1) -- Line: 411 -- upvalues: hideParts (val)
    hideParts(a1.Environment.EasterEggs)
end

function v1.run(a1) -- Line: 415 -- upvalues: hideParts (val)
    hideParts(a1.Environment.EasterEggs)
end

function v1.cleanup(a1) -- Line: 419
    for i, j in a1.Environment.EasterEggs:GetChildren() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = 1
            j:SetAttribute("Used", nil)
        end
    end
end

function v1.onWave(a1, a2) -- Line: 428
    -- upvalues: fireProjectile (val), u57 (val), hideParts (val), riftIn (val)
    local Magnitude, SpawnBox, v1, v2
    local v3, v4 = a2, a1
    for i, j in a1.Environment.EasterEggs:GetChildren() do
        if not (v3 < (j:GetAttribute("Wave") or 0)) and not j:GetAttribute("Used") then
            j:SetAttribute("Used", true)
            if j:HasTag("ProjectileEffect") then
                v2 = {map = v4}
                Magnitude = if not j:IsA("Model") then j.Size.Magnitude else j:GetExtentsSize().Magnitude
                v2.scale = Magnitude / 3.3
                v2.projectile = if not j:IsA("BasePart") then nil else j
                SpawnBox = v4.Effects.Rifts.SpawnBox
                v1 = SpawnBox.Size / 2
                v2.startPoint = SpawnBox.Position + Vector3.new(u57:NextNumber(-v1.X, v1.X), u57:NextNumber(-v1.Y, v1.Y), (u57:NextNumber(-v1.Z, v1.Z)))
                v2.endPoint = j:GetPivot().Position

                function v2.complete() -- Line: 445 -- upvalues: hideParts (upval), j (val)
                    hideParts(j, true)
                end

                fireProjectile(v2)
            elseif j:HasTag("RiftEffect") then
                riftIn({
                    map = v4,
                    target = j,
                    complete = function() -- Line: 453 -- upvalues: hideParts (upval), j (val)
                        hideParts(j, true)
                    end,
                })
            end
        end
    end
end

return v1