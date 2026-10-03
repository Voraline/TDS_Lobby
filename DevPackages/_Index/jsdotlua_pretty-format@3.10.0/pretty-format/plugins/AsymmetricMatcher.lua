-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.AsymmetricMatcher
-- Decompile time: 1.22 ms

local Symbol = (require((script.Parent.Parent.Parent:WaitForChild("luau-polyfill")))).Symbol
local Collections = require(script.Parent.Parent:WaitForChild("Collections"))
local printListItems = Collections.printListItems
local printTableEntries = Collections.printTableEntries
require(script.Parent.Parent:WaitForChild("Types"))
local u33 = Symbol.for_("jest.asymmetricMatcher")

local function unescape(a1) -- Line: 25 -- types: a1: string
    return a1:gsub("%%([%$%%%^%*%(%)%.%[%]%+%-%?])", "%1")
end

return {
    serialize = function(a1, a2, a3, a4, a5, a6) -- Line: 29
        -- upvalues: printListItems (val), printTableEntries (val)
        local v1
        local v2 = a1:toString()
        if v2 ~= "ArrayContaining" and v2 ~= "ArrayNotContaining" then
            if v2 ~= "ObjectContaining" and v2 ~= "ObjectNotContaining" then
                if v2 ~= "StringMatching" and v2 ~= "StringNotMatching" then
                    if v2 ~= "StringContaining" and v2 ~= "StringNotContaining" then
                        if typeof(a1.toAsymmetricMatcher) ~= "function" then
                            error("Asymmetric matcher does not implement toAsymmetricMatcher()")
                        end
                        return a1:toAsymmetricMatcher()
                    end
                    return v2 .. " " .. a6(a1.sample:gsub("%%([%$%%%^%*%(%)%.%[%]%+%-%?])", "%1"), a2, a3, a4, a5)
                end
                return v2 .. " " .. a6(a1.sample, a2, a3, a4, a5)
            end
            v1 = a4 + 1
            if a2.maxDepth < v1 then
                return "[" .. v2 .. "]"
            end
            return v2 .. " " .. "{" .. (printTableEntries(a1.sample, a2, a3, v1, a5, a6)) .. "}"
        end
        v1 = a4 + 1
        if a2.maxDepth < v1 then
            return "[" .. v2 .. "]"
        end
        return v2 .. " " .. "{" .. (printListItems(a1.sample, a2, a3, v1, a5, a6)) .. "}"
    end,
    test = function(a1) -- Line: 87 -- upvalues: u33 (val)
        local v1 = false
        if typeof(a1) == "table" then
            v1 = false
            if a1 ~= nil then
                v1 = a1["$$typeof"] == u33
            end
        end
        return v1
    end,
}