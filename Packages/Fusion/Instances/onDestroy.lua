-- Script path: ReplicatedStorage.Packages.Fusion.Instances.onDestroy
-- Decompile time: 0.62 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local logWarn = require(Parent.Logging.logWarn)
require(Parent.Instances.isAccessible)
return function(a1, a2, ...) -- Line: 24 -- upvalues: logWarn (val) -- types: a2: function
    if a1.instance == nil then
        logWarn("onDestroyNilRef")
        a2(...)
        return function() end
    end
    local u10 = nil
    local u11 = false
    local u15 = table.pack(...)
    local v1 = a1.instance.Destroying:Connect(function() -- Line: 44 -- upvalues: a2 (val), u15 (val), u11 (ref), u10 (ref)
        a2(table.unpack(u15, 1, u15.n))
        if not u11 then
            u11 = true
            u10:Disconnect()
        end
    end)
    return function() -- Line: 36 -- upvalues: u11 (ref), u10 (ref)
        if not u11 then
            u11 = true
            u10:Disconnect()
        end
    end
end