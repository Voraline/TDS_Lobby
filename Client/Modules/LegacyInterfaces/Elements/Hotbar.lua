-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Hotbar
-- Decompile time: 2.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local LegacyInterface = (ReplicatedStorage:WaitForChild("Client")).Interfaces.LegacyInterface
local ItemController = require(LegacyInterface.Controllers.ItemController)
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local v1 = Signal.new()
local u44 = Signal.new()
local u45 = {Clicked = v1, Finished = u44}
task.spawn(function() -- Line: 25
    -- upvalues: Cache (val), u44 (val), ItemController (val), math (val), Comma (val), u45 (val), GameType (val)
    -- upvalues: ReplicatedStorage (val)
    local u2 = Cache("Equipped.Troops")
    local u5 = Cache("Inventory.Troops")
    local u6 = {}
    local u7 = nil

    function u6.Start(a1, a2) -- Line: 37 -- upvalues: u7 (ref)
        a1:Stop()
        u7 = a2
        if u7 then
            u7.ImageTransparency = 0
        end
    end

    function u6.Stop(a1) -- Line: 47 -- upvalues: u7 (ref)
        if u7 then
            u7.ImageTransparency = 0
            u7 = nil
        end
    end

    u44:Connect(function() -- Line: 55 -- upvalues: u6 (val)
        u6:Stop()
    end)
    ItemController:init()

    local function formatNumber(a1, a2) -- Line: 61 -- upvalues: math (upval), Comma (upval) -- types: a1: number
        if (math.abs(a1)) == math.huge then
            if math.sign(a1) == 1 then
                return " ∞"
            end
            return " -∞"
        end
        if a1 ~= a1 then
            return "???"
        end
        if a2 then
            a1 = a2(a1)
        end
        return Comma(a1)
    end

    local u20 = {}

    function u45.Update() -- Line: 77 -- upvalues: u2 (val), u5 (val), u20 (val), u45 (upval)
        local v1 = ((u2:Get()):andThen(function(a1) -- Line: 79 -- upvalues: u5 (upval)
            return (u5:Get()):andThen(function(a1_2) -- Line: 80 -- upvalues: a1 (val)
                return {Equipped = a1, Inventory = a1_2}
            end)
        end)):andThen(function(a1) -- Line: 89 -- upvalues: u20 (upval) -- types: a1: table
            local v1, v2, v3
            local v4 = a1
            for k, v in pairs(u20) do
                v2 = v4.Equipped[k]
                if v2 then
                    v3 = v4.Inventory[v2] or {Skin = "Default"}
                    if v3 then
                        v1 = {Troop = v2, Skin = v3.Skin, GoldenPerks = v3.GoldenPerks}
                        v:Fire(v1)
                    end
                else
                    v:Fire(nil)
                end
            end
        end)
        v1:finally(function() -- Line: 111 -- upvalues: u45 (upval)
            u45.equipTroopsUpdate = nil
        end)
        u45.equipTroopsUpdate = v1
        return v1
    end

    u2.Updated:Connect(u45.Update)
    u5.Updated:Connect(u45.Update)
    for k, v in pairs(GameType:IsA("Game") and {"Cash", "Troops"} or {"Triumphs", "Wins", "Loses"}) do
        task.spawn(function() -- Line: 126 -- upvalues: ReplicatedStorage (upval), v (val), formatNumber (val)
            local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
            if v == "Cash" then
                (PlayerReplicator.GetLocalPlayer()):andThen(function(a1) -- Line: 131 -- upvalues: formatNumber (upval)
                    (a1.Replicator:GetStateChangedSignal("Cash")):Connect(function(a1) -- Line: 132 -- upvalues: formatNumber (upval)
                        local v1 = formatNumber(a1, function(a1) -- Line: 133
                            return string.format("%.f", a1)
                        end)
                    end)
                end)
            end
        end)
    end
    u45.Update()
end)
return u45