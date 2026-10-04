-- Script path: ReplicatedStorage.Packages.Fusion.State.ForKeys
-- Decompile time: 6.07 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
require(Parent.Types)
local captureDependencies = require(Parent.Dependencies.captureDependencies)
local initDependency = require(Parent.Dependencies.initDependency)
local useDependency = require(Parent.Dependencies.useDependency)
local parseError = require(Parent.Logging.parseError)
local logErrorNonFatal = require(Parent.Logging.logErrorNonFatal)
local logError = require(Parent.Logging.logError)
local cleanup = require(Parent.Utility.cleanup)
local v1 = {}
local u38 = {__index = v1}
local u39 = {__mode = "k"}

local function forKeysCleanup(a1, a2) -- Line: 30 -- upvalues: cleanup (val)
    cleanup(a1)
    if a2 then
        cleanup(a2)
    end
end

function v1:get(a2) -- Line: 42 -- upvalues: useDependency (val) -- types: self: table, a2: boolean?
    if a2 ~= false then
        useDependency(self)
    end
    return self._outputTable
end

function v1:update() -- Line: 65
    -- upvalues: u39 (val), captureDependencies (val), logError (val), logErrorNonFatal (val), parseError (val)
    local dependencySet_2, dependencySet_3, oldDependencySet, oldDependencySet_2, result, success, v1, v2, v3, v4, v5, v6
    local _inputIsState = self._inputIsState
    local _oldInputTable = self._oldInputTable
    local _inputTable = self._inputTable
    local _keyOIMap = self._keyOIMap
    local _outputTable = self._outputTable
    local _meta = self._meta
    if _inputIsState then
        _inputTable = _inputTable:get(false)
    end
    local v7 = false
    for k in pairs(self.dependencySet) do
        k.dependentSet[self] = nil
    end
    local dependencySet = self.dependencySet
    local _oldDependencySet = self._oldDependencySet
    self._oldDependencySet = dependencySet
    self.dependencySet = _oldDependencySet
    table.clear(self.dependencySet)
    if _inputIsState then
        self._inputTable.dependentSet[self] = true
        self.dependencySet[self._inputTable] = true
    end
    local v8 = self
    for k2, v in pairs(_inputTable) do
        v1 = v8._keyData[k2]
        if v1 == nil then
            v1 = {
                dependencySet = setmetatable({}, u39),
                oldDependencySet = setmetatable({}, u39),
                dependencyValues = setmetatable({}, u39),
            }
            v8._keyData[k2] = v1
        end
        v2 = _oldInputTable[k2] == nil
        if not v2 then
            for k3, i in pairs(v1.dependencyValues) do
                if i ~= k3:get(false) then
                    v2 = true
                    break
                end
            end
        end
        if v2 then
            dependencySet_2 = v1.dependencySet
            oldDependencySet = v1.oldDependencySet
            v1.oldDependencySet = dependencySet_2
            v1.dependencySet = oldDependencySet
            table.clear(v1.dependencySet)
            v3, v4, v5 = captureDependencies(v1.dependencySet, v8._processor, k2)
            if not v3 then
                dependencySet_3 = v1.dependencySet
                oldDependencySet_2 = v1.oldDependencySet
                v1.oldDependencySet = dependencySet_3
                v1.dependencySet = oldDependencySet_2
                logErrorNonFatal("forKeysProcessorError", v4)
            else
                v6 = _keyOIMap[v4]
                if v6 ~= k2 and _inputTable[v6] ~= nil then
                    logError("forKeysKeyCollision", nil, tostring(v4), tostring(v6), (tostring(v4)))
                end
                _oldInputTable[k2] = v
                _meta[v4] = v5
                _keyOIMap[v4] = k2
                _outputTable[v4] = v
                v7 = true
            end
        end
    end
    for k4, j in pairs(_keyOIMap) do
        if _inputTable[j] == nil then
            v1 = _meta[k4]
            success, result = xpcall(v8._destructor, parseError, k4, v1)
            if not success then
                logErrorNonFatal("forKeysDestructorError", result)
            end
            _oldInputTable[j] = nil
            _meta[k4] = nil
            _keyOIMap[k4] = nil
            _outputTable[k4] = nil
            v8._keyData[j] = nil
            v7 = true
        end
    end
    return v7
end

return function(a1, a2, a3) -- Line: 195
    -- upvalues: forKeysCleanup (val), u39 (val), u38 (val), initDependency (val)
    if a3 == nil then
        a3 = forKeysCleanup
    end
    local v1 = false
    if a1.type == "State" then
        v1 = typeof(a1.get) == "function"
    end
    local v2 = {
        type = "State",
        kind = "ForKeys",
        dependencySet = {},
        dependentSet = setmetatable({}, u39),
        _oldDependencySet = {},
        _processor = a2,
        _destructor = a3,
        _inputIsState = v1,
        _inputTable = a1,
        _oldInputTable = {},
        _outputTable = {},
        _keyOIMap = {},
        _keyData = {},
        _meta = {},
    }
    local v3 = setmetatable(v2, u38)
    initDependency(v3)
    v3:update()
    return v3
end