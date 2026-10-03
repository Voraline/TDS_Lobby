-- Script path: ReplicatedStorage.Client.Modules.Replicators.CashAwardStatsReplicator
-- Decompile time: 2.98 ms

local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local u25 = {}
local CaptureEditor = require(ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.CaptureEditor)
local ClientItemPickupData = require(ReplicatedStorage.Shared.Data.SharedData.ClientItemPickupData)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Cash = require(ReplicatedStorage.Shared.Modules.Network).Channel("Cash")
local ItemPickups = ReplicatedStorage.Assets.ItemPickups
local u60 = {}

local function makeCounter() -- Line: 36 -- upvalues: ItemPickups (val)
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "CashCounter"
    Attachment.Parent = workspace.Terrain
    local v1 = ItemPickups.BaseItemPickupUI:Clone()
    v1.Parent = Attachment
    v1.ClipsDescendants = false
    local v2 = ItemPickups.ItemPickupUI:Clone()
    v2.Parent = Attachment
    return Attachment, v1, v2
end

local function makeCounterVisible(a1, a2) -- Line: 53
    -- upvalues: TweenService (val), Debris (val)
    local v1 = if not a2 then 0.4 else 0.2
    local Icon = a1.Icon
    TweenService:Create(Icon, TweenInfo.new(v1), {ImageTransparency = if not a2 then 1 else 0}):Play()
    local Value = a1.Value
    TweenService:Create(Value, TweenInfo.new(v1), {TextTransparency = if not a2 then 1 else 0}):Play()
    local UIStroke = a1.Value.UIStroke
    TweenService:Create(UIStroke, TweenInfo.new(v1), {Transparency = if not a2 then 1 else 0}):Play()
    if a2 then
        TweenService:Create(a1.UIScale, TweenInfo.new(v1, Enum.EasingStyle.Back), {Scale = 0.5}):Play()
        return
    end
    local v2 = a1:FindFirstAncestorOfClass("Attachment")
    TweenService:Create(v2, TweenInfo.new(v1), {WorldCFrame = v2.WorldCFrame * CFrame.new(0, 0.1, 0)}):Play()
    Debris:AddItem(v2, v1)
end

function u25.IncrementCounter(a1, a2, a3) -- Line: 84
    -- upvalues: CaptureEditor (val), u60 (val), ClientItemPickupData (val), Enum (val), ItemPickups (val)
    -- upvalues: makeCounterVisible (val)
    if CaptureEditor.toggleCashUI and CaptureEditor.toggleCashUI:get() then
        return
    end
    local attachment = nil
    local v1 = u60[a1]
    if v1 then
        local ui = v1.ui
        local billboard = v1.billboard
        attachment = v1.attachment
    end
    if not v1 then
        local Icon = ClientItemPickupData[Enum.ItemPickupType.Cash].Icon
        local Attachment = Instance.new("Attachment")
        Attachment.Name = "CashCounter"
        Attachment.Parent = workspace.Terrain
        local v2 = ItemPickups.BaseItemPickupUI:Clone()
        v2.Parent = Attachment
        v2.ClipsDescendants = false
        local v3 = ItemPickups.ItemPickupUI:Clone()
        v3.Parent = Attachment
        local v4 = v2
        local v5 = v3
        if typeof(Icon) == "number" then
            Icon = string.format("rbxassetid://%d", Icon)
        end
        v5.Icon.Image = Icon
        v5.UIScale.Scale = 0
        v5.Parent = v4.Frame
        local v6 = {
            amount = 0,
            delta = 0,
            ui = v5,
            billboard = v4,
            attachment = Attachment,
        }
        u60[a1] = v6
        v1 = v6
    end
    v1.delta = 0
    v1.amount = v1.amount + a2
    v1.ui.Value.Text = ("+%*"):format(v1.amount)
    attachment.WorldCFrame = CFrame.new(a3)
    makeCounterVisible(v1.ui, true)
end

Cash:On("PickUp", function(a1) -- Line: 130 -- upvalues: HttpService (val), u25 (val)
    local v1, v2
    for i, j in a1 do
        v1, v2 = unpack(j)
        u25.IncrementCounter(HttpService:GenerateGUID(false), v2, v1)
    end
end)
RunService.Heartbeat:Connect(function(a1) -- Line: 139 -- upvalues: GameState (val), u60 (val), makeCounterVisible (val) -- types: a1: number
    local v1 = a1 * GameState.TimeScale
    for i, j in u60 do
        j.delta = j.delta + v1
        if 0.8 < j.delta then
            makeCounterVisible(j.ui, false)
            u60[i] = nil
        end
    end
end)
return u25