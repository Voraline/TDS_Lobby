-- Script path: ReplicatedStorage.Packages.Fusion.State.ForPairs
-- Decompile time: 5.89 ms

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

local function forPairsCleanup(a1, a2, a3) -- Line: 30 -- upvalues: cleanup (val)
    cleanup(a1)
    cleanup(a2)
    if a3 then
        cleanup(a3)
    end
end

function v1:get(a2) -- Line: 43 -- upvalues: useDependency (val) -- types: self: table, a2: boolean?
    if a2 ~= false then
        useDependency(self)
    end
    return self._outputTable
end

function v1:update() -- Line: 68
    -- upvalues: u39 (val), captureDependencies (val), parseError (val), logErrorNonFatal (val), logError (val)
    local dependencySet_2, dependencySet_3, oldDependencySet, oldDependencySet_2, result, result_2, success, success_2, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local _inputIsState = self._inputIsState
    local _oldInputTable = self._oldInputTable
    local _inputTable = self._inputTable
    local _keyIOMap = self._keyIOMap
    local _meta = self._meta
    if _inputIsState then
        _inputTable = _inputTable:get(false)
    end
    local v10 = false
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
    local _outputTable = self._outputTable
    local _oldOutputTable = self._oldOutputTable
    self._oldOutputTable = _outputTable
    self._outputTable = _oldOutputTable
    local _oldOutputTable_2 = self._oldOutputTable
    local _outputTable_2 = self._outputTable
    table.clear(_outputTable_2)
    local v11 = self
    for k2, v in pairs(_inputTable) do
        v1 = v11._keyData[k2]
        if v1 == nil then
            v1 = {
                dependencySet = setmetatable({}, u39),
                oldDependencySet = setmetatable({}, u39),
                dependencyValues = setmetatable({}, u39),
            }
            v11._keyData[k2] = v1
        end
        v2 = _oldInputTable[k2] ~= v
        if not v2 then
            for k3, i in pairs(v1.dependencyValues) do
                if i ~= k3:get(false) then
                    v2 = true
                    break
                end
            end
        end
        if not v2 then
            v3 = _keyIOMap[k2]
            if _outputTable_2[v3] ~= nil then
                v4 = nil
                v5 = nil
                for k4, j in pairs(_keyIOMap) do
                    if v3 == j then
                        v5 = _inputTable[k4]
                        if v5 ~= nil then
                            v4 = k4
                            break
                        end
                    end
                end
                if v4 ~= nil then
                    logError("forPairsKeyCollision", nil, tostring(v3), tostring(v4), tostring(v5), tostring(k2), (tostring(v)))
                end
            end
            _outputTable_2[v3] = _oldOutputTable_2[v3]
        else
            dependencySet_2 = v1.dependencySet
            oldDependencySet = v1.oldDependencySet
            v1.oldDependencySet = dependencySet_2
            v1.dependencySet = oldDependencySet
            table.clear(v1.dependencySet)
            v3, v4, v5, v6 = captureDependencies(v1.dependencySet, v11._processor, k2, v)
            if not v3 then
                dependencySet_3 = v1.dependencySet
                oldDependencySet_2 = v1.oldDependencySet
                v1.oldDependencySet = dependencySet_3
                v1.dependencySet = oldDependencySet_2
                logErrorNonFatal("forPairsProcessorError", v4)
            else
                v7 = _oldOutputTable_2[v4]
                if v7 ~= v5 then
                    v10 = true
                    if v7 ~= nil then
                        success_2, result_2 = xpcall(v11._destructor, parseError, v4, v7, _meta[v4])
                        if not success_2 then
                            logErrorNonFatal("forPairsDestructorError", result_2)
                        end
                    end
                end
                if _outputTable_2[v4] ~= nil then
                    v8 = nil
                    v9 = nil
                    for k5, k6 in pairs(_keyIOMap) do
                        if k6 == v4 then
                            v9 = _inputTable[k5]
                            if v9 ~= nil then
                                v8 = k5
                                break
                            end
                        end
                    end
                    if v8 ~= nil then
                        logError("forPairsKeyCollision", nil, tostring(v4), tostring(v8), tostring(v9), tostring(k2), (tostring(v)))
                    end
                end
                _oldInputTable[k2] = v
                _keyIOMap[k2] = v4
                _meta[v4] = v6
                _oldOutputTable_2[v4] = v5
                _outputTable_2[v4] = v5
            end
        end
    end
    for k7 in pairs(_oldOutputTable_2) do
        if _outputTable_2[k7] == nil then
            v1 = _oldOutputTable_2[k7]
            v2 = _meta[k7]
            if v1 ~= nil then
                success, result = xpcall(v11._destructor, parseError, k7, v1, v2)
                if not success then
                    logErrorNonFatal("forPairsDestructorError", result)
                end
            end
            _meta[k7] = nil
            v11._keyData[k7] = nil
            v10 = true
        end
    end
    for k8 in pairs(_oldInputTable) do
        if _inputTable[k8] == nil then
            _oldInputTable[k8] = nil
            _keyIOMap[k8] = nil
        end
    end
    return v10
end

return function(a1, a2, a3) -- Line: 313
    -- upvalues: forPairsCleanup (val), u39 (val), u38 (val), initDependency (val)
    if a3 == nil then
        a3 = forPairsCleanup
    end
    local v1 = false
    if a1.type == "State" then
        v1 = typeof(a1.get) == "function"
    end
    local v2 = {
        type = "State",
        kind = "ForPairs",
        dependencySet = {},
        dependentSet = setmetatable({}, u39),
        _oldDependencySet = {},
        _processor = a2,
        _destructor = a3,
        _inputIsState = v1,
        _inputTable = a1,
        _oldInputTable = {},
        _outputTable = {},
        _oldOutputTable = {},
        _keyIOMap = {},
        _keyData = {},
        _meta = {},
    }
    local v3 = setmetatable(v2, u38)
    initDependency(v3)
    v3:update()
    return v3
end