-- Script path: ReplicatedStorage.Shared.Modules.Middleware
-- Decompile time: 0.87 ms

local u0 = {}

function u0.new() -- Line: 126 -- upvalues: u0 (val)
    return (setmetatable({_registry = {}}, {__index = u0}))
end

function u0.use(a1, a2, a3, a4) -- Line: 132 -- types: a1: table, a3: function, a4: number?
    local u6 = a1._registry[a2]
    if not u6 then
        u6 = {}
        a1._registry[a2] = u6
    end
    if not table.find(u6, a3) then
        if not a4 then
            table.insert(u6, a3)
        else
            table.insert(u6, a4, a3)
        end
    end
    return function() -- Line: 148 -- upvalues: u6 (ref), a3 (val)
        local v1 = table.find(u6, a3)
        if v1 then
            table.remove(u6, v1)
        end
    end
end

function u0.run(a1, a2, a3) -- Line: 157 -- types: a1: table, a3: table
    local next
    local u4 = a1._registry[a2]
    if not u4 then
        return
    end
    local u5 = 0

    function next() -- Line: 165 -- upvalues: u5 (ref), u4 (val), a3 (val), next (val)
        u5 = u5 + 1
        local v1 = u4[u5]
        if v1 then
            v1(a3, next)
        end
    end

    u5 = u5 + 1
    local v1 = u4[u5]
    if v1 then
        v1(a3, next)
    end
end

return (u0.new())