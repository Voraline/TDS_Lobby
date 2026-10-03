-- Script path: ReplicatedStorage.Shared.UI.Components.Cleanup
-- Decompile time: 0.19 ms

return function(a1, a2) -- Line: 1 -- types: a1: userdata, a2: function
    local u6 = a1.Destroying:Once(a2)
    return function() -- Line: 4 -- upvalues: u6 (val)
        if u6.Connected then
            u6:Disconnect()
        end
    end
end