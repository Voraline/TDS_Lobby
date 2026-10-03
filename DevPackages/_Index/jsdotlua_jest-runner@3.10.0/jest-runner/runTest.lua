-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-runner@3.10.0.jest-runner.runTest
-- Decompile time: 8.05 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local console = v1.console
local setTimeout = v1.setTimeout
local Error = v1.Error
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local getRelativePath = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).getRelativePath
local CoreScriptSyncService = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).getDataModelService("CoreScriptSyncService")
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-console"))
local BufferedConsole = v3.BufferedConsole
local CustomConsole = v3.CustomConsole
local NullConsole = v3.NullConsole
local getConsoleOutput = v3.getConsoleOutput
require(script.Parent.Parent:WaitForChild("jest-environment"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local v4 = require(script.Parent.Parent:WaitForChild("jest-util"))
local ErrorWithStack = v4.ErrorWithStack
local setGlobal = v4.setGlobal
require(script.Parent:WaitForChild("types"))
local Writeable = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).Writeable

local function freezeConsole(a1, a2) -- Line: 81 -- upvalues: ErrorWithStack (val), chalk (val)
    local fakeConsolePush

    function fakeConsolePush(a1, a2, a3) -- Line: 83
        -- upvalues: ErrorWithStack (upval), chalk (upval), fakeConsolePush (val)
        ErrorWithStack.new(("%s\nAttempted to log \"%s\"."):format(
            chalk.red(("%s Did you forget to wait for something async in your test?"):format((chalk.bold("Cannot log after tests are done.")))),
            a3
        ), fakeConsolePush)
    end

    a1._log = fakeConsolePush
end

local function runTestInternal(a1, a2, a3, a4, a5, a6, a7) -- Line: 111
    -- upvalues: promise (val), Error (val), Writeable (val), getConsoleOutput (val), BufferedConsole (val)
    -- upvalues: NullConsole (val), CustomConsole (val), console (val), setGlobal (val), ErrorWithStack (val)
    -- upvalues: chalk (val), CoreScriptSyncService (val), getRelativePath (val), setTimeout (val)
    return (promise.resolve()):andThen(function() -- Line: 121
        -- upvalues: a3 (val), Error (upval), Writeable (upval), getConsoleOutput (upval), BufferedConsole (upval)
        -- upvalues: a2 (val), NullConsole (upval), CustomConsole (upval), a1 (val), console (upval), setGlobal (upval)
        -- upvalues: a7 (val), a6 (val), ErrorWithStack (upval), chalk (upval), CoreScriptSyncService (upval)
        -- upvalues: getRelativePath (upval), promise (upval), setTimeout (upval)
        local v1
        local testEnvironment = a3.testEnvironment
        if type(testEnvironment) ~= "string" then
            v1 = require(testEnvironment)
        else
            local Parent
            if _G.LUA_ENV == nil then
                Parent = script.Parent and script.Parent.Parent and script.Parent.Parent.Parent and script.Parent.Parent.Parent:FindFirstChild(testEnvironment, true)
                if Parent and Parent.ClassName == "Folder" then
                    Parent = Parent:FindFirstChild("src")
                end
                if Parent == nil then
                    error(Error.new((("unable to find environment '%*'"):format(testEnvironment))))
                end
                v1 = require(Parent)
            elseif _G.LUA_ENV ~= "roblox" then
                v1 = require(testEnvironment)
            else
                Parent = script.Parent and script.Parent.Parent and script.Parent.Parent.Parent and script.Parent.Parent.Parent:FindFirstChild(testEnvironment, true)
                if Parent and Parent.ClassName == "Folder" then
                    Parent = Parent:FindFirstChild("src")
                end
                if Parent == nil then
                    error(Error.new((("unable to find environment '%*'"):format(testEnvironment))))
                end
                v1 = require(Parent)
            end
        end
        local runner = require(script.Parent.Parent:WaitForChild("jest-circus")).runner
        local v2 = require(script.Parent.Parent:WaitForChild("jest-runtime"))
        local v3 = Writeable.new()

        local function consoleFormatter(a1, a2_2) -- Line: 191
            -- upvalues: getConsoleOutput (upval), BufferedConsole (upval), a3 (upval), a2 (upval)
            return getConsoleOutput(BufferedConsole.write({}, a1, a2_2, 4), a3, a2)
        end

        local u107 = if not a2.silent then if not a2.verbose then BufferedConsole.new() else CustomConsole.new(v3, v3, consoleFormatter) else NullConsole.new(v3, v3, consoleFormatter)
        local u115 = v1.new(a3, {console = u107, testPath = a1})
        if typeof(u115.getVmContext) ~= "function" then
            console.error(("Test environment found at \"%s\" does not export a \"getVmContext\" method, which is mandatory from Jest 27. This method is a replacement for \"runScript\"."):format((tostring(testEnvironment))))
            error(1)
        end
        setGlobal(u115.global, "console", u107)
        local u147 = v2.new(a3, a7)
        local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
        for i, j in a3.setupFiles do
            u147:requireModule(j)
        end
        local success, result = pcall(function() -- Line: 328
            -- upvalues: u115 (val), runner (val), a2 (upval), a3 (upval), u147 (val), a1 (upval), a6 (upval)
            -- upvalues: u107 (ref), ErrorWithStack (upval), chalk (upval), UnixTimestampMillis (val)
            -- upvalues: CoreScriptSyncService (upval), getRelativePath (upval), promise (upval), setTimeout (upval)
            local fakeConsolePush
            u115:setup():expect()
            local u7 = nil
            local success, result = pcall(function() -- Line: 332
                -- upvalues: u7 (ref), runner (upval), a2 (upval), a3 (upval), u115 (upval), u147 (upval), a1 (upval)
                -- upvalues: a6 (upval)
                u7 = runner(a2, a3, u115, u147, a1, a6):expect()
            end)
            if not success then
                local stack = result.stack
            end
            if not success then
                error(result)
            end
            local v1 = u107

            function fakeConsolePush(a1, a2, a3) -- Line: 83
                -- upvalues: ErrorWithStack (upval), chalk (upval), fakeConsolePush (val)
                ErrorWithStack.new(("%s\nAttempted to log \"%s\"."):format(
                    chalk.red(("%s Did you forget to wait for something async in your test?"):format((chalk.bold("Cannot log after tests are done.")))),
                    a3
                ), fakeConsolePush)
            end

            v1._log = fakeConsolePush
            v1 = u7.numPassingTests + u7.numFailingTests + u7.numPendingTests + u7.numTodoTests
            local UnixTimestampMillis_2 = DateTime.now().UnixTimestampMillis
            local v2 = UnixTimestampMillis_2 - UnixTimestampMillis
            local v3 = {["end"] = UnixTimestampMillis_2, runtime = v2}
            local v4 = v2 / 1000
            v3.slow = a3.slowTestThreshold < v4
            v3.start = UnixTimestampMillis
            u7.perfStats = v3
            if not CoreScriptSyncService then
                u7.testFilePath = getRelativePath(a1, a3.rootDir)
            else
                u7.testFilePath = CoreScriptSyncService:GetScriptFilePath(a1)
            end
            u7.console = u107:getBuffer()
            v3 = v1 == u7.numPendingTests
            u7.skipped = v3
            u7.displayName = a3.displayName
            return (promise.new(function(a1) -- Line: 412 -- upvalues: setTimeout (upval), u7 (ref)
                setTimeout(function() -- Line: 413 -- upvalues: a1 (val), u7 (upval)
                    return a1({result = u7})
                end)
            end))
        end)
        u147:teardown()
        u115:teardown():expect()
        if not success then
            error(result)
        end
        return result
    end)
end

function v2.default(a1, a2, a3, a4, a5, a6, a7) -- Line: 431
    -- upvalues: promise (val), Error (val), Writeable (val), getConsoleOutput (val), BufferedConsole (val)
    -- upvalues: NullConsole (val), CustomConsole (val), console (val), setGlobal (val), ErrorWithStack (val)
    -- upvalues: chalk (val), CoreScriptSyncService (val), getRelativePath (val), setTimeout (val), setTimeout (val)
    return (promise.resolve()):andThen(function() -- Line: 440
        -- upvalues: a1 (val), a2 (val), a3 (val), a4 (val), a5 (val), a6 (val), a7 (val), promise (upval)
        -- upvalues: Error (upval), Writeable (upval), getConsoleOutput (upval), BufferedConsole (upval)
        -- upvalues: NullConsole (upval), CustomConsole (upval), console (upval), setGlobal (upval)
        -- upvalues: ErrorWithStack (upval), chalk (upval), CoreScriptSyncService (upval), getRelativePath (upval)
        -- upvalues: setTimeout (upval), setTimeout (upval)
        local u0 = a1
        local u1 = a2
        local u2 = a3
        local u5 = a6
        local u6 = a7
        local v1 = (promise.resolve()):andThen(function() -- Line: 121
            -- upvalues: u2 (val), Error (upval), Writeable (upval), getConsoleOutput (upval), BufferedConsole (upval)
            -- upvalues: u1 (val), NullConsole (upval), CustomConsole (upval), u0 (val), console (upval)
            -- upvalues: setGlobal (upval), u6 (val), u5 (val), ErrorWithStack (upval), chalk (upval)
            -- upvalues: CoreScriptSyncService (upval), getRelativePath (upval), promise (upval), setTimeout (upval)
            local v1
            local testEnvironment = u2.testEnvironment
            if type(testEnvironment) ~= "string" then
                v1 = require(testEnvironment)
            else
                local Parent
                if _G.LUA_ENV == nil then
                    Parent = script.Parent and script.Parent.Parent and script.Parent.Parent.Parent and script.Parent.Parent.Parent:FindFirstChild(testEnvironment, true)
                    if Parent and Parent.ClassName == "Folder" then
                        Parent = Parent:FindFirstChild("src")
                    end
                    if Parent == nil then
                        error(Error.new((("unable to find environment '%*'"):format(testEnvironment))))
                    end
                    v1 = require(Parent)
                elseif _G.LUA_ENV ~= "roblox" then
                    v1 = require(testEnvironment)
                else
                    Parent = script.Parent and script.Parent.Parent and script.Parent.Parent.Parent and script.Parent.Parent.Parent:FindFirstChild(testEnvironment, true)
                    if Parent and Parent.ClassName == "Folder" then
                        Parent = Parent:FindFirstChild("src")
                    end
                    if Parent == nil then
                        error(Error.new((("unable to find environment '%*'"):format(testEnvironment))))
                    end
                    v1 = require(Parent)
                end
            end
            local runner = require(script.Parent.Parent:WaitForChild("jest-circus")).runner
            local v2 = require(script.Parent.Parent:WaitForChild("jest-runtime"))
            local v3 = Writeable.new()

            local function consoleFormatter(a1, a2) -- Line: 191
                -- upvalues: getConsoleOutput (upval), BufferedConsole (upval), u2 (upval), u1 (upval)
                return getConsoleOutput(BufferedConsole.write({}, a1, a2, 4), u2, u1)
            end

            local u107 = if not u1.silent then if not u1.verbose then BufferedConsole.new() else CustomConsole.new(v3, v3, consoleFormatter) else NullConsole.new(v3, v3, consoleFormatter)
            local u115 = v1.new(u2, {console = u107, testPath = u0})
            if typeof(u115.getVmContext) ~= "function" then
                console.error(("Test environment found at \"%s\" does not export a \"getVmContext\" method, which is mandatory from Jest 27. This method is a replacement for \"runScript\"."):format((tostring(testEnvironment))))
                error(1)
            end
            setGlobal(u115.global, "console", u107)
            local u147 = v2.new(u2, u6)
            local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
            for i, j in u2.setupFiles do
                u147:requireModule(j)
            end
            local success, result = pcall(function() -- Line: 328
                -- upvalues: u115 (val), runner (val), u1 (upval), u2 (upval), u147 (val), u0 (upval), u5 (upval)
                -- upvalues: u107 (ref), ErrorWithStack (upval), chalk (upval), UnixTimestampMillis (val)
                -- upvalues: CoreScriptSyncService (upval), getRelativePath (upval), promise (upval), setTimeout (upval)
                local fakeConsolePush
                u115:setup():expect()
                local u7 = nil
                local success, result = pcall(function() -- Line: 332
                    -- upvalues: u7 (ref), runner (upval), u1 (upval), u2 (upval), u115 (upval), u147 (upval)
                    -- upvalues: u0 (upval), u5 (upval)
                    u7 = runner(u1, u2, u115, u147, u0, u5):expect()
                end)
                if not success then
                    local stack = result.stack
                end
                if not success then
                    error(result)
                end
                local v1 = u107

                function fakeConsolePush(a1, a2, a3) -- Line: 83
                    -- upvalues: ErrorWithStack (upval), chalk (upval), fakeConsolePush (val)
                    ErrorWithStack.new(("%s\nAttempted to log \"%s\"."):format(
                        chalk.red(("%s Did you forget to wait for something async in your test?"):format((chalk.bold("Cannot log after tests are done.")))),
                        a3
                    ), fakeConsolePush)
                end

                v1._log = fakeConsolePush
                v1 = u7.numPassingTests + u7.numFailingTests + u7.numPendingTests + u7.numTodoTests
                local UnixTimestampMillis_2 = DateTime.now().UnixTimestampMillis
                local v2 = UnixTimestampMillis_2 - UnixTimestampMillis
                local v3 = {["end"] = UnixTimestampMillis_2, runtime = v2}
                local v4 = v2 / 1000
                v3.slow = u2.slowTestThreshold < v4
                v3.start = UnixTimestampMillis
                u7.perfStats = v3
                if not CoreScriptSyncService then
                    u7.testFilePath = getRelativePath(u0, u2.rootDir)
                else
                    u7.testFilePath = CoreScriptSyncService:GetScriptFilePath(u0)
                end
                u7.console = u107:getBuffer()
                v3 = v1 == u7.numPendingTests
                u7.skipped = v3
                u7.displayName = u2.displayName
                return (promise.new(function(a1) -- Line: 412 -- upvalues: setTimeout (upval), u7 (ref)
                    setTimeout(function() -- Line: 413 -- upvalues: a1 (val), u7 (upval)
                        return a1({result = u7})
                    end)
                end))
            end)
            u147:teardown()
            u115:teardown():expect()
            if not success then
                error(result)
            end
            return result
        end):expect()
        local leakDetector = v1.leakDetector
        local result = v1.result
        if leakDetector == nil then
            result.leaks = false
            return result
        end
        promise.new(function(a1) -- Line: 446 -- upvalues: setTimeout (upval)
            return setTimeout(a1, 100)
        end):expect()
        result.leaks = leakDetector:isLeaking():expect()
        return result
    end)
end

return v2