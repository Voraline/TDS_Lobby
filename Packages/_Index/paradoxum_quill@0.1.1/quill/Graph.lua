-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Graph
-- Decompile time: 10.06 ms

local deepClone
require(script.Parent.Types)
local u5 = {}
local u6 = {
    root = 1,
    prompt = 2,
    response = 3,
    command = 4,
    predicate = 5,
}

local function shallowCloneArray(a1) -- Line: 22 -- types: a1: table?
    local v1 = {}
    if not a1 then
        return v1
    end
    for i, j in a1 do
        v1[i] = j
    end
    return v1
end

function deepClone(a1) -- Line: 33 -- upvalues: deepClone (val)
    if typeof(a1) ~= "table" then
        return a1
    end
    local v1 = {}
    for i, j in a1 do
        v1[i] = (deepClone(j))
    end
    return v1
end

local function serializeString(a1) -- Line: 45 -- types: a1: string
    return (("\"%*\""):format((((((a1:gsub("\\", "\\\\")):gsub("\n", "\\n")):gsub("\r", "\\r")):gsub("\t", "\\t")):gsub("\"", "\\\""))))
end

local function appendLine(a1, a2, a3) -- Line: 50 -- types: a1: table, a2: number, a3: string
    table.insert(a1, (string.rep("\t", a2)) .. a3)
end

local function getSortedNodeIds(a1) -- Line: 54 -- types: a1: table
    local v1 = {}
    for i in a1 do
        table.insert(v1, i)
    end
    table.sort(v1)
    return v1
end

local function getOutgoingNodes(a1) -- Line: 63
    local out = a1.out
    local v1 = {}
    if out then
        for i, j in out do
            v1[i] = j
        end
    end
    if a1.t == "predicate" then
        if a1.yes then
            table.insert(v1, a1.yes)
        end
        if a1.no then
            table.insert(v1, a1.no)
        end
    end
    return v1
end

function u5.new() -- Line: 76
    return {strings = {}, actions = {}, predicates = {}, nodes = {{t = "root", x = 0, y = 0, out = {}}}}
end

function u5.clone(a1) -- Line: 88 -- upvalues: deepClone (val)
    return (deepClone(a1))
end

function u5.getRootId(a1) -- Line: 92
    for i, j in a1.nodes do
        if j.t == "root" then
            return i
        end
    end
    return nil
end

function u5.getNextNodeId(a1) -- Line: 101
    local v1 = 1
    for i in a1.nodes do
        if v1 <= i then
            v1 = i + 1
        end
    end
    return v1
end

function u5.getNodeLabel(a1, a2) -- Line: 111 -- types: a2: number
    local v1 = a1.nodes[a2]
    if not v1 then
        return (("Missing #%*"):format(a2))
    end
    if v1.t ~= "prompt" and v1.t ~= "response" then
        if v1.t == "command" then
            local action = v1.action and a1.actions[v1.action]
            if action and action ~= "" then
                return action
            end
            return (string.upper(v1.t:sub(1, 1))) .. v1.t:sub(2)
        end
        if v1.t == "predicate" then
            local predicate = v1.predicate and a1.predicates[v1.predicate]
            if predicate and predicate ~= "" then
                return predicate
            end
        end
        return (string.upper(v1.t:sub(1, 1))) .. v1.t:sub(2)
    end
    local texts = v1.texts and a1.strings[v1.texts[1]]
    if texts and texts ~= "" then
        return texts
    end
    return (string.upper(v1.t:sub(1, 1))) .. v1.t:sub(2)
end

function u5.getNodeTexts(a1, a2) -- Line: 137
    local v1 = {}
    if a2.texts then
        local v2
        for i, j in a2.texts do
            v2 = a1.strings[j]
            if v2 then
                table.insert(v1, v2)
            end
        end
    end
    return v1
end

function u5.getOutgoing(a1, a2) -- Line: 150
    local v1 = {}
    if a2.out then
        local v2
        for i, j in a2.out do
            v2 = a1.nodes[j]
            if v2 then
                table.insert(v1, v2)
            end
        end
    end
    return v1
end

