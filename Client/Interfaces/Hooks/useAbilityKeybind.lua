-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAbilityKeybind
-- Decompile time: 11.64 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Charm = require(ReplicatedStorage.Packages.Charm)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local TowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
local UserId = Players.LocalPlayer.UserId
local u42 = {}
local u43 = {}
local u44 = {}
local u45 = {}
local u46 = {}
local u47 = {}
local u49 = Signal.new()
local u51 = Signal.new()

local function getPriorityKey(a1) -- Line: 27 -- upvalues: u45 (val) -- types: a1: string
    return u45[a1]
end

local function updateKeybinds() -- Line: 62 -- upvalues: SettingsStore (val), u43 (val), u49 (val)
    local Game = SettingsStore.getState().Game or {}
    for i = 1, 6 do
        u43[i] = Game[("Ability %* Priority"):format(i)] or "Automatic"
    end
    u49:Fire()
end

local function incrementAbility(a1) -- Line: 73 -- upvalues: u42 (val), u44 (val) -- types: a1: string
    local v1 = u42[a1] or 0
    u42[a1] = v1 + 1
    if v1 > 0 then
        return false
    end
    if not table.find(u44, a1) then
        table.insert(u44, a1)
    end
    return true
end

local function decrementAbility(a1) -- Line: 88 -- upvalues: u42 (val), u44 (val) -- types: a1: string
    local v1 = u42[a1] or 0
    if v1 <= 0 then
        return false
    end
    local v2 = v1 - 1
    u42[a1] = if not (v2 > 0) then nil else v2
    if v2 > 0 then
        return false
    end
    local v3 = table.find(u44, a1)
    if v3 then
        table.remove(u44, v3)
    end
    return true
end

local function reconcileTowerAbilities(a1, a2) -- Line: 109
    -- upvalues: u46 (val), u42 (val), u44 (val), u49 (val)
    local Name, v1, v2, v3, v4, v5
    local v6 = u46[a1] or {}
    local v7 = {}
    local v8 = false
    local AvailableAbilities = a1.AvailableAbilities
    local v9 = nil
    local v10 = nil
    local v11, v12 = a1, a2
    for i, j in AvailableAbilities, v9, v10 do
        v7[j.Name] = true
        if not v6[j.Name] then
            Name = j.Name
            v3 = u42[Name] or 0
            u42[Name] = v3 + 1
            if not (v3 > 0) then
                if not table.find(u44, Name) then
                    table.insert(u44, Name)
                end
                v1 = true
            else
                v1 = false
            end
            v8 = v1 or v8
        end
    end
    v9 = nil
    v10 = nil
    for k in v6, v9, v10 do
        if not v7[k] then
            v2 = u42[k] or 0
            if not (v2 <= 0) then
                v3 = v2 - 1
                v5 = if not (v3 > 0) then nil else v3
                u42[k] = v5
                if not (v3 > 0) then
                    v4 = table.find(u44, k)
                    if v4 then
                        table.remove(u44, v4)
                    end
                    v1 = true
                else
                    v1 = false
                end
            else
                v1 = false
            end
            v8 = v1 or v8
        end
    end
    u46[v11] = v7
    if v8 and v12 then
        u49:Fire()
    end
end

local function addTower(a1) -- Line: 135 -- upvalues: UserId (val), u46 (val), reconcileTowerAbilities (val), u47 (val)
    if (a1.Replicator:Get("OwnerId")) ~= UserId then
        return
    end
    if u46[a1] then
        reconcileTowerAbilities(a1, true)
        return
    end
    u46[a1] = {}
    u47[a1] = (a1.OnAbilitiesUpdated:Connect(function() -- Line: 146 -- upvalues: reconcileTowerAbilities (upval), a1 (val)
        reconcileTowerAbilities(a1, true)
    end))
    reconcileTowerAbilities(a1, true)
end

TowerStore.TowerAdded:Connect(addTower)
TowerStore.TowerRemoved:Connect(function(a1) -- Line: 153 -- upvalues: UserId (val), u47 (val), u46 (val), u42 (val), u44 (val), u49 (val)
    local v1, v2, v3, v4, v5
    if (a1.Replicator:Get("OwnerId")) ~= UserId then
        return
    end
    local v6 = false
    local v7 = u47[a1]
    if v7 then
        v7:Disconnect()
        u47[a1] = nil
    end
    local v8 = u46[a1] or {}
    local v9 = nil
    local v10 = nil
    for i in v8, v9, v10 do
        v5 = u42[i] or 0
        if not (v5 <= 0) then
            v1 = v5 - 1
            v3 = if not (v1 > 0) then nil else v1
            u42[i] = v3
            if not (v1 > 0) then
                v2 = table.find(u44, i)
                if v2 then
                    table.remove(u44, v2)
                end
                v4 = true
            else
                v4 = false
            end
        else
            v4 = false
        end
        v6 = v4 or v6
    end
    u46[a1] = nil
    if v6 then
        u49:Fire()
    end
end)
Charm.listen(SettingsStore.getState, updateKeybinds)
u49:Connect(function() -- Line: 31 -- upvalues: u44 (val), u45 (val), u43 (val), u51 (val)
    local v1, v2
    local v3 = table.clone(u44)
    table.clear(u45)
    for i = 1, 6 do
        v1 = u43[i]
        if v1 ~= "Automatic" then
            v2 = table.find(v3, v1)
            if v2 then
                table.remove(v3, v2)
            end
        end
    end
    for j = 1, 6 do
        v1 = u43[j]
        if v1 == "Automatic" then
            v2 = table.remove(v3, 1)
            if v2 then
                v1 = v2
            end
        end
        if v1 ~= "Automatic" then
            u45[v1] = (("Ability %*"):format(j))
        end
    end
    u51:Fire()
end)
updateKeybinds()
for i, j in require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator).getTowers() do
    addTower(j)
end
return function(a1) -- Line: 187 -- upvalues: useState (val), useEffect (val), u45 (val), u51 (val) -- types: a1: string
    local v1, u3 = useState()
    local v2 = {a1}
    useEffect(function() -- Line: 190 -- upvalues: u3 (val), a1 (val), u45 (upval), u51 (upval)
        local u0 = false
        local u6 = u51:Connect(function() -- Line: 193 -- upvalues: u0 (ref), u3 (upval), a1 (upval), u45 (upval)
            if u0 then
                return
            end
            u0 = true
            task.defer(function() -- Line: 199 -- upvalues: u0 (upval)
                u0 = false
            end)
            u3(u45[a1])
        end)
        if not u0 then
            u0 = true
            task.defer(function() -- Line: 199 -- upvalues: u0 (ref)
                u0 = false
            end)
            u3(u45[a1])
        end
        return function() -- Line: 209 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, v2)
    return v1
end