-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useRightClickMenu
-- Decompile time: 0.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RightClickMenuStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.RightClickMenuStore)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
local useRefCallback = require(ReplicatedStorage.Client.Interfaces.Hooks.useRefCallback)
return function(a1, a2, a3, a4) -- Line: 11
    -- upvalues: useMouse (val), useRefCallback (val), RightClickMenuStore (val)
    local u5, u6 = useMouse()
    local v1 = {}
    local v2 = a4 or {}
    v1[1] = a3
    v1[2] = unpack(v2)
    useRefCallback(a1, "MouseButton2Click", function() -- Line: 19 -- upvalues: a3 (val), RightClickMenuStore (upval), a2 (val), u5 (val), u6 (val)
        if not a3 and a3 ~= nil then
            return
        end
        RightClickMenuStore.update({
            Enabled = true,
            Values = a2,
            Position = UDim2.fromOffset(u5:getValue(), u6:getValue()),
        })
    end, v1)
end