function u5.validate(a1) -- Line: 163 -- upvalues: u6 (val)
    local out_2, v1, v2, v3, v4
    local v5 = {}
    local v6 = {}
    local v7 = {}
    local v8 = nil
    local v9 = nil
    for i, j in a1.nodes, v8, v9 do
        if j.t == "root" then
            table.insert(v7, i)
        end
        if j.t == "prompt" then
            if j.texts then
                for k, n in j.texts do
                    if not v1.strings[n] then
                        table.insert(v5, {
                            code = "missing_text",
                            message = ("Node %* references missing text index %*."):format(i, n),
                            nodeId = i,
                        })
                    end
                end
            end
        elseif j.t ~= "response" then
            if j.t ~= "command" then
                if j.t ~= "predicate" then
                    if u6[j.t] == nil then
                        v2 = {code = "unknown_node_type"}
                        v3 = tostring(j.t)
                        v2.message = ("Node %* has unsupported type %*."):format(i, v3)
                        v2.nodeId = i
                        table.insert(v5, v2)
                    end
                elseif j.predicate and not v1.predicates[j.predicate] then
                    table.insert(v5, {
                        code = "missing_predicate",
                        message = ("Node %* references missing predicate index %*."):format(i, j.predicate),
                        nodeId = i,
                    })
                end
            elseif j.action and not v1.actions[j.action] then
                table.insert(v5, {
                    code = "missing_action",
                    message = ("Node %* references missing action index %*."):format(i, j.action),
                    nodeId = i,
                })
            end
        elseif j.texts then
            for m, i5 in j.texts do
                if not v1.strings[i5] then
                    table.insert(v5, {
                        code = "missing_text",
                        message = ("Node %* references missing text index %*."):format(i, i5),
                        nodeId = i,
                    })
                end
            end
        end
        out_2 = j.out
        v4 = {}
        if out_2 then
            for i6, i7 in out_2 do
                v4[i6] = i7
            end
        end
        if j.t == "predicate" then
            if j.yes then
                table.insert(v4, j.yes)
            end
            if j.no then
                table.insert(v4, j.no)
            end
        end
        for i8, i9 in v4 do
            if v1.nodes[i9] == nil then
                table.insert(v5, {
                    code = "missing_target",
                    message = ("Node %* points to missing node %*."):format(i, i9),
                    nodeId = i,
                })
            end
        end
        if j.t == "root" and j.out and #j.out == 0 then
            table.insert(v6, {
                code = "empty_root",
                message = ("Root node %* has no outgoing edge."):format(i),
                nodeId = i,
            })
        end
    end
    table.sort(v7)
    if #v7 == 0 then
        table.insert(v5, {code = "missing_root", message = "Graph must include exactly one root node."})
    elseif #v7 > 1 then
        table.insert(v5, {code = "multiple_roots", message = "Graph contains multiple root nodes."})
    end
    local v10 = v7[1]
    if v10 then
        local out, v11, v12
        v8 = {}
        v9 = {v10}
        v8[v10] = true
        local v13 = 1
        while v13 <= #v9 do
            v12 = v9[v13]
            v13 = v13 + 1
            v4 = v1.nodes[v12]
            if v4 then
                out = v4.out
                v11 = {}
                if out then
                    for i10, i11 in out do
                        v11[i10] = i11
                    end
                end
                if v4.t == "predicate" then
                    if v4.yes then
                        table.insert(v11, v4.yes)
                    end
                    if v4.no then
                        table.insert(v11, v4.no)
                    end
                end
                for i12, i13 in v11 do
                    if v1.nodes[i13] and not v8[i13] then
                        v8[i13] = true
                        table.insert(v9, i13)
                    end
                end
            end
        end
        for i14 in v1.nodes do
            if not v8[i14] then
                table.insert(v6, {
                    code = "unreachable_node",
                    message = ("Node %* is unreachable from the root."):format(i14),
                    nodeId = i14,
                })
            end
        end
    end
    table.sort(v5, function(a1, a2) -- Line: 274
        return (a1.nodeId or 0) < (a2.nodeId or 0)
    end)
    table.sort(v6, function(a1, a2) -- Line: 277
        return (a1.nodeId or 0) < (a2.nodeId or 0)
    end)
    return {errors = v5, warnings = v6, rootId = v10}
