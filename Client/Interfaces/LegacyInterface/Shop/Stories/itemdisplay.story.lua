-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.itemdisplay.story
-- Decompile time: 1.04 ms

Components = script.Parent.Parent.Components
FeaturedItems = require(Components.FeaturedItems)
return function(a1) -- Line: 4
    local u3 = FeaturedItems({})
    u3.Parent = a1
    return function() -- Line: 8 -- upvalues: u3 (val)
        u3:destroy()
    end
end