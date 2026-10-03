-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.slice
-- Decompile time: 0.59 ms

return function(a1, a2, a3) -- Line: 1 -- types: a1: string
    local v1, v2 = utf8.len(a1)
    local v3 = ("string `%s` has an invalid byte at position %s"):format(a1, (tostring(v2)))
    assert(v1 ~= nil, v3)
    local v4 = tonumber(a2)
    assert(typeof(v4) == "number", "startIndexStr should be a number")
    if v4 + v1 < 0 then
        v4 = 1
    end
    if v1 < v4 then
        return ""
    end
    local v5 = v1 + 1
    if a3 ~= nil then
        v5 = tonumber(a3) or (0 / 0)
    end
    assert(typeof(v5) == "number", "lastIndexStr should convert to number")
    if v1 < v5 then
        v5 = v1 + 1
    end
    return (string.sub(a1, utf8.offset(a1, v4), (utf8.offset(a1, v5)) - 1))
end