-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.InventoryStore
-- Decompile time: 10.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)

local function shouldPopulate(a1, a2) -- Line: 36 -- upvalues: RunService (val)
    if not RunService:IsRunning() then
        return a1
    end
    if a2 == nil then
        return {}
    end
    return a2
end

local function shouldPopulateTowers(a1) -- Line: 44 -- upvalues: RunService (val) -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        table.insert(v1, {skin = "Default", type = "tower", name = j})
    end
    if RunService:IsRunning() then
        return {}
    end
    return v1
end

local function cloneArray(a1) -- Line: 58 -- types: a1: table?
    local v1 = {}
    for i, j in a1 or {} do
        v1[i] = j
    end
    return v1
end

local function cloneDictionary(a1) -- Line: 68 -- types: a1: table?
    local v1 = {}
    for i, j in a1 or {} do
        v1[i] = j
    end
    return v1
end

local function cloneEntries(a1) -- Line: 78 -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        v1[i] = (table.clone(j))
    end
    return v1
end

local function cloneInventory(a1) -- Line: 88 -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        v1[i] = (table.clone(j))
    end
    return v1
end

local u210, u211 = Charm.signal({
    equippedFlair = "",
    pvpMode = false,
    hotbar = if not RunService:IsRunning() then {"Ranger", "Mecha Base", "Military Base", "Pursuit", "Ace Pilot"} else {},
    pvphotbar = if not RunService:IsRunning() then {"Ranger", "Mecha Base", "Military Base", "Pursuit", "Ace Pilot"} else {},
    consumableHotbar = if not RunService:IsRunning() then {"Nuke"} else {},
    consumablePVPHotbar = if not RunService:IsRunning() then {"Nuke"} else {},
    tags = if not RunService:IsRunning() then {Default = {Equipped = true}} else {},
    flairs = if not RunService:IsRunning() then {} else {},
    consumables = if not RunService:IsRunning() then {Nuke = 9000000000} else {},
    totems = if not RunService:IsRunning() then {
        Default = {Equipped = true},
        ["Fallen King"] = {Equipped = false},
        ["Molten Boss"] = {Equipped = false},
    } else {},
    emotes = if not RunService:IsRunning() then {Dab = {Equipped = false}} else {},
    stickers = if not RunService:IsRunning() then {["Mind Blown"] = {Equpped = false, Sorting = 0}} else {},
    crates = if not RunService:IsRunning() then {Basic = 9000000000} else {},
    skins = if not RunService:IsRunning() then {
        Freezer = {"Default"},
        Minigunner = {"Default", "Golden"},
        Commander = {"Default"},
        Scout = {"Default", "Golden"},
        Farm = {"Default"},
        Turret = {"Default"},
        Sniper = {"Default"},
        Pursuit = {"Default"},
        ["Military Base"] = {"Default"},
        Ranger = {"Default"},
    } else {},
    inventory = shouldPopulateTowers({
        "Scout",
        "Freezer",
        "Minigunner",
        "Commander",
        "Mecha Base",
        "Farm",
        "Sniper",
        "Ace Pilot",
        "Pursuit",
        "Military Base",
        "Ranger",
    }),
})

local function setStateKey(a1, a2) -- Line: 174 -- upvalues: u210 (val), u211 (val) -- types: a1: string
    local v1 = u210()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u211(v2)
end

local function updateHotbar(a1, a2) -- Line: 185 -- upvalues: u210 (val), u211 (val) -- types: a1: string, a2: function
    local v1 = u210()
    local v2 = table.clone(v1)
    v2[a1] = (a2(v1[a1]))
    u211(v2)
end

