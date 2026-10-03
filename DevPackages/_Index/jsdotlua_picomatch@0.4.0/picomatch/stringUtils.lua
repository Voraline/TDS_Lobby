-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_picomatch@0.4.0.picomatch.stringUtils
-- Decompile time: 1.13 ms

local Array = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Array
require(script.Parent.Parent:WaitForChild("luau-regexp"))
return {
    stringReplace = function(a1, a2, a3) -- Line: 12 -- upvalues: Array (val) -- types: a1: string, a3: function
        local from, length, v1, v2, v3, v4, value
        local v5 = a2:exec(a1)
        local v6 = 0
        local v7 = {}
        while v5 ~= nil do
            if v5.index == nil then
                break
            end
            v2 = v5[1]
            v3 = Array.slice(v5, 1, v5.n + 1)
            v4 = v5.index + v6
            table.insert(v3, v4)
            v1 = a3((table.unpack(v3)))
            table.insert(v7, {from = v4, length = #v2, value = v1})
            v6 = v6 + (#v2 + v5.index - 1)
            v5 = a2:exec((a1:sub(v6 + 1)))
        end
        v2 = a1:sub(1)
        for i, v in ipairs(Array.reverse(v7)) do
            from = v.from
            length = v.length
            value = v.value
            v2 = (v2:sub(1, from - 1)) .. value .. (v2:sub(from + length))
        end
        return v2
    end,
}