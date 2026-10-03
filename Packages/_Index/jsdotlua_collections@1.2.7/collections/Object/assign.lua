-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.assign
-- Decompile time: 0.91 ms

local None = require(script.Parent:WaitForChild("None"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1, a2, a3, a4, ...) -- Line: 12 -- upvalues: None (val)
    local v1
    if a2 ~= nil and typeof(a2) == "table" then
        for k, v in pairs(a2) do
            if v ~= None then
                a1[k] = v
            else
                a1[k] = nil
            end
        end
    end
    if a3 ~= nil and typeof(a3) == "table" then
        for k2, i in pairs(a3) do
            if i ~= None then
                a1[k2] = i
            else
                a1[k2] = nil
            end
        end
    end
    if a4 ~= nil and typeof(a4) == "table" then
        for k3, j in pairs(a4) do
            if j ~= None then
                a1[k3] = j
            else
                a1[k3] = nil
            end
        end
    end
    for k4 = 1, (select("#", ...)) do
        v1 = select(k4, ...)
        if v1 ~= nil and typeof(v1) == "table" then
            for k5, n in pairs(v1) do
                if n ~= None then
                    a1[k5] = n
                else
                    a1[k5] = nil
                end
            end
        end
    end
    return a1
end