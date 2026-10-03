-- Script path: ReplicatedStorage.Content.Consumables.Necromancer's Tome.Controller
-- Decompile time: 2.88 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local GlobalBusService = require(ServerStorage.Server.Services.Shared.GlobalBusService)
local Player = require(ServerStorage.Server.Modules.Player)
local Sift = require(ReplicatedStorage.Packages.Sift)
local TimerClass = require(ReplicatedStorage.Shared.Modules.TimerClass)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local UnitService = require(ServerStorage.Server.Services.Game.UnitService)
local u51 = {
    {name = "Skeleton", weight = 70, level = 0},
    {name = "Sword Skeleton", weight = 20, limit = 5, level = 2},
    {name = "Skeleton Knight", weight = 5, limit = 1, level = 3},
    {name = "Giant Skeleton", weight = 2, limit = 1, level = 3},
    {name = "Hallow Guard", weight = 2, limit = 1, level = 4},
    {name = "Executioner Skeleton", weight = 1, limit = 1, level = 4},
}

local function selectRandomUnit() -- Line: 23 -- upvalues: Sift (val), u51 (val)
    local name = ""
    local v1 = 0
    local v2 = {}
    for i, j in Sift.Array.copyDeep(u51) do
        table.insert(v2, j)
    end
    for k, n in v2 do
        if n.level <= 4 then
            v1 = v1 + n.weight
        end
    end
    local v3 = Random.new():NextInteger(1, v1)
    for i2, v in ipairs(v2) do
        if v.level <= 4 then
            if v3 <= v.weight then
                name = v.name
                break
            end
            v3 = v3 - v.weight
        end
    end
    if name == "" then
        name = "Skeleton"
    end
    return name
end

return {
    CreateContext = function(a1) -- Line: 57 -- upvalues: u51 (val)
        if not a1.Duration then
            a1.Duration = 10
        end
        a1.units = u51
    end,
    OnUse = function(a1) -- Line: 64
        -- upvalues: TypedPromise (val), Players (val), Player (val), GlobalBusService (val), selectRandomUnit (val)
        -- upvalues: UnitService (val), TimerClass (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 65
            -- upvalues: a1 (val), Players (upval), Player (upval), GlobalBusService (upval), selectRandomUnit (upval)
            -- upvalues: UnitService (upval), TimerClass (upval)
            local Context = a1.Context
            local playerId = Context.playerId
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            local u15 = PlayerByUserId
            if u15 then
                u15 = Player.GetEntityFromPlayer(PlayerByUserId)
            end
            if not u15 then
                a2("Invalid player")
                return
            end
            a1.Replicator:Set("TimeLeft", Context.Duration)
            local u33 = GlobalBusService.Connect("kill_enemy", function() -- Line: 78 -- upvalues: selectRandomUnit (upval), UnitService (upval), u15 (val)
                local v1 = selectRandomUnit()
                UnitService.CreateNewUnit({name = v1, owner = u15})
            end)

            local function cleanUp() -- Line: 85 -- upvalues: u33 (val)
                u33()
            end

            local u42 = TimerClass.new("NecromancersTomeTimer", Context.Duration, nil, nil, true)
            u42.OnFinish:Connect(function() -- Line: 90 -- upvalues: u33 (val), a1_2 (val)
                u33()
                a1_2()
            end)
            u42.OnSecond:Connect(function() -- Line: 94 -- upvalues: u42 (val), a1 (upval)
                local TimeLeft = u42:GetTimeLeft()
                a1.Replicator:Set("TimeLeft", TimeLeft)
            end)
            a3(function() -- Line: 98 -- upvalues: u33 (val), u42 (val)
                u33()
                u42:Destroy()
            end)
        end)
    end,
}