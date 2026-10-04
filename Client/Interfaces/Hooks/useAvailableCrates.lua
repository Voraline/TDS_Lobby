-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAvailableCrates
-- Decompile time: 3.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local SharedData = ReplicatedStorage.Shared.Data.SharedData
local ConsumableCrateWeights = require(SharedData.ConsumableCrateWeights)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerCrateWeights = require(SharedData.TowerCrateWeights)
local useCache = require(Hooks.useCache)
local useCrates = require(Hooks.useCrates)
local usePlayerReplicator = require(Hooks.usePlayerReplicator)
local useEffect = React.useEffect
local useMemo = React.useMemo
local useState = React.useState
return function(a1, a2, a3) -- Line: 57
    -- upvalues: useCrates (val), useCache (val), usePlayerReplicator (val), useState (val), useEffect (val)
    -- upvalues: useMemo (val), ConsumableCrateWeights (val), TowerCrateWeights (val)
    local u5 = useCrates(a3)
    local u10 = useCache("Inventory.Crates", {}, a3)
    local u12 = usePlayerReplicator()
    local u15, u16 = useState(0)
    local v1 = {u12}
    useEffect(function() -- Line: 68 -- upvalues: u12 (val), u16 (val)
        if not u12 then
            u16(0)
            return
        end
        u16(u12:Get("Luck") or 0)
        local u20 = (u12:GetStateChangedSignal("Luck")):Connect(function(a1) -- Line: 76 -- upvalues: u16 (upval)
            u16(a1 or 0)
        end)
        return function() -- Line: 80 -- upvalues: u20 (val)
            u20:Disconnect()
        end
    end, v1)
    return (useMemo(function() -- Line: 85
        -- upvalues: a1 (val), a2 (val), u5 (val), u10 (val), ConsumableCrateWeights (upval), u15 (val)
        -- upvalues: TowerCrateWeights (upval)
        if a1 and a2 then
            local Consumables, result, result_2, success, success_2, v1, v2, v3, v4, v5
            local v6 = {}
            local v7 = nil
            local v8 = nil
            for i, j in u5, v7, v8 do
                v2 = u10[i] or 0
                v3 = if not j.Consumables then "skins" else "consumables"
                v4 = nil
                v5 = nil
                Consumables = nil
                if not (v2 <= 0) then
                    if v3 == "consumables" then
                        Consumables = j.Consumables
                        success, result = pcall(ConsumableCrateWeights, i, u15)
                        v4 = success
                        v5 = result
                    elseif v3 == "skins" then
                        Consumables = j.Contents
                        success_2, result_2 = pcall(TowerCrateWeights, i, a1, a2, u15)
                        v4 = success_2
                        v5 = result_2
                    end
                    v1 = {
                        Type = v3,
                        DisplayName = j.DisplayName,
                        Icon = j.Icon,
                        Preview = j.Preview,
                        Contents = Consumables,
                        Description = j.Description,
                        Owned = v2,
                        Category = j.Category,
                        Weights = if not v4 then nil else v5,
                    }
                    v6[i] = v1
                end
            end
            return v6
        end
        return {}
    end, {u5, u15, u10, a1, a2}))
end