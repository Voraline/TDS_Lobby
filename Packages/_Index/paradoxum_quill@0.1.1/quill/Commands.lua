-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Commands
-- Decompile time: 0.53 ms

local v1 = {}
local u1 = {}

function v1.register(a1, a2) -- Line: 6 -- upvalues: u1 (val) -- types: a1: string, a2: function
    u1[a1] = a2
end

function v1.execute(a1) -- Line: 10 -- upvalues: u1 (val) -- types: a1: string
    local v1 = u1[a1]
    if v1 == nil then
        warn((("[Quill.Commands] No handler registered for action \"%*\""):format(a1)))
        return false
    end
    local success, result = pcall(v1)
    if not success then
        warn((("[Quill.Commands] Action \"%*\" failed: %*"):format(a1, result)))
    end
    return success
end

function v1.evaluate(a1) -- Line: 25 -- upvalues: u1 (val) -- types: a1: string
    local v1 = u1[a1]
    if v1 == nil then
        warn((("[Quill.Commands] No handler registered for predicate \"%*\""):format(a1)))
        return false
    end
    local success, result = pcall(v1)
    if not success then
        warn((("[Quill.Commands] Predicate \"%*\" failed: %*"):format(a1, result)))
        return false
    end
    local v2 = false
    if result ~= false then
        v2 = result ~= nil
    end
    return v2
end

return v1