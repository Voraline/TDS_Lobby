-- Script path: ReplicatedStorage.Content.Maps.Outpost 32.Animator
-- Decompile time: 7.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Events = script.Events
local Outpost32Map = NewNetwork.Channel("Outpost32Map")
local u61 = {}
local u62 = nil
TagReplicator.hook("Outpost32", function(a1, a2) -- Line: 19 -- upvalues: u61 (val), Events (val), u62 (ref)
    local function update() -- Line: 20 -- upvalues: a2 (val), u61 (upval), Events (upval), u62 (upval)
        local v1, v2
        for i, j in a2:WaitForState("States") do
            if not j then
                if u61[i] then
                    u61[i](u62)
                    u61[i] = nil
                end
            elseif not u61[i] then
                v1 = u61
                v2 = require(Events:WaitForChild(i))
                v1[i] = (v2(u62))
            end
        end
    end

    update()
    ;(a2:GetStateChangedSignal("States")):Connect(update)
end)
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://84409020127285"
local Sound_2 = Instance.new("Sound")
Sound_2.SoundId = "rbxassetid://137269319964390"
local Folder = Instance.new("Folder")
Folder.Name = "Junk"
Folder.Parent = workspace

local function IceRocket(a1, a2) -- Line: 49
    -- upvalues: ReplicatedStorage (val), Sound (val), TypedPromise (val), GameState (val), Shaker (val)
    -- upvalues: EmitterManager (val), Sound_2 (val)
    local u2 = nil
    local u3 = 0
    local Model = Instance.new("Model")
    Model.Name = "IceRocket"
    local u24 = (ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Shards:GetChildren())[math.random(1, 2)]:Clone()
    local u28 = Sound:Clone()
    u28.Volume = 1
    u28.PlaybackSpeed = Random.new():NextNumber(0.86, 1)
    u28.Parent = u24
    u28:Play()
    u28.Ended:Connect(function() -- Line: 66 -- upvalues: u28 (val)
        u28:Destroy()
    end)
    u24.Color = Color3.fromRGB(0, 157, 255)
    u24.Transparency = 0
    u24.Parent = Model
    Model:ScaleTo(1.1)
    Model.Parent = workspace
    local u62 = Random.new():NextNumber(0.4, 1)
    return (TypedPromise.new(function(a1_2) -- Line: 79
        -- upvalues: u2 (ref), u3 (ref), GameState (upval), u62 (val), Model (val), Shaker (upval)
        -- upvalues: EmitterManager (upval), a2 (val), Sound_2 (upval), u24 (val), a1 (val)
        local u2_2 = CFrame.new()
        u2 = (game:GetService("RunService")).RenderStepped:Connect(function(a1_3) -- Line: 81
            -- upvalues: u3 (upval), GameState (upval), u62 (upval), Model (upval), Shaker (upval)
            -- upvalues: EmitterManager (upval), a2 (upval), Sound_2 (upval), u24 (upval), a1_2 (val), u2 (upval)
            -- upvalues: a1 (upval), u2_2 (ref)
            u3 = u3 + a1_3 * GameState.TimeScale / u62
            if Model and Model.Parent and not (u3 >= 1) then
                local v1 = CFrame.new(math.noise(u3 * u62) * 14, math.noise(u3 * u62 * 2) * 25, 0)
                local v2 = CFrame.new((a1:Lerp(a2, u3))) * v1
                local v3 = (u2_2.Position - v2.Position).Unit * 2
                Model:PivotTo((CFrame.new(v2.Position, v2.Position - v3)) * (CFrame.Angles(1.5707963267948966, 0, 0)))
                u2_2 = v2
                return
            end
            if Model and Model.Parent then
                Shaker:Shake({0.5, 30, 0, 1.5}, 0.1, 0.7)
                EmitterManager.Emit("SnowExplosion", CFrame.new(a2), 5)
                local u85 = Sound_2:Clone()
                u85.Volume = 0.5
                u85.PlaybackSpeed = Random.new():NextNumber(0.86, 1)
                u85.Parent = u24
                u85:Play()
                u85.Ended:Connect(function() -- Line: 95 -- upvalues: u85 (val)
                    u85:Destroy()
                end)
                for k, v in pairs(Model:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                        v.Enabled = false
                    end
                end
                game.Debris:AddItem(Model, 2)
            end
            a1_2()
            u2:Disconnect()
        end)
    end))
end

local u81 = {}
Outpost32Map:onEvent("WallDamage", function(a1) -- Line: 132 -- upvalues: u81 (val), TweenService (val), TimescaleUtilities (val), RunService (val)
    local BaseCoolor = a1:FindFirstChild("BaseCoolor", true)
    if BaseCoolor then
        if u81[BaseCoolor] then
            u81[BaseCoolor]:Disconnect()
            u81[BaseCoolor] = nil
        end
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = 0.9
        TweenService:Create(NumberValue, TweenInfo.new(0.09), {Value = 0.3}):Play()
        TimescaleUtilities.Delay(0.09, function() -- Line: 143 -- upvalues: TweenService (upval), NumberValue (val)
            TweenService:Create(NumberValue, TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0.9}):Play()
        end)
        local u36 = 0
        u81[BaseCoolor] = (RunService.Heartbeat:Connect(function(a1) -- Line: 152 -- upvalues: u36 (ref), u81 (upval), BaseCoolor (val), NumberValue (val)
            u36 = u36 + a1
            if u36 >= 3.1 then
                u81[BaseCoolor]:Disconnect()
                u81[BaseCoolor] = nil
            end
            BaseCoolor.Transparency = NumberSequence.new(NumberValue.Value)
        end))
    end
end)

