-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.DebugMenu
-- Decompile time: 2.62 ms

local v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local u22 = {}
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local StatisticsBarChartUI = require(script.StatisticsBarChartUI)
local StatisticsUI = require(script.StatisticsUI)
local Thread = require(ReplicatedStorage.Shared.Modules.Thread)
local u46 = {}
u46.HB = {
    IncludeBarChart = true,
    BarChartEntryName = "Server heartbeat",
    Update = function(a1, a2) -- Line: 30
        a1:UpdateMS("Server heartbeat: ", a2, 40)
    end,
}
u46.Step = {
    IncludeBarChart = true,
    BarChartEntryName = "Server physics step",
    Update = function(a1, a2) -- Line: 37
        a1:UpdateMS("Server physics step: ", a2, 40, true)
    end,
}
u46.Tower = {
    IncludeBarChart = true,
    BarChartEntryName = "Average tower update time",
    Update = function(a1, a2) -- Line: 44
        a1:UpdateMS("Average tower update time: ", a2, 40, true)
    end,
}
u46.Enemy = {
    IncludeBarChart = true,
    BarChartEntryName = "Average enemy update time",
    Update = function(a1, a2) -- Line: 56
        a1:UpdateMS("Average enemy update time: ", a2, 40)
    end,
}
local LocalPlayer = Players.LocalPlayer
u22.Maid = Maid.new()
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DebugGui"
ScreenGui.Enabled = false
ScreenGui.ResetOnSpawn = false
StatisticsUI.RootUI.Parent = ScreenGui
local u65 = {}
local u66 = {}
for k, v in pairs(u46) do
    v1 = StatisticsUI.new()
    u65[k] = v1
    if v.IncludeBarChart then
        v2 = StatisticsBarChartUI.new(v.BarChartEntryName or "", 40, "ms")
        v2.UI.Name = "ZZZZZZ"
        v2.UI.Parent = StatisticsUI.RootUI
        v1.UI.MouseButton1Click:Connect(function() -- Line: 92 -- upvalues: u66 (val), k (val)
            for k2, v in pairs(u66) do
                v.UI.Visible = not (k ~= k2) and not v.UI.Visible or false
            end
        end)
        u66[k] = v2
    end
end
local u80 = os.clock()

local function pollStatisticsStep() -- Line: 105 -- upvalues: u80 (ref), Network (val), u65 (val), u46 (val), u66 (val)
    local v1 = os.clock()
    local v2 = v1 - u80
    if v2 >= 0.5 then
        local v3
        u80 = v1
        v2 = Network.Channel("PerfStatistics"):InvokeServer("Get")
        if not v2 then
            return
        end
        for k, v in pairs(v2) do
            v3 = u65[k]
            if v3 then
                u46[k].Update(v3, v)
                if u66[k] then
                    u66[k]:Add(v)
                end
            end
        end
    end
end

function u22.SetEnabled(a1) -- Line: 129 -- upvalues: ScreenGui (val), Thread (val), pollStatisticsStep (val), u22 (val)
    ScreenGui.Enabled = a1
    if not a1 then
        u22.Maid:Sweep()
        return
    end
    Thread.Add("StatisticsPollStep", pollStatisticsStep)
    u22.Maid:Mark(function() -- Line: 134 -- upvalues: Thread (upval)
        Thread.Remove("StatisticsPollStep")
    end)
end

task.defer(function() -- Line: 142 -- upvalues: u22 (val), ScreenGui (val), LocalPlayer (val)
    u22.SetEnabled(false)
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end)
;(LocalPlayer:GetAttributeChangedSignal("StatsOpen")):Connect(function() -- Line: 147 -- upvalues: u22 (val), LocalPlayer (val)
    u22.SetEnabled(LocalPlayer:GetAttribute("StatsOpen"))
end)
return u22