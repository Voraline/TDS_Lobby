-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-util@3.10.0.jest-util
-- Decompile time: 0.57 ms

local Object = (require((script.Parent:WaitForChild("luau-polyfill")))).Object
local v1 = {
    clearLine = require(script:WaitForChild("clearLine")).default,
    createDirectory = require(script:WaitForChild("createDirectory")).default,
    ErrorWithStack = require(script:WaitForChild("ErrorWithStack")).default,
    installCommonGlobals = require(script:WaitForChild("installCommonGlobals"))().default,
    isInteractive = require(script:WaitForChild("isInteractive")).default,
    isPromise = require(script:WaitForChild("isPromise")).default,
    setGlobal = require(script:WaitForChild("setGlobal")).default,
    deepCyclicCopy = require(script:WaitForChild("deepCyclicCopy")).default,
    convertDescriptorToString = require(script:WaitForChild("convertDescriptorToString")).default,
}
local specialChars = require(script:WaitForChild("specialChars"))
Object.assign(v1, specialChars)
v1.specialChars = specialChars
v1.ARROW = specialChars.ARROW
v1.ICONS = specialChars.ICONS
v1.CLEAR = specialChars.CLEAR
v1.testPathPatternToRegExp = require(script:WaitForChild("testPathPatternToRegExp")).default
v1.globsToMatcher = require(script:WaitForChild("globsToMatcher")).default
local preRunMessage = require(script:WaitForChild("preRunMessage"))
v1.preRunMessage = preRunMessage
v1.print = preRunMessage.print
v1.remove = preRunMessage.remove
v1.pluralize = require(script:WaitForChild("pluralize")).default
v1.formatTime = require(script:WaitForChild("formatTime")).default
return v1