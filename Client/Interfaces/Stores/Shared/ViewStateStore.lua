-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore
-- Decompile time: 1.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)

local function getBlurForView(a1) -- Line: 12 -- types: a1: string
    if a1 ~= "Hotbar"
        and a1 ~= "Crate"
        and a1 ~= "Music"
        and a1 ~= "ShopFocus"
        and a1 ~= "ShopModelFocus"
        and a1 ~= "Upgrades"
        and a1 ~= "Skills"
        and a1 ~= "TowerResearch"
        and a1 ~= "" then
        return 20
    end
    return 0
end

local u13, u14 = Charm.signal({blur = 0, currentView = "Hotbar", enabled = true, prompts = {}})

local function setStateKey(a1, a2) -- Line: 33 -- upvalues: u13 (val), u14 (val) -- types: a1: string
    local v1 = u13()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u14(v2)
end

return {
    getState = u13,
    getBlur = function() -- Line: 48 -- upvalues: u13 (val)
        return u13().blur
    end,
    getCurrentView = function() -- Line: 52 -- upvalues: u13 (val)
        return u13().currentView
    end,
    getEnabled = function() -- Line: 56 -- upvalues: u13 (val)
        return u13().enabled
    end,
    getPrompts = function() -- Line: 60 -- upvalues: u13 (val)
        return u13().prompts
    end,
    setBlur = function(a1) -- Line: 64 -- upvalues: u13 (val), u14 (val) -- types: a1: number
        local v1 = u13()
        if v1.blur == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.blur = a1
        u14(v2)
    end,
    setEnabled = function(a1) -- Line: 68 -- upvalues: u13 (val), u14 (val) -- types: a1: boolean
        local v1 = u13()
        if v1.enabled == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.enabled = a1
        u14(v2)
    end,
    setView = function(a1) -- Line: 72 -- upvalues: u13 (val), u14 (val) -- types: a1: string
        local v1 = u13()
        local v2 = if a1 == "Hotbar" then 0 else if a1 == "Crate" then 0 else if a1 == "Music" then 0 else if a1 == "ShopFocus" then 0 else if a1 == "ShopModelFocus" then 0 else if a1 == "Upgrades" then 0 else if a1 == "Skills" then 0 else if a1 == "TowerResearch" then 0 else if a1 ~= "" then 20 else 0
        if v1.currentView == a1 and v1.blur == v2 then
            return
        end
        local v3 = table.clone(v1)
        v3.blur = v2
        v3.currentView = a1
        u14(v3)
    end,
    addPrompt = function(a1, a2) -- Line: 86 -- upvalues: u13 (val), u14 (val) -- types: a2: number?
        local v1 = u13()
        local v2 = table.clone(v1.prompts)
        if not a2 then
            table.insert(v2, a1)
        else
            a2 = math.clamp(a2, 1, #v2 + 1)
            table.insert(v2, a2, a1)
        end
        local v3 = table.clone(v1)
        v3.prompts = v2
        u14(v3)
        return a2
    end,
    closePrompt = function(a1) -- Line: 104 -- upvalues: u13 (val), u14 (val) -- types: a1: number?
        local v1 = u13()
        local v2 = table.clone(v1.prompts)
        table.remove(v2, a1 or 1)
        local v3 = table.clone(v1)
        v3.prompts = v2
        u14(v3)
    end,
}