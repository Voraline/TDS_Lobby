-- Script path: ReplicatedStorage.Packages.Fusion.State.Computed
-- Decompile time: 1.15 ms

local Parent = script.Parent.Parent
require(Parent.Types)
local captureDependencies = require(Parent.Dependencies.captureDependencies)
local initDependency = require(Parent.Dependencies.initDependency)
local useDependency = require(Parent.Dependencies.useDependency)
local logErrorNonFatal = require(Parent.Logging.logErrorNonFatal)
local isSimilar = require(Parent.Utility.isSimilar)
local v1 = {}
local u27 = {__index = v1}
local u28 = {__mode = "k"}

function v1.get(a1, a2) -- Line: 26 -- upvalues: useDependency (val) -- types: a1: table, a2: boolean?
    if a2 ~= false then
        useDependency(a1)
    end
    return a1._value
end

function v1:update() -- Line: 37 -- upvalues: captureDependencies (val), isSimilar (val), logErrorNonFatal (val)
    for k in pairs(self.dependencySet) do
        k.dependentSet[self] = nil
    end
    local dependencySet = self.dependencySet
    local _oldDependencySet = self._oldDependencySet
    self._oldDependencySet = dependencySet
    self.dependencySet = _oldDependencySet
    table.clear(self.dependencySet)
    local v1, v2 = captureDependencies(self.dependencySet, self._callback)
    if v1 then
        local _value = self._value
        self._value = v2
        for k3 in pairs(self.dependencySet) do
            k3.dependentSet[self] = true
        end
        return not isSimilar(_value, v2)
    end
    logErrorNonFatal("computedCallbackError", v2)
    local dependencySet_2 = self.dependencySet
    local _oldDependencySet_2 = self._oldDependencySet
    self._oldDependencySet = dependencySet_2
    self.dependencySet = _oldDependencySet_2
    for k2 in pairs(self.dependencySet) do
        k2.dependentSet[self] = true
    end
    return false
end

return function(a1) -- Line: 79 -- upvalues: u28 (val), u27 (val), initDependency (val) -- types: a1: function
    local v1 = {
        type = "State",
        kind = "Computed",
        dependencySet = {},
        dependentSet = setmetatable({}, u28),
        _oldDependencySet = {},
        _callback = a1,
    }
    local v2 = setmetatable(v1, u27)
    initDependency(v2)
    v2:update()
    return v2
end