local function wallDestroyed(a1) -- Line: 165
    -- upvalues: TimescaleUtilities (val), u81 (val), TweenService (val), RunService (val)
    for i, j in a1:GetDescendants() do
        if j:IsA("Beam") then
            j.Color = ColorSequence.new(Color3.fromRGB(255, 10, 92))
            task.spawn(function() -- Line: 170 -- upvalues: TimescaleUtilities (upval), j (val)
                for i = 1, 6 do
                    TimescaleUtilities.Wait(0.1)
                    j.Enabled = false
                    TimescaleUtilities.Wait(0.1)
                    j.Enabled = true
                    TimescaleUtilities.Wait(0.05)
                end
                j.Enabled = false
            end)
        end
    end
    local BaseCoolor = a1:FindFirstChild("BaseCoolor", true)
    if BaseCoolor then
        if u81[BaseCoolor] then
            u81[BaseCoolor]:Disconnect()
            u81[BaseCoolor] = nil
        end
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = 0.9
        TweenService:Create(NumberValue, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Value = 0.3}):Play()
        local u46 = 0
        u81[BaseCoolor] = (RunService.Heartbeat:Connect(function(a1) -- Line: 199 -- upvalues: u46 (ref), u81 (upval), BaseCoolor (val), NumberValue (val)
            u46 = u46 + a1
            if u46 >= 3.1 then
                u81[BaseCoolor]:Disconnect()
                u81[BaseCoolor] = nil
            end
            BaseCoolor.Transparency = NumberSequence.new(NumberValue.Value)
        end))
    end
end

Outpost32Map:onEvent("WallDestroyed", wallDestroyed)
Outpost32Map:onEvent("FreezeEffect", function(a1) -- Line: 214
    -- upvalues: IceRocket (val), ReplicatedStorage (val), TweenService (val), EffectsController (val)
    -- upvalues: TimescaleUtilities (val), Folder (val)
    (IceRocket(a1 + Vector3.new(math.random(-80, 80), math.random(60, 120), (math.random(-80, 80))), a1)):andThen(function() -- Line: 218
        -- upvalues: ReplicatedStorage (upval), a1 (val), TweenService (upval), EffectsController (upval)
        -- upvalues: TimescaleUtilities (upval), Folder (upval)
        local v1 = ReplicatedStorage.Assets.Effects.Client.IceCrack:Clone()
        local u15 = ReplicatedStorage.Assets.Effects.Client.IceShards:Clone()
        u15.Size = Vector3.new(1, 1, 1)
        u15.CFrame = (CFrame.new(a1)) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0) * CFrame.new(0, -1, 0)
        v1.Size = Vector3.new(0, 0, 0)
        local v2 = math.random(4, 6)
        local v3 = Random.new():NextNumber(0.3, 2)
        v1.Position = a1 - Vector3.new(0, 1, 0)
        TweenService:Create(v1, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Position = a1 + Vector3.new(0, 0.10000000149011612, 0),
            Size = Vector3.new(v2, v3, v2),
        }):Play()
        TweenService:Create(u15, TweenInfo.new(1.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            CFrame = (CFrame.new(a1)) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0),
            Size = Vector3.new(v2 * 2, v3, v2 * 2),
        }):Play()
        EffectsController.Radius(CFrame.new(a1), 14)
        TimescaleUtilities.Delay(15, function() -- Line: 255 -- upvalues: TweenService (upval), u15 (val), TimescaleUtilities (upval)
            TweenService:Create(u15, TweenInfo.new(6, Enum.EasingStyle.Linear), {Transparency = 1, Size = Vector3.new(0, 0, 0)}):Play()
            TimescaleUtilities.CleanUp(u15, 6)
        end)
        u15.Parent = Folder
        v1.Parent = Folder
    end)
end)
Outpost32Map:onEvent("BeamWall", function(a1, a2) -- Line: 269 -- upvalues: u62 (ref), IceRocket (val), wallDestroyed (val)
    if a2:GetAttribute("Dead") then
        return
    end
    ;(IceRocket(u62.ProjectileStart.Position, a1)):andThen(function() -- Line: 275 -- upvalues: wallDestroyed (upval), a2 (val)
        wallDestroyed(a2)
    end)
end)
return function(a1, a2) -- Line: 280 -- upvalues: u62 (ref), Folder (val), RunService (val) -- types: a1: userdata
    local Animation
    local DangerZone = a1:WaitForChild("DangerZone")
    local Highlight = DangerZone:WaitForChild("Highlight")
    u62 = a1
    Folder:ClearAllChildren()
    a2:Mark((DangerZone.DescendantAdded:Connect(function(a1) -- Line: 288
        if not a1:IsA("BasePart") then
            return
        end
        a1.Transparency = 0.99
    end)))
    a2:Mark((DangerZone.DescendantRemoving:Connect(function(a1) -- Line: 296
        if not a1:IsA("BasePart") then
            return
        end
        a1.Transparency = 1
    end)))
    for i, j in DangerZone:GetDescendants() do
        if j:IsA("BasePart") then
            j.Transparency = 0.99
        end
    end
    a2:Mark((RunService.RenderStepped:Connect(function() -- Line: 310 -- upvalues: Highlight (val)
        Highlight.FillTransparency = (math.sin((tick()) * 4) * 0.5 + 0.5) * 0.5 + 0.5
    end)))
    for k, n in (a1:WaitForChild("Environment")):WaitForChild("Radars"):GetChildren() do
        if n:IsA("Model") then
            Animation = n:WaitForChild("Animation")
            n:WaitForChild("AnimationController"):WaitForChild("Animator"):LoadAnimation(Animation):Play()
        end
    end
end