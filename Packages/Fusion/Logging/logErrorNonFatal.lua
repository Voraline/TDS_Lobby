-- Script path: ReplicatedStorage.Packages.Fusion.Logging.logErrorNonFatal
-- Decompile time: 0.56 ms

local Parent = script.Parent.Parent
require(Parent.Types)
local messages = require(Parent.Logging.messages)
return function(a1, a2, ...) -- Line: 11 -- upvalues: messages (val) -- types: a1: string
    local u40
    local v1 = if messages[a1] == nil then messages.unknownMessage else messages[a1]
    if a2 ~= nil then
        v1 = v1:gsub("ERROR_MESSAGE", a2.message)
        u40 = string.format("[Fusion] " .. v1 .. "\n(ID: " .. a1 .. ")\n---- Stack trace ----\n" .. a2.trace, ...)
    else
        u40 = string.format("[Fusion] " .. v1 .. "\n(ID: " .. a1 .. ")", ...)
    end
    task.spawn(function(...) -- Line: 29 -- upvalues: u40 (ref)
        error(u40:gsub("\n", "\n    "), 0)
    end, ...)
end