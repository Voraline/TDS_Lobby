-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.KeybindStore
-- Decompile time: 1.87 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v2 = {}
local v3 = {}
v3[Enum_2.Hotkey.Ability] = {Enum.KeyCode.E}
v3[Enum_2.Hotkey.Upgrade] = {Enum.KeyCode.F}
v3[Enum_2.Hotkey.Sell] = {Enum.KeyCode.U}
for i, j in v3 do
    v1 = {
        pressed = false,
        name = Enum_2.Hotkey.ToString(i),
        callbacks = {},
        binds = j,
        type = i,
    }
    v2[i] = v1
end
local u47, u48 = Charm.signal(v2)
return {
    getState = u47,
    registerKeybind = function(a1, a2) -- Line: 42 -- upvalues: u47 (val), table (val), Enum_2 (val), u48 (val) -- types: a2: table
        local v1 = table.deepClone((u47()))
        v1[a1] = {
            pressed = false,
            name = Enum_2.Hotkey.ToString(a1),
            callbacks = {},
            binds = a2,
            type = a1,
        }
        u48(v1)
    end,
    registerCallback = function(a1, a2) -- Line: 57 -- upvalues: u47 (val), Enum_2 (val), table (val), u48 (val) -- types: a2: function
        local v1 = u47()
        assert(v1[a1], "Keybind " .. (Enum_2.Hotkey.ToString(a1)) .. " does not exist")
        local v2 = table.deepClone(v1)
        table.insert(v2[a1].callbacks, a2)
        u48(v2)
    end,
    unregisterCallback = function(a1, a2) -- Line: 67 -- upvalues: u47 (val), Enum_2 (val), table (val), u48 (val) -- types: a2: function
        local v1 = u47()
        assert(v1[a1], "Keybind " .. (Enum_2.Hotkey.ToString(a1)) .. " does not exist")
        local v2 = table.deepClone(v1)
        local callbacks = v2[a1].callbacks
        local v3 = table.find(callbacks, a2)
        if v3 then
            table.remove(callbacks, v3)
        end
        u48(v2)
    end,
    updateBinding = function(a1, a2) -- Line: 82 -- upvalues: u47 (val), Enum_2 (val), table (val), u48 (val) -- types: a2: table
        local v1 = u47()
        assert(v1[a1], "Keybind " .. (Enum_2.Hotkey.ToString(a1)) .. " does not exist")
        local v2 = table.deepClone(v1)
        v2[a1].binds = a2
        u48(v2)
    end,
    updateBindings = function(a1) -- Line: 92 -- upvalues: u47 (val), table (val), Enum_2 (val), u48 (val) -- types: a1: table
        local v1
        local v2 = table.deepClone((u47()))
        for k, v in pairs(a1) do
            v1 = v2[k]
            assert(v1, "Keybind " .. (Enum_2.Hotkey.ToString(k)) .. " does not exist")
            v1.binds = v
        end
        u48(v2)
    end,
}