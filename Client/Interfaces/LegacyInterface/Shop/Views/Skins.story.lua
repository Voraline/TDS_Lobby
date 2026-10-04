-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Skins.story
-- Decompile time: 0.70 ms

local Skins = require(script.Parent.Skins)
return function(a1) -- Line: 3 -- upvalues: Skins (val)
    local u3 = Skins({})
    u3.Parent = a1
    return function() -- Line: 7 -- upvalues: u3 (val)
        u3:destroy()
    end
end