-- Script path: ReplicatedStorage.Packages.Fusion.Animation.Tween
-- Decompile time: 1.34 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
require(Parent.Types)
local TweenScheduler = require(Parent.Animation.TweenScheduler)
local useDependency = require(Parent.Dependencies.useDependency)
local initDependency = require(Parent.Dependencies.initDependency)
local logError = require(Parent.Logging.logError)
local logErrorNonFatal = require(Parent.Logging.logErrorNonFatal)
local xtypeof = require(Parent.Utility.xtypeof)
local v1 = {}
local u34 = {__index = v1}
local u35 = {__mode = "k"}

function v1:get(a2) -- Line: 27 -- upvalues: useDependency (val) -- types: self: table, a2: boolean?
    if a2 ~= false then
        useDependency(self)
    end
    return self._currentValue
end

function v1.update(a1) -- Line: 38 -- upvalues: logErrorNonFatal (val), TweenScheduler (val)
    local v1 = a1._goalState:get(false)
    if v1 == a1._nextValue and not a1._currentlyAnimating then
        return false
    end
    local _tweenInfo = a1._tweenInfo
    if a1._tweenInfoIsState then
        _tweenInfo = _tweenInfo:get()
    end
    if typeof(_tweenInfo) ~= "TweenInfo" then
        logErrorNonFatal("mistypedTweenInfo", nil, (typeof(_tweenInfo)))
        return false
    end
    a1._prevValue = a1._currentValue
    a1._nextValue = v1
    a1._currentTweenStartTime = os.clock()
    a1._currentTweenInfo = _tweenInfo
    local v2 = _tweenInfo.DelayTime + _tweenInfo.Time
    if _tweenInfo.Reverses then
        v2 = v2 + _tweenInfo.Time
    end
    a1._currentTweenDuration = v2 * (_tweenInfo.RepeatCount + 1)
    TweenScheduler.add(a1)
    return false
end

return function(a1, a2) -- Line: 77 -- upvalues: xtypeof (val), logError (val), u35 (val), u34 (val), initDependency (val)
    local v1
    local v2 = a1:get(false)
    if a2 == nil then
        a2 = TweenInfo.new()
    end
    local v3 = {[a1] = true}
    if xtypeof(a2) == "State" then
        v3[a2] = true
    end
    local v4 = a2
    if v1 then
        v4 = v4:get()
    end
    if typeof(v4) ~= "TweenInfo" then
        logError("mistypedTweenInfo", nil, (typeof(v4)))
    end
    local v5 = {
        type = "State",
        kind = "Tween",
        _currentTweenDuration = 0,
        _currentTweenStartTime = 0,
        _currentlyAnimating = false,
        dependencySet = v3,
        dependentSet = setmetatable({}, u35),
        _goalState = a1,
        _tweenInfo = a2,
        _tweenInfoIsState = v1,
        _prevValue = v2,
        _nextValue = v2,
        _currentValue = v2,
        _currentTweenInfo = a2,
    }
    local v6 = setmetatable(v5, u34)
    initDependency(v6)
    a1.dependentSet[v6] = true
    return v6
end