end

function u5.compile(a1) -- Line: 288 -- upvalues: u5 (val)
    local v1 = u5.clone(a1)
    table.freeze(v1.strings)
    table.freeze(v1.actions)
    table.freeze(v1.predicates)
    for i, j in v1.nodes do
        table.freeze(j)
    end
    table.freeze(v1.nodes)
    table.freeze(v1)
    return v1
end

function u5.toModuleSource(a1) -- Line: 301 -- upvalues: serializeString (val)
    local out, v1, v2, v3, v4
    local v5 = {"return {"}
    table.insert(v5, (string.rep("\t", 1)) .. "strings = {")
    for i, j in a1.strings do
        v3 = (serializeString(j)) .. ","
        table.insert(v5, (string.rep("\t", 2)) .. v3)
    end
    table.insert(v5, (string.rep("\t", 1)) .. "},")
    table.insert(v5, (string.rep("\t", 1)) .. "actions = {")
    for k, n in a1.actions do
        v3 = (serializeString(n)) .. ","
        table.insert(v5, (string.rep("\t", 2)) .. v3)
    end
    table.insert(v5, (string.rep("\t", 1)) .. "},")
    table.insert(v5, (string.rep("\t", 1)) .. "predicates = {")
    for m, i5 in a1.predicates do
        v3 = (serializeString(i5)) .. ","
        table.insert(v5, (string.rep("\t", 2)) .. v3)
    end
    table.insert(v5, (string.rep("\t", 1)) .. "},")
    table.insert(v5, (string.rep("\t", 1)) .. "nodes = {")
    local v6 = {}
    v3 = nil
    local v7 = nil
    for i6 in a1.nodes, v3, v7 do
        table.insert(v6, i6)
    end
    table.sort(v6)
    local v8 = nil
    local v9 = nil
    for i7, i8 in v6, v8, v9 do
        v3 = a1.nodes[i8]
        v7 = {(("t = %*"):format((serializeString(v3.t))))}
        if v3.t == "prompt" then
            if v3.texts then
                v4 = {}
                for i9, i10 in v3.texts do
                    table.insert(v4, (tostring(i10)))
                end
                table.insert(v7, "texts = { " .. (table.concat(v4, ", ")) .. " }")
            end
        elseif v3.t ~= "response" then
            if v3.t ~= "command" then
                if v3.t == "predicate" then
                    if v3.predicate then
                        table.insert(v7, (("predicate = %*"):format(v3.predicate)))
                    end
                    if v3.yes then
                        table.insert(v7, (("yes = %*"):format(v3.yes)))
                    end
                    if v3.no then
                        table.insert(v7, (("no = %*"):format(v3.no)))
                    end
                end
            elseif v3.action then
                table.insert(v7, (("action = %*"):format(v3.action)))
            end
        elseif v3.texts then
            v4 = {}
            for i11, i12 in v3.texts do
                table.insert(v4, (tostring(i12)))
            end
            table.insert(v7, "texts = { " .. (table.concat(v4, ", ")) .. " }")
        end
        if v3.t == "prompt" and v3.skip ~= nil then
            table.insert(v7, (("skip = %*"):format((tostring(v3.skip)))))
        end
        if v3.x ~= nil then
            table.insert(v7, (("x = %*"):format(v3.x)))
        end
        if v3.y ~= nil then
            table.insert(v7, (("y = %*"):format(v3.y)))
        end
        out = v3.out
        v4 = {}
        if out then
            for i13, i14 in out do
                v4[i13] = i14
            end
        end
        v1 = {}
        for i15, i16 in v4 do
            table.insert(v1, (tostring(i16)))
        end
        table.insert(v7, "out = { " .. (table.concat(v1, ", ")) .. " }")
        v2 = "[" .. (tostring(i8)) .. "] = { " .. (table.concat(v7, ", ")) .. " },"
        table.insert(v5, (string.rep("\t", 2)) .. v2)
    end
    table.insert(v5, (string.rep("\t", 1)) .. "},")
    table.insert(v5, "}")
    return table.concat(v5, "\n")
end

return u5