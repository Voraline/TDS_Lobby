-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Validation
-- Decompile time: 3.32 ms

local Definitions = require(script.Parent.Definitions)
local LegacyParameters = require(script.Parent.LegacyParameters)
local u10 = {}

function u10.finite(a1) -- Line: 8
    local v1 = false
    if type(a1) == "number" then
        v1 = false
        if a1 == a1 then
            v1 = (math.abs(a1)) < (1 / 0)
        end
    end
    return v1
end

local function boundedString(a1, a2, a3) -- Line: 12 -- types: a2: number, a3: boolean?
    local v1 = false
    if type(a1) == "string" then
        v1 = false
        if #a1 <= a2 then
            v1 = true
            if a3 ~= true then
                v1 = string.find(a1, "%S") ~= nil
            end
        end
    end
    return v1
end

local function exactKeys(a1, a2) -- Line: 18 -- types: a2: table
    for i in a1 do
        if type(i) == "string" and a2[i] then
            continue
        end
        return false
    end
    return true
end

function u10.parameters(a1, a2) -- Line: 27
    -- upvalues: Definitions (val), u10 (val), LegacyParameters (val)
    local default, find, options, v1, v2, v3
    local v4 = Definitions.ById[a1]
    if not v4 then
        return nil, "This action is not supported by this server."
    end
    if type(a2) ~= "table" then
        return nil, "Action settings must be a table."
    end
    local v5 = {}
    local v6 = {}
    local fields = v4.fields
    local v7 = nil
    local v8 = nil
    local v9, v10 = a1, a2
    for i, j in fields, v7, v8 do
        v5[j.key] = true
        default = v10[j.key]
        if default == nil then
            default = j.default
        end
        if j.kind == "number" then
            if u10.finite(default) and not (default < (j.min or (-1 / 0))) and not ((j.max or (1 / 0)) < default) then
                if j.integer and default % 1 ~= 0 then
                    return nil, j.label .. " is outside its permitted range."
                end
                v6[j.key] = default
                continue
            end
            return nil, j.label .. " is outside its permitted range."
        end
        if j.kind == "select" then
            if type(default) == "string" then
                find = table.find
                options = j.options or {}
                if find(options, default) then
                    v6[j.key] = default
                    continue
                end
            end
            return nil, "Choose a supported " .. (string.lower(j.label)) .. "."
        end
        if j.kind ~= "text" and j.kind ~= "content" then
            if type(default) ~= "boolean" then
                return nil, j.label .. " must be on or off."
            end
            v6[j.key] = default
            continue
        end
        v2 = j.max or 180
        v1 = false
        if type(default) == "string" then
            v1 = false
            if #default <= v2 then
                v1 = string.find(default, "%S") ~= nil
            end
        end
        if not v1 then
            return nil, j.label .. " is empty or too long."
        end
        v6[j.key] = default
    end
    if v9 == "spawn-slop-army" then
        v5.minProgress = true
        v5.maxProgress = true
    end
    for k in v10 do
        if type(k) ~= "string" then
            v3 = false
        elseif v5[k] then
            continue
        else
            v3 = false
        end
        if not v3 then
            return nil, "Action settings contain an unknown field."
        end
        if v9 == "randomize-tower-sizes" and v6.maxScale < v6.minScale then
            return nil, "Smallest scale must not exceed largest scale."
        end
        v3 = LegacyParameters.validate(v9, v6)
        if v3 then
            return nil, v3
        end
        return v6, nil
    end
    if false then
        return nil, "Action settings contain an unknown field."
    end
    if v9 == "randomize-tower-sizes" and v6.maxScale < v6.minScale then
        return nil, "Smallest scale must not exceed largest scale."
    end
    v3 = LegacyParameters.validate(v9, v6)
    if v3 then
        return nil, v3
    end
    return v6, nil
end

return u10