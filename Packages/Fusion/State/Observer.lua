-- Script path: ReplicatedStorage.Packages.Fusion.State.Observer
-- Decompile time: 0.75 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
require(Parent.Types)
local initDependency = require(Parent.Dependencies.initDependency)
local v1 = {}
local u14 = {__index = v1}
local u15 = {}

function v1.update(a1) -- Line: 26
    for k, v in pairs(a1._changeListeners) do
        task.spawn(v)
    end
    return false
end

function v1.onChange(a1, a2) -- Line: 41 -- upvalues: u15 (val) -- types: a1: table, a2: function
    local u2 = {}
    a1._numChangeListeners = a1._numChangeListeners + 1
    a1._changeListeners[u2] = a2
    u15[a1] = true
    local u8 = false
    return function() -- Line: 51 -- upvalues: u8 (ref), a1 (val), u2 (val), u15 (upval)
        if u8 then
            return
        end
        u8 = true
        a1._changeListeners[u2] = nil
        local v1 = a1
        v1._numChangeListeners = v1._numChangeListeners - 1
        if a1._numChangeListeners == 0 then
            u15[a1] = nil
        end
    end
end

return function(a1) -- Line: 66 -- upvalues: u14 (val), initDependency (val)
    local v1 = {
        type = "State",
        kind = "Observer",
        _numChangeListeners = 0,
        dependencySet = {[a1] = true},
        dependentSet = {},
        _changeListeners = {},
    }
    local v2 = setmetatable(v1, u14)
    initDependency(v2)
    a1.dependentSet[v2] = true
    return v2
end