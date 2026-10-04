-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.mobilenavbutton.story
-- Decompile time: 0.48 ms

Components = script.Parent.Parent.Components
MobileNavButton = require(Components.MobileNavButton)
return function(a1) -- Line: 4
    local u11 = MobileNavButton({Text = "Home", Position = UDim2.fromScale(0, 0), AnchorPoint = Vector2.new(0, 0)})
    u11.Parent = a1
    return function() -- Line: 12 -- upvalues: u11 (val)
        u11:destroy()
    end
end