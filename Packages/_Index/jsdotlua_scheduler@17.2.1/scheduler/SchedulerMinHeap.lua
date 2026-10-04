-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_scheduler@17.2.1.scheduler.SchedulerMinHeap
-- Decompile time: 1.46 ms

local v1 = {}
local u1 = nil
local u2 = nil
local u3 = nil

function v1.push(a1, a2) -- Line: 22 -- upvalues: u2 (ref) -- types: a1: table, a2: table
    local v1 = #a1 + 1
    a1[v1] = a2
    u2(a1, a2, v1)
end

function v1.peek(a1) -- Line: 29 -- types: a1: table
    return a1[1]
end

function v1.pop(a1) -- Line: 33 -- upvalues: u3 (ref) -- types: a1: table
    local v1 = a1[1]
    if v1 == nil then
        return nil
    end
    local v2 = a1[#a1]
    a1[#a1] = nil
    if v2 ~= v1 then
        a1[1] = v2
        u3(a1, v2, 1)
    end
    return v1
end

function u2(a1, a2, a3) -- Line: 49 -- upvalues: u1 (ref) -- types: a1: table, a2: table, a3: number
    local v1, v2
    while true do
        v1 = math.floor(a3 / 2)
        v2 = a1[v1]
        if v2 == nil or not (0 < (u1(v2, a2))) then
            break
        end
        a1[v1] = a2
        a1[a3] = v2
    end
end

function u3(a1, a2, a3) -- Line: 65 -- upvalues: u1 (ref) -- types: a1: table, a2: table, a3: number
    local v1, v2, v3, v4
    local v5 = #a1
    local v6, v7, v8 = a3, a1, a2
    while v6 < v5 do
        v1 = v6 * 2
        v2 = v7[v1]
        v3 = v1 + 1
        v4 = v7[v3]
        if v2 ~= nil and (u1(v2, v8)) < 0 then
            if v4 == nil or not ((u1(v4, v2)) < 0) then
                v7[v6] = v2
                v7[v1] = v8
                v6 = v1
            else
                v7[v6] = v4
                v7[v3] = v8
                v6 = v3
            end
            continue
        end
        if v4 ~= nil and (u1(v4, v8)) < 0 then
            v7[v6] = v4
            v7[v3] = v8
            v6 = v3
            continue
        end
        return
    end
end

function u1(a1, a2) -- Line: 95 -- types: a1: table, a2: table
    local v1 = a1.sortIndex - a2.sortIndex
    if v1 == 0 then
        return a1.id - a2.id
    end
    return v1
end

return v1