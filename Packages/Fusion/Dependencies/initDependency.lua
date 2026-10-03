-- Script path: ReplicatedStorage.Packages.Fusion.Dependencies.initDependency
-- Decompile time: 0.28 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local sharedState = require(Parent.Dependencies.sharedState)
local initialisedStack = sharedState.initialisedStack
return function(a1) -- Line: 16 -- upvalues: sharedState (val), initialisedStack (val)
    local initialisedStackSize = sharedState.initialisedStackSize
    for i, v in ipairs(initialisedStack) do
        if initialisedStackSize < i then
            return
        end
        v[a1] = true
    end
end