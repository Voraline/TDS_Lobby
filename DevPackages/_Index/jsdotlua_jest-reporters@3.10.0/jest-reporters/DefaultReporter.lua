-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-reporters@3.10.0.jest-reporters.DefaultReporter
-- Decompile time: 12.92 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Set = v1.Set
local setTimeout = v1.setTimeout
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local getConsoleOutput = require(script.Parent.Parent:WaitForChild("jest-console")).getConsoleOutput
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-message-util"))
local formatStackTrace = v3.formatStackTrace
local indentAllLines = v3.indentAllLines
local separateMessageFromStack = v3.separateMessageFromStack
local u71 = require(script.Parent.Parent:WaitForChild("jest-util"))
local clearLine = u71.clearLine
local default = require(script.Parent:WaitForChild("BaseReporter")).default
local default_2 = (require((script.Parent:WaitForChild("Status")))).default
local default_3 = require(script.Parent:WaitForChild("getResultHeader")).default
local default_4 = require(script.Parent:WaitForChild("getSnapshotStatus")).default
require(script.Parent:WaitForChild("types"))
local Writeable = (require((script.Parent.Parent:WaitForChild("jest-roblox-shared")))).Writeable
local u129 = chalk.bold("● ")
local v4 = {__index = default}
local u133 = setmetatable({}, v4)
u133.__index = u133
u133.filename = "DefaultReporter"

function u133.new(a1, a2) -- Line: 117
    -- upvalues: default (val), u133 (val), u71 (val), Boolean (val), Writeable (val), default_2 (val), Set (val)
    local write, write_2
    local v1 = default.new(a2)
    local u8 = setmetatable(v1, u133)
    u8._isInteractive = u71.isInteractive
    if a2 ~= nil and a2.env.IS_INTERACTIVE ~= nil then
        u8._isInteractive = Boolean.toJSBoolean(a2.env.IS_INTERACTIVE)
    end

    local function defaultWrite() -- Line: 130 -- upvalues: Writeable (upval)
        local u2 = Writeable.new()
        return function(a1, a2) -- Line: 133 -- upvalues: u2 (val) -- types: a2: string
            u2:write(a2)
        end
    end

    if not a2 or not a2.stdout then
        local u25 = Writeable.new()

        function write(a1, a2) -- Line: 133 -- upvalues: u25 (val) -- types: a2: string
            u25:write(a2)
        end
    else
        write = a2.stdout.write
    end
    if not a2 or not a2.stderr then
        local u34 = Writeable.new()

        function write_2(a1, a2) -- Line: 133 -- upvalues: u34 (val) -- types: a2: string
            u34:write(a2)
        end
    else
        write_2 = a2.stderr.write
    end
    u8._globalConfig = a1
    u8._clear = ""

    function u8._out(a1, a2) -- Line: 153 -- upvalues: write (val), u8 (val) -- types: a2: string
        write(u8._process.stdout, a2)
    end

    function u8._err(a1, a2) -- Line: 156 -- upvalues: write_2 (val), u8 (val) -- types: a2: string
        write_2(u8._process.stderr, a2)
    end

    u8._status = default_2.new()
    u8._bufferedOutput = Set.new()
    u8:__wrapStdio(u8._process.stdout)
    u8:__wrapStdio(u8._process.stderr)
    u8._status:onChange(function() -- Line: 163 -- upvalues: u8 (val)
        u8:__clearStatus()
        u8:__printStatus()
    end)
    return u8
end

function u133:__wrapStdio(a2) -- Line: 171 -- upvalues: Array (val), Boolean (val), setTimeout (val)
    local flushBufferedOutput
    local write = a2.write
    local u3 = {}
    local u4 = nil

    function flushBufferedOutput() -- Line: 177
        -- upvalues: Array (upval), u3 (ref), self (val), Boolean (upval), write (val), a2 (val)
        -- upvalues: flushBufferedOutput (val)
        local v1 = Array.join(u3, "")
        u3 = {}
        self:__clearStatus()
        if Boolean.toJSBoolean(v1) then
            write(a2, v1)
        end
        self:__printStatus()
        self._bufferedOutput:delete(flushBufferedOutput)
    end

    self._bufferedOutput:add(flushBufferedOutput)

    local function debouncedFlush() -- Line: 192
        -- upvalues: a2 (val), self (val), flushBufferedOutput (val), Boolean (upval), u4 (ref), setTimeout (upval)
        if a2 == self._process.stderr then
            flushBufferedOutput()
            return
        end
        if not Boolean.toJSBoolean(u4) then
            u4 = setTimeout(function() -- Line: 199 -- upvalues: flushBufferedOutput (upval), u4 (upval)
                flushBufferedOutput()
                u4 = nil
            end, 100)
        end
    end

    function a2.write(a1, a2) -- Line: 206 -- upvalues: u3 (ref), debouncedFlush (val) -- types: a2: string
        table.insert(u3, a2)
        debouncedFlush()
        return true
    end
