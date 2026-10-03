-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Tags.story
-- Decompile time: 0.21 ms

local Tags = require(script.Parent.Tags)
return function(a1) -- Line: 3 -- upvalues: Tags (val)
    local u3 = Tags({})
    u3.Parent = a1
    return function() -- Line: 7 -- upvalues: u3 (val)
        u3:destroy()
    end
end