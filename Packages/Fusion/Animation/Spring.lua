-- Script path: ReplicatedStorage.Packages.Fusion.Animation.Spring
-- Decompile time: 2.31 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
require(Parent.Types)
local logError = require(Parent.Logging.logError)
local logErrorNonFatal = require(Parent.Logging.logErrorNonFatal)
local unpackType = require(Parent.Animation.unpackType)
local SpringScheduler = require(Parent.Animation.SpringScheduler)
local useDependency = require(Parent.Dependencies.useDependency)
local initDependency = require(Parent.Dependencies.initDependency)
local updateAll = require(Parent.Dependencies.updateAll)
local xtypeof = require(Parent.Utility.xtypeof)
local unwrap = require(Parent.State.unwrap)
local v1 = {}
local u46 = {__index = v1}
local u47 = {__mode = "k"}

function v1:get(a2) -- Line: 30 -- upvalues: useDependency (val) -- types: self: table, a2: boolean?
    if a2 ~= false then
        useDependency(self)
    end
    return self._currentValue
end

function v1.setPosition(a1, a2) -- Line: 44
    -- upvalues: logError (val), unpackType (val), SpringScheduler (val), updateAll (val)
    local v1 = typeof(a2)
    if v1 ~= a1._currentType then
        logError("springTypeMismatch", nil, v1, a1._currentType)
    end
    a1._springPositions = unpackType(a2, v1)
    a1._currentValue = a2
    SpringScheduler.add(a1)
    updateAll(a1)
end

function v1.setVelocity(a1, a2) -- Line: 63 -- upvalues: logError (val), unpackType (val), SpringScheduler (val)
    local v1 = typeof(a2)
    if v1 ~= a1._currentType then
        logError("springTypeMismatch", nil, v1, a1._currentType)
    end
    a1._springVelocities = unpackType(a2, v1)
    SpringScheduler.add(a1)
end

function v1.addVelocity(a1, a2) -- Line: 80 -- upvalues: logError (val), unpackType (val), SpringScheduler (val)
    local _springVelocities
    local v1 = typeof(a2)
    if v1 ~= a1._currentType then
        logError("springTypeMismatch", nil, v1, a1._currentType)
    end
    for i, v in ipairs((unpackType(a2, v1))) do
        _springVelocities = a1._springVelocities
        _springVelocities[i] = _springVelocities[i] + v
    end
    SpringScheduler.add(a1)
end

function v1:update() -- Line: 97
    -- upvalues: unwrap (val), logErrorNonFatal (val), unpackType (val), SpringScheduler (val)
    local v1
    local v2 = self._goalState:get(false)
    if v2 == self._goalValue then
        local v3 = unwrap(self._damping)
        if typeof(v3) ~= "number" then
            logErrorNonFatal("mistypedSpringDamping", nil, (typeof(v3)))
        elseif not (v3 < 0) then
            self._currentDamping = v3
        else
            logErrorNonFatal("invalidSpringDamping", nil, v3)
        end
        v1 = unwrap(self._speed)
        if typeof(v1) ~= "number" then
            logErrorNonFatal("mistypedSpringSpeed", nil, (typeof(v1)))
        elseif not (v1 < 0) then
            self._currentSpeed = v1
        else
            logErrorNonFatal("invalidSpringSpeed", nil, v1)
        end
        return false
    end
    self._goalValue = v2
    local _currentType = self._currentType
    v1 = typeof(v2)
    self._currentType = v1
    local v4 = unpackType(v2, v1)
    local v5 = #v4
    self._springGoals = v4
    if v1 == _currentType then
        if v5 == 0 then
            self._currentValue = self._goalValue
            return true
        end
        SpringScheduler.add(self)
        return false
    end
    self._currentValue = self._goalValue
    local v6 = table.create(v5, 0)
    local v7 = table.create(v5, 0)
    for i, v in ipairs(v4) do
        v6[i] = v
    end
    self._springPositions = v6
    self._springVelocities = v7
    SpringScheduler.remove(self)
    return true
end

return function(a1, a2, a3) -- Line: 165 -- upvalues: xtypeof (val), u47 (val), unwrap (val), u46 (val), initDependency (val)
    if a2 == nil then
        a2 = 10
    end
    local v1 = if a3 ~= nil then a3 else 1
    local v2 = {[a1] = true}
    if xtypeof(a2) == "State" then
        v2[a2] = true
    end
    if xtypeof(v1) == "State" then
        v2[v1] = true
    end
    local v3 = {
        type = "State",
        kind = "Spring",
        dependencySet = v2,
        dependentSet = setmetatable({}, u47),
        _speed = a2,
        _damping = v1,
        _goalState = a1,
        _currentSpeed = unwrap(a2),
        _currentDamping = unwrap(v1),
    }
    local v4 = setmetatable(v3, u46)
    initDependency(v4)
    a1.dependentSet[v4] = true
    v4:update()
    return v4
end