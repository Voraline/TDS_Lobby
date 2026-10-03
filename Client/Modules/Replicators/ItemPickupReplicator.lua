-- Script path: ReplicatedStorage.Client.Modules.Replicators.ItemPickupReplicator
-- Decompile time: 7.84 ms

local Attachment, Highlight, v1, v2, v3, v4
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("TweenService")
local u300 = {}
local Game = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController.Modules.Game)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local ClientItemPickupData = require(ReplicatedStorage.Shared.Data.SharedData.ClientItemPickupData)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local InstancePool = require(ReplicatedStorage.Shared.Modules.InstancePool)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local ItemPickupStatsUIReplicator = require(ReplicatedStorage.Client.Modules.Replicators.ItemPickupStatsUIReplicator)
require(ReplicatedStorage.Client.Modules.Replicators.CashAwardStatsReplicator)
local LocalPlayer = Players.LocalPlayer
local ItemPickups = ReplicatedStorage.Assets.ItemPickups
local Models = ItemPickups.Models
local Sounds = ItemPickups.Sounds
local ItemPickup = Network.Channel("ItemPickup")
local u313 = {}
local u314 = {}
local u315 = {}
local u316 = 0
local u317 = {}
local u318 = Random.new()
local Model = Instance.new("Model")
Model.Name = "Pickups"
Model.Parent = if not Game:Get("Show Currency Drops") then nil else workspace
local Model_2 = Instance.new("Model")
Model_2.Name = "ForcedPickups"
for i, j in {Model, Model_2} do
    Highlight = Instance.new("Highlight")
    Highlight.FillTransparency = 0.9
    Highlight.FillColor = Color3.new(1, 1, 1)
    Highlight.OutlineColor = Color3.new(1, 1, 1)
    Highlight.OutlineTransparency = 0
    Highlight.Parent = j
end
Game:On("Show Currency Drops", function(a1) -- Line: 55 -- upvalues: Model (val)
    Model.Parent = if not a1 then nil else workspace
end)

local function makeSoundPool(a1) -- Line: 59 -- upvalues: InstancePool (val) -- types: a1: userdata
    local Attachment = Instance.new("Attachment")
    local v1 = a1:Clone()
    v1.Name = "Sound"
    v1.Parent = Attachment
    return InstancePool.new(Attachment, 10, workspace.Terrain)
end

for i2, v in ipairs(Sounds:GetChildren()) do
    v1 = {}
    u313[v.Name] = v1
    for i3, k in ipairs(v:GetChildren()) do
        if not k:IsA("Sound") then
            v2 = {}
            for i4, n in ipairs(k:GetChildren()) do
                v3 = #v2 + 1
                Attachment = Instance.new("Attachment")
                v4 = n:Clone()
                v4.Name = "Sound"
                v4.Parent = Attachment
                v2[v3] = (InstancePool.new(Attachment, 10, workspace.Terrain))
            end
            v1[k.Name] = v2
        else
            v1[k.Name] = {makeSoundPool(k)}
        end
    end
end

local function playPooledSound(a1, a2) -- Line: 85 -- upvalues: u318 (val) -- types: a2: vector
    local u4 = a1:Get()
    u4.WorldPosition = a2
    u4.Sound.PlaybackSpeed = u318:NextNumber(0.8, 1.2)
    u4.Sound:Play()
    task.spawn(function() -- Line: 91 -- upvalues: u4 (val), a1 (val)
        u4.Sound.Ended:Wait()
        a1:Return(u4)
    end)
end

local u159 = {}
u159.__index = u159

function u159.new(a1, a2, a3, a4, a5, a6, a7) -- Line: 100
    -- upvalues: ClientItemPickupData (val), SpringClass (val), u318 (val), u159 (val), Maid (val), u314 (val)
    -- upvalues: u315 (val), u316 (ref)
    local v1 = ClientItemPickupData[a5]
    assert(v1, "Invalid pickup type: " .. (tostring(a5)))
    local v2 = SpringClass.new(Vector3.new(a3.X, a4.Y, a3.Z), 1, u318:NextNumber(5, 7))
    local v3 = SpringClass.new(0, u318:NextNumber(0.2, 0.5), u318:NextNumber(10, 14))
    v2.p = a3
    v2.t = a4
    v3.t = 0
    v3.v = u318:NextNumber(20, 60)
    local u58 = setmetatable({}, u159)
    u58.data = a7 or {}
    u58._maid = Maid.new()
    u58._data = v1
    u58._id = a5
    u58.amount = a6 or 1
    u58.model = a2
    u58.originPosition = a3
    u58.endPosition = a4
    u58.xzSpring = v2
    u58.ySpring = v3
    u58.localTime = u318:NextNumber(0, 6.283185307179586)
    u58._maid:Mark(function() -- Line: 139 -- upvalues: u314 (upval), u58 (val), u315 (upval), a1 (val), u316 (upval)
        u314[u58.model.Name]:Return(u58.model)
        if u315[a1] then
            u316 = u316 - 1
        end
        u315[a1] = nil
    end)
    v1.OnSpawn(u58)
    return u58
end

function u159:Destroy() -- Line: 152
    if self._maid then
        self._maid:Sweep()
        self._maid = nil
    end
end

