-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console
-- Decompile time: 0.55 ms

local v1 = {
    helpers = require(script:WaitForChild("helpers")),
    Console = require(script:WaitForChild("Console")),
    BufferedConsole = require(script:WaitForChild("BufferedConsole")).default,
    CustomConsole = require(script:WaitForChild("CustomConsole")).default,
    NullConsole = require(script:WaitForChild("NullConsole")).default,
    getConsoleOutput = require(script:WaitForChild("getConsoleOutput")).default,
}
require(script:WaitForChild("types"))
return v1