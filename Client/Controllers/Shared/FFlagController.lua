-- Script path: ReplicatedStorage.Client.Controllers.Shared.FFlagController
-- Decompile time: 3.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AttributeSerializer = require(ReplicatedStorage.Shared.Modules.AttributeSerializer)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u36 = {}
local fflags = NewNetwork.Channel("fflags")
local u40 = {_data = {}, _loaded = false}
u40.Updated = Signal.new()

function u40._awaitLoaded() -- Line: 19 -- upvalues: u40 (val)
    if u40._promise then
        u40._promise:await()
    end
end

function u40._update(a1) -- Line: 25 -- upvalues: table (val), u40 (val) -- types: a1: table
    if table.deepCompare(u40._data, a1) then
        return
    end
    local v1 = table.deepClone(a1)
    u40._data = v1
    u40.Updated:Fire(v1)
end

local function requestLoadedFlag(a1) -- Line: 35 -- upvalues: u40 (val), u36 (val), fflags (val) -- types: a1: string
    if u40._data[a1] == nil and not u36[a1] then
        u36[a1] = true
        task.spawn(function() -- Line: 38 -- upvalues: fflags (upval), a1 (val)
            fflags:fireServer("ask", a1)
        end)
    end
end

function u40.request(a1) -- Line: 44 -- upvalues: u40 (val), u36 (val), fflags (val) -- types: a1: string
    task.spawn(function() -- Line: 45 -- upvalues: u40 (upval), a1 (val), u36 (upval), fflags (upval)
        u40._awaitLoaded()
        local u3 = a1
        if u40._data[u3] == nil and not u36[u3] then
            u36[u3] = true
            task.spawn(function() -- Line: 38 -- upvalues: fflags (upval), u3 (val)
                fflags:fireServer("ask", u3)
            end)
        end
    end)
end

function u40.resolve(a1) -- Line: 51 -- upvalues: u40 (val), u36 (val), fflags (val) -- types: a1: string
    u40._awaitLoaded()
    if u40._data[a1] == nil and not u36[a1] then
        u36[a1] = true
        task.spawn(function() -- Line: 38 -- upvalues: fflags (upval), a1 (val)
            fflags:fireServer("ask", a1)
        end)
    end
    return u40._data[a1]
end

function u40.get(a1, a2) -- Line: 57 -- upvalues: AttributeSerializer (val), u40 (val) -- types: a1: string
    if AttributeSerializer.Sanetize(a1) ~= a1 then
        error((("FFlagController.get: Invalid characters in flag key '%*'"):format(a1)))
    end
    return function() -- Line: 62 -- upvalues: u40 (upval), a1 (val), a2 (val)
        local v1 = u40.resolve(a1)
        if v1 == nil then
            return a2
        end
        return v1
    end
end

u40._resolve = nil
u40._promise = Promise.new(function(a1) -- Line: 69 -- upvalues: u40 (val)
    u40._resolve = a1
end)
local u55 = nil
TagReplicator.hook("PlayerFFlags", function(a1, a2) -- Line: 74 -- upvalues: u55 (ref), u40 (val)
    if u55 then
        u55:Disconnect()
        u55 = nil
    end
    u40._update(a2.State or {})
    u40._resolve()
    u55 = a2.Changed:Connect(function() -- Line: 82 -- upvalues: u40 (upval), a2 (val)
        u40._update(a2.State or {})
    end)
end)
return u40