-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Emotes.story
-- Decompile time: 0.60 ms

local Emotes = require(script.Parent.Emotes)
return function(a1) -- Line: 3 -- upvalues: Emotes (val)
    local u3 = Emotes({})
    u3.Parent = a1
    return function() -- Line: 7 -- upvalues: u3 (val)
        u3:destroy()
    end
end