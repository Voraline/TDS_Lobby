-- Script path: ReplicatedStorage.Shared.Modules.FastSignal.Docs
-- Decompile time: 0.50 ms

error("This is not supposed to run!")
local u3 = {}
u3.__index = u3
local v1 = {}
v1.__index = v1

function u3.new() -- Line: 58
    return {}
end

function u3.Is(a1) -- Line: 76
    return true
end

function u3.IsActive(a1) -- Line: 91
    return true
end

function u3.Connect(a1, a2) end

function u3.Once(a1, a2) end

function u3.Wait(a1) end

function u3.Fire(a1, ...) end

function u3.DisconnectAll(a1) end

function u3.Destroy(a1) end

function v1.Disconnect(a1) end

return {
    new = function() -- Line: 212 -- upvalues: u3 (val)
        return u3.new()
    end,
    Is = function(a1) -- Line: 216
        return true
    end,
}