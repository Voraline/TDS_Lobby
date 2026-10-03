-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.GamemodeDebugMenu
-- Decompile time: 2.30 ms

local u0 = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DebugLineGraph = require(script.DebugLineGraph)
local DebugNumberStat = require(script.DebugNumberStat)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u29 = true
local u31 = Signal.new()
local DebugMenu = Network.Channel("DebugMenu")
local v1 = {
    EnemyHP = function(a1) -- Line: 19 -- upvalues: DebugNumberStat (val), u31 (val)
        local u6 = DebugNumberStat.new(a1, "Enemy HP", 0)
        u31:Connect(function(a1) -- Line: 21 -- upvalues: u6 (val)
            u6:Update("Enemy HP", a1.EnemyHpTotal)
        end)
    end,
    EnemyCashReward = function(a1) -- Line: 25 -- upvalues: DebugNumberStat (val), u31 (val)
        local u6 = DebugNumberStat.new(a1, "Enemy cash", 0)
        u31:Connect(function(a1) -- Line: 27 -- upvalues: u6 (val)
            u6:Update("Enemy cash", a1.EnemyCashRewardTotal)
        end)
    end,
    SPACER1 = function(a1) -- Line: 31
        local Frame = Instance.new("Frame")
        Frame.BackgroundTransparency = 1
        Frame.Size = UDim2.new(0, 50, 0, 20)
        Frame.Parent = a1
    end,
    WaveRewards = function(a1) -- Line: 37 -- upvalues: DebugLineGraph (val), u31 (val)
        local u5 = DebugLineGraph.new(a1, "Wave rewards")
        u31:Connect(function(a1) -- Line: 39 -- upvalues: u5 (val)
            u5:Draw(a1.WaveRewards)
        end)
    end,
    EnemyRewards = function(a1) -- Line: 43 -- upvalues: DebugLineGraph (val), u31 (val)
        local u5 = DebugLineGraph.new(a1, "Enemy cash")
        u31:Connect(function(a1) -- Line: 45 -- upvalues: u5 (val)
            u5:Draw(a1.WaveEnemyCashRewards)
        end)
    end,
    EnemyHealths = function(a1) -- Line: 49 -- upvalues: DebugLineGraph (val), u31 (val)
        local u5 = DebugLineGraph.new(a1, "Enemy health")
        u31:Connect(function(a1) -- Line: 51 -- upvalues: u5 (val)
            u5:Draw(a1.WaveEnemyHealths)
        end)
    end,
    CombinedRewards = function(a1) -- Line: 55 -- upvalues: DebugLineGraph (val), u31 (val)
        local u5 = DebugLineGraph.new(a1, "Combined rewards")
        u31:Connect(function(a1) -- Line: 57 -- upvalues: u5 (val)
            u5:Draw(a1.CombinedWaveRewards)
        end)
    end,
}
local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DebugGui"
ScreenGui.Enabled = false
ScreenGui.ResetOnSpawn = false
local Frame = Instance.new("Frame")
Frame.BackgroundTransparency = 0.5
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.AnchorPoint = Vector2.new(1, 0)
Frame.AutomaticSize = Enum.AutomaticSize.XY
Frame.Position = UDim2.new(1, -15, 0, 15)
local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.Parent = Frame
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Parent = Frame
Frame.Parent = ScreenGui
for k, v in pairs(v1) do
    v(Frame)
end

local function setData(a1) -- Line: 99 -- upvalues: u29 (ref)
    u29 = true
end

function u0.SetEnabled(a1) -- Line: 106 -- upvalues: ScreenGui (val), u29 (ref), DebugMenu (val)
    ScreenGui.Enabled = a1
    if not u29 then
        u29 = true
        task.spawn(function() -- Line: 110 -- upvalues: DebugMenu (upval), u29 (upval)
            DebugMenu:InvokeServer("GetDebugData")
            u29 = true
        end)
    end
end

task.defer(function() -- Line: 116 -- upvalues: ScreenGui (val), LocalPlayer (val)
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end)
;(LocalPlayer:GetAttributeChangedSignal("StatsOpen")):Connect(function() -- Line: 120 -- upvalues: u0 (val), LocalPlayer (val)
    u0.SetEnabled(LocalPlayer:GetAttribute("StatsOpen"))
end)
return u0