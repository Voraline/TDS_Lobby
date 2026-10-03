-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.encodeURIComponent
-- Decompile time: 0.76 ms

local HttpService = game:GetService("HttpService")
local charCodeAt = (require((script.Parent.Parent:WaitForChild("string")))).charCodeAt
local Error = require(script.Parent:WaitForChild("Error"))
return function(a1) -- Line: 8 -- upvalues: charCodeAt (val), Error (val), HttpService (val) -- types: a1: string
    local v1 = utf8.len(a1)
    if v1 ~= 0 and v1 ~= nil then
        local v2 = charCodeAt(a1, 1)
        if v1 == 1 then
            if v2 == 55296 then
                error(Error.new("URI malformed"))
            end
            if v2 == 57343 then
                error(Error.new("URI malformed"))
            end
        end
        if v2 >= 56320 and v2 < 57343 then
            error(Error.new("URI malformed"))
        end
        return (((((((((HttpService:UrlEncode(a1):gsub("%%2D", "-")):gsub("%%5F", "_")):gsub("%%2E", ".")):gsub("%%21", "!")):gsub("%%7E", "~")):gsub(
            "%%2A",
            "*"
        )):gsub(
            "%%27",
            "'"
        )):gsub(
            "%%28",
            "("
        )):gsub(
            "%%29",
            ")"
        ))
    end
    return ""
end