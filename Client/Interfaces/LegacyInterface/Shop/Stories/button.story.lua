-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.button.story
-- Decompile time: 0.56 ms

Components = script.Parent.Parent.Components
Button = require(Components.Button)
return function(a1) -- Line: 4
    local u15 = Button({
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.25),
        Size = UDim2.fromScale(1, 0.506),
    })
    u15.Parent = a1
    return function() -- Line: 12 -- upvalues: u15 (val)
        u15:destroy()
    end
end