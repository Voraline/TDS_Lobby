-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.console
-- Decompile time: 0.29 ms

local console = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console
local consoleWithStackDev = require(script.Parent:WaitForChild("consoleWithStackDev"))
if _G.__DEV__ then
    return (setmetatable({warn = consoleWithStackDev.warn, error = consoleWithStackDev.error}, {__index = console}))
end
return console