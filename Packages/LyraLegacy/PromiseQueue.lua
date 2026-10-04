-- Script path: ReplicatedStorage.Packages.LyraLegacy.PromiseQueue
-- Decompile time: 3.10 ms

require(script.Parent.Log)
local Promise = require(script.Parent.Promise)
local Tables = require(script.Parent.Tables)
local u15 = {}
u15.__index = u15

function u15.new(a1) -- Line: 104 -- upvalues: u15 (val) -- types: a1: table
    return (setmetatable({_totalItemCount = 0, _queue = {}, _logger = a1.logger}, u15))
end

function u15.add(a1, a2) -- Line: 122 -- upvalues: Promise (val) -- types: a1: table, a2: function
    local u5 = debug.traceback(nil, 2)
    return Promise.new(function(a1_2, a2_2, a3) -- Line: 124 -- upvalues: a1 (val), a2 (val), u5 (val)
        local v1 = a1
        v1._totalItemCount = v1._totalItemCount + 1
        local u6 = {}
        u6.id = a1._totalItemCount
        u6.fn = a2
        u6.resolve = a1_2
        u6.reject = a2_2
        u6.trace = u5
        table.insert(a1._queue, u6)
        a1._logger:log("trace", "added item to queue", (a1:_getLogContext()))
        a3(function() -- Line: 141 -- upvalues: a1 (upval), u6 (val)
            local v1 = table.find(a1._queue, u6)
            if v1 then
                table.remove(a1._queue, v1)
                a1._logger:log("trace", "removed cancelled item from queue", (a1:_getLogContext(u6)))
            end
        end)
        if #a1._queue == 1 then
            task.spawn(function() -- Line: 151 -- upvalues: a1 (upval)
                a1:_processQueue()
            end)
        end
    end)
end

function u15:_processQueue() -- Line: 164 -- upvalues: Promise (val)
    self._logger:log("trace", "processing queue", (self:_getLogContext()))
    while true do
        if not (#self._queue > 0) then
            break
        end
        local u15 = self._queue[1]
        local u19 = task.delay(60, function() -- Line: 172 -- upvalues: self (val), u15 (val)
            local v1 = self:_getLogContext(u15)
            v1.trace = u15.trace
            self._logger:log("warn", "queue item taking > 60s", v1)
        end)
        self._logger:log("trace", "processing queue item", (self:_getLogContext(u15)))
        ;((Promise.try(u15.fn):timeout(60)):andThen(u15.resolve, function(a1) -- Line: 185 -- upvalues: self (val), u15 (val), Promise (upval)
            local v1 = self:_getLogContext(u15)
            v1.error = a1
            v1.trace = u15.trace
            self._logger:log(
                "debug",
                if not Promise.Error.isKind(a1, Promise.Error.Kind.TimedOut) then "queue item failed" else "queue item timed out",
                v1
            )
            u15.reject((("Queue item failed: %*\nCreated at:\n%*"):format(a1, u15.trace)))
        end)):finally(function() -- Line: 203 -- upvalues: self (val), u15 (val), u19 (val)
            self._logger:log("trace", "finished processing queue item", (self:_getLogContext(u15)))
            if self._queue[1] == u15 then
                table.remove(self._queue, 1)
            end
            task.cancel(u19)
        end):await()
    end
    self._logger:log("trace", "finished processing queue", (self:_getLogContext()))
end

local function addResumableBlock(a1) -- Line: 232 -- upvalues: Promise (val)
    return Promise.new(function(a1_2) -- Line: 233 -- upvalues: a1 (val), Promise (upval)
        a1:add(function() -- Line: 235 -- upvalues: Promise (upval), a1_2 (val)
            return Promise.new(function(a1) -- Line: 236 -- upvalues: a1_2 (upval)
                a1_2(a1)
            end)
        end)
    end)
end

u15._addResumableBlock = addResumableBlock

function u15.multiQueueAdd(a1, a2) -- Line: 267
    -- upvalues: Promise (val), Tables (val), addResumableBlock (val)
    local u5 = debug.traceback(nil, 2)
    return Promise.new(function(a1_2, a2_2) -- Line: 269
        -- upvalues: Tables (upval), a1 (val), addResumableBlock (upval), Promise (upval), a2 (val), u5 (val)
        local v1 = Tables.map(a1, addResumableBlock)
        ;(Promise.all(v1)):andThen(function(a1) -- Line: 274 -- upvalues: Promise (upval), a2 (upval), a1_2 (val), a2_2 (val), u5 (upval)
            local v1 = a2
            ;((Promise.try(v1)):andThen(a1_2, function(a1) -- Line: 277 -- upvalues: a2_2 (upval), u5 (upval)
                a2_2((("multiQueueAdd callback failed: %*\nCreated at:\n%*"):format(a1, u5)))
            end)):finally(function() -- Line: 280 -- upvalues: a1 (val)
                for i, j in a1 do
                    j()
                end
            end)
        end)
    end)
end

function u15:_getLogContext(a2) -- Line: 297 -- types: self: table, a2: table?
    return {
        queueLength = #self._queue,
        totalItems = self._totalItemCount,
        itemId = a2 and a2.id,
    }
end

return u15