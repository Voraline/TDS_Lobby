-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Stories.navbar.story
-- Decompile time: 0.80 ms

local Components = script.Parent.Parent.Components
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
Navbar = require(Components.Navbar)
return function(a1) -- Line: 10 -- upvalues: Value (val), New (val), Children (val)
    local Home = Value("Home")
    local Frame = New("Frame")
    local v1 = {
        Size = UDim2.fromOffset(1000, 525),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
    }
    v1[Children] = {
        Navbar({
            Size = UDim2.fromOffset(0, 60),
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0),
            CurrentPage = Home,
            Pages = {
                {
                    Name = "Home",
                    Icon = "rbxassetid://6053791066",
                    Size = UDim2.fromOffset(80, 44),
                },
                {Name = "Skins", Icon = "rbxassetid://6053789775"},
                {Name = "Gamepasses", Icon = "rbxassetid://6053790285"},
                {Name = "Credits", Icon = "rbxassetid://6053833680"},
            },
        }),
    }
    local u47 = Frame(v1)
    u47.Parent = a1
    return function() -- Line: 51 -- upvalues: u47 (val)
        u47:Destroy()
    end
end