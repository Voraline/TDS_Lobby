-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.CutsceneStore
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({enabled = false, skipEnabled = false, letterboxEnabled = false})
local v1 = {getState = u12}

local function setStateKey(a1, a2) -- Line: 20 -- upvalues: u12 (val), u13 (val) -- types: a1: string
    local v1 = u12()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u13(v2)
end

function v1.setEnabled(a1) -- Line: 31 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
    local v1 = u12()
    if v1.enabled == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.enabled = a1
    u13(v2)
end

function v1.setSkipEnabled(a1) -- Line: 35 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
    local v1 = u12()
    if v1.skipEnabled == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.skipEnabled = a1
    u13(v2)
end

function v1.setLetterboxEnabled(a1) -- Line: 39 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
    local v1 = u12()
    if v1.letterboxEnabled == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.letterboxEnabled = a1
    u13(v2)
end

function v1.setAspectRatio(a1) -- Line: 43 -- upvalues: u12 (val), u13 (val) -- types: a1: number?
    local v1 = u12()
    if v1.aspectRatio == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.aspectRatio = a1
    u13(v2)
end

return v1