-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Home.story
-- Decompile time: 0.22 ms

local Home = require(script.Parent.Home)
return function(a1) -- Line: 3 -- upvalues: Home (val)
    local u3 = Home({})
    u3.Parent = a1
    return function() -- Line: 7 -- upvalues: u3 (val)
        u3:destroy()
    end
end