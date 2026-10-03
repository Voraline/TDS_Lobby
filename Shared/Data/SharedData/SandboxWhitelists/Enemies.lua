-- Script path: ReplicatedStorage.Shared.Data.SharedData.SandboxWhitelists.Enemies
-- Decompile time: 4.21 ms

local Difficulties, DisplayInfo, DisplayName, Waves_2, result_2, success_2, v1, v2, v3, v4, v5, v6, v7, v8
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local FFlagAtoms = require(ReplicatedStorage.Shared.Data.SharedData.FFlagAtoms)
local v9 = RunService:IsServer()
local u246 = {}
local Gamemodes = Content("Gamemodes")
local v10 = nil
local EnemyGameModes = Gamemodes:FindFirstChild("EnemyGameModes")
if EnemyGameModes and EnemyGameModes:IsA("StringValue") then
    local success, result = pcall(HttpService.JSONDecode, HttpService, EnemyGameModes.Value)
    if success then
        v10 = result
    end
end
local GamemodeWaves = v9 and ServerStorage:FindFirstChild("GamemodeWaves") or nil
for i, j in Gamemodes:GetChildren() do
    Difficulties = j:FindFirstChild("Difficulties")
    if Difficulties then
        for k, n in Difficulties:GetChildren() do
            v1 = ("%*/%*"):format(j.Name, n.Name)
            DisplayInfo = n:FindFirstChild("DisplayInfo")
            if DisplayInfo then
                v2 = require(DisplayInfo)
                v3 = {}
                if v10 then
                    v4 = v10[j.Name]
                    v3 = v4 and v4[n.Name] or {}
                elseif v9 and GamemodeWaves then
                    v4 = GamemodeWaves:FindFirstChild(j.Name)
                    v5 = v4 and v4:FindFirstChild(n.Name)
                    Waves_2 = v5 and v5:FindFirstChild("Waves")
                    if Waves_2 then
                        success_2, result_2 = pcall(require, Waves_2)
                        if success_2 and result_2 and result_2.Waves then
                            v6 = {}
                            v7 = nil
                            v8 = nil
                            for m, i5 in result_2.Waves, v7, v8 do
                                if i5.WaveTimeline and i5.WaveTimeline.Enemies then
                                    for i6, i7 in i5.WaveTimeline.Enemies do
                                        if i7.Name and not v6[i7.Name] then
                                            v6[i7.Name] = true
                                            table.insert(v3, i7.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                v4 = {Name = v1}
                DisplayName = v2.DisplayName or v2.Name or n.Name
                v4.DisplayName = DisplayName
                v4.Description = v2.Description
                v4.Difficulty = n.Name
                v4.Gamemode = j.Name
                v4.EnemyNames = v3
                u246[v1] = v4
            end
        end
    end
end
local u80 = FFlagAtoms("sandbox.whitelist_gamemodes", {})

local function getAdditiveEnemyWhitelist() -- Line: 87 -- upvalues: u80 (val), u246 (val)
    local v1 = u80()
    local v2 = {}
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in u246, v4, v5 do
        if table.find(v1, i) then
            for k, n in j.EnemyNames do
                v3[n] = true
            end
        end
    end
    for m in v3 do
        table.insert(v2, m)
    end
    return v2
end

return function(a1) -- Line: 109 -- upvalues: getAdditiveEnemyWhitelist (val)
    return getAdditiveEnemyWhitelist
end