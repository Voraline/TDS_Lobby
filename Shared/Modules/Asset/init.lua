-- Script path: ReplicatedStorage.Shared.Modules.Asset
-- Decompile time: 0.56 ms

local u0 = {}
local Handlers = script:WaitForChild("Handlers")

local function getHandler(a1) -- Line: 4 -- upvalues: u0 (val), Handlers (val) -- types: a1: string
    local v1 = u0[a1]
    if v1 then
        return v1
    end
    v1 = Handlers:FindFirstChild(a1)
    assert(v1, "No handler for asset type: " .. a1)
    local v2 = require(v1)
    u0[a1] = v2
    return v2
end

return function(a1, ...) -- Line: 18 -- upvalues: u0 (val), Handlers (val)
    local v1
    local v2 = u0[a1]
    if not v2 then
        v2 = Handlers:FindFirstChild(a1)
        assert(v2, "No handler for asset type: " .. a1)
        local v3 = require(v2)
        u0[a1] = v3
        v1 = v3
    else
        v1 = v2
    end
    if v1 then
        return v1(...)
    end
end