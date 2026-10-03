-- Script path: ReplicatedStorage.Packages.Fusion.Logging.logWarn
-- Decompile time: 0.33 ms

local Parent_2 = script.Parent.Parent
local messages = require(Parent_2.Logging.messages)
return function(a1, ...) -- Line: 10 -- upvalues: messages (val)
    local v1 = if messages[a1] == nil then messages.unknownMessage else messages[a1]
    warn(string.format("[Fusion] " .. v1 .. "\n(ID: " .. a1 .. ")", ...))
end