-- Script path: ReplicatedStorage.Packages.Fusion.Dependencies.captureDependencies
-- Decompile time: 0.52 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local parseError = require(Parent.Logging.parseError)
local sharedState = require(Parent.Dependencies.sharedState)
local initialisedStack = sharedState.initialisedStack
local u15 = 0
return function(a1, a2, ...) -- Line: 25
    -- upvalues: sharedState (val), u15 (ref), initialisedStack (val), parseError (val)
    local dependencySet = sharedState.dependencySet
    sharedState.dependencySet = a1
    local v1 = sharedState
    v1.initialisedStackSize = v1.initialisedStackSize + 1
    local initialisedStackSize = sharedState.initialisedStackSize
    if not (u15 < initialisedStackSize) then
        table.clear(initialisedStack[initialisedStackSize])
    else
        initialisedStack[initialisedStackSize] = {}
        u15 = initialisedStackSize
    end
    local v2 = table.pack(xpcall(a2, parseError, ...))
    sharedState.dependencySet = dependencySet
    local v3 = sharedState
    v3.initialisedStackSize = v3.initialisedStackSize - 1
    return table.unpack(v2, 1, v2.n)
end