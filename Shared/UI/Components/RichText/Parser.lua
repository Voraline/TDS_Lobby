-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Parser
-- Decompile time: 3.44 ms

local deepCompare

local function merge(a1, ...) -- Line: 1
    local v1
    local v2 = {...}
    for i = 1, (select("#", ...)) do
        v1 = v2[i]
        if v1 then
            if type(v1) ~= "table" then
                error("Attempt to merge non table")
            end
            for k, v in pairs(v1) do
                a1[k] = v
            end
        end
    end
    return a1
end

local u1 = {}

function u1.parseArgs(a1) -- Line: 23
    local u1 = {}
    string.gsub(a1, "(%w+)=([\"'])(.-)%2", function(a1, a2, a3) -- Line: 27 -- upvalues: u1 (val)
        u1[a1] = a3
    end)
    return u1
end

function u1.parseXml(a1) -- Line: 35 -- upvalues: u1 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = {}
    local v12 = {v11}
    local v13 = 1
    local v14 = a1
    while true do
        v1, v2, v3, v4, v5, v6 = string.find(v14, "<(/?)([%w:]+)(.-)(/?)>", v13)
        v7 = v1
        v10 = v2
        v8 = v4
        v9 = v5
        if not v7 then
            break
        end
        v1 = string.sub(v14, v13, v7 - 1)
        if not string.find(v1, "^%s*$") then
            table.insert(v11, v1)
        end
        if v6 == "/" then
            table.insert(v11, {empty = 1, label = v8, xarg = u1.parseArgs(v9)})
        elseif v3 ~= "" then
            v2 = table.remove(v12)
            v11 = v12[#v12]
            if #v12 < 1 then
                return error("nothing to close with " .. v8)
            end
            if v2.label ~= v8 then
                return error("trying to close " .. v2.label .. " with " .. v8)
            end
            table.insert(v11, v2)
        else
            table.insert(v12, {label = v8, xarg = u1.parseArgs(v9)})
        end
        v13 = v10 + 1
    end
    v1 = string.sub(v14, v13)
    if not string.find(v1, "^%s*$") then
        table.insert(v12[#v12], v1)
    end
    if #v12 > 1 then
        error("unclosed " .. v12[#v12].label)
    end
    return v12[1]
end

function u1.parseTags(a1) -- Line: 89 -- upvalues: u1 (val), merge (val)
    local readTagRecursive
    local v1 = {}
    local v2 = u1.parseXml(a1)

    function readTagRecursive(a1, a2, a3) -- Line: 93 -- upvalues: merge (upval), readTagRecursive (val)
        local v1
        local v2 = merge({}, a3 or {})
        local v3 = a2 or {}
        if not a1.label then
            return v3
        end
        local v4 = v2[a1.label] or {}
        v2[a1.label] = (merge({}, v4, a1.xarg))
        for i, v in ipairs(a1) do
            if type(v) ~= "table" then
                v1 = #v
                for i2 = 1, v1 do
                    table.insert(v3, {char = v:sub(i2, i2), effects = merge({}, v2)})
                end
            else
                readTagRecursive(v, v3, v2)
            end
        end
        return v3
    end

    for i, v in ipairs(v2) do
        if type(v) ~= "table" then
            table.insert(v1, {word = v, effects = {}})
        else
            for i2, i3 in ipairs((readTagRecursive(v))) do
                table.insert(v1, i3)
            end
        end
    end
    return v1
end

function deepCompare(a1, a2) -- Line: 136 -- upvalues: deepCompare (val)
    if type(a1) == "table" and type(a2) == "table" then
        for k, v in pairs(a1) do
            if not deepCompare(v, a2[k]) then
                return false
            end
        end
        for k2, i in pairs(a2) do
            if not deepCompare(i, a1[k2]) then
                return false
            end
        end
        return true
    end
    return a1 == a2
end

function u1.parseEffects(a1) -- Line: 157 -- upvalues: u1 (val), deepCompare (val)
    local v1 = u1.parseTags(a1)
    local u45 = {}
    local effects = {}
    local u7 = {}

    local function pushEffect() -- Line: 164 -- upvalues: u7 (ref), u45 (val), effects (ref)
        if #u7 > 0 then
            table.insert(u45, {word = table.concat(u7), effects = effects})
            table.clear(u7)
        end
    end

    for i, v in ipairs(v1) do
        if not deepCompare(v.effects, effects) then
            pushEffect()
            u7 = {}
            effects = v.effects
        end
        table.insert(u7, v.word or v.char)
    end
    pushEffect()
    return u45
end

return u1