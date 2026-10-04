-- Script path: ReplicatedStorage.Shared.Modules.StatusEffects.StatusEffectRegistry
-- Decompile time: 1.62 ms

require(script.Parent.Parent.Parent.Types.StatusEffects)
local u8 = {}
local u9 = {}
local u10 = {}
local u11 = {}

local function indexTags(a1) -- Line: 30 -- upvalues: u10 (val), u11 (val)
    local v1, v2, v3
    if a1.tags then
        v1 = nil
        v2 = nil
        for i, j in a1.tags, v1, v2 do
            if not u10[j] then
                u10[j] = {}
            end
            v3 = u10[j]
            v3[a1.name] = true
        end
    end
    if a1.immuneTo then
        v1 = nil
        v2 = nil
        for k, n in a1.immuneTo, v1, v2 do
            if not u11[n] then
                u11[n] = {}
            end
            v3 = u11[n]
            v3[a1.name] = true
        end
    end
end

function u8.register(a1) -- Line: 49 -- upvalues: u9 (val), indexTags (val)
    assert(a1.name, "StatusEffectDefinition must have a name")
    assert(not u9[a1.name], (("StatusEffect \"%*\" is already registered"):format(a1.name)))
    u9[a1.name] = (table.freeze(a1))
    indexTags(a1)
end

function u8.registerAll(a1) -- Line: 59 -- upvalues: u9 (val), u8 (val) -- types: a1: table
    for i, j in a1 do
        if not u9[j.name] then
            u8.register(j)
        end
    end
end

function u8.get(a1) -- Line: 67 -- upvalues: u9 (val) -- types: a1: string
    return u9[a1]
end

function u8.getAll() -- Line: 71 -- upvalues: u9 (val)
    return u9
end

function u8.has(a1) -- Line: 75 -- upvalues: u9 (val) -- types: a1: string
    return u9[a1] ~= nil
end

function u8.hasTag(a1, a2) -- Line: 82 -- upvalues: u9 (val) -- types: a1: string, a2: string
    local v1 = u9[a1]
    if v1 and v1.tags then
        for i, j in v1.tags do
            if j == a2 then
                return true
            end
        end
        return false
    end
    return false
end

function u8.getByTag(a1) -- Line: 98 -- upvalues: u10 (val) -- types: a1: string
    local v1 = u10[a1]
    if not v1 then
        return {}
    end
    local v2 = {}
    for i in v1 do
        table.insert(v2, i)
    end
    return v2
end

function u8.getImmunityEffects(a1) -- Line: 115 -- upvalues: u11 (val) -- types: a1: string
    local v1 = u11[a1]
    if not v1 then
        return {}
    end
    local v2 = {}
    for i in v1 do
        table.insert(v2, i)
    end
    return v2
end

return u8