end

function u133:forceFlushBufferedOutput() -- Line: 213 -- upvalues: Set (val)
    Set.forEach(self._bufferedOutput, function(a1) -- Line: 214
        a1()
    end)
end

function u133:__clearStatus() -- Line: 219
    if self._isInteractive then
        if self._globalConfig.useStderr then
            self:_err(self._clear)
            return
        end
        self:_out(self._clear)
    end
end

function u133:__printStatus() -- Line: 230
    local v1 = self._status:get()
    local content = v1.content
    self._clear = v1.clear
    if self._isInteractive then
        if self._globalConfig.useStderr then
            self:_err(content)
            return
        end
        self:_out(content)
    end
end

function u133.onRunStart(a1, a2, a3) -- Line: 244
    a1._status:runStarted(a2, a3)
end

function u133.onTestStart(a1, a2) -- Line: 248
    a1._status:testStarted(a2.path, a2.context.config)
end

function u133.onTestCaseResult(a1, a2, a3) -- Line: 252
    a1._status:addTestCaseResult(a2, a3)
end

function u133.onRunComplete(a1) -- Line: 256 -- upvalues: clearLine (val)
    a1:forceFlushBufferedOutput()
    a1._status:runFinished()
    a1._process.stdout.write = a1._out
    a1._process.stderr.write = a1._err
    clearLine(a1._process.stderr)
end

function u133.onTestResult(a1, a2, a3, a4) -- Line: 264
    a1:testFinished(a2.context.config, a3, a4)
    if not a3.skipped then
        a1:printTestFileHeader(a3.testFilePath, a2.context.config, a3)
        a1:printTestFileFailureMessage(a3.testFilePath, a2.context.config, a3)
    end
    a1:forceFlushBufferedOutput()
end

function u133:testFinished(a2, a3, a4) -- Line: 273
    self._status:testFinished(a2, a3, a4)
end

function u133:printTestFileHeader(a2, a3, a4) -- Line: 281
    -- upvalues: Array (val), chalk (val), separateMessageFromStack (val), Boolean (val), formatStackTrace (val)
    -- upvalues: indentAllLines (val), default_3 (val), u129 (val), getConsoleOutput (val)
    Array.forEach(a4.testResults, function(a1) -- Line: 287
        -- upvalues: self (val), chalk (upval), Array (upval), separateMessageFromStack (upval), Boolean (upval)
        -- upvalues: formatStackTrace (upval), a3 (val), a2 (val), indentAllLines (upval)
        local retryReasons = a1.retryReasons
        if retryReasons and #retryReasons > 0 then
            self:log((("%s %s"):format(tostring((chalk.reset.inverse.bold:yellow(" LOGGING RETRY ERRORS "))), (chalk.bold(a1.fullName)))))
            Array.forEach(retryReasons, function(a1, a2_2) -- Line: 296
                -- upvalues: separateMessageFromStack (upval), Boolean (upval), self (upval), chalk (upval)
                -- upvalues: formatStackTrace (upval), a3 (upval), a2 (upval), indentAllLines (upval)
                local v1 = separateMessageFromStack(a1)
                local message = v1.message
                local stack = v1.stack
                local v2 = indentAllLines(message)
                self:log((("%s\n"):format((tostring((chalk.reset.inverse.bold:blueBright(((" RETRY %s "):format((tostring(a2_2 + 1)))))))))))
                self:log((("%s\n%s\n"):format(
                    tostring(v2),
                    (tostring(if not Boolean.toJSBoolean(self._globalConfig.noStackTrace) then chalk.dim(formatStackTrace(stack, a3, self._globalConfig, a2)) else ""))
                )))
            end)
        end
    end)
    self:log((default_3(a4, self._globalConfig, a3)))
    if a4.console ~= nil then
        self:log("  " .. u129 .. "Console\n\n" .. (getConsoleOutput(a4.console, a3, self._globalConfig)))
    end
end

function u133:printTestFileFailureMessage(a2, a3, a4) -- Line: 321
    -- upvalues: Boolean (val), default_4 (val), Array (val)
    if Boolean.toJSBoolean(a4.failureMessage) then
        self:log(a4.failureMessage)
    end
    Array.forEach(default_4(a4.snapshot, self._globalConfig.updateSnapshot == "all"), self.log, self)
end

v2.default = u133
return v2