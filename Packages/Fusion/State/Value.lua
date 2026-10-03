-- Script path: ReplicatedStorage.Packages.Fusion.State.Value
-- Decompile time: 0.71 ms

local Parent = script.Parent.Parent
require(Parent.Types)
local useDependency = require(Parent.Dependencies.useDependency)
local initDependency = require(Parent.Dependencies.initDependency)
local updateAll = require(Parent.Dependencies.updateAll)
local isSimilar = require(Parent.Utility.isSimilar)
local v1 = {}
local u23 = {__index = v1}
local u24 = {__mode = "k"}

function v1.get(a1, a2) -- Line: 25 -- upvalues: useDependency (val) -- types: a1: table, a2: boolean?
    if a2 ~= false then
        useDependency(a1)
    end
    return a1._value
end

function v1.set(a1, a2, a3) -- Line: 39 -- upvalues: isSimilar (val), updateAll (val) -- types: a1: table, a3: boolean?
    local v1 = isSimilar(a1._value, a2)
    a1._value = a2
    if not v1 or a3 then
        updateAll(a1)
    end
end

return function(a1) -- Line: 50 -- upvalues: u24 (val), u23 (val), initDependency (val)
    local v1 = {type = "State", kind = "Value", dependentSet = setmetatable({}, u24), _value = a1}
    local v2 = setmetatable(v1, u23)
    initDependency(v2)
    return v2
end