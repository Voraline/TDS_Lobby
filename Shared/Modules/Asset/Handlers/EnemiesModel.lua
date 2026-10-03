-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.EnemiesModel
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local SoundService = game:GetService("SoundService")
local u22 = RunService:IsRunning()
local u25 = RunService:IsServer()
local Enemies = SoundService:WaitForChild("Enemies")
local u30 = {}

local function getModelKey(a1, a2) -- Line: 12 -- types: a1: string, a2: boolean
    return (("%*:%*"):format(if not a2 then "New" else "Legacy", a1))
end

local function resolveEnemyModel(a1, a2) -- Line: 17
    -- upvalues: u22 (val), u25 (val), ServerStorage (val), ReplicatedStorage (val), Enemies (val), u30 (val)
    local u17 = ("%*:%*"):format(if not (a2 == true) then "New" else "Legacy", a1)
    local v1 = if not a2 then "NewEnemies" else "Enemies"
    local u60 = (if not u22 then ServerStorage.Assets[("Dev%*"):format(v1)] else u25 and ServerStorage.Assets:WaitForChild(v1) or (ReplicatedStorage:WaitForChild("Assets")):WaitForChild(v1)):WaitForChild(
        a1,
        5
    )
    if not u60 then
        return
    end
    for i, j in u60:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Enemies
        end
    end
    u60.Destroying:Connect(function() -- Line: 42 -- upvalues: u30 (upval), u17 (val), u60 (val)
        if u30[u17] and u30[u17] == u60 then
            u30[u17] = nil
            return
        end
    end)
    return u60
end

return function(a1, a2) -- Line: 53 -- upvalues: u30 (val), resolveEnemyModel (val) -- types: a1: string, a2: boolean?
    local v1 = ("%*:%*"):format(if not (a2 == true) then "New" else "Legacy", a1)
    if not u30[v1] then
        local v2
        u30[v1] = (resolveEnemyModel(a1, v2))
    end
    return u30[v1]
end