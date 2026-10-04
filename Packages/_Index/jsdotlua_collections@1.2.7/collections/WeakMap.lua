-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.WeakMap
-- Decompile time: 0.44 ms

require(script.Parent.Parent:WaitForChild("es7-types"))
local u9 = {}
u9.__index = u9

function u9.new() -- Line: 19 -- upvalues: u9 (val)
    return (setmetatable({_weakMap = setmetatable({}, {__mode = "k"})}, u9))
end

function u9.get(a1, a2) -- Line: 24
    return a1._weakMap[a2]
end

function u9.set(a1, a2, a3) -- Line: 28
    a1._weakMap[a2] = a3
    return a1
end

function u9.has(a1, a2) -- Line: 33
    return a1._weakMap[a2] ~= nil
end

return u9