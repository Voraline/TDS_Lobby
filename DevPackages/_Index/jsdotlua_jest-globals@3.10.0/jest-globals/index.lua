-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-globals@3.10.0.jest-globals.index
-- Decompile time: 0.29 ms

local Error = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Error
require(script.Parent.Parent:WaitForChild("jest-environment"))
require(script.Parent.Parent:WaitForChild("expect"))
require(script.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent.Parent:WaitForChild("expect"))
error(Error.new("Do not import `JestGlobals` outside of the Jest 3 test environment.\nTip: Jest 2 uses a different pattern - check your Jest version."))
return {}