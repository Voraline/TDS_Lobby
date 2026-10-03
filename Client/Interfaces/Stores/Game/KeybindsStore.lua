-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.KeybindsStore
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u19, u20 = Charm.signal({enabled = false, inputType = "Keyboard", keybinds = {}})
return {
    getState = u19,
    setInputType = function(a1) -- Line: 20 -- upvalues: u20 (val), table (val), u19 (val) -- types: a1: string?
        u20((table.merge(u19(), {inputType = a1 or "Keyboard"})))
    end,
    setEnabled = function(a1) -- Line: 26 -- upvalues: u20 (val), table (val), u19 (val) -- types: a1: boolean?
        u20((table.merge(u19(), {enabled = a1 or false})))
    end,
    setBinds = function(a1) -- Line: 32 -- upvalues: u20 (val), table (val), u19 (val)
        u20((table.merge(u19(), {keybinds = a1 or {}})))
    end,
}