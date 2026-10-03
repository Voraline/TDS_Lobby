-- Script path: ReplicatedStorage.Shared.Modules.GuiLib.Utilities.Maid
-- Decompile time: 1.31 ms

local u0 = {}

u0["function"] = function(a1) -- Line: 2
    a1()
end

function u0.table(a1) -- Line: 5
    for i, j in {"Disconnect", "Destroy", "destroy", "disconnect"} do
        if a1[j] then
            a1[j](a1)
            return
        end
    end
end

function u0.RBXScriptConnection(a1) -- Line: 20
    a1:Disconnect()
end

function u0.Instance(a1) -- Line: 23
    a1:Destroy()
end

function u0.thread(a1) -- Line: 26
    task.cancel(a1)
end

local u6 = {}
u6.__index = u6

function u6.Mark(a1, a2, a3) -- Line: 39 -- upvalues: u0 (val)
    if not u0[typeof(a2)] then
        error(("Maid does not support type \"%s\""):format((typeof(a2))), 2)
        return
    end
    a1.trash[#a1.trash + 1] = a2
    if not a3 then
        return
    end
    a1.keys[a3] = a2
end

function u6.Get(a1, a2) -- Line: 50
    return a1.keys[a2]
end

function u6.Unmark(a1, a2) -- Line: 54
    if not a2 then
        a1.trash = {}
        return
    end
    local trash = a1.trash
    local v1 = #trash
    for i = 1, v1 do
        if trash[i] == a2 then
            table.remove(trash, i)
            a1.keys[a2] = nil
            return
        end
    end
end

function u6.Sweep(a1) -- Line: 69 -- upvalues: u0 (val)
    local v1
    local trash = a1.trash
    local v2 = #trash
    for i = 1, v2 do
        v1 = trash[i]
        u0[typeof(v1)](v1)
    end
    a1.trash = {}
    a1.keys = {}
end

function u6.new() -- Line: 79 -- upvalues: u6 (val)
    local v1 = setmetatable({}, u6)
    v1.trash = {}
    v1.keys = {}
    return v1
end

u6.Destroy = u6.Sweep
return u6