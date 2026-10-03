-- Script path: ReplicatedStorage.Client.Modules.Replicators.ItemPickupStatsUIReplicator
-- Decompile time: 2.15 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local v1 = {}
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local ClientItemPickupData = require(ReplicatedStorage.Shared.Data.SharedData.ClientItemPickupData)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local LocalPlayer = Players.LocalPlayer
local ItemPickups = ReplicatedStorage.Assets.ItemPickups
local Attachment = Instance.new("Attachment")
Attachment.Parent = workspace.Terrain
local u45 = {}
local u49 = ItemPickups.BaseItemPickupUI:Clone()
u49.Parent = Attachment
u49.ClipsDescendants = false
local u54 = ItemPickups.ItemPickupUI:Clone()
u54.Parent = Attachment

local function makeCounterVisible(a1, a2) -- Line: 41 -- upvalues: spr (val), TweenService (val) -- types: a2: boolean
    local v1 = if not a2 then 0.6 else 0.4
    spr.target(a1.UIScale, 1, if not a2 then 4 else 6, {Scale = if not a2 then 0 else 0.5})
    local Icon = a1.Icon
    TweenService:Create(Icon, TweenInfo.new(v1), {ImageTransparency = if not a2 then 1 else 0}):Play()
    local Value = a1.Value
    TweenService:Create(Value, TweenInfo.new(v1), {TextTransparency = if not a2 then 1 else 0}):Play()
    local UIStroke = a1.Value.UIStroke
    TweenService:Create(UIStroke, TweenInfo.new(v1), {Transparency = if not a2 then 1 else 0}):Play()
end

function v1.IncrementCounter(a1, a2) -- Line: 56
    -- upvalues: ClientItemPickupData (val), u45 (val), u54 (val), u49 (val), spr (val), makeCounterVisible (val)
    local v1
    local v2 = ClientItemPickupData[a1]
    assert(v2, "Invalid pickup type: " .. (tostring(a1)))
    if not u45[a1] then
        v1 = u54:Clone()
        local Icon = v2.Icon
        if typeof(Icon) == "number" then
            Icon = string.format("rbxassetid://%d", Icon)
        end
        v1.Icon.Image = Icon
        v1.UIScale.Scale = 0
        v1.Parent = u49.Frame
        u45[a1] = {amount = 0, enabled = true, ui = v1, lastRunTime = os.clock()}
    end
    v1 = u45[a1]
    v1.amount = v1.amount + a2
    v1.lastRunTime = os.clock()
    v1.enabled = true
    v1.ui.Value.Text = "+" .. v1.amount
    spr.bump(v1.ui.UIScale, 1, 6, {Scale = 4})
    makeCounterVisible(v1.ui, true)
end

Scheduler.add("ItemPickupStatsUIReplicator", RunService.Heartbeat, function() -- Line: 93 -- upvalues: LocalPlayer (val), Attachment (val), u45 (val), makeCounterVisible (val)
    local v1 = os.clock()
    local Character = LocalPlayer.Character
    if Character then
        local PrimaryPart = Character.PrimaryPart
        if PrimaryPart then
            Attachment.WorldPosition = PrimaryPart.Position
        end
    end
    for i, j in u45 do
        if 4 <= v1 - j.lastRunTime and j.enabled then
            j.enabled = false
            j.amount = 0
            makeCounterVisible(j.ui, false)
        end
    end
end)
return v1