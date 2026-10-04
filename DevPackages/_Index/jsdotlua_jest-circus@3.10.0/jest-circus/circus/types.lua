-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.types
-- Decompile time: 0.42 ms

local Symbol = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill")).Symbol
local v1 = {}
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent.Parent.Parent:WaitForChild("expect"))
v1.STATE_SYM = Symbol("JEST_STATE_SYMBOL")
v1.RETRY_TIMES = Symbol.for_("RETRY_TIMES")
v1.TEST_TIMEOUT_SYMBOL = Symbol.for_("TEST_TIMEOUT_SYMBOL")
return v1