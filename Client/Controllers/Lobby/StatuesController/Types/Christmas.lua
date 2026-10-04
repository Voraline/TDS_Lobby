-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.Christmas
-- Decompile time: 10.02 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Events = require(ReplicatedStorage.Shared.Data.Events)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local u36 = {}
local u37 = {}
local u38 = {}
u38.__index = u38

local function intro(a1) -- Line: 21 -- upvalues: TweenService (val)
    local v1 = TweenInfo.new(2)
    TweenService:Create(a1.Model.Lock.Tombstone, v1, {
        Position = a1.Model.Lock.Tombstone.Position - Vector3.new(0, 4, 0),
    }):Play()
    TweenService:Create(a1.Model.Lock.Lock, v1, {Position = a1.Model.Lock.Lock.Position - Vector3.new(0, 4, 0)}):Play()
    a1.Model.Lock.Tombstone.Sink:Play()
    a1.Model.Lock.Tombstone.Dirt.Enabled = true
    task.wait(v1.Time)
end

local function unlock(a1) -- Line: 38 -- upvalues: ReplicatedStorage (val)
    local v1
    local v2 = {}
    local v3 = {}
    v2.WorldPosition = a1.Model.PrimaryPart.Position + Vector3.new(0, 30, 0)
    v2.WorldAxis = Vector3.new(0, 0, 1)
    v3.WorldPosition = a1.Model.PrimaryPart.Position
    v3.WorldAxis = Vector3.new(0, 0, 1)
    local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
    local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
    local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
    local v4 = LightningBolt.new(v2, v3, 14)
    v4.Color = Color3.new(0.25098039215686274, 1, 0.8)
    v4.PulseSpeed = 20
    v4.Frequency = 2
    v4.AnimationSpeed = 20
    Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
    wait(0.2)
    v4:DestroyDissipate()
    EmitterManager.Emit("EnergyExplosion", a1.Model.PrimaryPart.CFrame, 5)
    a1.Model.Statue.Transparency = 1
    a1.Model.Statue.Break:Play()
    a1.Model.Statue.StoneParticle:Emit(50)
    a1.Model.Lock:Destroy()
    a1.Model.SnowGlobe.GlobeLayerInside:Destroy()
    a1.Model.SnowGlobe.GlobeLayerOutside:Destroy()
    for k, v in pairs(a1.Model.GroundDebris:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v1 = v:GetAttribute("EmitCount") or 1
            if v1 then
                v:Emit(v1)
            end
        end
    end
    a1.Character.Parent = a1.Model
end

local function countDown(a1, a2) -- Line: 80 -- types: a2: number
    local Lock = a1.Model:FindFirstChild("Lock")
    local Counter = Lock and Lock:FindFirstChild("Counter", true)
    if not Counter then
        return
    end
    Counter.Text = ("Days: %*, Hours: %*\nMinutes: %*, Seconds: %*"):format(
        math.floor(a2 / 86400),
        math.floor(a2 / 3600 % 24),
        math.floor(a2 / 60 % 60),
        (math.floor(a2 % 60))
    )
end

local function waitUntilInDistance(a1, a2, a3) -- Line: 96
    -- upvalues: Promise (val), LocalPlayer (val), RunService (val)
    return Promise.new(function(a1_2, a2_2, a3) -- Line: 99 -- upvalues: LocalPlayer (upval), RunService (upval), a1 (val), a2 (val)
        local u3 = nil
        local Character = LocalPlayer.Character
        local u13 = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 105 -- upvalues: Character (ref)
            Character = a1
        end)
        u3 = RunService.Heartbeat:Connect(function() -- Line: 109 -- upvalues: Character (ref), a1 (upval), a2 (upval), u13 (ref), u3 (ref), a1_2 (val)
            if Character and Character.PrimaryPart then
                if (Character.PrimaryPart.Position - a1.Position).Magnitude <= a2 then
                    u13:Disconnect()
                    u3:Disconnect()
                    a1_2()
                end
                return
            end
        end)
        a3(function() -- Line: 123 -- upvalues: u13 (ref), u3 (ref)
            u13:Disconnect()
            u3:Disconnect()
        end)
    end)