return {
    getState = u210,
    getItems = function() -- Line: 196 -- upvalues: u210 (val)
        return u210().inventory
    end,
    getSkins = function() -- Line: 200 -- upvalues: u210 (val)
        return u210().skins
    end,
    getEmotes = function() -- Line: 204 -- upvalues: u210 (val)
        return u210().emotes
    end,
    getStickers = function() -- Line: 208 -- upvalues: u210 (val)
        return u210().stickers
    end,
    getCrates = function() -- Line: 212 -- upvalues: u210 (val)
        return u210().crates
    end,
    getHotbar = function() -- Line: 216 -- upvalues: u210 (val)
        return u210().hotbar
    end,
    getPvPHotbar = function() -- Line: 220 -- upvalues: u210 (val)
        return u210().pvphotbar
    end,
    getTotems = function() -- Line: 224 -- upvalues: u210 (val)
        return u210().totems
    end,
    getTags = function() -- Line: 228 -- upvalues: u210 (val)
        return u210().tags
    end,
    getFlairs = function() -- Line: 232 -- upvalues: u210 (val)
        return u210().flairs
    end,
    getEquippedFlair = function() -- Line: 236 -- upvalues: u210 (val)
        return u210().equippedFlair
    end,
    getConsumables = function() -- Line: 240 -- upvalues: u210 (val)
        return u210().consumables
    end,
    getConsumablesHotbar = function() -- Line: 244 -- upvalues: u210 (val)
        return u210().consumableHotbar
    end,
    getPvPConsumablesHotbar = function() -- Line: 248 -- upvalues: u210 (val)
        return u210().consumablePVPHotbar
    end,
    getPVPMode = function() -- Line: 252 -- upvalues: u210 (val)
        return u210().pvpMode
    end,
    setPVPMode = function(a1) -- Line: 256 -- upvalues: u210 (val), u211 (val) -- types: a1: boolean
        local v1 = u210()
        if v1.pvpMode == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.pvpMode = a1
        u211(v2)
    end,
    setHotbar = function(a1) -- Line: 260 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = {}
        for i, j in a1 or {} do
            v1[i] = j
        end
        local v2 = u210()
        if v2.hotbar == v1 then
            return
        end
        local v3 = table.clone(v2)
        v3.hotbar = v1
        u211(v3)
    end,
    setPvPHotbar = function(a1) -- Line: 264 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = {}
        for i, j in a1 or {} do
            v1[i] = j
        end
        local v2 = u210()
        if v2.pvphotbar == v1 then
            return
        end
        local v3 = table.clone(v2)
        v3.pvphotbar = v1
        u211(v3)
    end,
    addHotbar = function(a1, a2) -- Line: 268 -- upvalues: u210 (val), u211 (val) -- types: a1: string, a2: number?
        local function v1(a1_2) -- Line: 269 -- upvalues: a1 (val), a2 (val)
            local v1
            local v2 = {}
            for i, j in a1_2 or {} do
                v2[i] = j
            end
            if table.find(v2, a1) then
                return v2
            end
            for k = 1, a2 or 4 do
                v1 = v2[k]
                if v1 ~= nil and v1 ~= a1 then
                    continue
                end
                v2[k] = a1
                return v2
            end
            return v2
        end

        local v2 = u210()
        local v3 = table.clone(v2)
        v3.hotbar = v1(v2.hotbar)
        u211(v3)
    end,
    addPvPHotbar = function(a1, a2) -- Line: 287 -- upvalues: u210 (val), u211 (val) -- types: a1: string, a2: number?
        local function v1(a1_2) -- Line: 288 -- upvalues: a1 (val), a2 (val)
            local v1
            local v2 = {}
            for i, j in a1_2 or {} do
                v2[i] = j
            end
            if table.find(v2, a1) then
                return v2
            end
            for k = 1, a2 or 4 do
                v1 = v2[k]
                if v1 ~= nil and v1 ~= a1 then
                    continue
                end
                v2[k] = a1
                return v2
            end
            return v2
        end

        local v2 = u210()
        local v3 = table.clone(v2)
        v3.pvphotbar = v1(v2.pvphotbar)
        u211(v3)
    end,
    removeFromHotbar = function(a1) -- Line: 306 -- upvalues: u210 (val), u211 (val) -- types: a1: string
        local function v1(a1_2) -- Line: 307 -- upvalues: a1 (val)
            local v1 = {}
            for i, j in a1_2 or {} do
                v1[i] = j
            end
            local v2 = table.find(v1, a1)
            if v2 then
                table.remove(v1, v2)
            end
            return v1
        end

        local v2 = u210()
        local v3 = table.clone(v2)
        local v4 = {}
        for i, j in v2.hotbar or {} do
            v4[i] = j
        end
        local v5 = table.find(v4, a1)
        if v5 then
            table.remove(v4, v5)
        end
        v3.hotbar = v4
        u211(v3)
    end,
    removeFromPvPHotbar = function(a1) -- Line: 318 -- upvalues: u210 (val), u211 (val) -- types: a1: string
        local function v1(a1_2) -- Line: 319 -- upvalues: a1 (val)
            local v1 = {}
            for i, j in a1_2 or {} do
                v1[i] = j
            end
            local v2 = table.find(v1, a1)
            if v2 then
                table.remove(v1, v2)
            end
            return v1
        end

        local v2 = u210()
        local v3 = table.clone(v2)
        local v4 = {}
        for i, j in v2.pvphotbar or {} do
            v4[i] = j
        end
        local v5 = table.find(v4, a1)
        if v5 then
            table.remove(v4, v5)
        end
        v3.pvphotbar = v4
        u211(v3)
    end,
    setSkin = function(a1, a2) -- Line: 330 -- upvalues: u210 (val), cloneInventory (val), u211 (val) -- types: a1: string, a2: string
        local v1 = u210()
        local v2 = cloneInventory(v1.inventory)
        for i, j in v2 do
            if j.name == a1 and j.type == "tower" then
                j.skin = a2
            end
        end
        local v3 = table.clone(v1)
        v3.inventory = v2
        u211(v3)
    end,
    setConsumableCounts = function(a1) -- Line: 345 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = u210()
        local v2 = {}
        for i, j in v1.consumables or {} do
            v2[i] = j
        end
        for k, n in a1 do
            v2[k] = n
        end
        local v3 = table.clone(v1)
        v3.consumables = v2
        u211(v3)
    end,
    setEquippedConsumables = function(a1) -- Line: 358 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = {}
        for i, j in a1 or {} do
            v1[i] = j
        end
        local v2 = u210()
        if v2.consumableHotbar == v1 then
            return
        end
        local v3 = table.clone(v2)
        v3.consumableHotbar = v1
        u211(v3)
    end,
    setEquippedPVPConsumables = function(a1) -- Line: 362 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = {}
        for i, j in a1 or {} do
            v1[i] = j
        end
        local v2 = u210()
        if v2.consumablePVPHotbar == v1 then
            return
        end
        local v3 = table.clone(v2)
        v3.consumablePVPHotbar = v1
        u211(v3)
    end,
    setCrates = function(a1) -- Line: 366 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = {}
        for i, j in a1 or {} do
            v1[i] = j
        end
        local v2 = u210()
        if v2.crates == v1 then
            return
        end
        local v3 = table.clone(v2)
        v3.crates = v1
        u211(v3)
    end,
    setStickers = function(a1) -- Line: 370 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: table
        local v1 = u210()
        local v2 = cloneEntries(v1.stickers)
        for i in a1 do
            if not v2[i] then
                v2[i] = {Equipped = false, Sorting = 999}
            end
        end
        local v3 = table.clone(v1)
        v3.stickers = v2
        u211(v3)
    end,
    setEquippedStickers = function(a1) -- Line: 388 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: table
        local v1
        local v2 = u210()
        local v3 = cloneEntries(v2.stickers)
        for i, j in v3 do
            j.Equipped = false
            j.Sorting = 999
        end
        for k, n in a1 do
            v1 = v3[n]
            if v1 then
                v1.Equipped = true
                v1.Sorting = k
            end
        end
        local v4 = table.clone(v2)
        v4.stickers = v3
        u211(v4)
    end,
    setEmotes = function(a1) -- Line: 410 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: table
        local v1
        local v2 = u210()
        local v3 = cloneEntries(v2.emotes)
        for i, j in a1 do
            if v3[i] then
                v3[i].Equipped = j.Equipped
            else
                v1 = {Sorting = 999, Equipped = j.Equipped}
                v3[i] = v1
            end
        end
        local v4 = table.clone(v2)
        v4.emotes = v3
        u211(v4)
    end,
    setEquippedEmotes = function(a1) -- Line: 430 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: table
        local v1
        local v2 = u210()
        local v3 = cloneEntries(v2.emotes)
        for i, j in v3 do
            j.Equipped = false
            j.Sorting = 999
        end
        for k, n in a1 do
            v1 = v3[n]
            if v1 then
                v1.Equipped = true
                v1.Sorting = k
            end
        end
        local v4 = table.clone(v2)
        v4.emotes = v3
        u211(v4)
    end,
    setTags = function(a1) -- Line: 452 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: table
        local v1
        local v2 = u210()
        local v3 = cloneEntries(v2.tags)
        local v4 = "Default"
        for i, j in v3 do
            if j.Equipped then
                v4 = i
                break
            end
        end
        local v5 = nil
        local v6 = nil
        for k, n in a1, v5, v6 do
            v1 = {Equipped = v4 == n}
            v3[n] = v1
        end
        local v7 = table.clone(v2)
        v7.tags = v3
        u211(v7)
    end,
    setEquippedFlair = function(a1) -- Line: 475 -- upvalues: u210 (val), u211 (val) -- types: a1: string
        local v1 = u210()
        if v1.equippedFlair == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.equippedFlair = a1
        u211(v2)
    end,
    setFlairs = function(a1) -- Line: 479 -- upvalues: u210 (val), u211 (val) -- types: a1: table
        local v1 = {}
        for i, j in a1 or {} do
            v1[i] = j
        end
        local v2 = u210()
        if v2.flairs == v1 then
            return
        end
        local v3 = table.clone(v2)
        v3.flairs = v1
        u211(v3)
    end,
    setEquippedTag = function(a1) -- Line: 483 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: string
        local v1 = u210()
        local v2 = cloneEntries(v1.tags)
        for i, j in v2 do
            j.Equipped = false
        end
        local v3 = v2[a1] or {}
        v2[a1] = v3
        v2[a1].Equipped = true
        v3 = table.clone(v1)
        v3.tags = v2
        u211(v3)
    end,
    setTotems = function(a1) -- Line: 499 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: table
        local v1
        local v2 = u210()
        local v3 = cloneEntries(v2.totems)
        local v4 = "Default"
        for i, j in v3 do
            if j.Equipped then
                v4 = i
                break
            end
        end
        local v5 = nil
        local v6 = nil
        for k, n in a1, v5, v6 do
            v1 = {Equipped = v4 == n}
            v3[n] = v1
        end
        local v7 = table.clone(v2)
        v7.totems = v3
        u211(v7)
    end,
    setEquippedTotem = function(a1) -- Line: 522 -- upvalues: u210 (val), cloneEntries (val), u211 (val) -- types: a1: string
        local v1 = u210()
        local v2 = cloneEntries(v1.totems)
        for i, j in v2 do
            j.Equipped = false
        end
        local v3 = v2[a1] or {}
        v2[a1] = v3
        v2[a1].Equipped = true
        v3 = table.clone(v1)
        v3.totems = v2
        u211(v3)
    end,
    setSkins = function(a1) -- Line: 538 -- upvalues: u210 (val), u211 (val)
        local v1
        local v2 = {}
        local v3 = nil
        local v4 = nil
        for i, j in a1, v3, v4 do
            v1 = {}
            for k, n in j do
                table.insert(v1, n.Name)
            end
            v2[i] = v1
        end
        local v5 = u210()
        if v5.skins == v2 then
            return
        end
        v3 = table.clone(v5)
        v3.skins = v2
        u211(v3)
    end,
    setItems = function(a1) -- Line: 553 -- upvalues: u210 (val), cloneInventory (val), u211 (val) -- types: a1: table
        local v1, v2
        local v3 = u210()
        local v4 = cloneInventory(v3.inventory)
        local v5 = nil
        local v6 = nil
        for i, j in a1, v5, v6 do
            v1 = table.clone(j)
            v2 = false
            for k, n in v4 do
                if n.name == v1.name and n.type == v1.type then
                    v4[k] = v1
                    v2 = true
                    break
                end
            end
            if not v2 then
                table.insert(v4, v1)
            end
        end
        local v7 = table.clone(v3)
        v7.inventory = v4
        u211(v7)
    end,
    addItem = function(a1) -- Line: 579 -- upvalues: u210 (val), cloneInventory (val), u211 (val) -- types: a1: table
        local v1 = u210()
        local v2 = cloneInventory(v1.inventory)
        table.insert(v2, (table.clone(a1)))
        local v3 = table.clone(v1)
        v3.inventory = v2
        u211(v3)
    end,
}