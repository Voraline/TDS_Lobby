-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.dailyskins.story
-- Decompile time: 0.21 ms

Components = script.Parent.Parent.Components
DailySkins = require(Components.DailySkins)
return function(a1) -- Line: 4
    local u3 = DailySkins({})
    u3.Parent = a1
    return function() -- Line: 8 -- upvalues: u3 (val)
        u3:destroy()
    end
end