end

function u38.new(a1) -- Line: 130 -- upvalues: Maid (val), u38 (val), u37 (val) -- types: a1: userdata
    local v1 = a1:GetAttribute("Mode") or ""
    if v1 == "winter" then
        v1 = "Christmas2023"
    end
    local v2 = {
        Level = 0,
        Enabled = false,
        Maid = Maid.new(),
        Model = a1,
        Character = a1:WaitForChild("Character"),
        Event = v1,
    }
    local v3 = setmetatable(v2, u38)
    if v3:init() then
        u37[v3] = a1
    end
    return v3
end

function u38:init() -- Line: 153
    local Interaction = self.Model:WaitForChild("Interaction")
    self.Interaction = Interaction
    Interaction.Enabled = false
    ;(Interaction:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 159 -- upvalues: Interaction (val), self (val)
        if Interaction.Enabled ~= self.Enabled then
            Interaction.Enabled = self.Enabled
        end
    end)
    self.Character.Parent = nil
    self.Model.Statue.Transparency = 0
    self.Interaction.Enabled = false
    return self
end

function u38:Destroy() -- Line: 172 -- upvalues: u37 (val), u36 (val)
    u37[self] = nil
    u36[self] = nil
    self.Maid:Destroy()
end

task.spawn(function() -- Line: 179
    -- upvalues: u37 (val), u36 (val), Events (val), countDown (val), Promise (val), LocalPlayer (val), RunService (val)
    -- upvalues: intro (val), unlock (val)
    local Countdown, Level, Lock, new, v1, v2, v3, v4
    while true do
        v1 = nil
        v2 = nil
        for i in u37, v1, v2 do
            if not u36[i] then
                v3 = Events.getEvent(i.Event)
                if v3 then
                    v4 = v3.starts.UnixTimestamp - workspace:GetServerTimeNow()
                    countDown(i, (math.max(0, v4)))
                    if not (v4 > 0) then
                        Lock = i.Model:FindFirstChild("Lock")
                        Countdown = Lock and Lock:FindFirstChild("Countdown", true)
                        if Countdown then
                            Countdown:Destroy()
                        end
                        if Events.isActive(i.Event) then
                            u36[i] = true
                            local PrimaryPart = i.Model.PrimaryPart
                            Level = i.Level
                            new = Promise.new
                            local u65 = 30
                            ;(new(function(a1, a2, a3) -- Line: 99 -- upvalues: LocalPlayer (upval), RunService (upval), PrimaryPart (val), u65 (val)
                                local u3 = nil
                                local Character = LocalPlayer.Character
                                local u13 = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 105 -- upvalues: Character (ref)
                                    Character = a1
                                end)
                                u3 = RunService.Heartbeat:Connect(function() -- Line: 109 -- upvalues: Character (ref), PrimaryPart (upval), u65 (upval), u13 (ref), u3 (ref), a1 (val)
                                    if Character and Character.PrimaryPart then
                                        if (Character.PrimaryPart.Position - PrimaryPart.Position).Magnitude <= u65 then
                                            u13:Disconnect()
                                            u3:Disconnect()
                                            a1()
                                        end
                                        return
                                    end
                                end)
                                a3(function() -- Line: 123 -- upvalues: u13 (ref), u3 (ref)
                                    u13:Disconnect()
                                    u3:Disconnect()
                                end)
                            end)):andThen(function() -- Line: 213 -- upvalues: intro (upval), i (val), unlock (upval)
                                intro(i)
                                unlock(i)
                                i.Enabled = true
                                i.Interaction.Enabled = true
                            end)
                        end
                    end
                end
            end
        end
        RunService.Heartbeat:Wait()
    end
end)
return u38