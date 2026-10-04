-- Script path: ReplicatedStorage.Packages.Fusion.Logging.logError
-- Decompile time: 0.82 ms

local Parent = script.Parent.Parent
require(Parent.Types)
local messages = require(Parent.Logging.messages)
return function(a1, a2, ...) -- Line: 11 -- upvalues: messages (val) -- types: a1: string
    local v1
    local v2 = if messages[a1] == nil then messages.unknownMessage else messages[a1]
    if a2 ~= nil then
        v2 = v2:gsub("ERROR_MESSAGE", a2.message)
        v1 = string.format("[Fusion] " .. v2 .. "\n(ID: " .. a1 .. ")\n---- Stack trace ----\n" .. a2.trace, ...)
    else
        v1 = string.format("[Fusion] " .. v2 .. "\n(ID: " .. a1 .. ")", ...)
    end
    error(v1:gsub("\n", "\n    "), 0)
end