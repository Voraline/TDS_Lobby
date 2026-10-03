-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberSuspenseContext.new
-- Decompile time: 0.60 ms

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local createCursor = v1.createCursor
local push = v1.push
local pop = v1.pop
local v2 = {InvisibleParentSuspenseContext = 1, ForceSuspenseFallback = 2}
local u24 = createCursor(0)
v2.suspenseStackCursor = u24

function v2.hasSuspenseContext(a1, a2) -- Line: 59 -- types: a1: number, a2: number
    return bit32.band(a1, a2) ~= 0
end

function v2.setDefaultShallowSuspenseContext(a1) -- Line: 66 -- types: a1: number
    return (bit32.band(a1, 1))
end

function v2.setShallowSuspenseContext(a1, a2) -- Line: 72 -- types: a1: number, a2: number
    return (bit32.bor(bit32.band(a1, 1), a2))
end

function v2.addSubtreeSuspenseContext(a1, a2) -- Line: 82 -- types: a1: number, a2: number
    return (bit32.bor(a1, a2))
end

function v2.pushSuspenseContext(a1, a2) -- Line: 89 -- upvalues: push (val), u24 (val) -- types: a2: number
    push(u24, a2, a1)
end

function v2.popSuspenseContext(a1) -- Line: 93 -- upvalues: pop (val), u24 (val)
    pop(u24, a1)
end

return v2