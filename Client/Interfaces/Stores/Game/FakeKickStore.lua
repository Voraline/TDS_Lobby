-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.FakeKickStore
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({enabled = false, text = ""})
return {
    getState = u12,
    setEnabled = function(a1, a2) -- Line: 21 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean, a2: string?
        local v1 = u12()
        local v2 = a2 or ""
        if v1.enabled == a1 and v1.text == v2 then
            return
        end
        u13({enabled = a1, text = v2})
    end,
}