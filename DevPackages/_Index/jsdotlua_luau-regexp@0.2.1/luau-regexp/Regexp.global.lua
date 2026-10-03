-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_luau-regexp@0.2.1.luau-regexp.Regexp.global
-- Decompile time: 0.90 ms

local RegEx = require(script.Parent:WaitForChild("RegEx"))
local v1 = {}
local u9 = {__index = v1}

function u9.__tostring(a1) -- Line: 14
    return (tostring(a1._innerRegEx))
end

function v1:exec(a2) -- Line: 19 -- types: self: table, a2: string
    local v1 = self._innerRegEx:match(a2)
    if not v1 then
        return nil
    end
    local v2 = v1:span()
    local v3 = v1:grouparr()
    local v4 = {v3[0]}
    local n = v3.n
    for i = 1, n do
        v4[i + 1] = v3[i]
    end
    v4.n = v3.n + 1
    v4.index = v2
    v4.input = a2
    return v4
end

function v1.test(a1, a2) -- Line: 38 -- types: a1: table, a2: string
    return a1:exec(a2) ~= nil
end

return (setmetatable(v1, {
    __call = function(a1, a2, a3) -- Line: 42 -- upvalues: RegEx (val), u9 (val) -- types: a3: string?
        local v1 = a3 or ""
        return (setmetatable({
            source = a2,
            ignoreCase = v1:find("i") ~= nil,
            global = v1:find("g") ~= nil,
            multiline = v1:find("m") ~= nil,
            _innerRegEx = RegEx.new(a2, v1),
        }, u9))
    end,
}))