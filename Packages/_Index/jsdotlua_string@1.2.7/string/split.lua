-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.split
-- Decompile time: 2.49 ms

local findOr = require(script.Parent:WaitForChild("findOr"))
local slice = require(script.Parent:WaitForChild("slice"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local MAX_SAFE_INTEGER = require(script.Parent.Parent:WaitForChild("number")).MAX_SAFE_INTEGER
return function(a1, a2, a3) -- Line: 10
    -- upvalues: MAX_SAFE_INTEGER (val), findOr (val), slice (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    if a2 == nil then
        return {a1}
    end
    if a3 == 0 then
        return {}
    end
    local v10 = if a3 == nil then MAX_SAFE_INTEGER else if not (a3 < 0) then a3 else MAX_SAFE_INTEGER
    if typeof(a2) ~= "string" then
        v5 = 1
        v6 = {}
        v7 = nil
        v8, v9 = utf8.len(a1)
        v3 = ("string `%s` has an invalid byte at position %s"):format(a1, (tostring(v9)))
        assert(v8 ~= nil, v3)
        repeat
            v1 = findOr(a1, a2, v5)
            if v1 == nil then
                table.insert(v6, (slice(a1, v5, nil)))
            else
                table.insert(v6, (slice(a1, v5, v1.index)))
                v5 = v1.index + (utf8.len(v1.match))
            end
            if v1 ~= nil then
                v7 = v1
            end
        until v1 == nil or v8 < v5 or v10 <= #v6
        if v7 ~= nil then
            v1, v2 = utf8.len(v7.match)
            v4 = ("string `%s` has an invalid byte at position %s"):format(v7.match, (tostring(v2)))
            assert(v1 ~= nil, v4)
            if v7.index + v1 == v8 + 1 then
                table.insert(v6, "")
            end
        end
        return v6
    end
    if a2 == "" then
        v5 = {}
        for i in a1:gmatch(".") do
            table.insert(v5, i)
        end
        return v5
    end
    local v11 = {a2}
    v5 = 1
    v6 = {}
    v7 = nil
    v8, v9 = utf8.len(a1)
    v3 = ("string `%s` has an invalid byte at position %s"):format(a1, (tostring(v9)))
    assert(v8 ~= nil, v3)
    repeat
        v1 = findOr(a1, v11, v5)
        if v1 == nil then
            table.insert(v6, (slice(a1, v5, nil)))
        else
            table.insert(v6, (slice(a1, v5, v1.index)))
            v5 = v1.index + (utf8.len(v1.match))
        end
        if v1 ~= nil then
            v7 = v1
        end
    until v1 == nil or v8 < v5 or v10 <= #v6
    if v7 ~= nil then
        v1, v2 = utf8.len(v7.match)
        v4 = ("string `%s` has an invalid byte at position %s"):format(v7.match, (tostring(v2)))
        assert(v1 ~= nil, v4)
        if v7.index + v1 == v8 + 1 then
            table.insert(v6, "")
        end
    end
    return v6
end