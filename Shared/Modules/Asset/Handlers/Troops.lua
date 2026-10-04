-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops
-- Decompile time: 4.07 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Tower = Content("Tower")
local u46 = RunService:IsClient()
local u49 = RunService:IsRunning()
local u50 = {}
local Icons = require(ReplicatedStorage:WaitForChild("Shared").Data:WaitForChild("Icons"))

local function createValue(a1) -- Line: 19
    local u1 = a1
    return {
        get = function() -- Line: 23 -- upvalues: u1 (ref)
            return u1
        end,
        set = function(a1, a2) -- Line: 27 -- upvalues: u1 (ref) -- types: a2: userdata
            u1 = a2
        end,
    }
end

local function getEligible(a1) -- Line: 140
    -- upvalues: createValue (val), u46 (val), u49 (val), Players (val)
    local u3 = createValue(false)
    if u46 and u49 then
        task.spawn(function() -- Line: 147 -- upvalues: a1 (val), Players (upval), u3 (val)
            local success, result = pcall(function() -- Line: 148 -- upvalues: a1 (upval), Players (upval)
                return a1.Eligible(Players.LocalPlayer)
            end)
            u3:set(success and result)
        end)
        return u3
    end
    return u3
end

local function getPaths(a1) -- Line: 158 -- types: a1: table
    local v1 = 0
    for k, v in pairs(a1) do
        if not v[1] then
            if v1 > 0 then
                warn("Multiple paths have been detected, and stat does not have multiple paths")
            end
        elseif not (#v < v1) then
            v1 = #v
        else
            warn("Upgrade path has less upgrades than the previous path")
        end
    end
    return v1, a1
end

local function formatStats(a1) -- Line: 180 -- upvalues: getPaths (val), table (val) -- types: a1: table
    for k, v in pairs(a1) do
        v.Paths = getPaths(v.Upgrades)
        if not v.Paths or not (0 < v.Paths) then
            table.sort(v.Upgrades or {}, function(a1, a2) -- Line: 187
                return a1.Cost < a2.Cost
            end)
        end
    end
    return a1
end

local function resolveTroop(a1, a2) -- Line: 195
    -- upvalues: Tower (val), GameState (val), u49 (val), u46 (val), formatStats (val), table (val), Enum (val)
    -- upvalues: Icons (val), createValue (val), Players (val), HttpService (val)
    local v1
    if not a1 then
        return nil
    end
    local v2 = Tower:FindFirstChild(a1)
    local Stats = v2
    if Stats then
        Stats = v2:FindFirstChild("Stats")
    end
    if not Stats then
        return nil
    end
    local v3 = require(Stats)
    local TowerInformation = v2:FindFirstChild("TowerInformation")
    local Animator = v2 and v2:WaitForChild("Animator")
    local Upgrade = v2 and v2:FindFirstChild("Upgrade")
    local UpgradeOptions = v2 and v2:FindFirstChild("UpgradeOptions")
    if GameState.GameMode == "PVP" then
        v1 = v2 and v2:FindFirstChild("Stats-PVP")
        if v1 then
            Stats = v1
        end
    end
    if a2 then
        v1 = v2 and v2:FindFirstChild((("Stats-%*"):format(a2)))
        if v1 then
            Stats = v1
        end
    end
    local u78 = require(Stats)
    if workspace:FindFirstChild("Type").Value ~= "Lobby" then
        u78.Upgrades = Upgrade and u49 and require(Upgrade)
        u78.Animator = if not u46 then {} else if not u49 then {} else require(Animator)
    end
    u78.Stats = formatStats(table.reconcile(v3.Stats, u78.Stats))
    u78.TowerInformation = TowerInformation and require(TowerInformation) or {}
    local v4 = {Default = true}
    for i in u78.Properties.SkinData or {} do
        v4[i] = true
    end
    local SkinData_2 = u78.Properties.SkinData or {}
    if not u78.Properties.SkinData then
        u78.Properties.SkinData = SkinData_2
    end
    if not SkinData_2.Default then
        SkinData_2.Default = {
            Icon = u78.Properties.Preview.Icon,
            Rarity = Enum.SkinRarity.Common,
        }
    end
    if Icons.Towers[a1] then
        local v5
        for j, k in SkinData_2 do
            v5 = Icons.Towers[a1][j]
            if v5 then
                k.Icon = v5
            end
        end
        if Icons.Towers[a1].Default then
            u78.Properties.Preview.Icon = Icons.Towers[a1].Default
        end
    end
    local Price = u78.Properties.Price
    if Price then
        if not Price.Eligible then
            Price.IsEligible = createValue(true)
        else
            local u225 = createValue(false)
            if u46 and u49 then
                task.spawn(function() -- Line: 147 -- upvalues: Price (val), Players (upval), u225 (val)
                    local success, result = pcall(function() -- Line: 148 -- upvalues: Price (upval), Players (upval)
                        return Price.Eligible(Players.LocalPlayer)
                    end)
                    u225:set(success and result)
                end)
            end
            Price.IsEligible = u225
        end
    end
    local Attribute = Stats:GetAttribute("_DATA")
    if Attribute then
        u78.Stats = formatStats(HttpService:JSONDecode(Attribute))
    end
    if u49 then
        (Stats:GetAttributeChangedSignal("_DATA")):Connect(function() -- Line: 285 -- upvalues: Stats (ref), u78 (val), formatStats (upval), HttpService (upval)
            local Attribute = Stats:GetAttribute("_DATA")
            if Attribute then
                u78.Stats = formatStats(HttpService:JSONDecode(Attribute))
            end
        end)
    end
    u78.Skins = v4
    u78.UpgradeOptions = UpgradeOptions and require(UpgradeOptions) or {}
    return u78
end

return function(a1, a2, a3, a4) -- Line: 299
    -- upvalues: u50 (val), resolveTroop (val)
    local v1 = u50[("%*%*"):format(a1, a3 or "")]
    if not v1 or a4 then
        v1 = resolveTroop(a1, a3)
        u50[("%*%*"):format(a1, a3 or "")] = v1
    end
    local v2 = v1
    if a2 and v1 then
        v2 = v1.Skins[a2]
    end
    return v2
end