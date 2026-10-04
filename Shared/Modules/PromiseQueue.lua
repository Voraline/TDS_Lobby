-- Script path: ReplicatedStorage.Shared.Modules.PromiseQueue
-- Decompile time: 2.63 ms

local v1 = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.PromiseTypes)

function v1.new(a1, a2, a3) -- Line: 18 -- types: a1: number?, a2: string?, a3: userdata?
    local u3 = {
        _queue = {},
        _runningQueues = 0,
        _currentPromises = {},
        _currentData = {},
        _factoriesById = {},
        _dataById = {},
    }
    if a2 then
        u3._replicator = (require((game:GetService("ServerStorage")).Server.Modules.ServerTagReplicator)).new(a2, {Content = {}}, a3)
    end
    local u30 = math.min(a1 or 1, 1)

    function u3.Mutate(a1, a2) -- Line: 39 -- upvalues: u3 (val) -- types: a1: string
        u3._dataById[a1] = a2
        u3.OnChange()
    end

    function u3.Enqueue(a1, a2, a3) -- Line: 45 -- upvalues: u3 (val) -- types: a1: function, a2: string?
        table.insert(u3._queue, {factory = a1, id = a2})
        if a2 then
            u3._factoriesById[a2] = a1
            if a3 then
                u3.Mutate(a2, a3)
            end
        end
        u3.Run()
        return u3
    end

    function u3.Remove(a1) -- Line: 60 -- upvalues: u3 (val) -- types: a1: function
        local v1 = nil
        for i, j in u3._queue do
            if j.factory == a1 then
                v1 = i
                break
            end
        end
        if v1 then
            local v2 = u3._queue[v1]
            if v2.id then
                u3._factoriesById[v2.id] = nil
            end
            table.remove(u3._queue, v1)
        end
        u3.Run()
        return u3, v1 ~= nil
    end

    function u3.RemoveById(a1) -- Line: 84 -- upvalues: u3 (val) -- types: a1: string
        local v1 = u3._factoriesById[a1]
        if v1 then
            return u3.Remove(v1)
        end
        return u3, false
    end

    function u3.Run() -- Line: 94 -- upvalues: u3 (val), u30 (val)
        u3.OnChange()
        if u30 <= u3._runningQueues then
            return
        end
        local u10 = table.remove(u3._queue, 1)
        if u10 then
            local u13 = u10.factory(function(a1) -- Line: 102 -- upvalues: u3 (upval), u10 (val)
                u3.Mutate(u10.id, a1)
            end)
            local v1 = u3
            v1._runningQueues = v1._runningQueues + 1
            u13:finally(function() -- Line: 107 -- upvalues: u3 (upval), u13 (val), u10 (val)
                local v1 = u3
                v1._runningQueues = v1._runningQueues - 1
                u3._currentPromises[u13] = nil
                u3._currentData[u13] = nil
                if u10.id then
                    u3._factoriesById[u10.id] = nil
                end
                return u3.Run()
            end)
            u13:catch(warn)
            u3._currentPromises[u13] = true
            u3._currentData[u13] = u10
            u3.OnChange()
        end
    end

    function u3.Destroy() -- Line: 128 -- upvalues: u3 (val)
        table.clear(u3._queue)
        table.clear(u3._factoriesById)
        u3._running = false
        for i in u3._currentPromises do
            i:cancel()
        end
        table.clear(u3._currentPromises)
        if u3._replicator then
            u3._replicator:Destroy()
        end
    end

    function u3.IsRunning() -- Line: 144 -- upvalues: u3 (val)
        return u3._running
    end

    function u3.Clear() -- Line: 148 -- upvalues: u3 (val)
        table.clear(u3._queue)
        u3._running = false
        u3._currentPromise = nil
        u3.OnChange()
        return u3
    end

    function u3.OnChange() -- Line: 158 -- upvalues: u3 (val)
        if u3._replicator then
            local v1 = {}
            for i, j in u3._currentData do
                if j.id then
                    table.insert(v1, {
                        id = j.id,
                        startTime = j.startTime,
                        data = u3._dataById[j.id],
                    })
                end
            end
            for k, n in u3._queue do
                if n.id then
                    table.insert(v1, {
                        id = n.id,
                        startTime = n.startTime,
                        data = u3._dataById[n.id],
                    })
                end
            end
            u3._replicator:Set("Content", v1)
        end
    end

    return u3
end

return v1