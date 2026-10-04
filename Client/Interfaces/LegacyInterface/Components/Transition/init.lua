-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Transition
-- Decompile time: 1.61 ms

local UI = game:GetService("ReplicatedStorage"):WaitForChild("Shared").UI
local Binder = require(UI.Components.Binder)
local Cleanup = require(UI.Components.Cleanup)
local u18 = {}
local v1 = {
    __index = function(a1, a2) -- Line: 11
        local v1 = script:FindFirstChild(a2)
        assert(v1, "Transition '" .. a2 .. "' does not exist")
        assert(v1:IsA("ModuleScript"), "Transition '" .. a2 .. "' is not a ModuleScript")
        local v2 = require(v1)
        rawset(a1, a2, v2)
        return v2
    end,
}
setmetatable(u18, v1)
return function(a1, a2, a3, ...) -- Line: 22
    -- upvalues: u18 (val), Binder (val), Cleanup (val)
    local u4 = u18[a1]
    local u5 = {}
    u5[1] = ...
    Cleanup(a3, (Binder(a2, function(a1) -- Line: 26 -- upvalues: u4 (val), a3 (val), u5 (val)
        u4(a1, a3, table.unpack(u5))
    end)))
    return a3
end