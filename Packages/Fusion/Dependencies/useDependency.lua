-- Script path: ReplicatedStorage.Packages.Fusion.Dependencies.useDependency
-- Decompile time: 0.30 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local sharedState = require(Parent.Dependencies.sharedState)
local initialisedStack = sharedState.initialisedStack
return function(a1) -- Line: 14 -- upvalues: sharedState (val), initialisedStack (val)
    local dependencySet = sharedState.dependencySet
    if dependencySet ~= nil then
        local initialisedStackSize = sharedState.initialisedStackSize
        if initialisedStackSize > 0 and initialisedStack[initialisedStackSize][a1] ~= nil then
            return
        end
        dependencySet[a1] = true
    end
end