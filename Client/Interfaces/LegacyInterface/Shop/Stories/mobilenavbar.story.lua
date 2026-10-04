-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.mobilenavbar.story
-- Decompile time: 1.14 ms

local Value = (require(game.ReplicatedStorage.Shared.UI.Fusion)).Value
Components = script.Parent.Parent.Components
MobileNavBar = require(Components.MobileNavBar)
return function(a1) -- Line: 7 -- upvalues: Value (val)
    local Home = Value("Home")
    local u15 = MobileNavBar({
        CurrentPage = Home,
        Pages = {
            {Name = "Home", Icon = "rbxassetid://6053791066", Size = UDim2.fromOffset(80, 44)},
            {Name = "Skins", Icon = "rbxassetid://6053789775"},
            {Name = "Gamepasses", Icon = "rbxassetid://6053790285"},
            {Name = "Credits", Icon = "rbxassetid://6053833680"},
        },
    })
    u15.Parent = a1
    return function() -- Line: 33 -- upvalues: u15 (val)
        u15:destroy()
    end
end