-- Script path: ReplicatedStorage.Shared.Modules.StoryModeSerialization
-- Decompile time: 1.02 ms

local copyDeep
local v1 = {}

function copyDeep(a1) -- Line: 5 -- upvalues: copyDeep (val)
    if typeof(a1) ~= "table" then
        return a1
    end
    local v1 = table.clone(a1)
    for i, j in a1 do
        v1[i] = (copyDeep(j))
    end
    return v1
end

local function serializeChapterKey(a1) -- Line: 18
    if typeof(a1) == "number" then
        return (tostring(a1))
    end
    return a1
end

local function deserializeChapterKey(a1) -- Line: 26
    if typeof(a1) ~= "string" then
        return a1
    end
    local v1 = tonumber(a1)
    if v1 ~= nil and v1 % 1 == 0 then
        return v1
    end
    return a1
end

local function transformChapterKeys(a1, a2, a3) -- Line: 39
    -- upvalues: copyDeep (val)
    local v1
    if typeof(a1) ~= "table" then
        return a1
    end
    local v2 = copyDeep(a1)
    local v3 = a1[a2]
    if typeof(v3) ~= "table" then
        return v2
    end
    local v4 = {}
    for i, j in v3 do
        v1 = a3(i)
        v4[v1] = (copyDeep(j))
    end
    v2[a2] = v4
    return v2
end

function v1.serialize(a1) -- Line: 63 -- upvalues: transformChapterKeys (val), serializeChapterKey (val)
    return (transformChapterKeys(a1, "Chapters", serializeChapterKey))
end

function v1.deserialize(a1) -- Line: 67 -- upvalues: transformChapterKeys (val), deserializeChapterKey (val)
    return (transformChapterKeys(a1, "Chapters", deserializeChapterKey))
end

function v1.serializePartyAvailability(a1) -- Line: 71
    -- upvalues: transformChapterKeys (val), serializeChapterKey (val)
    return (transformChapterKeys(a1, "chapters", serializeChapterKey))
end

function v1.deserializePartyAvailability(a1) -- Line: 75
    -- upvalues: transformChapterKeys (val), deserializeChapterKey (val)
    return (transformChapterKeys(a1, "chapters", deserializeChapterKey))
end

return v1