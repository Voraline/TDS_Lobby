-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactSharedInternals
-- Decompile time: 0.62 ms

local console = require(script.Parent.Parent:WaitForChild("luau-polyfill")).console

local function onlyInTestError(a1) -- Line: 26 -- upvalues: console (val) -- types: a1: string
    return function() -- Line: 27 -- upvalues: console (upval), a1 (val)
        console.error(a1 .. " is only available in tests, not in production")
    end
end

local ReactCurrentDispatcher = require(script:WaitForChild("ReactCurrentDispatcher"))
local ReactCurrentBatchConfig = require(script:WaitForChild("ReactCurrentBatchConfig"))
local ReactCurrentOwner = require(script:WaitForChild("ReactCurrentOwner"))
local ReactDebugCurrentFrame = require(script:WaitForChild("ReactDebugCurrentFrame"))
return {
    ReactCurrentDispatcher = ReactCurrentDispatcher,
    ReactCurrentBatchConfig = ReactCurrentBatchConfig,
    ReactCurrentOwner = ReactCurrentOwner,
    IsSomeRendererActing = require(script:WaitForChild("IsSomeRendererActing")),
    ReactDebugCurrentFrame = if not _G.__DEV__ then {
        setExtraStackFrame = function(a1) end,
    } else ReactDebugCurrentFrame,
}