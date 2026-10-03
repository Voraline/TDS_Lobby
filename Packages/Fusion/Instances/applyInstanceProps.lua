-- Script path: ReplicatedStorage.Packages.Fusion.Instances.applyInstanceProps
-- Decompile time: 1.91 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local onDestroy = require(Parent.Instances.onDestroy)
local cleanup = require(Parent.Utility.cleanup)
local xtypeof = require(Parent.Utility.xtypeof)
local logError = require(Parent.Logging.logError)
local logWarn = require(Parent.Logging.logWarn)
local Observer = require(Parent.State.Observer)

local function setProperty_unsafe(a1, a2, a3) -- Line: 25 -- types: a1: userdata, a2: string
    a1[a2] = a3
end

local function testPropertyAssignable(a1, a2) -- Line: 29 -- types: a1: userdata, a2: string
    a1[a2] = a1[a2]
end

local function setProperty(a1, a2, a3) -- Line: 33
    -- upvalues: setProperty_unsafe (val), testPropertyAssignable (val), logError (val)
    if not pcall(setProperty_unsafe, a1, a2, a3) then
        if not pcall(testPropertyAssignable, a1, a2) then
            logError("cannotAssignProperty", nil, a1.ClassName, a2)
            return
        end
        local v1 = typeof(a3)
        logError("invalidPropertyType", nil, a1.ClassName, a2, typeof(a1[a2]), v1)
    end
end

local function bindProperty(a1, a2, a3, a4) -- Line: 48
    -- upvalues: xtypeof (val), setProperty (val), Observer (val)
    if xtypeof(a3) ~= "State" then
        setProperty(a1.instance, a2, a3)
        return
    end
    local u7 = false
    setProperty(a1.instance, a2, a3:get(false))
    table.insert(a4, (Observer(a3):onChange(function() -- Line: 52 -- upvalues: u7 (ref), setProperty (upval), a1 (val), a2 (val), a3 (val)
        if not u7 then
            u7 = true
            task.defer(function() -- Line: 55 -- upvalues: u7 (upval), setProperty (upval), a1 (upval), a2 (upval), a3 (upval)
                u7 = false
                setProperty(a1.instance, a2, a3:get(false))
            end)
        end
    end)))
end

return function(a1, a2) -- Line: 70
    -- upvalues: logWarn (val), xtypeof (val), bindProperty (val), logError (val), onDestroy (val), cleanup (val)
    local stage, v1, v2
    if a2.instance == nil then
        return logWarn("applyPropsNilRef")
    end
    local v3 = {self = {}, descendants = {}, ancestor = {}, observer = {}}
    local v4 = {}
    for k, v in pairs(a1) do
        v2 = xtypeof(k)
        if v2 ~= "string" then
            if v2 ~= "SpecialKey" then
                logError("unrecognisedPropertyKey", nil, xtypeof(k))
            else
                stage = k.stage
                v1 = v3[stage]
                if v1 ~= nil then
                    v1[k] = v
                else
                    logError("unrecognisedPropertyStage", nil, stage)
                end
            end
        elseif k ~= "Parent" then
            bindProperty(a2, k, v, v4)
        end
    end
    for k2, i in pairs(v3.self) do
        k2:apply(i, a2, v4)
    end
    for k3, j in pairs(v3.descendants) do
        k3:apply(j, a2, v4)
    end
    if a1.Parent ~= nil then
        bindProperty(a2, "Parent", a1.Parent, v4)
    end
    for k4, k5 in pairs(v3.ancestor) do
        k4:apply(k5, a2, v4)
    end
    for k6, n in pairs(v3.observer) do
        k6:apply(n, a2, v4)
    end
    onDestroy(a2, cleanup, v4)
end