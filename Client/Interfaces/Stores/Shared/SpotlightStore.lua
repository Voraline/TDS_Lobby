-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore
-- Decompile time: 3.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u24, u25 = Charm.signal({objects = {}})
local u26 = {}
local v1 = {getState = u24}

local function getEvent(a1) -- Line: 24 -- upvalues: u26 (val), Signal (val) -- types: a1: string
    local v1 = u26[a1]
    if not v1 then
        u26[a1] = (Signal.new())
    end
    return v1
end

function v1.connect(a1, a2) -- Line: 34 -- upvalues: u26 (val), Signal (val) -- types: a1: string, a2: function
    local v1 = u26[a1]
    if not v1 then
        u26[a1] = (Signal.new())
    end
    return v1:Connect(a2)
end

function v1.wait(a1) -- Line: 38 -- upvalues: u26 (val), Signal (val) -- types: a1: string
    local v1 = u26[a1]
    if not v1 then
        u26[a1] = (Signal.new())
    end
    return v1:Wait()
end

function v1.fire(a1, ...) -- Line: 42 -- upvalues: u26 (val), Signal (val) -- types: a1: string
    local v1 = u26[a1]
    if not v1 then
        u26[a1] = (Signal.new())
    end
    v1:Fire(...)
end

function v1.add(a1, a2) -- Line: 46 -- upvalues: u24 (val), table (val), u25 (val) -- types: a1: string, a2: userdata
    local v1 = u24()
    if v1.objects[a1] then
        if v1.objects[a1] == a2 then
            return
        end
        assert(false, (("SpotlightStore: Attempted to add an object with the same name as an existing object (%*)"):format(a1)))
    end
    local v2 = table.clone(v1)
    v2.objects = table.clone(v1.objects)
    v2.objects[a1] = a2
    u25(v2)
end

function v1.remove(a1) -- Line: 66 -- upvalues: u24 (val), table (val), u25 (val) -- types: a1: string
    local v1 = u24()
    if not v1.objects[a1] then
        return
    end
    local v2 = table.clone(v1)
    v2.objects = table.clone(v1.objects)
    v2.objects[a1] = nil
    u25(v2)
end

function v1.select(a1) -- Line: 78 -- upvalues: u24 (val), table (val), u25 (val) -- types: a1: string?
    local v1 = u24()
    if v1.selected == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.selected = a1
    u25(v2)
end

return v1