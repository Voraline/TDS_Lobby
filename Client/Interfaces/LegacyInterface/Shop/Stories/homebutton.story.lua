-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.homebutton.story
-- Decompile time: 0.25 ms

local HomeButton = require(script.Parent.Parent.Components.HomeButton)
return function(a1) -- Line: 3 -- upvalues: HomeButton (val)
    local u7 = HomeButton({Position = UDim2.fromScale(0, 0)})
    u7.Parent = a1
    return function() -- Line: 9 -- upvalues: u7 (val)
        u7:destroy()
    end
end