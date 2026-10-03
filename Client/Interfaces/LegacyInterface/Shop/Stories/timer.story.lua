-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.timer.story
-- Decompile time: 0.27 ms

local Timer = require(script.Parent.Parent.Components.Timer)
return function(a1) -- Line: 3 -- upvalues: Timer (val)
    local u15 = Timer({
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromOffset(332, 45),
    })
    u15.Parent = a1
    return function() -- Line: 11 -- upvalues: u15 (val)
        u15:destroy()
    end
end