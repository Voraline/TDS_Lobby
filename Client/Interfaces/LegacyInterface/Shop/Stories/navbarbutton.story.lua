-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.navbarbutton.story
-- Decompile time: 0.28 ms

local NavbarButton = require(script.Parent.Parent.Components.NavbarButton)
return function(a1) -- Line: 3 -- upvalues: NavbarButton (val)
    local u16 = NavbarButton({
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
        StrokeColor = Color3.fromRGB(117, 117, 117),
    })
    u16.Parent = a1
    return function() -- Line: 14 -- upvalues: u16 (val)
        u16:destroy()
    end
end