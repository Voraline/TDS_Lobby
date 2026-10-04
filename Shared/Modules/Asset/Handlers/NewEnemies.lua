-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewEnemies
-- Decompile time: 3.06 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local SoundService = game:GetService("SoundService")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Enemies = Content("Enemies")
local NewEnemies = Content("NewEnemies")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Enemies_2 = Assets:WaitForChild("Enemies")
local NewEnemies_2 = Assets:WaitForChild("NewEnemies")
local u63 = {}
local u66 = RunService:IsClient()
local u69 = RunService:IsRunning()
local u70 = {
    Boss = Enum.Modifier.Boss,
    NoStun = Enum.Modifier.StunImmune,
    NoBurn = Enum.Modifier.FireImmune,
    NoExplode = Enum.Modifier.ExplosionImmune,
    NoFreeze = Enum.Modifier.FreezeImmune,
}

local function legacyToModernStats(a1, a2) -- Line: 68 -- upvalues: u70 (val)
    local v1 = {Attributes = {}, MaxHealth = a1.max_health, Speed = a1.speed}
    for i, j in u70 do
        if a2:FindFirstChild(i) then
            table.insert(v1.Attributes, j)
        end
    end
    return v1
end

local u84 = GameState.NewGameModes == true
;(GameState.Replicator:GetStateChangedSignal("NewGameModes")):Connect(function() -- Line: 82 -- upvalues: u84 (ref), GameState (val), u63 (val)
    local v1 = u84
    u84 = GameState.NewGameModes == true
    if v1 ~= u84 then
        table.clear(u63)
    end
end)

local function resolveEnemy(a1, a2) -- Line: 91
    -- upvalues: u84 (ref), NewEnemies_2 (val), Enemies_2 (val), RunService (val), ServerStorage (val)
    -- upvalues: SoundService (val), Enemies (val), NewEnemies (val), legacyToModernStats (val), Icons (val), u66 (val)
    -- upvalues: u69 (val), HttpService (val)
    local v1
    local v2 = if a2 == nil then u84 else a2
    if string.find(a1, " Legacy") then
        v2 = false
    end
    local v3 = (v2 and NewEnemies_2 or Enemies_2):FindFirstChild(a1)
    if RunService:IsServer() then
        v3 = (if not v2 then nil else (ServerStorage.Assets:WaitForChild("Enemies")):FindFirstChild(a1)) or (ServerStorage.Assets:WaitForChild("LegacyEnemies")):FindFirstChild(a1) or (ServerStorage.Assets:WaitForChild("LegacyEnemies")):FindFirstChild(a1 .. " Legacy")
    end
    if not v3 then
        return nil
    end
    local Model = v3:FindFirstChild("Model")
    if not Model then
        return nil
    end
    local Enemies_4 = SoundService:FindFirstChild("Enemies")
    for i, j in Model:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Enemies_4
        end
    end
    local v4 = Enemies:FindFirstChild(a1)
    local v5 = v2 and NewEnemies:FindFirstChild(a1) or v4
    if v5 then
        v1 = a1
    else
        if string.sub(a1, #a1 - 6) ~= " Legacy" then
            v1 = a1
        else
            v1 = string.sub(a1, 1, #a1 - 7)
            v4 = Enemies:FindFirstChild(v1)
            local v6 = NewEnemies:FindFirstChild(v1)
            v5 = v2 and NewEnemies:FindFirstChild(v1) or v4 or v6
        end
        if not v5 then
            return nil
        end
    end
    local Stats = v5:FindFirstChild("Stats")
    if not Stats then
        Stats = v3:FindFirstChild("Stats")
    end
    if not Stats then
        return nil
    end
    local v7 = require(Stats)
    if v7.max_health then
        v7 = legacyToModernStats(v7, Model)
    end
    local u185 = {Stats = v7, Model = Model}
    local Enemies_5 = v2 and Icons.Enemies or Icons.LegacyEnemies
    u185.Icon = Enemies_5[v1] or "rbxassetid://15913919212"
    u185.isLegacy = not v2
    if workspace.Type.Value ~= "Lobby" then
        local Animator = v5:FindFirstChild("Animator")
        if Animator ~= nil and u66 and u69 then
            u185.Animator = require(Animator)
        end
    end
    ;(Stats:GetAttributeChangedSignal("_DATA")):Connect(function() -- Line: 195 -- upvalues: Stats (ref), u185 (val), HttpService (upval)
        local Attribute = Stats:GetAttribute("_DATA")
        if Attribute then
            u185.Stats = HttpService:JSONDecode(Attribute)
        end
    end)
    local Attribute = Stats:GetAttribute("_DATA")
    if Attribute then
        u185.Stats = HttpService:JSONDecode(Attribute)
    end
    return u185
end

return function(a1, a2) -- Line: 208 -- upvalues: u63 (val), resolveEnemy (val) -- types: a1: string, a2: boolean?
    local v1 = a1
    if a2 ~= nil then
        v1 = ("%*%*"):format(if not a2 then "Legacy" else "New", a1)
    end
    local v2 = u63[v1]
    if not v2 then
        u63[v1] = (resolveEnemy(a1, a2))
    end
    return v2
end