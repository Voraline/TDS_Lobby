-- Script path: ReplicatedStorage.Packages.Fusion.State.ForValues
-- Decompile time: 7.04 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
require(Parent.Types)
local captureDependencies = require(Parent.Dependencies.captureDependencies)
local initDependency = require(Parent.Dependencies.initDependency)
local useDependency = require(Parent.Dependencies.useDependency)
local parseError = require(Parent.Logging.parseError)
local logErrorNonFatal = require(Parent.Logging.logErrorNonFatal)
local cleanup = require(Parent.Utility.cleanup)
local v1 = {}
local u34 = {__index = v1}
local u35 = {__mode = "k"}

local function forValuesCleanup(a1, a2) -- Line: 29 -- upvalues: cleanup (val)
    cleanup(a1)
    if a2 then
        cleanup(a2)
    end
end

function v1:get(a2) -- Line: 41 -- upvalues: useDependency (val) -- types: self: table, a2: boolean?
    if a2 ~= false then
        useDependency(self)
    end
    return self._outputTable
end

function v1:update() -- Line: 66
    -- upvalues: u35 (val), parseError (val), logErrorNonFatal (val), captureDependencies (val)
    local dependencySet_2, oldDependencySet, result, result_2, result_3, result_4, success, success_2, success_3, success_4, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local _inputIsState = self._inputIsState
    local _inputTable = self._inputTable
    local _oldValueCache = self._oldValueCache
    local _valueCache = self._valueCache
    local v10 = {}
    local v11 = {}
    local _meta = self._meta
    if _inputIsState then
        _inputTable = _inputTable:get(false)
    end
    local v12 = false
    for k in pairs(self.dependencySet) do
        k.dependentSet[self] = nil
    end
    local dependencySet = self.dependencySet
    local _oldDependencySet = self._oldDependencySet
    self._oldDependencySet = dependencySet
    self.dependencySet = _oldDependencySet
    table.clear(self.dependencySet)
    self._oldValueCache = _valueCache
    self._valueCache = _oldValueCache
    table.clear(_oldValueCache)
    if _inputIsState then
        self._inputTable.dependentSet[self] = true
        self.dependencySet[self._inputTable] = true
    end
    local v13 = self
    for k2, v in pairs(_inputTable) do
        v1 = _valueCache[v]
        v2 = _oldValueCache[v]
        v3 = v1 == nil
        v4 = v13._valueData[v]
        if v4 == nil then
            v4 = {
                dependencySet = setmetatable({}, u35),
                oldDependencySet = setmetatable({}, u35),
                dependencyValues = setmetatable({}, u35),
            }
            v13._valueData[v] = v4
        end
        if v2 == nil then
            if not v3 and v10[v] == nil then
                for k3, i in pairs(v4.dependencyValues) do
                    if i ~= k3:get(false) then
                        v3 = true
                        break
                    end
                end
                if not v3 then
                    v10[v] = true
                else
                    if type(v1) ~= "table" then
                        v1 = {v1}
                    end
                    for i2, j in ipairs(v1) do
                        v9 = _meta[j]
                        success_3, result_3 = xpcall(v13._destructor, parseError, j, v9)
                        if not success_3 then
                            logErrorNonFatal("forValuesDestructorError", result_3)
                        end
                        _meta[j] = nil
                    end
                    dependencySet_2 = v4.dependencySet
                    oldDependencySet = v4.oldDependencySet
                    v4.oldDependencySet = dependencySet_2
                    v4.dependencySet = oldDependencySet
                    table.clear(v4.dependencySet)
                    _valueCache[v] = nil
                    v1 = nil
                end
            end
        elseif type(v2) ~= "table" then
            v1 = v2
            v3 = false
        elseif not v3 and v10[v] == nil then
            for k4, k5 in pairs(v4.dependencyValues) do
                if k5 ~= k4:get(false) then
                    v3 = true
                    break
                end
            end
            if not v3 then
                v10[v] = true
            else
                if type(v1) ~= "table" then
                    v1 = {v1}
                end
                for i3, n in ipairs(v1) do
                    v9 = _meta[n]
                    success_3, result_3 = xpcall(v13._destructor, parseError, n, v9)
                    if not success_3 then
                        logErrorNonFatal("forValuesDestructorError", result_3)
                    end
                    _meta[n] = nil
                end
                dependencySet_2 = v4.dependencySet
                oldDependencySet = v4.oldDependencySet
                v4.oldDependencySet = dependencySet_2
                v4.dependencySet = oldDependencySet
                table.clear(v4.dependencySet)
                _valueCache[v] = nil
                v1 = nil
            end
        end
        if not v3 and type(v1) == "table" then
            v5 = v1
            v6 = #v5
            if not (v6 > 0) then
                v1 = nil
                v3 = true
            else
                v1 = v5[v6]
                table.remove(v5, v6)
            end
        end
        if v3 then
            if not v10[v] then
                v7, v8, v9 = captureDependencies(v4.dependencySet, v13._processor, v)
                v5 = v7
                v6 = v8
            else
                success_4, result_4, v9 = pcall(v13._processor, v)
                v5 = success_4
                v6 = result_4
            end
            if not v5 then
                logErrorNonFatal("forValuesProcessorError", v6)
            else
                v1 = v6
                _meta[v6] = v9
                v10[v] = true
                v12 = true
            end
        end
        if v1 ~= nil then
            if type(v1) == "userdata" then
                v5 = _oldValueCache[v]
                if not v5 then
                    _oldValueCache[v] = {}
                end
                table.insert(v5, v1)
            elseif type(v1) ~= "table" then
                _oldValueCache[v] = v1
            else
                v5 = _oldValueCache[v]
                if not v5 then
                    _oldValueCache[v] = {}
                end
                table.insert(v5, v1)
            end
            v11[k2] = v1
        end
    end
    for k6, m in pairs(_valueCache) do
        if type(m) == "table" then
            for i4, i5 in ipairs(m) do
                v6 = _meta[i5]
                success, result = xpcall(v13._destructor, parseError, i5, v6)
                if not success then
                    logErrorNonFatal("forValuesDestructorError", result)
                end
                _meta[i5] = nil
                v12 = true
            end
        elseif _oldValueCache[k6] ~= m then
            v1 = _meta[m]
            success_2, result_2 = xpcall(v13._destructor, parseError, m, v1)
            if not success_2 then
                logErrorNonFatal("forValuesDestructorError", result_2)
            end
            _meta[m] = nil
            v12 = true
        end
    end
    v13._outputTable = v11
    return v12
end

return function(a1, a2, a3) -- Line: 286
    -- upvalues: forValuesCleanup (val), u35 (val), u34 (val), initDependency (val)
    if a3 == nil then
        a3 = forValuesCleanup
    end
    local v1 = false
    if a1.type == "State" then
        v1 = typeof(a1.get) == "function"
    end
    local v2 = {
        type = "State",
        kind = "ForValues",
        dependencySet = {},
        dependentSet = setmetatable({}, u35),
        _oldDependencySet = {},
        _processor = a2,
        _destructor = a3,
        _inputIsState = v1,
        _inputTable = a1,
        _outputTable = {},
        _valueCache = {},
        _oldValueCache = {},
        _valueData = {},
        _meta = {},
    }
    local v3 = setmetatable(v2, u34)
    initDependency(v3)
    v3:update()
    return v3
end