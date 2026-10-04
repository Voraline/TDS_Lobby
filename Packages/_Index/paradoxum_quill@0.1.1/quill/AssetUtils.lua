-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.AssetUtils
-- Decompile time: 1.61 ms

require(script.Parent.Types)
local u5 = {}

local function isTable(a1) -- Line: 13
    return typeof(a1) == "table"
end

function u5.isGraphDialog(a1) -- Line: 17
    return typeof(a1) == "table" and typeof(a1.nodes) == "table" and typeof(a1.strings) == "table" and typeof(a1.actions) == "table" and typeof(a1.predicates) == "table"
end

function u5.getGraphRootId(a1) -- Line: 25
    local v1 = nil
    local v2 = nil
    for i, j in a1.nodes, v1, v2 do
        if typeof(j) == "table" and j.t == "root" then
            return i
        end
    end
    return nil
end

function u5.hasContent(a1) -- Line: 34 -- upvalues: u5 (val)
    if not u5.isGraphDialog(a1) then
        return typeof(a1) == "table" and typeof(a1.dialogBlockChain) == "table" and next(a1.dialogBlockChain) ~= nil
    end
    local v1 = u5.getGraphRootId(a1)
    if v1 ~= nil then
        local v2 = a1.nodes[v1]
        if typeof(v2) == "table" and v2.out and next(v2.out) ~= nil then
            return true
        end
    end
    local v3 = nil
    local v4 = nil
    for i, j in a1.nodes, v3, v4 do
        if typeof(j) == "table" and j.t ~= "root" then
            return true
        end
    end
    return false
end

function u5.getNodeTextValues(a1, a2) -- Line: 56
    local v1 = {}
    if not (typeof(a2) == "table") then
        return v1
    end
    local texts = a2.texts
    if not (typeof(texts) == "table") and a2.text ~= nil then
        texts = {a2.text}
    end
    for i, j in texts or {} do
        table.insert(v1, a1.strings[j] or "")
    end
    return v1
end

function u5.getGraphNextNodeId(a1, a2) -- Line: 74 -- types: a2: number
    local v1 = a1.nodes[a2]
    if not (typeof(v1) == "table") then
        return nil
    end
    if v1.t ~= "predicate" then
        return typeof(v1.out) == "table" and v1.out[1] or nil
    end
    return v1.yes or v1.no or typeof(v1.out) == "table" and v1.out[1] or nil
end

return u5