function u300.SpawnPickup(a1, a2, a3, a4, a5, a6, a7) -- Line: 160
    -- upvalues: ClientItemPickupData (val), u316 (ref), NPCReplicator (val), u314 (val), Models (val), Model_2 (val)
    -- upvalues: InstancePool (val), Model (val), playPooledSound (val), u313 (val), u318 (val), u315 (val), u159 (val)
    local v1
    local v2 = ClientItemPickupData[a5]
    assert(v2, "Invalid pickup type: " .. (tostring(a5)))
    if u316 >= 50 then
        return
    end
    if a3 and not NPCReplicator.GetNPCFromFolder(a3) then
        return
    end
    local Position = a2 or NPCReplicator.GetNPCFromFolder(a3).Model.PrimaryPart.Position
    local v3 = u314[v2.ModelName]
    if not v3 then
        v1 = Models:FindFirstChild(v2.ModelName)
        assert(v1, "Invalid pickup model: " .. (tostring(v2.ModelName)))
        if v2.AlwaysShow and not Model_2.Parent then
            Model_2.Parent = workspace
        end
        v3 = InstancePool.new(v1, nil, if not v2.AlwaysShow then Model else Model_2)
        u314[v2.ModelName] = v3
    end
    v1 = v3:Get()
    playPooledSound(u313[v2.SoundName or v2.ModelName].Drop[u318:NextInteger(1, #u313[v2.SoundName or v2.ModelName].Drop)], Position)
    v1:PivotTo((CFrame.new(Position)))
    u315[a1] = (u159.new(a1, v1, Position, a4, a5, a6, a7))
    u316 = u316 + 1
end

Scheduler.add("ItemPickupReplicator", RunService.Heartbeat, function(a1) -- Line: 215
    -- upvalues: u315 (val), GameState (val), Players (val), u317 (val), ItemPickupStatsUIReplicator (val)
    -- upvalues: EffectsController (val)
    local otherPickup, p, v1, v2
    for i, j in u315 do
        j.localTime = j.localTime + a1 * GameState.State.TimeScale
        v1 = Vector3.new(0, (math.sin(j.localTime * 0.3) + 1) * 0.5, 0)
        j.model:PivotTo((CFrame.new(j.xzSpring.p + Vector3.new(0, (math.abs(j.ySpring.p)) + (j._data.Height or 0), 0) + v1)) * (CFrame.Angles(0, j.localTime * 0.3, 0)))
    end
    local Character = Players.LocalPlayer.Character and Players.LocalPlayer.Character.PrimaryPart and Players.LocalPlayer.Character.PrimaryPart.Position
    if Character == nil then
        return
    end
    for k, n in u317 do
        n.localTime = n.localTime + a1
        n.otherPickup.xzSpring.t = Character
        p = n.otherPickup.xzSpring.p
        v2 = Vector3.new(0, (math.sin(n.localTime * 0.3) + 1) * 0.5, 0)
        n.model:PivotTo((CFrame.new(p + v2)) * (CFrame.Angles(0, n.localTime * 0.3, 0)))
        if (p - Character).Magnitude < 5 then
            otherPickup = n.otherPickup
            otherPickup._data.OnPickup(otherPickup)
            ItemPickupStatsUIReplicator.IncrementCounter(otherPickup._id, otherPickup.amount or 1)
            EffectsController.Cash(otherPickup.model.Position, Character, otherPickup.model)
            otherPickup:Destroy()
        end
    end
end)
ItemPickup:On("Spawn", function(a1, a2, a3, a4, a5, a6, a7) -- Line: 267 -- upvalues: u300 (val)
    u300.SpawnPickup(a1, a2, a3, a4, a5, a6, a7)
end)
ItemPickup:On("Pickup", function(a1, a2) -- Line: 280
    -- upvalues: u315 (val), LocalPlayer (val), playPooledSound (val), u313 (val), u318 (val), u316 (ref), u317 (val)
    local v1 = u315[a1]
    if not LocalPlayer.Character
        or not LocalPlayer.Character.PrimaryPart
        or not LocalPlayer.Character.PrimaryPart.Position then
        local endPosition = v1.endPosition
    end
    if v1 then
        local Position = v1.model.Position
        playPooledSound(
            u313[v1._data.SoundName or v1._data.ModelName].Collect[u318:NextInteger(1, #u313[v1._data.SoundName or v1._data.ModelName].Collect)],
            Position
        )
        local v2 = {localTime = v1.localTime, model = v1.model, otherPickup = v1}
        v1.xzSpring.s = 13
        v1.xzSpring.p = v1.xzSpring.p + Vector3.new(0, math.abs(v1.ySpring.p), 0)
        local xzSpring_3 = v1.xzSpring
        xzSpring_3.v = xzSpring_3.v + Vector3.new(0, 5, 0)
        u315[a1] = nil
        u316 = u316 - 1
        u317[a1] = v2
        v1._maid:Mark(function() -- Line: 310 -- upvalues: u317 (upval), a1 (val)
            u317[a1] = nil
        end)
    end
end)
ItemPickup:On("Despawn", function(a1) -- Line: 324 -- upvalues: u315 (val)
    local v1 = u315[a1]
    if v1 then
        v1:Destroy()
    end
end)
return u300